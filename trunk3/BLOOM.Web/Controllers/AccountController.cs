//Author: ZHOU Yuanyuan
//Date: 2010.5.9

//Revised by: QIAO Yu
//Date: 2010.5.13

//Revised by: Yang Juyuan
//Date:2010.6.7
//Only change the login part, add the validate code

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Data.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;

using BLOOM.Web.Models.User;

namespace BLOOM.Web.Controllers
{

    public class AccountController : Controller
    {
        public ActionResult Register()  // show the register page
        {
            ViewData["Occupation"] = PersonalInfo.GetOccupationList("IT");
            ViewData["Gender"] = PersonalInfo.GetGenderList("男");

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(FormCollection formValues) // retrieve the information in the register form, and add a new user
        {
            ViewData["Occupation"] = PersonalInfo.GetOccupationList("IT");
            ViewData["Gender"] = PersonalInfo.GetGenderList("男");

            ModelState.Add("UserName", new ModelState() { Value = formValues.ToValueProvider()["UserName"] });
            ModelState.Add("NickName", new ModelState() { Value = formValues.ToValueProvider()["NickName"] });
            ModelState.Add("Password", new ModelState() { Value = formValues.ToValueProvider()["Password"] });
            ModelState.Add("Confirmpassword", new ModelState() { Value = formValues.ToValueProvider()["Confirmpassword"] });
            ModelState.Add("PasswordQuestion", new ModelState() { Value = formValues.ToValueProvider()["PasswordQuestion"] });
            ModelState.Add("PasswordAnswer", new ModelState() { Value = formValues.ToValueProvider()["PasswordAnswer"] });
            ModelState.Add("EMail", new ModelState() { Value = formValues.ToValueProvider()["EMail"] });
            ModelState.Add("Age", new ModelState() { Value = formValues.ToValueProvider()["Age"] });

            //use PersonalInfo and AccountInfo to store the info 
            if (formValues["Age"].Trim().Length == 0)
                formValues["Age"] = "0";   //this is a temporary solution

            //validate
            if (formValues["UserName"].Trim().Length == 0)
                ModelState.AddModelError("UserName", "用户名不能为空\n");
            if (formValues["NickName"].Trim().Length == 0)
                ModelState.AddModelError("NickName", "昵称不能为空\n");
            if (formValues["Password"].Trim().Length == 0)
                ModelState.AddModelError("Password", "密码不能为空\n");
            if (formValues["Confirmpassword"].Trim().Length == 0)
                ModelState.AddModelError("Confirmpassword", "确认密码不能为空\n");
            if (formValues["PasswordQuestion"].Trim().Length == 0)
                ModelState.AddModelError("PasswordQuestion", "密码提示问题不能为空\n");
            if (formValues["PasswordAnswer"].Trim().Length == 0)
                ModelState.AddModelError("PasswordAnswer", "密码提示答案\n");
            if (formValues["EMail"].Trim().Length == 0)
                ModelState.AddModelError("EMail", "邮箱地址不能为空\n");

            if (!ModelState.IsValid)
                return View();

            //validate
            PersonalInfo personalInfo = new PersonalInfo();
            UpdateModel(personalInfo);
            personalInfo.Gender = formValues["Sex"] == "M" ? true : false;

            if (!personalInfo.IsValid())
            {
                List<PersonalInfoRuleViolation> errorList = personalInfo.GetViolations();
                foreach (PersonalInfoRuleViolation item in errorList)
                    ModelState.AddModelError(item.PropertyName, item.ErrorMessage);
            }

            //use Membership and relavant class to add a user

            MembershipUser newUser = null;

            //creates account for user by passing in the username and password 
            try
            {
                newUser = Membership.CreateUser(personalInfo.UserName, personalInfo.password, personalInfo.EMail);
                newUser.ChangePasswordQuestionAndAnswer(personalInfo.password, personalInfo.PasswordQuestion, personalInfo.PasswordAnswer);
            }
            catch (MembershipCreateUserException exception)  //catch the exception that the Membership.Create throws
            {
                if (exception.StatusCode == MembershipCreateStatus.DuplicateUserName)
                    ModelState.AddModelError("UserName", "该用户名已被注册。\n");
                else if (exception.StatusCode == MembershipCreateStatus.DuplicateEmail)
                    ModelState.AddModelError("EMail", "该邮箱已被注册。\n");
                else if (exception.StatusCode == MembershipCreateStatus.InvalidEmail)
                    ModelState.AddModelError("EMail", "请输入有效的邮箱。\n");
                else if (exception.StatusCode == MembershipCreateStatus.InvalidPassword)
                    ModelState.AddModelError("Password", "密码强度太低，请设置更复杂的密码。\n");
                else ModelState.AddModelError("general", exception.Message + '\n');
                return View();
            }

            try
            {
                //use UserRepository to modify the aspnet_AccountInfo table:set MoneyPaid and Balance 0
                UserRepository userRepository = new UserRepository();
                Guid guid = new Guid();
                guid = (Guid)newUser.ProviderUserKey;

                aspnet_AccountInfo balanceInfo = new aspnet_AccountInfo();
                balanceInfo.UserId = guid;
                balanceInfo.MoneyPaid = 0;
                balanceInfo.Balance = 200;  // a default of 200 RMB balance
                userRepository.Add(balanceInfo);

                aspnet_Membership membership = userRepository.GetUserPersonalInfo(guid);
                membership.Gender = personalInfo.Gender;
                membership.Occupation = personalInfo.Occupation;
                membership.Age = personalInfo.Age;

                userRepository.Submit();
                Session["UserName"] = personalInfo.UserName;
                FormsAuthentication.SetAuthCookie(personalInfo.UserName, true); //log in
                return RedirectToAction("RegisterSuccess");
            }
            catch (ChangeConflictException e)  //catch the exception that userRepository.Submit throws
            {
                ModelState.AddModelError(e.Message, e.InnerException);
            }
            return View();  //view(personalInfo)

        }

        public ActionResult RegisterSuccess()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session["UserName"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("../Home");
        }

        public ActionResult GetValidateCode()
        {
            ValidateCode vCode = new ValidateCode();
            string code = vCode.CreateValidateCode(4);
            Session["ValidateCode"] = code;
            byte[] bytes = vCode.CreateValidateGraphic(code);
            return File(bytes, @"image/jpeg");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(FormCollection formValues)
        {
            string userName = formValues["Name"], password = formValues["Password"], validateCode = formValues["ValidateCode"];
            bool validateCodeMatched = true;

            //add model state manually to suppress a run-time error
            ModelState.Add("ValidateCode", new ModelState() { Value = formValues.ToValueProvider()["ValidateCode"] });
            ModelState.Add("Name", new ModelState() { Value = formValues.ToValueProvider()["Name"] });
            ModelState.Add("password", new ModelState() { Value = formValues.ToValueProvider()["password"] });

            if (validateCode != Session["ValidateCode"].ToString())
            {
                ModelState.AddModelError("ValidateCode", "验证码错误！");
                validateCodeMatched = false;
            }
            if (Membership.ValidateUser(userName, password))
            {
                if (validateCodeMatched == true)
                {
                    Session["UserName"] = userName;
                    FormsAuthentication.SetAuthCookie(userName, true);  //set cookies for the logged in user
                    return RedirectToAction("../Home");
                }
            }
            else
                ModelState.AddModelError("Name", "用户名或密码错误");
            return View();    //not logged in
        }

    }

}

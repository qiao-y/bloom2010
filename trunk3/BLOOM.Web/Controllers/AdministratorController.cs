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
    public class AdministratorController : Controller
    {
        //
        // GET: /Administrator/

        [Authorize(Roles = "admin")]
        public ActionResult Create()  // show the create page
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post), Authorize(Roles = "admin")]
        public ActionResult Create(FormCollection formValues)
        {
            ModelState.Add("UserName", new ModelState() { Value = formValues.ToValueProvider()["UserName"] });
            ModelState.Add("Password", new ModelState() { Value = formValues.ToValueProvider()["Password"] });
            ModelState.Add("Confirmpassword", new ModelState() { Value = formValues.ToValueProvider()["Confirmpassword"] });
            ModelState.Add("EMail", new ModelState() { Value = formValues.ToValueProvider()["EMail"] });
            return View();
            
            if (formValues["UserName"].Trim().Length == 0)
                ModelState.AddModelError("UserName","用户名不能为空\n");
            if (formValues["Password"].Trim().Length == 0)
                ModelState.AddModelError("Password", "密码不能为空\n");
            if (formValues["Confirmpassword"].Trim().Length == 0)
                ModelState.AddModelError("Confirmpassword", "确认密码不能为空\n");
            if (formValues["EMail"].Trim().Length == 0)
                ModelState.AddModelError("EMail", "邮箱地址不能为空\n");
      
            if (!ModelState.IsValid)
                return View();

            //validate
            PersonalInfo personalInfo = new PersonalInfo();
            UpdateModel(personalInfo);
           
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
                balanceInfo.Balance = 200;

                userRepository.Add(balanceInfo);
                userRepository.Submit();
                return View(personalInfo);//this is a temporary solution
            }
            catch (ChangeConflictException e)  //catch the exception that userRepository.Submit throws
            {
                ModelState.AddModelError(e.Message, e.InnerException);
            }
            return View();  //view(personalInfo)

        }

        [Authorize(Roles = "admin")]
        public ActionResult Delete()  // show the delete page
        {
            return View();
        }
        
        [AcceptVerbs(HttpVerbs.Post), Authorize(Roles = "admin")]
        public ActionResult Delete(Guid uid)
        {
            UserRepository userRepository = new UserRepository();
            aspnet_Membership membership = userRepository.GetUserPersonalInfo(guid);
            aspnet_AccountInfo accountInfo = userRepository.GetAccountInfo(uid);
            if (membership == null)
                return View("NotFound");
            userRepository.Delete(accountInfo);
            userRepository.Delete(membership);
            return View("Deleted");
        }

        [Authorize(Roles = "admin")]
        public ActionResult Edit(Guid uid)  // show the edit page
        {
            Search(Guid);
        }

        [AcceptVerbs(HttpVerbs.Post), Authorize(Roles = "admin")]
        public ActionResult Edit(Guid uid, FormCollection formValues)
        {
            UserRepository userRepository = new UserRepository();
            aspnet_AccountInfo accountInfo = new aspnet_AccountInfo();
            aspnet_Membership membership = new aspnet_Membership();
            GenenalInfo generalInfo = new GenenalInfo();
            PersonalInfo personalInfo = new PersonalInfo();
            BalanceInfo balanceInfo = new BalanceInfo();
            membership = userRepository.GetUserPersonalInfo(uid);
            accountInfo = userRepository.GetAccountInfo(uid);  // retrieve information

            if (membership == null)
                return View("NotFound");
            
            //  found
            personalInfo.UserName = membership.aspnet_Users.UserName;
            personalInfo.Age = membership.Age;
            personalInfo.Occupation = membership.Occupation;
            personalInfo.password = membership.Password;
            personalInfo.PasswordQuestion = membership.PasswordQuestion;
            personalInfo.PasswordAnswer = membership.PasswordAnswer;
            balanceInfo.Balance = accountInfo.Balance;
            balanceInfo.MoneyPaid = accountInfo.MoneyPaid;

            try
            {
                UpdateModel(personalInfo);
                UpdateModel(balanceInfo);
                userRepository.Submit();
                return RedirectToAction("Details");  // This is a temporary solution.
            }
            catch
            {
                foreach (var issue in personalInfo.GetRuleViolations())
                {
                    ModelState.AddModelError(issue.PropertyName, issue.ErrorMessage);
                }
                foreach (var issue in balanceInfo.GetRuleViolations())
                {
                    ModelState.AddModelError(issue.PropertyName, issue.ErrorMessage);
                }
                return View(generalInfo);
            }
        }

        [Authorize(Roles = "admin")]
        public ActionResult Search()  // show the search page
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post), Authorize(Roles = "admin")]
        public ActionResult Search(Guid uid)
        {
            UserRepository userRepository = new UserRepository();
            aspnet_AccountInfo accountInfo = new aspnet_AccountInfo();
            aspnet_Membership membership = new aspnet_Membership();
            GenenalInfo generalInfo = new GenenalInfo();
            membership = userRepository.GetUserPersonalInfo(uid);
            accountInfo = userRepository.GetAccountInfo(uid);  // retrieve information

            if (membership == null)
                return View("NotFound");
            
            //  found
            generalInfo.PersonalInfo.UserName = membership.aspnet_Users.UserName;
            generalInfo.PersonalInfo.Age = membership.Age;
            generalInfo.PersonalInfo.Occupation = membership.Occupation;
            generalInfo.PersonalInfo.password = membership.Password;
            generalInfo.PersonalInfo.PasswordQuestion = membership.PasswordQuestion;
            generalInfo.PersonalInfo.PasswordAnswer = membership.PasswordAnswer;
            generalInfo.BalanceInfo.Balance = accountInfo.Balance;
            generalInfo.BalanceInfo.MoneyPaid = accountInfo.MoneyPaid;
            
            return View(generalInfo);
        }

    }
}

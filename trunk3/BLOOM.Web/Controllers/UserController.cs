//Author: QIAO Yu
//Date: 2010.5.1
//Description: This file defines the User Controller class.
//Only for debugging

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

using BLOOM.Web.Models.User;  //using user model classes

namespace BLOOM.Web.Controllers
{
    public class UserController : Controller
    {
        // public:

        public UserController()
        {
            m_userRepository = new UserRepository();
        }

        public ActionResult User(int id)
        {
            Guid guid = new Guid("ac0cded8-29a5-47ea-ae24-ced333f3c380");
            aspnet_Membership temp1 = m_userRepository.GetUserPersonalInfo(guid);
            aspnet_AccountInfo temp2 = m_userRepository.GetAccountInfo(guid);
            GeneralInfo model = new GeneralInfo();
            model.m_personalInfo = temp1;
            model.m_accountInfo = temp2;
            return View(model);
        }


        //GET: /user
        //public ActionResult Index()
        //{
        //    string userName = User.Identity.Name();
        //    Guid guid = Membership.GetUser(userName).ProviderName;
        //    aspnet_AccountInfo accountInfo = m_userRepository.GetAccountInfo(guid);

        //    PersonalInfo 
        //}

        //GET: /user/details/1
        public ActionResult Details(int id)
        {


            // var userBase = m_userRepository.gGetUser(id);
            return View("Details", 1);
        }

        // private:
        private UserRepository m_userRepository = null;
    }
}

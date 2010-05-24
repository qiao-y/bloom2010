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

using BLOOM.Models.User;  //using user model classes

namespace BLOOM.Controllers
{
    public class UserController : Controller
    {
        // public:

        public UserController()
        {
            m_userRepository = new UserRepository();
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

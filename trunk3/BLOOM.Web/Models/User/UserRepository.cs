//Author: QIAO Yu
//Date: 2010.5.1
//Description: This file defines the User Repository class, which actully finishes the CRUD job. 

using System;
using System.Data;
using System.Data.Linq;
using System.Configuration;
using System.Linq;

using BLOOM.Web.Models.User;

namespace BLOOM.Web.Models.User
{
    public class UserRepository
    {
        // public :
        public UserRepository()
        {
            m_userDataContext = new UserLinqConnectionDataContext();  //instantiate a user context class
        }

        public aspnet_Membership GetUserPersonalInfo(Guid uid)   
        {
            //get the user info, such as the UID, password, e-mail
            return m_userDataContext.aspnet_Membership.SingleOrDefault(d => d.UserId == uid);  //SingleOrDefault returns a single value rather than a table
        }

        public aspnet_AccountInfo GetAccountInfo(Guid uid)
        {
            return m_userDataContext.aspnet_AccountInfo.SingleOrDefault(d => d.UserId == uid);       
        }


        public IQueryable<aspnet_Membership> GetAllUser()
        {
            return m_userDataContext.aspnet_Membership;
        }

        public void Add(aspnet_AccountInfo theInfo)
        {
            m_userDataContext.aspnet_AccountInfo.InsertOnSubmit(theInfo);
        }

        public void Delete(aspnet_AccountInfo theInfo)
        {
            m_userDataContext.aspnet_AccountInfo.DeleteOnSubmit(theInfo);
        }

        public void Delete(aspnet_Membership theMembership)
        {
            m_userDataContext.aspnet_Membership.DeleteOnSubmit(theMembership);
        }

        public void Submit()
        {
            try
            {
                m_userDataContext.SubmitChanges();

            }
            catch (ChangeConflictException /*e*/)
            {
                //TBD
            }

        }

        // private:
        private UserLinqConnectionDataContext  m_userDataContext = null;

    }
}

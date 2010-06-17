//Author: QIAO Yu
//Date: 2010.5.13
//Description: This file defines the PersonalInfoRuleViolation class, which implements the validation 
//                  and business rule logic.

using System;
using System.Data;

namespace BLOOM.Web.Models.User
{
    public class PersonalInfoRuleViolation
    {
        //public:

        public PersonalInfoRuleViolation(string msg)
        {
            ErrorMessage = msg;
        }

        public PersonalInfoRuleViolation(string msg, string peoperyName)
        {
            ErrorMessage = msg;
            PropertyName = peoperyName;
        }

        public string ErrorMessage { get; set; }
        public string PropertyName { get; set; }
    }
}

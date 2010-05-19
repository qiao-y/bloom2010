//Author: QIAO Yu
//Date: 2010.5.7
//Description: This file defines the PersonalInfo class, which allows to 
//                  modify/add/delete the user data.
//Note: There are view helpers here. 


using System;
using System.Data;
using System.Configuration;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Text.RegularExpressions; 

namespace BLOOM.Models.User
{
   
    public class PersonalInfo
    {
        //public:
        public bool IsValid()
        {
            return GetViolations().Count== 0;
        }

        public List<PersonalInfoRuleViolation> GetViolations()
        {
            List<PersonalInfoRuleViolation> result = new List<PersonalInfoRuleViolation>();
            if (password != Confirmpassword)
                result.Add(new PersonalInfoRuleViolation("两次输入密码不一致\n","Confirmpassword"));
            
            //use regular expression to check if a email address is valid
            if (!Regex.IsMatch(EMail, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"))
                result.Add(new PersonalInfoRuleViolation("请输入有效的邮箱地址\n","EMail"));
            
            if (UserName == null)
                result.Add(new PersonalInfoRuleViolation("用户名不能为空\n","UserName"));

            if (password == null)
                result.Add(new PersonalInfoRuleViolation("密码不能为空\n","password"));

            return result;
        }
     
        public static SelectList GetGenderList(string gender)
        {
            // This is a static function, so call it directly by "PersonalInfo.GetGenList("M")"
            List<SelectListItem> genderList = new List<SelectListItem>(){
                new SelectListItem() { Value = "M", Text = "男" },
                new SelectListItem() { Value = "F", Text = "女" }
            };
            return new SelectList(genderList, "Value", "Text", gender ?? "M");
        }

        public static SelectList GetOccupationList(string occupation)
        {
            // This is a static function, so call it directly by "PersonalInfo.GetGenList("M")"
            List<SelectListItem> occupationList = new List<SelectListItem>(){
                new SelectListItem() { Value = "Common", Text = "一般职业"},
                new SelectListItem() { Value = "Agriculture", Text = "农业"},
                new SelectListItem() { Value = "Transportion", Text = "交通运输业"},
                new SelectListItem() { Value = "Repast", Text = "餐旅业"},
                new SelectListItem() { Value = "Architecture", Text = "建筑工程业"},
                new SelectListItem() { Value = "Entertainment", Text = "娱乐业"},
                new SelectListItem() { Value = "Education", Text = "文教"},
                new SelectListItem() { Value = "IT", Text = "信息技术"},
                new SelectListItem() { Value = "Others", Text = "其他"}
            };
            return new SelectList(occupationList,"Value","Text",occupation ?? "IT");
        }


        //public static SelectList GetCountryList(String country)
        //{
        //    return new SelectList(Iso3166CountryCodes.CountryDictonary, "Key", "Value",
        //    country ?? "中华人民共和国");
        //}


        public string UserName { get; set; }
        public string password { get; set; }
        public string Confirmpassword { get; set; }
        public string PasswordQuestion { get; set; }
        public string PasswordAnswer { get; set; }
        public string NickName { get; set; }
        public string Occupation { get; set; }
        public string EMail { get; set; }
        public int Age { get; set; }
        public bool Gender { get; set; } //1 for male, 0 for female

    }
}

using System;
using System.Data;
using System.Configuration;
using System.Web.Mvc;
using System.Collections.Generic;


namespace BLOOM.Web.Models.Analyse
{
    public class GetAnalyseCommand
    {
        public static SelectList GetKindOfUserInfo()
        {
            List<SelectListItem> kindOfUserInfo = new List<SelectListItem>(){
                new SelectListItem {Value = "NULL", Text = "请选择"},
                new SelectListItem {Value = "AgeRange", Text = "年龄分布"},
                new SelectListItem {Value = "GenderRange", Text = "性别分布"},
                new SelectListItem {Value = "OccupationRange", Text = "职业分布"},
                new SelectListItem {Value = "CreateDateRange", Text = "注册日期分布"}
     //           new SelectListItem {Value = "AllRange", Text="全部数据"}
            };
            return new SelectList(kindOfUserInfo, "Value", "Text", "NULL");
        }

        public static SelectList GetWhetherDisplayCategoryStatistics()
        {
            List<SelectListItem> whetherDisplayCategoryStatistics = new List<SelectListItem>(){
                new SelectListItem {Value = "NULL", Text = "请选择"},
                new SelectListItem {Value = "Yes", Text = "显示数据"},
                new SelectListItem {Value = "No", Text = "不显示数据"}
            };
            return new SelectList(whetherDisplayCategoryStatistics,"Value","Text","NULL");
        }

        public static SelectList GetKindOfGroup()
        {
            List<SelectListItem> kindOfGroup = new List<SelectListItem>(){
                new SelectListItem {Value = "NULL", Text = "请选择"},
                new SelectListItem {Value = "Whole", Text = "全部"},
                new SelectListItem {Value = "Age", Text = "按年龄统计"},
                new SelectListItem {Value = "Occupation", Text = "按职业统计"},
                new SelectListItem {Value = "Gender", Text = "按性别统计"},
                new SelectListItem {Value = "Category", Text = "按书籍分类统计"}
            };
            return new SelectList(kindOfGroup, "Value", "Text", "NULL");
        }

        public static SelectList GetTimeSpan()
        {
            List<SelectListItem> timeSpan = new List<SelectListItem>(){
                new SelectListItem {Value = "Whole", Text = "全部"},
                new SelectListItem {Value = "OneWeek", Text = "近一周"},
                new SelectListItem {Value = "OneMonth", Text = "近一个月"}
            };
            return new SelectList(timeSpan, "Value", "Text", "Whole");
        }

        public static SelectList GetWhetherCategory()
        {
            List<SelectListItem> kindOfBoughtTime = new List<SelectListItem>(){
                new SelectListItem {Value = "NULL", Text = "请选择"},
                new SelectListItem {Value = "Whole", Text = "全部"},
                new SelectListItem {Value = "Category", Text = "按书籍分类统计"}
            };
            return new SelectList(kindOfBoughtTime, "Value", "Text", "NULL");
        }

    }
}
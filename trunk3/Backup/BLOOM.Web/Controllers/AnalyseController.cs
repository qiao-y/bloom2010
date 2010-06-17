//Author : Yang Juyuan
//date: 2010.6.13
//just to test analyse model

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using BLOOM.Web.Models.Analyse;

namespace BLOOM.Web.Controllers
{
    public class AnalyseController : Controller
    {
        //
        // GET: /Analyse/

        public ActionResult Index()
        {
            Analyse analyse = new Analyse();
            ViewData["AgeRange"] = analyse.GetAgeStatistics();
            ViewData["GenderRange"] = analyse.GetGenderStatistics();
            ViewData["OccupationRange"] = analyse.GetOccupationStatistics();
            ViewData["CreateDateRange"] = analyse.GetCreateDateStatistics();

            ViewData["CategoryStatistics"] = analyse.GetCategoryStatistics();

            ViewData["MoneyEarned"] = analyse.GetMoneyStatistics();
            ViewData["MoneyForOneMonth"] = analyse.GetMoneyStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByAge"] = analyse.GetMoneyByAgeStatistics();
            ViewData["MoneyByAgeForOneMonth"] = analyse.GetMoneyByAgeStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByOccupation"] = analyse.GetMoneyByOccupationStatistics();
            ViewData["MoneyByOccupationForOneMonth"] = analyse.GetMoneyByOccupationStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByGender"] = analyse.GetMoneyByGenderStatistics();
            ViewData["MoneyByGenderForOneMonth"] = analyse.GetMoneyByGenderStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByCategory"] = analyse.GetMoneyByCategoryStatistics();
            ViewData["MoneyByCategoryForOneMonth"] = analyse.GetMoneyByCategoryStatistics(DateTime.Now.AddDays(-30));

            ViewData["BoughtTimesRank"] = analyse.GetBooksByBoughtTimes();
            ViewData["BoughtTimesRankForOneMonth"] = analyse.GetBooksByBoughtTimes(DateTime.Now.AddDays(-30));
            ViewData["CategoryBoughtTimesRank"] = analyse.GetBooksByCategoryAndBoughtTimes();
            ViewData["CategoryBoughtTimesRankForOneMonth"] = analyse.GetBooksByCategoryAndBoughtTimes(DateTime.Now.AddDays(-30));
            ViewData["ViewedTimesRank"] = analyse.GetBooksByViewedTimes();
            ViewData["CategoryViewedTimesRank"] = analyse.GetBooksByCategoryAndViewedTimes();
            return View();
        }

    }
}

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

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(FormCollection formValues)
        {
            ViewData["KindOfUserInfo"] = GetAnalyseCommand.GetKindOfUserInfo();
            ViewData["UserInfoSelectResult"] = formValues["UserInfoCommand"];

            ViewData["WhetherDisplayCategoryStatistics"] = GetAnalyseCommand.GetWhetherDisplayCategoryStatistics();
            ViewData["CategorySelectResult"] = formValues["CategoryCommand"];

            ViewData["KindOfGroup"] = GetAnalyseCommand.GetKindOfGroup();
            ViewData["TimeSpanForMoney"] = GetAnalyseCommand.GetTimeSpan();
            ViewData["KindOfGroupResult"] = formValues["KindOfGroupCommand"];
            ViewData["TimeSpanResultForMoney"] = formValues["TimeSpanCommandForMoney"];

            ViewData["CategoryForBought"] = GetAnalyseCommand.GetWhetherCategory();
            ViewData["TimeSpanForBought"] = GetAnalyseCommand.GetTimeSpan();
            ViewData["CategoryForBoughtResult"] = formValues["CategoryForBoughtCommand"];
            ViewData["TimeSpanForBoughtResult"] = formValues["TimeSpanForBoughtCommand"];

            ViewData["CategoryForViewed"] = GetAnalyseCommand.GetWhetherCategory();
            ViewData["CategoryForViewedResult"] = formValues["CategoryForViewedCommand"];

            ViewData["AgeRange"] = analyse.GetAgeStatistics();
            ViewData["GenderRange"] = analyse.GetGenderStatistics();
            ViewData["OccupationRange"] = analyse.GetOccupationStatistics();
            ViewData["CreateDateRange"] = analyse.GetCreateDateStatistics();

            ViewData["CategoryStatistics"] = analyse.GetCategoryStatistics();

            ViewData["MoneyEarned"] = analyse.GetMoneyStatistics();
            ViewData["MoneyForOneWeek"] = analyse.GetMoneyStatistics(DateTime.Now.AddDays(-7));
            ViewData["MoneyForOneMonth"] = analyse.GetMoneyStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByAge"] = analyse.GetMoneyByAgeStatistics();
            ViewData["MoneyByAgeForOneWeek"] = analyse.GetMoneyByAgeStatistics(DateTime.Now.AddDays(-7));
            ViewData["MoneyByAgeForOneMonth"] = analyse.GetMoneyByAgeStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByOccupation"] = analyse.GetMoneyByOccupationStatistics();
            ViewData["MoneyByOccupationForOneWeek"] = analyse.GetMoneyByOccupationStatistics(DateTime.Now.AddDays(-7));
            ViewData["MoneyByOccupationForOneMonth"] = analyse.GetMoneyByOccupationStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByGender"] = analyse.GetMoneyByGenderStatistics();
            ViewData["MoneyByGenderForOneWeek"] = analyse.GetMoneyByGenderStatistics(DateTime.Now.AddDays(-7));
            ViewData["MoneyByGenderForOneMonth"] = analyse.GetMoneyByGenderStatistics(DateTime.Now.AddDays(-30));
            ViewData["MoneyByCategory"] = analyse.GetMoneyByCategoryStatistics();
            ViewData["MoneyByCategoryForOneWeek"] = analyse.GetMoneyByCategoryStatistics(DateTime.Now.AddDays(-7));
            ViewData["MoneyByCategoryForOneMonth"] = analyse.GetMoneyByCategoryStatistics(DateTime.Now.AddDays(-30));

            ViewData["BoughtTimesRank"] = analyse.GetBooksByBoughtTimes();
            ViewData["BoughtTimesRankForOneWeek"] = analyse.GetBooksByBoughtTimes(DateTime.Now.AddDays(-7));
            ViewData["BoughtTimesRankForOneMonth"] = analyse.GetBooksByBoughtTimes(DateTime.Now.AddDays(-30));
            ViewData["CategoryBoughtTimesRank"] = analyse.GetBooksByCategoryAndBoughtTimes();
            ViewData["CategoryBoughtTimesRankForOneWeek"] = analyse.GetBooksByCategoryAndBoughtTimes(DateTime.Now.AddDays(-7));
            ViewData["CategoryBoughtTimesRankForOneMonth"] = analyse.GetBooksByCategoryAndBoughtTimes(DateTime.Now.AddDays(-30));
            ViewData["ViewedTimesRank"] = analyse.GetBooksByViewedTimes();
            ViewData["CategoryViewedTimesRank"] = analyse.GetBooksByCategoryAndViewedTimes();
            return View();
        }

        public ActionResult Index()
        {
            ViewData["KindOfUserInfo"] = GetAnalyseCommand.GetKindOfUserInfo();
            ViewData["WhetherDisplayCategoryStatistics"] = GetAnalyseCommand.GetWhetherDisplayCategoryStatistics();
            ViewData["KindOfGroup"] = GetAnalyseCommand.GetKindOfGroup();
            ViewData["TimeSpanForMoney"] = GetAnalyseCommand.GetTimeSpan();
            ViewData["CategoryForBought"] = GetAnalyseCommand.GetWhetherCategory();
            ViewData["TimeSpanForBought"] = GetAnalyseCommand.GetTimeSpan();
            ViewData["CategoryForViewed"] = GetAnalyseCommand.GetWhetherCategory();
            return View();
        }

        public ActionResult AgeRange()
        {
            return Json(analyse.GetAgeStatistics());
        }

        public ActionResult OccupationRange()
        {
            return Json(analyse.GetOccupationStatistics());
        }

        public ActionResult GenderRange()
        {
            return Json(analyse.GetGenderStatistics());
        }

        public ActionResult CreateDateRange()
        {
            return Json(analyse.GetCreateDateStatistics());
        }

        public ActionResult CategoryStatistics()
        {
            return Json(analyse.GetCategoryStatistics());
        }

        public ActionResult MoneyByAge(int id)
        {
            if(id != 0)
                return Json(analyse.GetMoneyByAgeStatistics(DateTime.Now.AddDays(-id)));
            else
                return Json(analyse.GetMoneyByAgeStatistics());
        }

        public ActionResult MoneyByOccupation(int id)
        {
            if(id != 0)
                return Json(analyse.GetMoneyByOccupationStatistics(DateTime.Now.AddDays(-id)));
            else
                return Json(analyse.GetMoneyByOccupationStatistics());
        }

        public ActionResult MoneyByGender(int id)
        {
            if(id != 0)
                return Json(analyse.GetMoneyByGenderStatistics(DateTime.Now.AddDays(-id)));
            else
                return Json(analyse.GetMoneyByGenderStatistics());
        }

        public ActionResult MoneyByCategory(int id)
        {
            if(id != 0)
                return Json(analyse.GetMoneyByCategoryStatistics(DateTime.Now.AddDays(-id)));
            else
                return Json(analyse.GetMoneyByCategoryStatistics());
        }
        
        public ActionResult BookBoughtRank(int id)
        {
            if (id != 0)
                return Json(analyse.GetBooksByBoughtTimes(DateTime.Now.AddDays(-id)));
            else
                return Json(analyse.GetBooksByBoughtTimes ());
        }
          
        public ActionResult CategoryBoughtRank(int id)
        {
            if (id != 0)
                return Json(analyse.GetBooksByCategoryAndBoughtTimes(DateTime.Now.AddDays(-id)));
            else
                return Json(analyse.GetBooksByCategoryAndBoughtTimes());
        }

        public ActionResult BookViewedRank(int id)
        {
            return Json(analyse.GetBooksByViewedTimes());
        }

        public ActionResult CategoryViewedRank(int id)
        {
            return Json(analyse.GetBooksByCategoryAndViewedTimes());
        }

        private Analyse analyse = new Analyse();
        private GetAnalyseCommand getAnalyseCommand = new GetAnalyseCommand();
    }
}

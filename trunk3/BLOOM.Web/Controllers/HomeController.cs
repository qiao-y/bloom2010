using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLOOM.Web.Models.Analyse;

namespace BLOOM.Web.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Analyse bookAnalyse = new Analyse();
            ViewData["Message"] = "Welcome to BLOOM!";
            ViewData["NewBooks"] = bookAnalyse.NewBooks();
            ViewData["TopFive"] = bookAnalyse.TopFive();
            ViewData["HotBooks"] = bookAnalyse.HotBooks();
            return View();
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(FormCollection formCollection)
        {
            string key = formCollection["SearchInput"];   //key word
            if (key == null)
                return View();   // nothing is input, just show the initial index page
            int theKind = int.Parse(formCollection["SearchKind"]);  //kind of key word typed, such as title, ISBN...
            return RedirectToAction("../Book/Search", new { keyWord = key, kind = theKind });
        }

        public ActionResult About()
        {
            return View();
        }
    }
}

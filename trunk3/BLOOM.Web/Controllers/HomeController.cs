using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BLOOM.Web.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

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

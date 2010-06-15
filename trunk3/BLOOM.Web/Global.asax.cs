using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BLOOM.Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
            );

            routes.MapRoute(
             "BuyBook",
             "Book/Buy/{bookID}",
              new { controller = "Book", action = "Buy", bookID = ""}
            ); 
            
            routes.MapRoute(
                 "BookRead",
                 "Book/Read/{id}/{page}",
                 new { controller = "Book", action = "Read", id = "", page = "" }
             );

            routes.MapRoute(
               "BookSearch",
               "Book/Search/{keyWord}/{kind}",
               new { controller = "Book", action = "Search", keyWord = "", kind = "" }
           );

            routes.MapRoute(
             "GetPage",
             "Book/GetPage/{id}/{page}",
             new { controller = "Book", action = "GetPage", id = "", page = "" }
         ); 
 
        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebFilm
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
           
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("{*botdetect}",
     new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });

           
            routes.MapRoute(
               name: "Category",
               url: "theloai/{idcate}",
               defaults: new { controller = "Cate", action = "CategoryPage", id = UrlParameter.Optional },
               namespaces: new[] { "WebFilm.Controllers" }
           );

            routes.MapRoute(
              name: "Country",
              url: "quocgia/{idcate}",
              defaults: new { controller = "Cate", action = "CountryPage", id = UrlParameter.Optional },
              namespaces: new[] { "WebFilm.Controllers" }
          );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Movies1", action = "Index", id = UrlParameter.Optional } ,
                namespaces: new[] { "WebFilm.Controllers" }
            ); 
        }
    }
}

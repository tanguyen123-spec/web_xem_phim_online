using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebFilm.Models.XULY;
namespace WebFilm.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var MovieTT = new MovieTT();
            ViewBag.ListMovieNew = MovieTT.ListMovieTop(10);
            ViewBag.ListMovieTop = MovieTT.ListMovieTop(6);
            ViewBag.Rate = MovieTT.ListMovieRate(12);
            return View();
        }

        public ActionResult About()
        {

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult ERROR()
        {
           
            return View();
        }
    }
}
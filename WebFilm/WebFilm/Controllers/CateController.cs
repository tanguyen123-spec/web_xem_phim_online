using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebFilm.Models;
using WebFilm.Models.XULY;
using PagedList;

namespace WebFilm.Controllers
{
    public class CateController : Controller
    {
        private Phim2Entities db = new Phim2Entities();

       


        //Lấy thông tin thể loại đổ vào drop box ở menu
        [ChildActionOnly]
        public PartialViewResult Category()
        {
            var model = new CategoryTT().ListAll();
            return PartialView(model);

        }
        //Lấy thông tin quốc gia đổ vào drop box ở menu
        [ChildActionOnly]
        public PartialViewResult Country()
        {
            var model = new CountryTT().ListAll();
            return PartialView(model);

        }
        //Trang thể loại
        public ActionResult CategoryPage(long idcate, int page = 1)
        {
            var movieTT = new MovieTT();
            ViewBag.cate = new CategoryTT().ViewDetail(idcate);;
            var model = movieTT.ListByCateId(idcate);
            return View(model.ToPagedList(page, 6));
        }
        //Trang quốc gia
        public ActionResult CountryPage(long idcate, int page = 1)
        {
            var moviDao = new MovieTT();
            ViewBag.cate = new CountryTT().ViewDetail(idcate);
            var model = moviDao.ListByCateId(idcate);
            return View(model.ToPagedList(page, 6));
        }
        //Menu ở footer
        public PartialViewResult MenuBottom()
        {
            var model = new CategoryTT().ListAll();
            return PartialView(model);
        }

       
    }
}

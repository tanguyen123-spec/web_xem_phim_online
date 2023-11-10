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
    public class Movies1Controller : Controller
    {
        private Phim2Entities db = new Phim2Entities();

        // GET: Movies1
        public ActionResult Search()
        {
            return View();
        }
        public ActionResult Index(int page = 1)
        {
            var MovieTT = new MovieTT();
            ViewBag.ListMovieTop = MovieTT.ListMovieTop(8);
            var model = MovieTT.ListMovieRate(36);
            return View(model.ToPagedList(page,12));
        }
        public ActionResult Index2(int page = 1)
        {
            var MovieTT = new MovieTT();
            ViewBag.ListMovieTop = MovieTT.ListMovieTop(8);
            var model = MovieTT.ListMovieRate(36);
            return View(model.ToPagedList(page, 12));
        }

        // GET: Movies1/Details/5
        public ActionResult Details(int id)
        {
           
            Movie model = db.Movies.Find(id);
            //var movie = new MovieTT().ViewDetail(id);
            ViewBag.ListMovieTop = new MovieTT().ListMovieTop(6);
            ViewBag.category = new CategoryTT().ViewDetail(model.CategoryID.Value);
            ViewBag.ListMovieRelated = new MovieTT().ListMovieRelated(id, 4);

            return View(model);
        }

        // GET: Movies1/Create
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "NameCategory");
            ViewBag.CountryID = new SelectList(db.Countries, "CountryID", "NameCountry");
            return View();
        }

        // POST: Movies1/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MovieID,Name,Image,Actor,Description,Directors,Time,Year,MovieLink,TrailerLink,CategoryID,Rate,TrailerID,Viewed,Status,TopHot,CountryID")] Movie movie)
        { //System.Web.HttpPostedFileBase Avatar;
            var imgNV = Request.Files["Avatar"];
            //Lấy thông tin từ input type=file có tên Avatar
            string postedFileName = System.IO.Path.GetFileName(imgNV.FileName);
            //Lưu hình đại diện về Server
            var path = Server.MapPath("/Images/" + postedFileName);
            imgNV.SaveAs(path);
            if (ModelState.IsValid)
            {
                movie.Image = postedFileName;
                db.Movies.Add(movie);
                db.SaveChanges();
                return RedirectToAction("Index2");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "NameCategory", movie.CategoryID);
            ViewBag.CountryID = new SelectList(db.Countries, "CountryID", "NameCountry", movie.CountryID);
            return View(movie);
        }

        // GET: Movies1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "NameCategory", movie.CategoryID);
            ViewBag.CountryID = new SelectList(db.Countries, "CountryID", "NameCountry", movie.CountryID);
            return View(movie);
        }

        // POST: Movies1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MovieID,Name,Image,Actor,Description,Directors,Time,Year,MovieLink,TrailerLink,CategoryID,Rate,TrailerID,Viewed,Status,TopHot,CountryID")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                db.Entry(movie).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index2");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "NameCategory", movie.CategoryID);
            ViewBag.CountryID = new SelectList(db.Countries, "CountryID", "NameCountry", movie.CountryID);
            return View(movie);
        }

        // GET: Movies1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // POST: Movies1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Movie movie = db.Movies.Find(id);
            db.Movies.Remove(movie);
            db.SaveChanges();
            return RedirectToAction("Index2");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

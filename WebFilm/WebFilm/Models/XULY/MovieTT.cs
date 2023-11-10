using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFilm.Models.XULY
{
    public class MovieTT
    {
        Phim2Entities db=null;
        public MovieTT()
        {
            db = new Phim2Entities();
        }
        //Phim có cùng mã thể loại
        public List<Movie> ListByCateId(long cateID)
        {

            return db.Movies.Where(x => x.CategoryID == cateID).ToList();

        }
        //Phim có nhiều lượt xem
        public List<Movie> ListMovieTop(int top)
        {
            return db.Movies.OrderByDescending(x => x.Viewed).Take(top).ToList();
        }
        //Sắp xếp phim có điểm Rate cao đên thấp
        public List<Movie> ListMovieRate(int top)
        {
            return db.Movies.Where(x => x.Status == true).OrderByDescending(x => x.Rate).Take(top).ToList();
        }
     
        //Lấy thông tin các tim có liên quan
        public List<Movie> ListMovieRelated(int movieid, int top)
        {
            var movie = db.Movies.Find(movieid);
            return db.Movies.Where(x => x.MovieID != movieid && x.CategoryID == movie.CategoryID).Take(top).ToList();
        }
        //Tìm kiếm theo tên phim
        public List<Movie> SearchByKey(string key)
        {
            return db.Movies.SqlQuery("Select * from Movie where Name like N'%"+key+"%'").ToList();
        }
    }
}
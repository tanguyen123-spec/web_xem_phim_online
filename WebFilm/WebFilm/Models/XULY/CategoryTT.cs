using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFilm.Models.XULY
{
    public class CategoryTT
    {
        Phim2Entities db= null;
        public CategoryTT()
        {
            db = new Phim2Entities();
        }
        //Tất cả phim cùng thể loại
        public List<Category> ListAll()
        {
            return db.Categories.ToList();
        }
        //Tìm thông tin phim với mã thể loại
        public Category ViewDetail(long id)
        {
            return db.Categories.Find(id);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFilm.Models.XULY
{
    public class CountryTT
    {

        Phim2Entities db = null;
        public CountryTT()
        {
            db = new Phim2Entities();
        }

        public List<Country> ListAll()
        {
            return db.Countries.ToList();
        }
        public Country ViewDetail(long id)
        {
            return db.Countries.Find(id);
        }
       
    }
}
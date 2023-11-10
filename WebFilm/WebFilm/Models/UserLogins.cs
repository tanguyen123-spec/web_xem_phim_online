using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFilm.Models
{
    public class UserLogins
    {
   
        public long UserID { set; get; }
        public string UserName { set; get; }
        public string Name { set; get; }
        public int PermissonID { set; get; }
        public int? GroupID { set; get; }
    }
}
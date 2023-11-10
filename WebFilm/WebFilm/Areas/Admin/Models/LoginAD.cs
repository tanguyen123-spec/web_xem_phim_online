using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebFilm.Areas.Admin.Models
{
    public class LoginAD
    {
        [Required(ErrorMessage = "Mời nhập username")]
        public string UserName { set; get; }
        [Required(ErrorMessage = "Mời nhập password")]
        public string Password { set; get; }

       
    }
}
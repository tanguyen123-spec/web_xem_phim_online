using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebFilm.Models
{
    public class LoginUser
    {
        [Key]
        [Display(Name = "Tài Khoản")]
        [Required(ErrorMessage = "Yêu cầu nhập tên tài khoản")]
        public string UserName { set; get; }
        [Display(Name = "Mật Khẩu")]
        [Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        public string Password { set; get; }
    }
}
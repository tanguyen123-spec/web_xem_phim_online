using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebFilm.Models.XULY
{
    public class RegisterUser
    {
        [Key]
        public int ID { set; get; }
       
       
        public string UserName { set; get; }
        [Display(Name = "Mật Khẩu")]
        [Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "Mật khẩu có ít nhất 6 ký tự")]
        public string Password { set; get; }
        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("Password", ErrorMessage = "Mật khẩu xác nhận không khớp")]
        public string ConfirmPassword { set; get; }
       
    }
}
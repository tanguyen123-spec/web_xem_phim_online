using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebFilm.Models;
using WebFilm.Models.XULY;
using BotDetect.Web.Mvc;

namespace WebFilm.Controllers
{
    public class UserLoginController : Controller
    {
        // GET: UserLogin
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        //Dang xuất
        public ActionResult Logout()
        {
            Session[WebFilm.Models.XULY.Session.USER_SESSION] = null;
            return Redirect("/");
        }
        //Đăng nhập
        [HttpPost]
        public ActionResult Login(LoginUser model)
        {
            if (ModelState.IsValid)
            {
                var UserTT = new UserTT();

                var result = UserTT.Login(model.UserName, model.Password);

                if (result == 1)
                {
                    var user = UserTT.GetById(model.UserName);
                    var userSession = new UserLogins();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.UserID;
                    Session.Add(WebFilm.Models.XULY.Session.USER_SESSION,userSession);
                    return Redirect("/Movies1/Index2");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }

                else
                {
                    ModelState.AddModelError("", "Đăng nhập không thành công!");
                }
            }
            return View(model);
        }
        //Đăng ký và kiểm tra mã xác nhận
        [HttpPost]

        [CaptchaValidationActionFilter("CaptchaCode", "registerCapcha", "Xác nhận mã không đúng!")]
        public ActionResult Register(RegisterUser model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserTT();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else
                {
                    var user = new User();
                  
                    user.UserName = model.UserName;
                    user.UserPass = model.Password;
                    user.GroupID = 2; 
                 
                    var result = dao.InsertUser(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công ";
                        model = new RegisterUser();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công");
                    }


                }
            }
            return View(model);
        }
        //Hiển thị thông tin trên giao diện(Đăng ký/Đăng nhập hoặc tên người dùng)
        public PartialViewResult Tool()
        {

            return PartialView();
        }
    }
}
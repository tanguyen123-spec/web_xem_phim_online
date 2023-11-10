using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebFilm.Models;
using WebFilm.Models.XULY;
namespace WebFilm.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(LoginUser model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserTT();
                var result = dao.Login(model.UserName, model.Password, true);
                if (result == 1)
                {
                    var user = dao.GetById(model.UserName);
                    var userSession = new UserLogins();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.UserID;
                    userSession.GroupID = user.GroupID;
                    //var listCredentials = dao.GetListCredential(model.UserName);
                    //Session.Add(CommonContants.SESSION_CREDENTIALS, listCredentials);
                    Session.Add(WebFilm.Models.XULY.Session.USER_SESSION, userSession);

                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập");
                }

                else
                {
                    ModelState.AddModelError("", "Đăng nhập không thành công!");
                }
            }

            return View("Index");
        }
        public ActionResult LogoutAD()
        {
            Session[WebFilm.Models.XULY.Session.USER_SESSION] = null;
            return Redirect("/Admin/Login");
        }
    }
}
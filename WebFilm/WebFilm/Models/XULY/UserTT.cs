using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFilm.Models.XULY
{
    public class UserTT
    {

        Phim2Entities db = null;

        public  UserTT()
        {
            db = new Phim2Entities();
        }
        //Thêm user đã đăng ký vào csdl
        public int InsertUser(User us)
        {
            db.Users.Add(us);
            db.SaveChanges();
            return us.UserID;
        }
        //Kiểm tra tên đăng nhập
        public bool CheckUserName(string userName)
        {
            return db.Users.Count(x => x.UserName == userName) > 0;
        }
        //Lấy thông tin của user thông qua username
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }
        //Thiết kế hàm đăng nhập
        public int Login(string username, string password, bool isLoginAdmin = false)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == username);

            if (result == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {            
                     if(result.GroupID==1)
                    {
                            if (result.UserPass == password )
                                return 1;
                            else
                                return -2;
                    }    
                     else
                    {
                        return -3;
                    }    

                }
                else
                {
                          if (result.UserPass == password)
                            return 1;
                        else
                            return -2;
                 
                }
            }

        }
    }
}
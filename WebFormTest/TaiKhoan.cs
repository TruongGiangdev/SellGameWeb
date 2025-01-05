using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFormTest
{
    public class TaiKhoan
    {
        public string Username { get; set; }
        public string HoTen { get; set; }
        public bool GioiTinh { get; set; } 
        public DateTime NgaySinh { get; set; } 
        public string Email { get; set; }
        public string SDT { get; set; } 
        public string Password { get; set; }
        public bool Quyen { get; set; }

        public TaiKhoan() { }

        public TaiKhoan(string username, string hoTen, bool gioiTinh, DateTime ngaySinh, string email, string sdt, string password, bool quyen)
        {
            Username = username;
            HoTen = hoTen;
            GioiTinh = gioiTinh;
            NgaySinh = ngaySinh;
            Email = email;
            SDT = sdt;
            Password = password;
            Quyen = quyen;
        }

        
    }
}
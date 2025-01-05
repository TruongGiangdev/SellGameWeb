using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFormTest
{
    public class TheLoai
    {
        public string MaTheLoai { get; set; }
        public string TenTheLoai { get; set; }
        public string MoTa { get; set; }

        public TheLoai() { }

        public TheLoai(string maTheLoai, string tenTheLoai, string moTa)
        {
            MaTheLoai = maTheLoai;
            TenTheLoai = tenTheLoai;
            MoTa = moTa;
        }
    }
}
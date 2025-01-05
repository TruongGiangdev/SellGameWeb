using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFormTest
{
    public class Game
    {
        public string MaGame { get; set; }
        public string TenGame { get; set; }
        public string MoTa { get; set; }
        public float DonGia { get; set; }
        public DateTime NamRaMat { get; set; }
        public int SoLuong { get; set; }
        public string MaTheLoai { get; set; }
        public string Anh { get; set; }

        // Constructor không tham số
        public Game()
        {
        }

        // Constructor có tham số
        public Game(string maGame, string tenGame, string moTa, float donGia, DateTime namRaMat, int soLuong, string maTheLoai, string anh)
        {
            MaGame = maGame;
            TenGame = tenGame;
            MoTa = moTa;
            DonGia = donGia;
            NamRaMat = namRaMat;
            SoLuong = soLuong;
            MaTheLoai = maTheLoai;
            Anh = anh;
        }

        // Phương thức để hiển thị thông tin game (tùy chọn)
        public override string ToString()
        {
            return $"Mã Game: {MaGame}, Tên Game: {TenGame}, Đơn Giá: {DonGia:C}, Năm Ra Mắt: {NamRaMat:yyyy}, Số Lượng: {SoLuong}, Mã Thể Loại: {MaTheLoai}, Ảnh: {Anh}";
        }
    }
}
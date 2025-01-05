using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormTest
{
    public partial class DangNhap : Page
    {
        // Chuỗi kết nối đến cơ sở dữ liệu
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void LoginButton_Click1(object sender, EventArgs e)
        {
            string username = UserName.Text.Trim();
            string password = Password.Text.Trim();
            string maXacNhan = MaXacNhan.Text.Trim();

            // Kiểm tra mã xác nhận
            if (!KiemTraMaXacNhan(maXacNhan))
            {
                lblThongBao.Text = "Mã xác nhận không hợp lệ!";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string sql = "SELECT HoTen, Quyen FROM TaiKhoan WHERE Username = @Username AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();  // Đọc dòng dữ liệu
                        string hoTen = reader["HoTen"].ToString();
                        bool quyen = Convert.ToBoolean(reader["Quyen"]);

                        // Lưu mã xác nhận vào bảng MaXacNhan
                        reader.Close(); // Đóng reader trước khi thực hiện truy vấn khác
                        string insertSql = "INSERT INTO MaXacNhan (MaXacNhan) VALUES (@MaXacNhan)";
                        using (SqlCommand insertCmd = new SqlCommand(insertSql, conn))
                        {
                            insertCmd.Parameters.AddWithValue("@MaXacNhan", maXacNhan);
                            insertCmd.ExecuteNonQuery();
                        }

                        // Tạo session lưu tên đăng nhập và họ tên
                        Session["Username"] = username;
                        Session["HoTen"] = hoTen;
                        Session["Quyen"] = quyen;

                        // Điều hướng đến trang khác sau khi đăng nhập thành công
                        Response.Redirect("Default.aspx");  // Trang Home hoặc trang bạn muốn điều hướng đến

                    }
                    else
                    {
                        // Nếu đăng nhập thất bại
                        lblThongBao.Text = "Tên đăng nhập hoặc mật khẩu không đúng!";
                    }
                }
            }
        }

        // Phương thức kiểm tra mã xác nhận
        private bool KiemTraMaXacNhan(string maXacNhan)
        {
            // mã xác nhận phải có ít nhất 8 ký tự
            if (string.IsNullOrEmpty(maXacNhan) || maXacNhan.Length < 8)
            {
                return false; // Mã xác nhận phải có ít nhất 8 ký tự
            }

            // mã xác nhận bắt đầu bằng một số lớn hơn 0
            if (!char.IsDigit(maXacNhan[0]) || maXacNhan[0] == '0')
            {
                return false; // Mã xác nhận phải bắt đầu bằng một chữ số lớn hơn 0
            }

            // mã xác nhận có ít nhất 1 chữ cái
            bool hasLetter = maXacNhan.Any(char.IsLetter); // Kiểm tra nếu có ít nhất một ký tự là chữ cái
            if (!hasLetter)
            {
                return false; // Mã xác nhận phải chứa ít nhất 1 chữ cái
            }

            return true;
        }

    }
}
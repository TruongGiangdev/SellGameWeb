using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormTest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            // Lấy danh sách sở thích đã chọn
            List<string> soThich = new List<string>();

            // Kiểm tra các checkbox sở thích
            if (chkA01.Checked) soThich.Add("Đá bóng");
            if (chkA02.Checked) soThich.Add("Du lịch");
            if (chkA03.Checked) soThich.Add("Chơi game");
            if (chkA04.Checked) soThich.Add("Đọc sách");
            if (chkA05.Checked) soThich.Add("Nghe nhạc");

            // Kiểm tra số lượng sở thích đã chọn
            if (soThich.Count < 1 || soThich.Count > 3)
            {
                lblThongBao.Text = "Vui lòng chọn ít nhất 1 và nhiều nhất 3 sở thích.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            string soThichDaChon = string.Join(", ", soThich);



            // Ví dụ: Hiển thị danh sách sở thích đã chọn
            lblThongBao.Text = "Sở thích của bạn: " + soThichDaChon;

            // Lấy danh sách lớp đã chọn
            List<string> lop = ddlLop.Items.Cast<ListItem>()
                                    .Where(item => item.Selected)
                                    .Select(item => item.Value)
                                    .ToList();

            string lopDaChon = string.Join(", ", lop);


            // Ví dụ: Hiển thị danh sách sở thích đã chọn
            lblThongBao.Text = "Sở thích của bạn: " + soThichDaChon;

            string username = txtUsername.Text;
            string hoTen = txtHoTen.Text;
            bool gioiTinh = rdoNam.Checked; // Nam: true, Nữ: false
            DateTime ngaySinh;
            string email = txtEmail.Text;
            string sdt = txtSDT.Text;
            string matKhau = txtMatKhau.Text;
            string xacNhanMatKhau = txtXacNhanMatKhau.Text;

            // Kiểm tra tên đăng nhập
            if (!System.Text.RegularExpressions.Regex.IsMatch(username, "^[a-zA-Z0-9]{5,20}$"))
            {
                lblThongBao.Text = "Tên đăng nhập chỉ chứa chữ cái, số và phải dài từ 5-20 ký tự.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra họ tên
            if (!System.Text.RegularExpressions.Regex.IsMatch(hoTen.Trim(), "^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểễệỉịọỏốồổỗộớờởỡợụủứừửữựỳỵỷỹ\\s]+$"))
            {
                lblThongBao.Text = "Họ tên chỉ chứa chữ cái và khoảng trắng.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            if (hoTen.Length < 8 || hoTen.Length > 50)
            {
                lblThongBao.Text = "Họ tên phải có độ dài từ 8 đến 50 ký tự.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra ngày sinh
            if (string.IsNullOrEmpty(txtNgaySinh.Text) || !DateTime.TryParse(txtNgaySinh.Text, out ngaySinh))
            {
                lblThongBao.Text = "Ngày sinh không hợp lệ hoặc chưa được điền.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra giới tính
            if (!rdoNam.Checked && !rdoNu.Checked)
            {
                lblThongBao.Text = "Vui lòng chọn giới tính.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra email
            if (!System.Text.RegularExpressions.Regex.IsMatch(email, "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"))
            {
                lblThongBao.Text = "Email không hợp lệ.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra số điện thoại
            if (!System.Text.RegularExpressions.Regex.IsMatch(sdt, "^[0-9]{10,11}$"))
            {
                lblThongBao.Text = "Số điện thoại phải chứa 10-11 chữ số.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra mật khẩu
            if (!System.Text.RegularExpressions.Regex.IsMatch(matKhau, "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,20}$"))
            {
                lblThongBao.Text = "Mật khẩu phải có từ 6 đến 20 ký tự, chứa ít nhất một chữ hoa, một chữ thường và một chữ số.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra mật khẩu và xác nhận mật khẩu có khớp không
            if (matKhau != xacNhanMatKhau)
            {
                lblThongBao.Text = "Mật khẩu và xác nhận mật khẩu không khớp.";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Kiểm tra nếu tên đăng nhập đã tồn tại
            if (KiemTraUsernameTonTai(username) > 0)
            {
                lblThongBao.Text = "Tên tài khoản đã tồn tại";
                lblThongBao.CssClass = "text-danger";
                return;
            }

            // Gọi stored procedure để đăng ký và tạo giỏ hàng
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("proc_DangKiGioHang1", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    // Thêm các tham số cho stored procedure
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@HoTen", hoTen);
                    cmd.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    cmd.Parameters.AddWithValue("@NgaySinh", ngaySinh);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@SDT", sdt);
                    cmd.Parameters.AddWithValue("@Password", matKhau);
                    cmd.Parameters.AddWithValue("@SoThich", soThichDaChon);
                    cmd.Parameters.AddWithValue("@Lop", lopDaChon);

                    try
                    {
                        cmd.ExecuteNonQuery();
                        lblThongBao.Text = "Đăng ký thành công!";
                        lblThongBao.CssClass = "text-success";
                    }
                    catch (Exception ex)
                    {
                        lblThongBao.Text = "Đăng ký thất bại. Lỗi: " + ex.Message;
                        lblThongBao.CssClass = "text-danger";
                    }
                }
            }
        }

        private int KiemTraUsernameTonTai(string username)
        {
            string query = "SELECT COUNT(*) FROM TaiKhoan WHERE Username = @Username";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();

                    return count; // Trả về số lượng tài khoản có cùng tên đăng nhập
                }
            }
        }
    }
}

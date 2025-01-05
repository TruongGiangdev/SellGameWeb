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
    public partial class ThongTinTK : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    LoadUserData(Session["Username"].ToString());
                }

            }
        }

        private void LoadUserData(string username)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Username, HoTen, GioiTinh, NgaySinh, Email, SDT, Password FROM TaiKhoan WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtUsername.Text = reader["Username"].ToString();
                            txtHoTen.Text = reader["HoTen"].ToString();
                            bool gioiTinh = Convert.ToBoolean(reader["GioiTinh"]);
                            rdbNam.Checked = gioiTinh;
                            rdbNu.Checked = !gioiTinh;
                            txtNgaySinh.Text = reader["NgaySinh"] != DBNull.Value ? Convert.ToDateTime(reader["NgaySinh"]).ToString("yyyy-MM-dd") : "";
                            txtEmail.Text = reader["Email"].ToString();
                            txtSDT.Text = reader["SDT"].ToString();
                        }
                    }
                    conn.Close();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (chkChangePassword.Checked)
            {
                if (string.IsNullOrEmpty(txtCurrentPassword.Text) || string.IsNullOrEmpty(txtNewPassword.Text) || string.IsNullOrEmpty(txtConfirmNewPassword.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập đầy đủ thông tin mật khẩu.');", true);
                    return;
                }

                if (txtNewPassword.Text != txtConfirmNewPassword.Text)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mật khẩu mới và nhập lại mật khẩu mới không khớp.');", true);
                    return;
                }
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE TaiKhoan SET HoTen = @HoTen, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, Email = @Email, SDT = @SDT";
                if (chkChangePassword.Checked)
                {
                    query += ", Password = @NewPassword";
                }
                query += " WHERE Username = @Username";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@HoTen", txtHoTen.Text);
                    cmd.Parameters.AddWithValue("@GioiTinh", rdbNam.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@NgaySinh", DateTime.TryParse(txtNgaySinh.Text, out DateTime ngaySinh) ? (object)ngaySinh : DBNull.Value);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@SDT", txtSDT.Text);

                    if (chkChangePassword.Checked)
                    {
                        cmd.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text);
                    }

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            // Hiển thị thông báo cập nhật thành công
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông tin thành công!');", true);

            // tải lại trang
            Response.Redirect("ThongTinTK.aspx");
        }
    }
}
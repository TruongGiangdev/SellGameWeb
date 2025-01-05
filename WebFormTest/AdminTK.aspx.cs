using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebFormTest
{
    public partial class AdminTK : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTaiKhoan();
            }
        }

        private void LoadTaiKhoan()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM TaiKhoan", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewTaiKhoan.DataSource = dt;
                GridViewTaiKhoan.DataBind();
            }
        }

        protected void btnAddTaiKhoan_Click(object sender, EventArgs e)
        {
            
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // check username trùng
                string checkQuery = "SELECT COUNT(*) FROM TaiKhoan WHERE Username = @Username";
                using (SqlCommand cmdCheck = new SqlCommand(checkQuery, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@Username", txtUsername.Text);
                    conn.Open();
                    int userCount = (int)cmdCheck.ExecuteScalar();
                    conn.Close();

                    if (userCount > 0)
                    {
                        lblUsernameError.Text = "Username đã tồn tại. Vui lòng chọn tên khác.";
                        lblUsernameError.Visible = true;
                        return;
                    }
                }


                string query = "INSERT INTO TaiKhoan (Username, HoTen, GioiTinh, NgaySinh, Email, SDT, Password, Quyen) " +
                               "VALUES (@Username, @HoTen, @GioiTinh, @NgaySinh, @Email, @SDT, @Password, @Quyen)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@HoTen", txtHoTen.Text);
                    cmd.Parameters.AddWithValue("@GioiTinh", txtGioiTinh.Text == "1");
                    cmd.Parameters.AddWithValue("@NgaySinh", DateTime.TryParse(txtNgaySinh.Text, out DateTime ngaySinh) ? (object)ngaySinh : DBNull.Value);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@SDT", txtSDT.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Quyen", txtQuyen.Text == "1");

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                lblUsernameError.Visible = false; // Ẩn thông báo lỗi khi thêm thành công
            }

            Response.Redirect("AdminTaiKhoan.aspx");
        }

        protected void GridViewTaiKhoan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewTaiKhoan.EditIndex = e.NewEditIndex;
            LoadTaiKhoan();
        }

        protected void GridViewTaiKhoan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewTaiKhoan.EditIndex = -1;
            LoadTaiKhoan();
        }

        protected void GridViewTaiKhoan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewTaiKhoan.Rows[e.RowIndex];
            string username = GridViewTaiKhoan.DataKeys[e.RowIndex].Value.ToString();
            string hoTen = ((TextBox)row.Cells[1].Controls[0]).Text;
            bool gioiTinh = ((TextBox)row.Cells[2].Controls[0]).Text == "1";
            DateTime ngaySinh = DateTime.Parse(((TextBox)row.Cells[3].Controls[0]).Text);
            string email = ((TextBox)row.Cells[4].Controls[0]).Text;
            string sdt = ((TextBox)row.Cells[5].Controls[0]).Text;
            string password = ((TextBox)row.Cells[6].Controls[0]).Text;
            bool quyen = ((TextBox)row.Cells[7].Controls[0]).Text == "1";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE TaiKhoan SET HoTen = @HoTen, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, Email = @Email, SDT = @SDT, Password = @Password, Quyen = @Quyen WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@HoTen", hoTen);
                    cmd.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    cmd.Parameters.AddWithValue("@NgaySinh", ngaySinh);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@SDT", sdt);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Quyen", quyen);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            GridViewTaiKhoan.EditIndex = -1;
            LoadTaiKhoan();
        }

        protected void GridViewTaiKhoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string username = GridViewTaiKhoan.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                //string query = "DELETE FROM TaiKhoan WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand("proc_XoaUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Thêm tham số cho stored procedure
                    cmd.Parameters.AddWithValue("@Username", username);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        lblThongBao.Text = "Lỗi khi xóa người dùng: " + ex.Message;
                        lblThongBao.CssClass = "text-danger";
                        return;
                    }
                }
            }

            LoadTaiKhoan();
        }
    }
}
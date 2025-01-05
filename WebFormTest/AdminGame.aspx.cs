using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebFormTest
{
    public partial class AdminGame : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGames();
            }
        }

        private void LoadGames()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Game", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewGames.DataSource = dt;
                GridViewGames.DataBind();
            }
        }

        protected void btnAddGame_Click(object sender, EventArgs e)
        {
            Game game = new Game
            {
                MaGame = txtMaGame.Text,
                TenGame = txtTenGame.Text,
                MoTa = txtMoTa.Text,
                MaTheLoai = txtMaTheLoai.Text
            };

            if (!float.TryParse(txtDonGia.Text, out float donGia))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đơn giá không hợp lệ. Vui lòng nhập lại.');", true);
                return;
            }
            game.DonGia = donGia;

            if (!DateTime.TryParse(txtNamRaMat.Text, out DateTime namRaMat))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Năm ra mắt không hợp lệ. Vui lòng nhập đúng định dạng.');", true);
                return;
            }
            game.NamRaMat = namRaMat;

            if (!int.TryParse(txtSoLuong.Text, out int soLuong))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Số lượng không hợp lệ. Vui lòng nhập lại.');", true);
                return;
            }
            game.SoLuong = soLuong;

            if (fileUploadAnh.HasFile)
            {
                // Lấy tên file
                string fileName = fileUploadAnh.FileName;

                // Đường dẫn đến thư mục "assets" trong thư mục gốc của dự án
                string filePath = Server.MapPath("~/assets/img/") + fileName;

                // Lưu đường dẫn file vào thuộc tính Anh
                game.Anh = fileName;

                // Lưu file vào thư mục "assets"
                fileUploadAnh.SaveAs(filePath);
            }


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // check id game trùng
                string checkQuery = "SELECT COUNT(*) FROM Game WHERE MaGame = @MaGame";
                using (SqlCommand cmdCheck = new SqlCommand(checkQuery, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@MaGame", txtMaGame.Text);
                    conn.Open();
                    int gameCount = (int)cmdCheck.ExecuteScalar();
                    conn.Close();

                    if (gameCount > 0)
                    {
                        lblUsernameError.Text = "Mã game đã tồn tại. Vui lòng chọn mã khác.";
                        lblUsernameError.Visible = true;
                        return;
                    }
                }

                string query = "INSERT INTO Game (MaGame, TenGame, MoTa, DonGia, NamRaMat, SoLuong, MaTheLoai, Anh) " +
                               "VALUES (@MaGame, @TenGame, @MoTa, @DonGia, @NamRaMat, @SoLuong, @MaTheLoai, @Anh)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MaGame", game.MaGame);
                    cmd.Parameters.AddWithValue("@TenGame", game.TenGame);
                    cmd.Parameters.AddWithValue("@MoTa", game.MoTa);
                    cmd.Parameters.AddWithValue("@DonGia", game.DonGia);
                    cmd.Parameters.AddWithValue("@NamRaMat", game.NamRaMat);
                    cmd.Parameters.AddWithValue("@SoLuong", game.SoLuong);
                    cmd.Parameters.AddWithValue("@MaTheLoai", game.MaTheLoai);
                    cmd.Parameters.AddWithValue("@Anh", game.Anh);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                lblUsernameError.Visible = false;
            }

            Response.Redirect("AdminGame.aspx");
        }

        protected void GridViewGames_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewGames.EditIndex = e.NewEditIndex;
            LoadGames();
        }

        protected void GridViewGames_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewGames.EditIndex = -1;
            LoadGames();
        }

        protected void GridViewGames_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewGames.Rows[e.RowIndex];
            Game game = new Game
            {
                MaGame = GridViewGames.DataKeys[e.RowIndex].Value.ToString(),
                TenGame = ((TextBox)row.Cells[1].Controls[0]).Text,
                MoTa = ((TextBox)row.Cells[2].Controls[0]).Text,
                DonGia = float.Parse(((TextBox)row.Cells[3].Controls[0]).Text),
                NamRaMat = DateTime.Parse(((TextBox)row.Cells[4].Controls[0]).Text),
                SoLuong = int.Parse(((TextBox)row.Cells[6].Controls[0]).Text),
                MaTheLoai = ((TextBox)row.Cells[7].Controls[0]).Text
            };

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Game SET TenGame = @TenGame, MoTa = @MoTa, DonGia = @DonGia, NamRaMat = @NamRaMat, SoLuong = @SoLuong, MaTheLoai = @MaTheLoai WHERE MaGame = @MaGame";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MaGame", game.MaGame);
                    cmd.Parameters.AddWithValue("@TenGame", game.TenGame);
                    cmd.Parameters.AddWithValue("@MoTa", game.MoTa);
                    cmd.Parameters.AddWithValue("@DonGia", game.DonGia);
                    cmd.Parameters.AddWithValue("@NamRaMat", game.NamRaMat);
                    cmd.Parameters.AddWithValue("@SoLuong", game.SoLuong);
                    cmd.Parameters.AddWithValue("@MaTheLoai", game.MaTheLoai);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            GridViewGames.EditIndex = -1;
            LoadGames();
        }

        protected void GridViewGames_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string maGame = GridViewGames.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Game WHERE MaGame = @MaGame";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MaGame", maGame);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            LoadGames();
        }
    }
}

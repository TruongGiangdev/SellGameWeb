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
    public partial class AdminTheLoai : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTheLoai();
            }
        }

        private void LoadTheLoai()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM TheLoai", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewTheLoai.DataSource = dt;
                GridViewTheLoai.DataBind();
            }
        }

        protected void btnAddTheLoai_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // check id thể loại trùng
                string check = "SELECT COUNT(*) FROM TheLoai WHERE MaTheLoai = @MaTheLoai";
                using (SqlCommand cmdCheck = new SqlCommand(check, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@MaTheLoai", txtMaTheLoai.Text);
                    conn.Open();
                    int tlCount = (int)cmdCheck.ExecuteScalar();
                    conn.Close();

                    if (tlCount > 0)
                    {
                        lblUsernameError.Text = "Mã thể loại đã tồn tại. Vui lòng chọn mã khác.";
                        lblUsernameError.Visible = true;
                        return;
                    }
                }

                string checkQuery = "SELECT COUNT(*) FROM TheLoai WHERE MaTheLoai = @MaTheLoai";
                using (SqlCommand cmdCheck = new SqlCommand(checkQuery, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@MaTheLoai", txtMaTheLoai.Text);
                    conn.Open();
                    int count = (int)cmdCheck.ExecuteScalar();
                    conn.Close();

                    if (count > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã thể loại đã tồn tại. Vui lòng chọn mã khác.');", true);
                        return;
                    }
                }

                string query = "INSERT INTO TheLoai (MaTheLoai, TenTheLoai, MoTa) VALUES (@MaTheLoai, @TenTheLoai, @MoTa)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MaTheLoai", txtMaTheLoai.Text);
                    cmd.Parameters.AddWithValue("@TenTheLoai", txtTenTheLoai.Text);
                    cmd.Parameters.AddWithValue("@MoTa", txtMoTa.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                lblUsernameError.Visible = false;
            }

            Response.Redirect("AdminTheLoai.aspx");
        }

        protected void GridViewTheLoai_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewTheLoai.EditIndex = e.NewEditIndex;
            LoadTheLoai();
        }

        protected void GridViewTheLoai_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewTheLoai.EditIndex = -1;
            LoadTheLoai();
        }

        protected void GridViewTheLoai_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewTheLoai.Rows[e.RowIndex];
            string maTheLoai = GridViewTheLoai.DataKeys[e.RowIndex].Value.ToString();
            string tenTheLoai = ((TextBox)row.Cells[1].Controls[0]).Text;
            string moTa = ((TextBox)row.Cells[2].Controls[0]).Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE TheLoai SET TenTheLoai = @TenTheLoai, MoTa = @MoTa WHERE MaTheLoai = @MaTheLoai";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MaTheLoai", maTheLoai);
                    cmd.Parameters.AddWithValue("@TenTheLoai", tenTheLoai);
                    cmd.Parameters.AddWithValue("@MoTa", moTa);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            GridViewTheLoai.EditIndex = -1;
            LoadTheLoai();
        }

        protected void GridViewTheLoai_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string maTheLoai = GridViewTheLoai.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM TheLoai WHERE MaTheLoai = @MaTheLoai";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MaTheLoai", maTheLoai);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            LoadTheLoai();
        }
    }
}
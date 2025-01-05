using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormTest
{
    public partial class DanhSachUser : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThiDanhSachUser();
            }
        }

        private DataTable LayDanhSachUser()
        {
            // Tạo DataTable để chứa dữ liệu trả về
            DataTable dt = new DataTable();

            // Truy vấn để lấy toàn bộ dữ liệu từ bảng TaiKhoan
            string query = "SELECT * FROM TaiKhoan";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();

                    // Sử dụng SqlDataAdapter để điền dữ liệu vào DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }

        private void HienThiDanhSachUser()
        {
            // Lấy dữ liệu từ bảng TaiKhoan
            DataTable danhSachUser = LayDanhSachUser();

            // Gắn dữ liệu vào GridView
            gvDanhSachUser.DataSource = danhSachUser;
            gvDanhSachUser.DataBind();
        }
    }
}
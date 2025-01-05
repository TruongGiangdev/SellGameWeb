using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebFormTest
{
    public partial class ChiTietSP : Page
    {
        // Kết nối đến cơ sở dữ liệu
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string maGame = Request.QueryString["id"];

                // Gọi phương thức cập nhật lượt xem
                if (!string.IsNullOrEmpty(maGame))
                {
                    UpdateViewCount(maGame);
                }

                // Gọi phương thức để tải thông tin sản phẩm
                LoadProductDetails();
            }
        }

        private void UpdateViewCount(string maGame)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("UPDATE Game SET SoLuotXem = SoLuotXem + 1 WHERE MaGame = @MaGame", conn))
                    {
                        // Thêm tham số cho truy vấn
                        cmd.Parameters.AddWithValue("@MaGame", maGame);

                        // Thực thi truy vấn
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ, ghi log hoặc hiển thị thông báo lỗi nếu cần
                Response.Write("<script>alert('Lỗi khi cập nhật lượt xem: " + ex.Message + "');</script>");
            }
        }

        protected void LoadProductDetails()
        {
            string maGame = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(maGame))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT SoLuotXem FROM Game WHERE MaGame = @MaGame", conn))
                    {
                        cmd.Parameters.AddWithValue("@MaGame", maGame);
                        int soLuotXem = (int)cmd.ExecuteScalar();
                        lblViewCount.Text = soLuotXem.ToString();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            // Lấy thông tin Username từ session và MaGame từ query string
            string username = Session["Username"]?.ToString();
            string maGame = Request.QueryString["id"]; // Lấy MaGame từ URL (productID)

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(maGame))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("proc_ThemGameVaoGio", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        // Gán giá trị cho các tham số
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@MaGame", maGame);
                        cmd.Parameters.AddWithValue("@SoLuong", int.Parse(quantity.Value)); // Lấy số lượng từ input quantity
                        cmd.Parameters.AddWithValue("@NgayOrder", DateTime.Now);

                        try
                        {
                            // Thực thi stored procedure
                            cmd.ExecuteNonQuery();

                            // Hiển thị thông báo thành công
                            Response.Write("<script>alert('Sản phẩm đã được thêm vào giỏ hàng!');</script>");
                        }
                        catch (Exception ex)
                        {
                            // Thông báo lỗi nếu có
                            Response.Write("<script>alert('Lỗi khi thêm sản phẩm: " + ex.Message + "');</script>");
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng.'); window.location='DangNhap.aspx';</script>");
                return; // Dừng lại nếu chưa có thông tin đăng nhập
            }
        }
    }
}

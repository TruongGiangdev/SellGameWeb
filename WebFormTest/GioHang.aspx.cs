using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace WebFormTest
{
    public partial class GioHang : Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    LoadCartItems();
                }
                else
                {
                    Response.Redirect("DangNhap.aspx");
                }
            }
        }

        private void LoadCartItems()
        {
            string username = Session["Username"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("proc_ThongTinGioHang", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Username", username);
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        // Gán dữ liệu cho Repeater
                        cartRepeater.DataSource = dt;
                        cartRepeater.DataBind();

                        // Kiểm tra nếu giỏ hàng trống
                        if (dt.Rows.Count == 0)
                        {
                            ViewState["CartEmpty"] = true;
                        }
                        else
                        {
                            ViewState["CartEmpty"] = false;
                        }
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string username = Session["Username"].ToString();
            string maGame = ((System.Web.UI.WebControls.Button)sender).CommandArgument;

            DeleteItem(username, maGame);
            LoadCartItems();
        }

        protected void DeleteItem(string username, string maGame)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("proc_XoaSPGioHang", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@MaGame", maGame);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // kiểm tra xem đã đăng nhập chưa
            if (Session["Username"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            // Kiểm tra nếu giỏ hàng trống
            if (ViewState["CartEmpty"] != null && (bool)ViewState["CartEmpty"] == true)
            {
                Response.Write("<script>alert('Giỏ hàng của bạn không có sản phẩm nào!');</script>");
                return;
            }

            string username = Session["Username"].ToString();
            string maHoaDon = GenerateUniqueMaHoaDon().ToString().ToUpper(); // Tạo mã hóa đơn duy nhất
            DateTime ngayThanhToan = DateTime.Now;
            string phuongThucThanhToan = "COD"; // Hoặc lấy từ giao diện nếu có nhiều lựa chọn

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmdCheckout = new SqlCommand("proc_TaoHoaDon", connection))
                {
                    cmdCheckout.CommandType = CommandType.StoredProcedure;
                    cmdCheckout.Parameters.AddWithValue("@MaHoaDon", maHoaDon);
                    cmdCheckout.Parameters.AddWithValue("@Username", username);
                    cmdCheckout.Parameters.AddWithValue("@NgayThanhToan", ngayThanhToan);
                    cmdCheckout.Parameters.AddWithValue("@PhuongThucThanhToan", phuongThucThanhToan);

                    connection.Open();

                    try
                    {
                        cmdCheckout.ExecuteNonQuery();
                        Response.Write("<script>alert('Thanh toán thành công!');</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Thanh toán thất bại: " + ex.Message + "');</script>");
                    }
                }
            }

            LoadCartItems();
        }

        private string GenerateUniqueMaHoaDon()
        {
            string maHoaDon = "";
            bool isUnique = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                while (!isUnique)
                {
                    maHoaDon = Guid.NewGuid().ToString(); // Tạo mã ngẫu nhiên

                    // Kiểm tra xem mã này đã tồn tại chưa
                    string checkQuery = "SELECT COUNT(*) FROM HoaDon WHERE MaHoaDon = @MaHoaDon";
                    using (SqlCommand cmdCheck = new SqlCommand(checkQuery, connection))
                    {
                        cmdCheck.Parameters.AddWithValue("@MaHoaDon", maHoaDon);
                        int count = (int)cmdCheck.ExecuteScalar();

                        if (count == 0)
                        {
                            isUnique = true; // Mã không tồn tại trong CSDL, có thể sử dụng
                        }
                    }
                }
            }

            return maHoaDon;
        }
    }
}

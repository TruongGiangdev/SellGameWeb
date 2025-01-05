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
    public partial class HanhDong : Page
    {
        // Chuỗi kết nối tới cơ sở dữ liệu
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGameData();
            }
        }

        private void LoadGameData()
        {

            // Câu truy vấn để lấy dữ liệu từ bảng Game
            string query = "SELECT MaGame, TenGame, MoTa, DonGia, Anh FROM Game where MaTheLoai='hanhdong'";

            // Thiết lập kết nối đến cơ sở dữ liệu
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Lặp qua kết quả và thêm các sản phẩm vào giao diện
                    while (reader.Read())
                    {
                        string maGame = reader["MaGame"].ToString();
                        string tenGame = reader["TenGame"].ToString();
                        string moTa = reader["MoTa"].ToString();
                        decimal donGia = Convert.ToDecimal(reader["DonGia"]); // Chuyển đổi sang kiểu decimal
                        string formattedDonGia = donGia.ToString("N0"); // Định dạng với dấu chấm ngăn cách hàng nghìn
                        string anh = "assets/img/" + reader["Anh"].ToString();

                        // Thêm sản phẩm vào div hiển thị trên trang
                        productList.InnerHtml += $@"
                            <div class='col-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 product-item'>
                                <div class='card'>
                                    <a href='ChiTietSP.aspx?name={tenGame}&price={donGia}&image={anh}&description={moTa}' style='text-decoration: none; color: inherit;'>
                                        <img src='{anh}' class='card-img-top' alt='{tenGame}'>
                                        <div class='card-body'>
                                            <h5 class='card-title'>{tenGame}</h5>
                                            <!-- <p class='card-text'>{moTa}</p> -->
                                              <p class='card-text'><strong>Giá: {formattedDonGia} VNĐ</strong></p>
                                               <div style='display: flex; justify-content: space-between;'> 
                                           
                                             <button class='btn btn-primary' onclick='addToCart(\""{maGame}\"")'>Thêm vào giỏ hàng</button>
                                             </div>

                                        </div>
                                    </a>
                                </div>
                            </div>";
                    }

                    conn.Close();
                }
            }
        }
    }
}
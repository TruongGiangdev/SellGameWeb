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
    public partial class TimKiem : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string keyword = Request.QueryString["keyword"];
                if (!string.IsNullOrEmpty(keyword))
                {
                    LoadSearchResults(keyword);
                }
            }
        }

        private void LoadSearchResults(string keyword)
        {
            
            string query = "SELECT MaGame, TenGame, MoTa, DonGia, Anh FROM Game WHERE TenGame LIKE @Keyword";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Keyword", "%" + keyword + "%");

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        string maGame = reader["MaGame"].ToString();
                        string tenGame = reader["TenGame"].ToString();
                        string donGia = reader["DonGia"].ToString();
                        string anh = "assets/img/" + reader["Anh"].ToString();
                        string moTa = reader["MoTa"].ToString();

                        searchResults.InnerHtml += $@"
                            <div class='col-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 product-item'>
                                <div class='card'>
                                    <a href='ChiTietSP.aspx?name={tenGame}&price={donGia}&image={anh}&description={moTa}&id={maGame}'>
                                        <img src='{anh}' class='card-img-top' alt='{tenGame}'>
                                        <div class='card-body'>
                                            <h5 class='card-title'>{tenGame}</h5>
                                              <p class='card-text'><strong>Giá: {donGia} VNĐ</strong></p>
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
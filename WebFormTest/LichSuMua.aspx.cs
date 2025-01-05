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
    public partial class LichSuMua : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                LoadPurchaseHistory();
            }
            else
            {
                Response.Redirect("DangNhap.aspx");
            }
        }

        private void LoadPurchaseHistory()
        {
            string username = Session["Username"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("proc_LayLichSuMuaHang", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Username", username);

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        historyRepeater.DataSource = dt;
                        historyRepeater.DataBind();
                    }
                }
            }
        }
    }
}
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
    public partial class MaXacNhan : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebBanGameConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMaXacNhan();
            }
        }

        private void LoadMaXacNhan()
        {
            String query = "Select * from MaXacNhan";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        maXacNhan.DataSource = dt;
                        maXacNhan.DataBind();
                    }
                }
            }
        }
    }
}
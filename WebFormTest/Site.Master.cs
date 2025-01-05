using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormTest
{
    public partial class SiteMaster : MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HoTen"] != null)
            {
                lb_chao.Text = "Xin chào, " + Session["HoTen"].ToString();
                dangnhap.Visible = false;
                dangxuat.Visible = true;
            }
            else
            {
                chaomung.Visible = false;
                dangnhap.Visible = true;
                dangxuat.Visible = false;
            }

            // Kiểm tra quyền hạn để hiển thị hoặc ẩn dropdown Admin
            if (Session["Quyen"] != null)
            {
                int quyen = Convert.ToInt32(Session["Quyen"]);
                adminDropdown.Visible = (quyen == 1); // Hiển thị nếu là admin, ẩn nếu không
            }
            else
            {
                adminDropdown.Visible = false; // Ẩn dropdown admin nếu chưa đăng nhập
            }


        }
        protected void DangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = searchInput.Value;
            if (!string.IsNullOrEmpty(keyword))
            {
                Response.Redirect($"TimKiem.aspx?keyword={Server.UrlEncode(keyword)}");
            }
        }
    }
}
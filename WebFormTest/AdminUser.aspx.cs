using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormTest
{
    public partial class AdminUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridViewUser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Đặt GridView vào chế độ chỉnh sửa
            GridViewUser.EditIndex = e.NewEditIndex;
            LoadGridViewData();  // Tải lại dữ liệu để hiển thị chế độ chỉnh sửa
        }

        // Phương thức để tải dữ liệu vào GridView (ví dụ)
        private void LoadGridViewData()
        {
            
        }
    }
}
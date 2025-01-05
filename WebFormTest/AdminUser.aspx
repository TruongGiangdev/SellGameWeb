<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="WebFormTest.AdminUser" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý User</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Quản lý User</h2>
            <asp:MultiView ID="MultiViewUser" runat="server" ActiveViewIndex="0">
                <!-- View hiển thị danh sách User (Read) -->
                <asp:View ID="ViewList" runat="server">
                    <asp:GridView ID="GridViewUser" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" 
                        DataKeyNames="Username" OnRowEditing="GridViewUser_RowEditing" 
                        OnRowDeleting="GridViewUser_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnAddUser" runat="server" Text="Thêm User" CssClass="btn btn-primary" OnClick="btnAddUser_Click" />
                </asp:View>

                <!-- View tạo mới User (Create) -->
                <asp:View ID="ViewCreate" runat="server">
                    <h3>Thêm User mới</h3>
                    <div class="form-group">
                        <label>Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username là bắt buộc" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Họ Tên:</label>
                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvHoTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="Họ tên là bắt buộc" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email là bắt buộc" CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+@\w+\.\w+" ErrorMessage="Định dạng email không đúng" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại:</label>
                        <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSDT" runat="server" ControlToValidate="txtSDT" ErrorMessage="Số điện thoại là bắt buộc" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu:</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Mật khẩu là bắt buộc" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnSaveUser" runat="server" Text="Lưu" CssClass="btn btn-success" OnClick="btnSaveUser_Click" />
                        <asp:Button ID="btnCancelCreate" runat="server" Text="Hủy" CssClass="btn btn-secondary" OnClick="btnCancelCreate_Click" />
                    </div>
                </asp:View>

                <!-- View chỉnh sửa User (Update) -->
                <asp:View ID="ViewEdit" runat="server">
                    <h3>Chỉnh sửa User</h3>
                    <div class="form-group">
                        <label>Họ Tên:</label>
                        <asp:TextBox ID="txtEditHoTen" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditHoTen" runat="server" ControlToValidate="txtEditHoTen" ErrorMessage="Họ tên là bắt buộc" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ControlToValidate="txtEditEmail" ErrorMessage="Email là bắt buộc" CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="revEditEmail" runat="server" ControlToValidate="txtEditEmail" ValidationExpression="\w+@\w+\.\w+" ErrorMessage="Định dạng email không đúng" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại:</label>
                        <asp:TextBox ID="txtEditSDT" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditSDT" runat="server" ControlToValidate="txtEditSDT" ErrorMessage="Số điện thoại là bắt buộc" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnUpdateUser" runat="server" Text="Cập nhật" CssClass="btn btn-success" OnClick="btnUpdateUser_Click" />
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Hủy" CssClass="btn btn-secondary" OnClick="btnCancelEdit_Click" />
                    </div>
                </asp:View>
                 <!-- View xác nhận xóa (Delete) -->
     <asp:View ID="ViewDelete" runat="server">
        <h3>Xác nhận xóa tài khoản</h3>
        <p>Bạn có chắc muốn xóa tài khoản <asp:Label ID="lblUsernameToDelete" runat="server"></asp:Label>?</p>
        <asp:Button ID="btnConfirmDelete" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="btnConfirmDelete_Click" />
        <asp:Button ID="btnCancelDelete" runat="server" Text="Hủy" CssClass="btn btn-secondary" OnClick="btnCancelDelete_Click" />
     </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>

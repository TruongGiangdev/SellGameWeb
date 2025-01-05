<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminTK.aspx.cs" Inherits="WebFormTest.AdminTK" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý Tài Khoản</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Quản lý Tài Khoản</h2>

            <div class="table-responsive">
                <asp:GridView ID="GridViewTaiKhoan" runat="server" AutoGenerateColumns="False" DataKeyNames="Username"
                    CssClass="table table-striped table-bordered" OnRowEditing="GridViewTaiKhoan_RowEditing"
                    OnRowDeleting="GridViewTaiKhoan_RowDeleting" OnRowUpdating="GridViewTaiKhoan_RowUpdating"
                    OnRowCancelingEdit="GridViewTaiKhoan_RowCancelingEdit">
                    <Columns>
                        <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />
                        <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" />
                        <asp:BoundField DataField="GioiTinh" HeaderText="Giới Tính" />
                        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="SDT" HeaderText="SĐT" />
                        <asp:BoundField DataField="Password" HeaderText="Mật Khẩu" />
                        <asp:BoundField DataField="Quyen" HeaderText="Quyền" />
                        <asp:BoundField DataField="SoThich" HeaderText="Sở thích" />
                        <asp:BoundField DataField="Lop" HeaderText="Lớp" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <h3 class="text-center mt-4">Thêm Tài Khoản</h3>
            <div class="form-group">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
                <asp:Label ID="lblUsernameError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" Placeholder="Họ Tên"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtGioiTinh" runat="server" CssClass="form-control" Placeholder="Giới Tính (0 hoặc 1)"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control" Placeholder="Ngày Sinh (yyyy-MM-dd)"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control" Placeholder="SĐT"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Placeholder="Mật Khẩu"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtQuyen" runat="server" CssClass="form-control" Placeholder="Quyền (0: User, 1: Admin)"></asp:TextBox>
            </div>

            <!-- Thông báo -->
            <div class="text-center mt-3">
                <asp:Label ID="lblThongBao" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <div class="text-center">
                <asp:Button ID="btnAddTaiKhoan" runat="server" CssClass="btn btn-primary" Text="Thêm Tài Khoản" OnClick="btnAddTaiKhoan_Click" />
            </div>
        </div>
    </form>
    <!-- Thêm Bootstrap JS -->
    <script src="Script/jquery-3.6.0.min.js"></script>
    <script src="Script/bootstrap.bundle.min.js"></script>
</body>
</html>

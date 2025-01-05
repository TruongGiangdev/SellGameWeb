<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongTinTK.aspx.cs" Inherits="WebFormTest.ThongTinTK" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thông Tin Tài Khoản</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script>
        function togglePasswordFields(checkbox) {
            var passwordFields = document.getElementById('passwordFields');
            passwordFields.style.display = checkbox.checked ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Thông Tin Tài Khoản</h2>
            
            <div class="card">
                <div class="card-body">
                    <div class="form-group mb-3">
                        <label for="txtUsername">Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtHoTen">Họ Tên:</label>
                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group mb-3">
                        <label>Giới Tính:</label><br />
                        <asp:RadioButton ID="rdbNam" runat="server" GroupName="GioiTinh" Text="Nam" />
                        <asp:RadioButton ID="rdbNu" runat="server" GroupName="GioiTinh" Text="Nữ" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtNgaySinh">Ngày Sinh:</label>
                        <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtSDT">Số Điện Thoại:</label>
                        <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-check mb-3">
                        <asp:CheckBox ID="chkChangePassword" runat="server" CssClass="form-check-input" OnClick="togglePasswordFields(this)" Text="" />
                        <label class="form-check-label" for="chkChangePassword">Đổi mật khẩu</label> 
                    </div>
                    <div id="passwordFields" style="display: none;">
                        <div class="form-group mb-3">
                            <label for="txtCurrentPassword">Mật Khẩu Hiện Tại:</label>
                            <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtNewPassword">Mật Khẩu Mới:</label>
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtConfirmNewPassword">Nhập Lại Mật Khẩu Mới:</label>
                            <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-3">
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Cập Nhật" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>

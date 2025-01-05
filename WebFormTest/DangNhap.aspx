<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebFormTest.DangNhap" EnableViewState="true" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Đăng nhập</h3>

                        <!-- Form đăng nhập -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control" Placeholder="Nhập username" aria-label="Username" />
                            <label for="UserName">Username</label>
                        </div>
                        <asp:Label ID="lblErrorUserName" runat="server" CssClass="text-danger small"></asp:Label>

                        <div class="form-floating mb-3">
                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Nhập mật khẩu" aria-label="Password" />
                            <label for="Password">Mật khẩu</label>
                        </div>
                        <asp:Label ID="lblErrorPassword" runat="server" CssClass="text-danger small"></asp:Label>

                        <div class="form-floating mb-3">
                            <asp:TextBox ID="MaXacNhan" runat="server" CssClass="form-control" Placeholder="Nhập mã" aria-label="Verification code" />
                            <label for="MaXacNhan">MDT</label>
                        </div>
                        <asp:Label ID="lblErrorMaXacNhan" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Checkbox ghi nhớ tôi -->
                        <div class="form-check mb-3">
                            <asp:CheckBox ID="RememberMe" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label" for="RememberMe">Ghi nhớ tôi</label>
                        </div>

                        <!-- Nút submit -->
                        <div class="d-grid gap-2 mt-4">
                            <asp:Button ID="LoginButton" runat="server" Text="Tiếp tục" CssClass="btn btn-primary btn-lg" OnClick="LoginButton_Click1" />
                        </div>

                        <!-- Thông báo lỗi -->
                        <div class="text-center mt-3">
                            <asp:Label ID="lblThongBao" runat="server" CssClass="text-danger"></asp:Label>
                        </div>

                        <div class="text-center mt-4">
                            <p class="small">Nhập ngẫu nhiên MDT bắt đầu bằng chữ số > 0, ít nhất 8 kí tự, ít nhất 1 chữ cái</p>
                        </div>

                        <!-- Liên kết đến trang đăng ký -->
                        <div class="text-center mt-4">
                            <p class="small">Bạn chưa có tài khoản? <a href="Dangki.aspx">Đăng ký</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

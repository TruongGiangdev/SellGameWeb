<%@ Page Title="Đăng ký" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dangki.aspx.cs" Inherits="WebFormTest.WebForm1" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Đăng Ký Tài Khoản</h2>

                        <!-- Tên đăng nhập -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Nhập tên đăng nhập" aria-label="Username" required="required"></asp:TextBox>
                            <label for="txtUsername">Tên đăng nhập</label>
                        </div>
                        <asp:Label ID="lblErrorUsername" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Họ và tên -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" Placeholder="Nhập họ và tên" aria-label="Full name" required="required"></asp:TextBox>
                            <label for="txtHoTen">Họ và tên</label>
                        </div>
                        <asp:Label ID="lblErrorHoTen" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Giới tính -->
                        <div class="mb-3">
                            <label class="form-label">Giới tính</label>
                            <div class="d-flex gap-3">
                                <div class="form-check">
                                    <asp:RadioButton ID="rdoNam" runat="server" GroupName="GioiTinh" Text="" CssClass="form-check-input" />
                                    <label class="form-check-label" for="rdoNam">Nam</label>
                                </div>
                                <div class="form-check">
                                    <asp:RadioButton ID="rdoNu" runat="server" GroupName="GioiTinh" Text="" CssClass="form-check-input" />
                                    <label class="form-check-label" for="rdoNu">Nữ</label>
                                </div>
                            </div>
                        </div>

                        <!-- Ngày sinh -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control" TextMode="Date" aria-label="Date of Birth"></asp:TextBox>
                            <label for="txtNgaySinh">Ngày sinh</label>
                        </div>
                        <asp:Label ID="lblErrorNgaySinh" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Email -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Nhập email" aria-label="Email" required="required"></asp:TextBox>
                            <label for="txtEmail">Email</label>
                        </div>
                        <asp:Label ID="lblErrorEmail" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Số điện thoại -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control" Placeholder="Nhập số điện thoại" aria-label="Phone Number" required="required"></asp:TextBox>
                            <label for="txtSDT">Số điện thoại</label>
                        </div>
                        <asp:Label ID="lblErrorSDT" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Mật khẩu -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Nhập mật khẩu" aria-label="Password" required="required"></asp:TextBox>
                            <label for="txtMatKhau">Mật khẩu</label>
                        </div>
                        <asp:Label ID="lblErrorMatKhau" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Xác nhận mật khẩu -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtXacNhanMatKhau" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Nhập lại mật khẩu" aria-label="Confirm Password" required="required"></asp:TextBox>
                            <label for="txtXacNhanMatKhau">Xác nhận mật khẩu</label>
                        </div>
                        <asp:Label ID="lblErrorXacNhanMatKhau" runat="server" CssClass="text-danger small"></asp:Label>

                        <!-- Lớp -->
                        <div class="mb-3">
                            <label class="form-label">Lớp</label>
                            <asp:ListBox ID="ddlLop" runat="server" CssClass="form-select" SelectionMode="Multiple">
                                <asp:ListItem Text="A01" Value="A01"></asp:ListItem>
                                <asp:ListItem Text="A02" Value="A02"></asp:ListItem>
                                <asp:ListItem Text="A03" Value="A03"></asp:ListItem>
                                <asp:ListItem Text="A04" Value="A04"></asp:ListItem>
                                <asp:ListItem Text="A05" Value="A05"></asp:ListItem>
                                <asp:ListItem Text="A06" Value="A06"></asp:ListItem>
                                <asp:ListItem Text="A07" Value="A07"></asp:ListItem>
                                <asp:ListItem Text="A08" Value="A08"></asp:ListItem>
                                <asp:ListItem Text="A09" Value="A09"></asp:ListItem>
                            </asp:ListBox>
                        </div>

                        <!-- Sở thích (Checkboxes) -->
                        <div class="mb-3">
                            <label class="form-label">Sở thích</label><br />
                            <asp:CheckBox ID="chkA01" runat="server" Text="Đá bóng" CssClass="form-check-input" />
                            <asp:CheckBox ID="chkA02" runat="server" Text="Du lịch" CssClass="form-check-input" />
                            <asp:CheckBox ID="chkA03" runat="server" Text="Chơi game" CssClass="form-check-input" />
                            <asp:CheckBox ID="chkA04" runat="server" Text="Đọc sách" CssClass="form-check-input" />
                            <asp:CheckBox ID="chkA05" runat="server" Text="Nghe nhạc" CssClass="form-check-input" />
                        </div>

                        <!-- Nút đăng ký -->
                        <div class="d-grid gap-2 mt-4">
                            <asp:Button ID="btnDangKy" runat="server" CssClass="btn btn-primary btn-lg" Text="Đăng Ký" OnClick="btnDangKy_Click" />
                        </div>

                        <!-- Thông báo -->
                        <div class="text-center mt-3">
                            <asp:Label ID="lblThongBao" runat="server" CssClass="text-danger"></asp:Label>
                        </div>

                        <!-- Liên kết đến trang đăng nhập -->
                        <div class="text-center mt-4">
                            <p class="small">Bạn đã có tài khoản? <a href="DangNhap.aspx">Đăng nhập</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

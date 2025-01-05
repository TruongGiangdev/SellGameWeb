<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminGame.aspx.cs" Inherits="WebFormTest.AdminGame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý Game</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Quản lý Game</h2>

            <div class="table-responsive">
                <asp:GridView ID="GridViewGames" runat="server" AutoGenerateColumns="False" DataKeyNames="MaGame"
                    CssClass="table table-striped table-bordered" OnRowEditing="GridViewGames_RowEditing"
                    OnRowDeleting="GridViewGames_RowDeleting" OnRowUpdating="GridViewGames_RowUpdating"
                    OnRowCancelingEdit="GridViewGames_RowCancelingEdit">
                    <Columns>
                        <asp:BoundField DataField="MaGame" HeaderText="Mã Game" ReadOnly="True" />
                        <asp:BoundField DataField="TenGame" HeaderText="Tên Game" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" />
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn Giá" />
                        <asp:BoundField DataField="NamRaMat" HeaderText="Năm Ra Mắt" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Anh" HeaderText="Ảnh" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />
                        <asp:BoundField DataField="MaTheLoai" HeaderText="Mã Thể Loại" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <h3 class="text-center mt-4">Thêm Game</h3>
            <div class="form-group">
                <asp:TextBox ID="txtMaGame" runat="server" CssClass="form-control" Placeholder="Mã Game"></asp:TextBox>
                <asp:Label ID="lblUsernameError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtTenGame" runat="server" CssClass="form-control" Placeholder="Tên Game"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtMoTa" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Mô Tả"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDonGia" runat="server" CssClass="form-control" Placeholder="Đơn Giá"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtNamRaMat" runat="server" CssClass="form-control" Placeholder="Năm Ra Mắt (yyyy-MM-dd)"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-control" Placeholder="Số Lượng"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtMaTheLoai" runat="server" CssClass="form-control" Placeholder="Mã Thể Loại"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:FileUpload ID="fileUploadAnh" runat="server" CssClass="form-control-file" />
            </div>
            <div class="text-center">
                <asp:Button ID="btnAddGame" runat="server" CssClass="btn btn-primary" Text="Thêm Game" OnClick="btnAddGame_Click" />
            </div>
        </div>
    </form>
    <!-- Thêm Bootstrap JS -->
    <script src="Script/jquery-3.6.0.min.js"></script>
    <script src="Script/bootstrap.bundle.min.js"></script>
</body>
</html>

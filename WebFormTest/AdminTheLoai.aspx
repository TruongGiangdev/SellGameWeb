<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminTheLoai.aspx.cs" Inherits="WebFormTest.AdminTheLoai" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý Thể Loại</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Quản lý Thể Loại</h2>

            <div class="table-responsive">
                <asp:GridView ID="GridViewTheLoai" runat="server" AutoGenerateColumns="False" DataKeyNames="MaTheLoai"
                    CssClass="table table-striped table-bordered" OnRowEditing="GridViewTheLoai_RowEditing"
                    OnRowDeleting="GridViewTheLoai_RowDeleting" OnRowUpdating="GridViewTheLoai_RowUpdating"
                    OnRowCancelingEdit="GridViewTheLoai_RowCancelingEdit">
                    <Columns>
                        <asp:BoundField DataField="MaTheLoai" HeaderText="Mã Thể Loại" ReadOnly="True" />
                        <asp:BoundField DataField="TenTheLoai" HeaderText="Tên Thể Loại" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <h3 class="text-center mt-4">Thêm Thể Loại</h3>
            <div class="form-group">
                <asp:TextBox ID="txtMaTheLoai" runat="server" CssClass="form-control" Placeholder="Mã Thể Loại"></asp:TextBox>
                <asp:Label ID="lblUsernameError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtTenTheLoai" runat="server" CssClass="form-control" Placeholder="Tên Thể Loại"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtMoTa" runat="server" CssClass="form-control" Placeholder="Mô Tả" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>
            <div class="text-center">
                <asp:Button ID="btnAddTheLoai" runat="server" CssClass="btn btn-primary" Text="Thêm Thể Loại" OnClick="btnAddTheLoai_Click" />
            </div>
        </div>
    </form>
    <!-- Thêm Bootstrap JS -->
    <script src="Script/jquery-3.6.0.min.js"></script>
    <script src="Script/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachUser.aspx.cs" Inherits="WebFormTest.DanhSachUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh sách user</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Danh sách người dùng</h2>
            <asp:GridView ID="gvDanhSachUser" runat="server" AutoGenerateColumns="true" CssClass="table table-striped">
            </asp:GridView>
        </div>
    </form>
</body>
</html>

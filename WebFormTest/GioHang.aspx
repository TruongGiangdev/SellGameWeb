<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebFormTest.GioHang" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
                <h1 id="cartTitle">Giỏ hàng</h1>
                <!-- Bảng hiển thị sản phẩm trong giỏ hàng -->
                <asp:Repeater ID="cartRepeater" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped mt-4">
                            <thead>
                                <tr>
                                    <th scope="col">Game</th>
                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Xóa Game</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("TenGame") %></td>
                            <td>
                                <img src='<%# "assets/img/" + Eval("HinhAnh") %>' alt="Game Image" style="width: 80px; height: auto;" />
                            </td>
                            <td><%# String.Format("{0:N0} VNĐ", Eval("DonGia")) %></td>
                            <td><%# Eval("SoLuong") %></td>
                            <td><%# String.Format("{0:N0} VNĐ", Eval("ThanhTien")) %></td>
                            <td>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete"
                                    CommandArgument='<%# Eval("MaGame") %>'
                                    OnClick="btnDelete_Click"
                                    CssClass="btn btn-danger" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Button ID="btnCheckout" runat="server" Text="Thanh toán" OnClick="btnCheckout_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>

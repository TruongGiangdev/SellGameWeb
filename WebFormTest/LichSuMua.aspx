<%@ Page Title="Lịch sử mua" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LichSuMua.aspx.cs" Inherits="WebFormTest.LichSuMua" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
               
                <asp:Repeater ID="historyRepeater" runat="server">
                    <HeaderTemplate>
                        <div class="container">
                            <h2>Lịch sử mua hàng</h2>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="card-header">
                                <strong>Mã hóa đơn:</strong> <%# Eval("MaHoaDon") %>
                                <br />
                                <strong>Ngày thanh toán:</strong> <%# Eval("NgayThanhToan", "{0:dd/MM/yyyy HH:mm}") %>
                                <br />
                                <strong>Phương thức thanh toán:</strong> <%# Eval("PhuongThucThanhToan") %>
                            </div>
                            <div class="card-body">
                                <ul>
                                    <li><strong>Tên game:</strong> <%# Eval("TenGame") %></li>
                                    <li><strong>Số lượng:</strong> <%# Eval("SoLuong") %></li>
                                    <li><strong>Giá:</strong> <%# Eval("DonGia", "{0:N0} VNĐ") %></li>
                                    <li><strong>Thành tiền:</strong> <%# Eval("ThanhTien", "{0:N0} VNĐ") %></li>
                                </ul>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div class="text-center mt-4">
                            <p>Hết danh sách</p>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>



            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MaXacNhan.aspx.cs" Inherits="WebFormTest.MaXacNhan" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
               
                <asp:Repeater ID="maXacNhan" runat="server">
                    <HeaderTemplate>
                        <div class="container">
                            <h2>Danh sách mã xác nhận</h2>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="card-header">
                                <strong>STT:</strong> <%# Eval("ID") %>
                                <br />
                                <strong>MaXacNhan:</strong> <%# Eval("MaXacNhan") %>
                                <br />
                                
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
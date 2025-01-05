<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TimKiem.aspx.cs" Inherits="WebFormTest.TimKiem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .card {
            margin-bottom: 20px;
        }

        .product-item img {
            height: 200px;
            object-fit: cover;
        }

        .more-products-offline,
        .more-products-online {
            display: none;
        }
    </style>

    <main>



        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">Trang chủ</h1>
            <p class="lead">Chào mừng bạn đến với trang web của chúng tôi, nơi cung cấp các sản phẩm đa dạng.</p>
        </section>

        <!-- Danh mục sản phẩm từ cơ sở dữ liệu -->


        <h3 class="col-12">Game Đề Xuất</h3>
        <div class="row mt-4" id="searchResults" runat="server">
            <!-- Kết quả tìm kiếm sẽ được chèn tại đây -->
        </div>

    </main>

    <!-- jQuery & Bootstrap JS -->
    <script src="Script/jquery-3.6.0.min.js"></script>
    <script src="Script/bootstrap.bundle.min.js"></script>

</asp:Content>

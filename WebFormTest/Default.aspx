<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormTest._Default" %>

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
        <div class="row mt-4" id="productList" runat="server">
            <h3 class="col-12">Game Đề Xuất</h3>
        </div>

    </main>

    <!-- jQuery & Bootstrap JS -->
    <script src="Script/jquery-3.6.0.min.js"></script>
    <script src="Script/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#loadMoreBtn1').on('click', function () {
                // Hiển thị các sản phẩm bị ẩn trong danh mục offline
                $('.more-products-offline').slideDown();

                // Ẩn nút sau khi hiển thị tất cả sản phẩm
                $(this).hide();
            });

            $('#loadMoreBtn2').on('click', function () {
                // Hiển thị các sản phẩm bị ẩn trong danh mục online
                $('.more-products-online').slideDown();

                // Ẩn nút sau khi hiển thị tất cả sản phẩm
                $(this).hide();
            });
        });


    </script>
</asp:Content>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HanhDong.aspx.cs" Inherits="WebFormTest.HanhDong" %>

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
            <h1 id="aspnetTitle">Game hành động</h1>
            
        </section>

        <!-- Danh mục sản phẩm từ cơ sở dữ liệu -->
        <div class="row mt-4" id="productList" runat="server">
            
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

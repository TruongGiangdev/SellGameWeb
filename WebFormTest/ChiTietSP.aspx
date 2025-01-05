<%@ Page Title="Chi tiết sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChiTietSP.aspx.cs" Inherits="WebFormTest.ChiTietSP" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row">
            <!-- Hình ảnh sản phẩm -->
            <div class="col-md-6">
                <img id="productImage" src="assets/img/default.jpg" class="img-fluid" alt="Product Image" style="border-radius: 15px;" />
            </div>

            <!-- Thông tin chi tiết sản phẩm -->
            <div class="col-md-6">
                <h1 id="productTitle">Tên sản phẩm</h1>
                <h3 id="productPrice">0.00 VNĐ</h3>
                

                <!-- Thêm vào giỏ hàng -->
                <div class="mt-4">
                    <label for="quantity">Số lượng:</label>
                    <input type="number" id="quantity" runat="server" class="form-control" value="1" min="1" style="width: 100px;" />
                    <asp:Button ID="Button1" class="btn btn-primary mt-3" runat="server" Text="Thêm vào giỏ" OnClick="Button1_Click" />
                    <h6 class="mt-4">Số lượt xem: <asp:Label ID="lblViewCount" runat="server"></asp:Label></h6>

                </div>
            </div>

            <div class="mt-5">
                <h3>Mô tả</h3>
                <p id="productDescription">Mô tả sản phẩm</p>
            </div>
            
        </div>
    </div>

    <script>
        // Lấy thông tin sản phẩm từ URL
        const urlParams = new URLSearchParams(window.location.search);
        const productName = urlParams.get('name');
        const productPrice = urlParams.get('price');
        const productImage = urlParams.get('image');
        const productDescription = urlParams.get('description');

        // Hàm định dạng giá tiền
        function formatPrice(price) {
            return parseFloat(price).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
        }

        // Cập nhật thông tin trên trang
        document.getElementById('productTitle').innerText = productName || 'Tên sản phẩm';
        document.getElementById('productPrice').innerText = formatPrice(productPrice) || '0.00 VNĐ';
        document.getElementById('productImage').src = productImage || 'assets/img/default.jpg';
        document.getElementById('productDescription').innerText = productDescription || 'Mô tả sản phẩm';
    </script>
</asp:Content>

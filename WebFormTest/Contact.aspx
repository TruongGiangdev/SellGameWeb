<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebFormTest.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title">Liên hệ.</h2>
        <h3>Bạn có thắc mắc hãy liên hệ với chúng tôi.</h3>
        <address>
            Lập trình Website bán game<br />
            Hà Nội, Việt Nam<br />
            <abbr title="Phone">Điện thoại:</abbr>
            0987654321
        </address>

        <address>
            <strong>Hỗ trợ:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
        </address>
    </main>
</asp:Content>

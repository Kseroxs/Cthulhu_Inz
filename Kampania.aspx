<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kampania.aspx.cs" Inherits="Cthulhu_Inz.Kampania" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <body>
            <h1>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="65px" ImageUrl="~/Content/plus.png" Width="68px" />
            </h1>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"></asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </body>
    </html>
</asp:Content>

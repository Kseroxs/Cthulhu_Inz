<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="Cthulhu_Inz.Logowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
<body>
    <h1>Logowanie</h1>
    <p>Login: 
        <asp:TextBox ID="login" runat="server" ></asp:TextBox>
        </p>
    <p>Hasło: 
        <asp:TextBox ID="haslo" runat="server" type="password"></asp:TextBox>
        </p>
    <asp:Button ID="Zalogowanie" runat="server" Text="Zaloguj" OnClick="Zalogowanie_Click" />
    <p>
        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" Visible="False" /> </p>
    <p>
    <p>
        <asp:Label ID="InvalidCredentialsMessage" runat="server" ForeColor="Red" Text="Niepoprawny login lub hasło." Font-Size="Small"
            Visible="False"></asp:Label> </p>
    <asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Login], [Haslo] FROM [Users]"></asp:SqlDataSource>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Rejestracja.aspx">Stwórz konto</asp:HyperLink>
    

</body>
    
</html>
</asp:Content>
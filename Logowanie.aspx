<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="Cthulhu_Inz.Logowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
<body class="text-center">
    
    
    <h1>Logowanie</h1>
        <asp:TextBox ID="login" runat="server" placeholder="Login"></asp:TextBox>

    <div>
        <br />
        <asp:TextBox ID="haslo" runat="server" type="password" placeholder="Hasło"></asp:TextBox>
        </div>
    <br />
       
    <asp:Button ID="Zalogowanie" runat="server" Text="Zaloguj" OnClick="Zalogowanie_Click" />
        
    <p>
        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" Visible="False" /> </p>
    <p>
    <p>
        <asp:Label ID="InvalidCredentialsMessage" runat="server" ForeColor="Red" Text="Niepoprawny login lub hasło." Font-Size="Large"
            Visible="False"></asp:Label> </p>
    <asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Login], [Haslo] FROM [Users]"></asp:SqlDataSource>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Rejestracja.aspx">Stwórz konto</asp:HyperLink>
      </div>  
</body>
    
</html>
</asp:Content>
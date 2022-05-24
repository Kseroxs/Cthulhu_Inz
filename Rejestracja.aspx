<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rejestracja.aspx.cs" Inherits="Cthulhu_Inz.Rejestracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <body>
            <h1>Rejestracja</h1>
         <p>
            <asp:Literal runat="server" ID="StatusMessage" />
        </p>   
    <h2>Login: 
        <asp:TextBox ID="login" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="login" ErrorMessage="Login nie może być pusty" Font-Size="Small" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </h2>
        <h2>Email: 
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Email niepoprawny" Font-Size="Small" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </h2>
    <h2>Hasło: 
        <asp:TextBox ID="haslo" runat="server" type="password"></asp:TextBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="haslo" ErrorMessage="Hasło musi zawierać conajmniej 6 znaków" Font-Size="Small" ForeColor="#FF3300"></asp:RequiredFieldValidator>

        </h2>
            <p>
        <asp:Label ID="InvalidCredentialsMessage" runat="server" ForeColor="Red" Text="Podany login jest zajęty."
            Visible="False"></asp:Label> </p>
            <asp:Button ID="Zarejestruj" runat="server" Text="Zarejestruj" Width="144px" OnClick="Zarejestruj_Click" />

            <asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" OnSelecting="Sample_Selecting" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logowanie.aspx">Powrót</asp:HyperLink>
        </body>
    </html>
</asp:Content>

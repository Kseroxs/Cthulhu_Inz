<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kampania.aspx.cs" Inherits="Cthulhu_Inz.Kampania" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <header>
            <h1>Moje Kampanie</h1>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Konto.aspx">Powrót</asp:HyperLink>
            <hr noshade="noshade"/>
        </header>
        <body>
            Stwórz Kampanię i dodaj do niej członków. <asp:Button ID="Stworz_kampanie" runat="server" Text="STWÓRZ KAMPANIĘ" OnClick="Stworz_kampanie_Click"  />
            <br />
            <br />
            <div class="text-center">
                <asp:Label ID="Label1" runat="server" Text="Nazwa Kampanii*" Visible="False"></asp:Label>
                <br />
            <asp:TextBox ID="Nazwa_kampanii" runat="server" Width="186px" Visible="False" MaxLength="25"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Nazwa_kampanii" ErrorMessage="Nazwa nie może być pusta" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Opis" Visible="False"></asp:Label>
                <br />
            <asp:TextBox ID="Opis" runat="server" Height="194px" Width="374px" Visible="False" TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Dodaj_kampanie" runat="server" Text="Dodaj" OnClick="Dodaj_kampanie_Click" Visible="False" />
                </div>
            <br />
            <h3>Aktywne Kampanie</h3>
            

        </body>
    </html>
</asp:Content>

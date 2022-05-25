<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KampaniaEdycja.aspx.cs" Inherits="Cthulhu_Inz.KampaniaEdycja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <h1 class="text-center">
            Edytowanie Kampanii
        </h1>
    </header>
    <body>
        <div class="text-center">
                <asp:Label ID="Label1" runat="server" Text="Nazwa Kampanii*"></asp:Label>
                <br />
            <asp:TextBox ID="Nazwa_kampanii" runat="server" Width="186px" MaxLength="25"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Nazwa_kampanii" ErrorMessage="Nazwa nie może być pusta" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Opis" ></asp:Label>
                <br />
            <asp:TextBox ID="Opis" runat="server" Height="194px" Width="374px"  TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Edytuj_kampanie" runat="server" Text="Edytuj" OnClick="Edytuj_kampanie_Click"  />
                </div>
        <h1 class="text-center">
            Dodawanie graczy do Kampanii
        </h1>
        <div class="text-center">
        Podaj login gracza
            </div>
        <div class="text-center">
        <asp:TextBox ID="TextBox1" runat="server" Width="432px">

        </asp:TextBox><asp:Button ID="Button1" runat="server" Text="Szukaj" OnClick="Szukaj_Click" />
            </div>
    </body>
</asp:Content>

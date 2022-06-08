<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sesja.aspx.cs" Inherits="Cthulhu_Inz.Sesja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <head>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Konto.aspx">Powrót</asp:HyperLink>
        <div class="text-center">
            
        <asp:Label ID="Nazwa_postaci" runat="server" Text="Nazwa postaci" Font-Size="X-Large"></asp:Label>
        </div>
    </head>

</body>
    <div class="text-center">
        
    <asp:Label ID="Profesja" runat="server" Text="Profesja" Font-Size="Large"></asp:Label>
    </div>
    <hr />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Siła
            </div>
            <div class="col col-lg-2">
            Zręczność
            </div>
            <div class="col col-lg-2">
            MOC
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:Label ID="Sila" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Zrecznosc" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Moc" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        
        <br />
        <div class="row justify-content-md-center">
            <div class="col col-lg-2">
            Kondycja
            </div>
            <div class="col col-lg-2">
            Wygląd
            </div>
            <div class="col col-lg-2">
            Wykształcenie
            </div>
            </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:Label ID="Kondycja" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Wyglad" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Wyksztalcenie" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        
        <br />
        <div class="row justify-content-md-center">
            <div class="col col-lg-2">
            Budowa Ciała
            </div>
            <div class="col col-lg-2">
            Inteligencja
            </div>
            <div class="col col-lg-2">
            Ruch
            </div>
            </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:Label ID="Budowa_ciala" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Inteligencja" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Ruch" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox1" runat="server" />
            Antropologia
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox2" runat="server" />
            Księgowość
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox3" runat="server" />
            Pływanie
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox4" runat="server" />
            Unik
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Antropologia" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Ksiegowosc" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Plywanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Unik" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    </body>
</asp:Content>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Konto.aspx.cs" Inherits="Cthulhu_Inz.Konto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <body>
            <h1>
                <asp:Panel runat="server" ID="AuthenticatedMessagePanel">
        <asp:Label runat="server" ID="WelcomeBackMessage"></asp:Label>
                    
    </asp:Panel>
                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/Logowanie.aspx" />
            </h1>
            <h2 class="text-center">
            <asp:LinkButton ID="Tworzenie_postaci" runat="server" PostBackUrl="~/Tworzenie_postaci.aspx">Stwórz postać</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Kampania.aspx">Kampanie</asp:LinkButton>

                </h2>
            <h3>
                Twoje aktualne postacie
            </h3>
            <div class="text-center">
            <asp:GridView ID="GridView1" runat="server" Width="466px"></asp:GridView>
                </div>
        </body>
    </html>
</asp:Content>

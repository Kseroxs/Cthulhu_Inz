<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Konto.aspx.cs" Inherits="Cthulhu_Inz.Konto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <body>
            <h1>
                <asp:Panel runat="server" ID="AuthenticatedMessagePanel">
        <asp:Label runat="server" ID="WelcomeBackMessage"></asp:Label>
                    
    </asp:Panel>
                
            </h1>
            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/Logowanie.aspx" />
            <h2 class="text-center">
            <asp:LinkButton ID="Tworzenie_postaci" runat="server" PostBackUrl="~/Tworzenie_postaci.aspx">Stwórz postać  </asp:LinkButton>

                </h2>
            
            <h2 class="text-center">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Kampania.aspx">Kampanie</asp:LinkButton>
                </h2>
            <h3 >
                Twoje aktualne postacie
            </h3>
            <div class="text-center">
            <asp:GridView ID="GridView1" runat="server" Width="466px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                <Columns>  
                    <asp:TemplateField><ItemTemplate>  
                        <asp:LinkButton ID = "LinkButton" runat="server"  
            PostBackUrl='<%# "~/PostacEdycja.aspx?IDPostaci="+ Eval("IDPostaci") %>' Text="Edit"></asp:LinkButton>  
                                       </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                </div>
        </body>
    </html>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kampania.aspx.cs" Inherits="Cthulhu_Inz.Kampania" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <header>
            <h1>Moje Kampanie</h1>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Konto.aspx">Powrót</asp:HyperLink>
            <hr noshade="noshade"/>
        </header>
        <body>
            <div class="text-center">
            <asp:Button ID="Stworz_kampanie" runat="server" Text="STWÓRZ KAMPANIĘ" OnClick="Stworz_kampanie_Click"  />
                </div>
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
            <h3>Aktywne Kampanie Twoich Postaci</h3>
            <div class="text-center">
            <asp:GridView ID="GridView2" runat="server" Width="466px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                <Columns>  
                    <asp:TemplateField><ItemTemplate>  
                        <asp:LinkButton ID = "LinkButton" runat="server"  
            PostBackUrl='<%# "~/Sesja.aspx?IDPostaci="+ Eval("IDPostaci") %>' Text="Przejdź"></asp:LinkButton>  
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
            <hr noshade="noshade"/>
            <h3>Twoje Kampanie</h3>
            <div class="text-center">
            <asp:GridView ID="GridView1" runat="server" Width="466px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                <Columns>  
                    <asp:TemplateField><ItemTemplate>  
                        <asp:LinkButton ID = "LinkButton" runat="server"  
            PostBackUrl='<%# "~/KampaniaEdycja.aspx?IDKampanii="+ Eval("IDKampanii") %>' Text="Edytuj"></asp:LinkButton>  
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

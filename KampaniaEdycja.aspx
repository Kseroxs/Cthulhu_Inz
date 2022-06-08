<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KampaniaEdycja.aspx.cs" Inherits="Cthulhu_Inz.KampaniaEdycja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <h1 class="text-center">
            Edytowanie Kampanii
        </h1>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Kampania.aspx">Powrót</asp:HyperLink>
        <asp:Button ID="Usun_kampanie" runat="server" Text="Usuń Kampanię" style="float:right;" BackColor="#FF3300" OnClick="Usun_kampanie_Click" Height="40px"/>
            
    </header>
    <body>
        <hr noshade="noshade"/>
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
        <h1>
            Członkowie Kampanii
        </h1>
        <div class="text-center">
            <asp:GridView ID="GridView2" runat="server" Width="466px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCommand="GridView2_RowCommand" >
                <Columns>  
                    <asp:TemplateField><ItemTemplate>  
                        <asp:LinkButton ID = "LinkButton2" runat="server"   Text="Usuń" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="UsunButton"></asp:LinkButton>  
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
        <h1 class="text-center">
            Dodawanie graczy do Kampanii
        </h1>
        <div class="text-center">
        Podaj login gracza
            </div>
        <div class="text-center">
        <asp:TextBox ID="LoginTxt" runat="server" Width="432px">

        </asp:TextBox><asp:Button ID="Button1" runat="server" Text="Szukaj" OnClick="Szukaj_Click" />
            </div>
        <div class="text-center">
            <asp:Label ID="BrakPostaciLabel" runat="server" Text="Brak dostępnych postaci lub nie ma gracza o takim loginie." ForeColor="#FF3300" Visible="False"></asp:Label>
        </div>
        <div>
            <asp:Label ID="PostacieGraczaLabel" runat="server" Text="Postacie gracza" Visible="false" Font-Size="large"></asp:Label>
        </div>
        <div class="text-center">
            <asp:GridView ID="GridView1" runat="server" Width="466px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCommand="GridView1_RowCommand" >
                <Columns>  
                    <asp:TemplateField><ItemTemplate>  
                        <asp:LinkButton ID = "LinkButton" runat="server"   Text="Dodaj" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="DodajButton"></asp:LinkButton>  
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
</asp:Content>

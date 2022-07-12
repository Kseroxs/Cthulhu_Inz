<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tworzenie_postaci.aspx.cs" Inherits="Cthulhu_Inz.Tworzenie_postaci" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <body>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Konto.aspx">Powrót</asp:HyperLink>
            
            <h1 class="text-center">
                Tworzenie Badacza
            </h1>
             <h2 class="text-center">INFORMACJE PODSTAWOWE</h2>
            <div class="text-center">
                Imię <asp:TextBox ID="imie" runat="server"></asp:TextBox>
                Nazwisko <asp:TextBox ID="nazwisko" runat="server"></asp:TextBox>
            </div>
            <div class="text-center">
                Profesja 
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Profesja" DataTextField="Nazwa_Profesji" DataValueField="Nazwa_Profesji" AppendDataBoundItems="true">
                <asp:ListItem Selected="True">--Wybierz profesję--</asp:ListItem>
            </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" InitialValue="--Wybierz profesję--" ErrorMessage="Musisz najpierw wybrać profesję" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="Profesja" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Nazwa_Profesji] FROM [Profesja]"></asp:SqlDataSource>
                </div>
            <div class="text-center">
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="WiekTextBox" ErrorMessage="Wiek nie może być pusty" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
              
            Wiek <asp:TextBox ID="WiekTextBox" runat="server" Width="41px"></asp:TextBox>
                <asp:RangeValidator runat="server" ControlToValidate="WiekTextBox" ErrorMessage="Wybierz wiek pomiędzy 15 a 90 rokiem życia"
    Type="Integer" MinimumValue="15" MaximumValue="90" ForeColor="Red" Font-Size="Small"></asp:RangeValidator>
                </div>
            <div class="text-center">
            Miejsce zamieszkania <asp:TextBox ID="Miejsce_zamieszkania" runat="server"></asp:TextBox>
            Miejsce urdodzenia <asp:TextBox ID="Miejsce_urodzenia" runat="server"></asp:TextBox>
                </div>
            <h2 class="text-center">CECHY</h2>
            <h2 class="text-center">
                <asp:ImageButton ID="Rzut_na_cechy" runat="server" OnClick="Roll_cechy" Height="62px" ImageUrl="~/Content/kostka.png" Width="68px" />
                </h2>
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
                <asp:Label ID="Sila" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Zrecznosc" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Moc" runat="server" Text="0"></asp:Label>
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
                <asp:Label ID="Kondycja" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Wyglad" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Wyksztalcenie" runat="server" Text="0"></asp:Label>
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
                <asp:Label ID="Budowa_Ciala" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Inteligencja" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Ruch" runat="server" Text="0"></asp:Label>
            </div>
        </div>
                </div>
            <h2 class="text-center">CECHY POCHODNE</h2>
             <div class="container">
                <div class="row justify-content-md-center">
            
            <div class="col col-lg-2">
            Punkty Poczytalności
            </div>
            <div class="col col-lg-2">
            Punkty Magii
            </div>
            <div class="col col-lg-2">
            Szczęście
            </div>
                    <div class="col col-lg-2">
            Punkty Wytrzymałości
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:Label ID="Pkt_poczytalnosci" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Pkt_magii" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Szczescie" runat="server" Text="0"></asp:Label>
            </div>
            <div class="col col-lg-2">
                <asp:Label ID="Pkt_wytrzymalosci" runat="server" Text="0"></asp:Label>
            </div>
        </div>
                 </div>
            <h2 class="text-center">UMIEJĘTNOŚCI</h2>
            <div class="text-center"
            <asp:Label ID="Pula_pkt" runat="server" Text="Label" Visible="False" ></asp:Label>
                </div>
            <div class="text-center"
            <asp:Label ID="Umiejetnosci_dodawanie" runat="server" Text="Label" Visible="False" ></asp:Label>
                </div>
            <div class="text-center"
            <asp:Label ID="Umiejetnosci_zainteresowania" runat="server" Text="Label" Visible="False" ></asp:Label>
                </div>
            <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Antropologia
            </div>
            <div class="col col-lg-2">
            Księgowość
            </div>
            <div class="col col-lg-2">
            Pilotowanie
            </div>
            <div class="col col-lg-2">
            Tropienie
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Antropologia" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Ksiegowosc" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Pilotowanie" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Tropienie" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Archeologia
            </div>
            <div class="col col-lg-2">
            Majętność
            </div>
            <div class="col col-lg-2">
            Plywanie
            </div>
            <div class="col col-lg-2">
            Ukrywanie
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Archeologia" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Majetnosc" runat="server" Height="24px" Width="34px" CssClass="text-center"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Plywanie" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Ukrywanie" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Broń Palna (Karabin/Strzelba)
            </div>
            <div class="col col-lg-2">
            Mechanika
            </div>
            <div class="col col-lg-2">
            Prawo
            </div>
            <div class="col col-lg-2">
            Unik
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Bron_palna_dluga" runat="server" Height="24px" Width="34px" CssClass="text-center">25</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Mechanika" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Prawo" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Unik" runat="server" Height="24px" Width="34px" CssClass="text-center"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Broń Palna (Krótka)
            </div>
            <div class="col col-lg-2">
            Medycyna
            </div>
            <div class="col col-lg-2">
            Prowadzenie Samochodu
            </div>
            <div class="col col-lg-2">
            Urok Osobisty
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Bron_palna_krotka" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Medycyna" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Prowadzenie_Samochodu" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Urok_osobisty" runat="server" Height="24px" Width="34px" CssClass="text-center">15</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Charakteryzacja
            </div>
            <div class="col col-lg-2">
            Mity Cthulhu
            </div>
            <div class="col col-lg-2">
            Psychoanaliza
            </div>
            <div class="col col-lg-2">
            Walka Wręcz (Bijatyka)
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Charakteryzacja" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Mity_cthulhu" runat="server" Height="24px" Width="34px" CssClass="text-center" ReadOnly="True">0</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Psychoanaliza" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Walka_wrecz" runat="server" Height="24px" Width="34px" CssClass="text-center">25</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Elektryka
            </div>
            <div class="col col-lg-2">
            Nasłuchiwanie
            </div>
            <div class="col col-lg-2">
            Psychologia
            </div>
            <div class="col col-lg-2">
            Wiedza o Naturze
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Elektryka" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Nasluchiwanie" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Psychologia" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Wiedza_o_naturze" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Gadanina
            </div>
            <div class="col col-lg-2">
            Nauka
            </div>
            <div class="col col-lg-2">
            Rzucanie
            </div>
            <div class="col col-lg-2">
            Wspinaczka
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Gadanina" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Nauka" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Rzucanie" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Wspinaczka" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
        </div>
    </div>
            <div class="text-right">
                Wydane punkty: 
            <asp:TextBox ID="TextBox1" runat="server" Width="83px" Height="29px"></asp:TextBox>
                </div>
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Historia
            </div>
            <div class="col col-lg-2">
            Nawigacja
            </div>
            <div class="col col-lg-2">
            Skakanie
            </div>
            <div class="col col-lg-2">
            Wycena
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Historia" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Nawigacja" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Skakanie" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Wycena" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Jeździectwo
            </div>
            <div class="col col-lg-2">
            Obsługa Ciężkiego Sprzętu
            </div>
            <div class="col col-lg-2">
            Spostrzegawczość
            </div>
            <div class="col col-lg-2">
            Zastraszanie
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Jezdziectwo" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Obsluga_ciezkiego_sprzetu" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Spostrzegawczosc" runat="server" Height="24px" Width="34px" CssClass="text-center">25</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Zastraszanie" runat="server" Height="24px" Width="34px" CssClass="text-center">15</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Język Obcy
            </div>
            <div class="col col-lg-2">
            Okultyzm
            </div>
            <div class="col col-lg-2">
            Sztuka/Rzemiosło
            </div>
            <div class="col col-lg-2">
            Zręczne Palce
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Jezyk_obcy" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Okultyzm" runat="server" Height="24px" Width="34px" CssClass="text-center">5</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Sztuka_rzemioslo" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Zreczne_palce" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Język Ojczysty
            </div>
            <div class="col col-lg-2">
            Perswazja
            </div>
            <div class="col col-lg-2">
            Sztuka Przetrwania
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Jezyk_ojczysty" runat="server" Height="24px" Width="34px" CssClass="text-center"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Perswazja" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Sztuka_przetrwania" runat="server" Height="24px" Width="34px" CssClass="text-center">10</asp:TextBox>
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Korzystanie z Bibliotek
            </div>
            <div class="col col-lg-2">
            Pierwsza Pomoc
            </div>
            <div class="col col-lg-2">
            Ślusarstwo
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Korzystanie_z_bibliotek" runat="server" Height="24px" Width="34px" CssClass="text-center">20</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Pierwsza_pomoc" runat="server" Height="24px" Width="34px" CssClass="text-center">30</asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Slusarstwo" runat="server" Height="24px" Width="34px" CssClass="text-center">1</asp:TextBox>
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
            <h2 class="text-center">UZBROJENIE</h2>

            <div class="text-center">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr" AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"  AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"  AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"  AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Uzbrojenie" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Nazwa_uzbr] FROM [Uzbrojenie] ORDER BY [IDUzbrojenia]"></asp:SqlDataSource>
                </div>
            <h2 class="text-center">HISTORIA BADACZA</h2>
            <h4 class="text-center">Opisz swoją postać</h4>
            <div class="text-center">
                <asp:TextBox ID="Historia_Badacza" runat="server" Height="254px" Width="1171px" BackColor="White" TextMode="MultiLine"></asp:TextBox>
            </div>
            <br />

            <h2 class="text-center">EKWIPUNEK</h2>
            <div class="text-center">
                <asp:TextBox ID="Ekwipunek" runat="server" Height="185px" Width="820px" TextMode="MultiLine"></asp:TextBox>
                </div>
            <br />
            <div class="text-center">
                
            <asp:Button ID="Koniec" runat="server" Text="Zakończ" OnClick="Koniec_Click" />
                </div>
            

        </body>
    </html>
            

            
            

        </asp:Content>

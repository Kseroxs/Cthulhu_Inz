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
            </asp:DropDownList>Mie
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
            <div class="text-center">
                    Siła(S) <asp:TextBox ID="Sila" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                    Zręczność(ZR) <asp:TextBox ID="Zrecznosc" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                MOC <asp:TextBox ID="Moc" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>

            </div>
            <div class="text-center">
                Kondycja(KON) <asp:TextBox ID="Kondycja" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                Wygląd(WYG) <asp:TextBox ID="Wyglad" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                Wykształcenie(WYK) <asp:TextBox ID="Wyksztalcenie" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                </div>
            <div class="text-center">
                Budowa Ciała(BC) <asp:TextBox ID="Budowa_Ciala" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                Inteligencja(INT) <asp:TextBox ID="Inteligencja" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                Ruch <asp:TextBox ID="Ruch" runat="server" Height="18px" Width="27px" ReadOnly="True"></asp:TextBox>
                </div>
            <h2 class="text-center">CECHY POCHODNE</h2>
            <div class="text-center">
                Punkty poczytalności <asp:TextBox ID="Pkt_poczytalnosci" runat="server" Height="18px" Width="27px"></asp:TextBox>
                Punkty Magii <asp:TextBox ID="Pkt_magii" runat="server" Height="18px" Width="27px"></asp:TextBox>
                Szczęście <asp:TextBox ID="Szczescie" runat="server" Height="18px" Width="27px"></asp:TextBox>
                Punkty Wytrzymałości <asp:TextBox ID="Pkt_wytrzymalosci" runat="server" Height="18px" Width="27px"></asp:TextBox>
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
            <div class="text-center">
                Antropologia <asp:TextBox ID="Antropologia" runat="server" Height="18px" Width="27px">1</asp:TextBox>
                Księgowość <asp:TextBox ID="Ksiegowosc" runat="server" Height="18px" Width="27px">5</asp:TextBox>
                Pływanie <asp:TextBox ID="Plywanie" runat="server" Height="18px" Width="27px">20</asp:TextBox>
                Unik <asp:TextBox ID="Unik" runat="server" Height="18px" Width="27px" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="text-center">
                Archeologia <asp:TextBox ID="Archeologia" runat="server" Height="18px" Width="27px">1</asp:TextBox>
                Majętność <asp:TextBox ID="Majetnosc" runat="server" Height="18px" Width="27px">0</asp:TextBox>
                Prawo <asp:TextBox ID="Prawo" runat="server" Height="18px" Width="27px">5</asp:TextBox>
                Urok Osobisty <asp:TextBox ID="Urok_osobisty" runat="server" Height="18px" Width="27px">15</asp:TextBox>
            </div>
            <div class="text-center">
                Broń Palna(Karabin/Strzelba) <asp:TextBox ID="Bron_palna_dluga" runat="server" Height="18px" Width="27px">25</asp:TextBox>
                Mechanika <asp:TextBox ID="Mechanika" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Prowadzenie Samochodu <asp:TextBox ID="Prowadzenie_Samochodu" runat="server" Height="18px" Width="27px">20</asp:TextBox>
                Walka Wręcz(Bijatyka) <asp:TextBox ID="Walka_wrecz" runat="server" Height="18px" Width="27px">25</asp:TextBox>
            </div>
            <div class="text-center">
                Medycyna <asp:TextBox ID="Medycyna" runat="server" Height="18px" Width="27px">1</asp:TextBox>
                Psychoanaliza <asp:TextBox ID="Psychoanaliza" runat="server" Height="18px" Width="27px">1</asp:TextBox>
                Broń Palna(Krótka) <asp:TextBox ID="Bron_palna_krotka" runat="server" Height="18px" Width="27px">20</asp:TextBox>
                Mity Cthulhu <asp:TextBox ID="Mity_cthulhu" runat="server" Height="18px" Width="27px" ReadOnly="true">0</asp:TextBox>
            </div>
            <div class="text-center">
                Psychologia <asp:TextBox ID="Psychologia" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Charakteryzacja <asp:TextBox ID="Charakteryzacja" runat="server" Height="18px" Width="27px">5</asp:TextBox>
                Nasłuchiwanie <asp:TextBox ID="Nasłuchiwanie" runat="server" Height="18px" Width="27px">20</asp:TextBox>
                Rzucanie <asp:TextBox ID="Rzucanie" runat="server" Height="18px" Width="27px">20</asp:TextBox>
            </div>
            <div class="text-center">
                Wiedza o Naturze <asp:TextBox ID="Wiedza_o_naturze" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Elektryka <asp:TextBox ID="Elektryka" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Nauka <asp:TextBox ID="Nauka" runat="server" Height="18px" Width="27px">1</asp:TextBox>
                Skakanie <asp:TextBox ID="Skakanie" runat="server" Height="18px" Width="27px">20</asp:TextBox>
            </div>
            <div class="text-center">
                Wspinaczka <asp:TextBox ID="Wspinaczka" runat="server" Height="18px" Width="27px">20</asp:TextBox>
                Gadanina <asp:TextBox ID="Gadanina" runat="server" Height="18px" Width="27px">5</asp:TextBox>
                Spostrzegawczoś<asp:TextBox ID="Spostrzegawczosc" runat="server" Height="18px" Width="27px">25</asp:TextBox>ć 
                Wycena <asp:TextBox ID="Wycena" runat="server" Height="18px" Width="27px">5</asp:TextBox>
            </div>
            <div class="text-center">
                Historia <asp:TextBox ID="Historia" runat="server" Height="18px" Width="27px">5</asp:TextBox>
                Sztuka/Rzemiosło <asp:TextBox ID="Sztuka_rzemioslo" runat="server" Height="18px" Width="27px">5</asp:TextBox>
                Zastraszanie <asp:TextBox ID="Zastraszanie" runat="server" Height="18px" Width="27px">15</asp:TextBox>
                Jeździectwo <asp:TextBox ID="Jezdziectwo" runat="server" Height="18px" Width="27px">5</asp:TextBox>
            </div>
            <div class="text-center">
                Nawigacja <asp:TextBox ID="Nawigacja" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Zręczne Palce <asp:TextBox ID="Zreczne_palce" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Język Obcy <asp:TextBox ID="Jezyk_obcy" runat="server" Height="18px" Width="27px">1</asp:TextBox>
                Obsługa Ciężkiego Sprzętu <asp:TextBox ID="Obsluga_ciezkiego_sprzetu" runat="server" Height="18px" Width="27px">1</asp:TextBox>
            </div>
            <div class="text-center">
                Okultyzm <asp:TextBox ID="Okultyzm" runat="server" Height="18px" Width="27px">5</asp:TextBox>
                Sztuka Przetrwania <asp:TextBox ID="Sztuka_przetrwania" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Perswazja <asp:TextBox ID="Perswazja" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Ślusarstwo <asp:TextBox ID="Slusarstwo" runat="server" Height="18px" Width="27px">1</asp:TextBox>
            </div>
            <div class="text-center">
                Język Ojczysty <asp:TextBox ID="Jezyk_ojczysty" runat="server" Height="18px" Width="27px"></asp:TextBox>
                Pierwsza Pomoc <asp:TextBox ID="Pierwsza_pomoc" runat="server" Height="18px" Width="27px">30</asp:TextBox>
                Tropienie <asp:TextBox ID="Tropienie" runat="server" Height="18px" Width="27px">10</asp:TextBox>
                Korzystanie z Bibliotek <asp:TextBox ID="Korzystanie_z_bibliotek" runat="server" Height="18px" Width="27px">20</asp:TextBox>
            </div>
            <div class="text-center">
                Pilotowanie <asp:TextBox ID="Pilotowanie" runat="server" Height="18px" Width="27px">1</asp:TextBox>
                Ukrywanie <asp:TextBox ID="Ukrywanie" runat="server" Height="18px" Width="27px">20</asp:TextBox>
            </div>
            <h2 class="text-center">UZBROJENIE</h2>

            <div class="text-center">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr" AppendDataBoundItems="true">
                <asp:ListItem Selected="True">Brak</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"  AppendDataBoundItems="true">
                <asp:ListItem Selected="True">Brak</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"  AppendDataBoundItems="true">
                <asp:ListItem Selected="True">Brak</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="Uzbrojenie" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"  AppendDataBoundItems="true">
                <asp:ListItem Selected="True">Brak</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="Uzbrojenie" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Nazwa_uzbr] FROM [Uzbrojenie]"></asp:SqlDataSource>
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

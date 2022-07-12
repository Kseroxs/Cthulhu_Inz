<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sesja.aspx.cs" Inherits="Cthulhu_Inz.Sesja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Konto.aspx">Powrót</asp:HyperLink>
        <div class="text-center">
            
        <asp:Label ID="Nazwa_postaci" runat="server" Text="Nazwa postaci" Font-Size="X-Large"></asp:Label>
        </div>
    </header>

<body>
    <div class="text-center">
        
    <asp:Label ID="Profesja" runat="server" Text="Profesja" Font-Size="Large"></asp:Label>
    </div>
    <div class="text-center">
        
    <asp:Label ID="Wiek" runat="server" Text="Wiek" Font-Size="Small"></asp:Label>
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
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
            Punkty Poczytalności
            </div>
            <div class="col col-lg-2">
            Szczęście
            </div>
            <div class="col col-lg-2">
            Punkty Wytrzymałości
            </div>
            <div class="col col-lg-2">
            Punkty Magii
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="PktPoczytalnosci" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Szczescie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="PktWytrzymalosci" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="PktMagii" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="text-center">Rzuty kością
    </div>
    <div class="text-center">
        <asp:TextBox ID="Wynik_rzutu" runat="server" Width="267px"></asp:TextBox>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col col-lg-2">
                <asp:Button ID="Rzut_k100" runat="server" Text="Kość k100" OnClick="Rzut_k100_Click" />
            </div>
            <div class="col col-lg-2">
            <asp:Button ID="Rzut_k4" runat="server" Text="Kość k4" OnClick="Rzut_k4_Click" Width="108px" />
            </div>
            <div class="col col-lg-2">
                <asp:Button ID="Rzut_k6" runat="server" Text="Kość k6" OnClick="Rzut_k6_Click" Width="108px" />
            </div>
            <div class="col col-lg-2">
                <asp:Button ID="Rzut_k8" runat="server" Text="Kość k8" OnClick="Rzut_k8_Click" Width="108px" />
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
            Pilotowanie
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox4" runat="server" />
            Tropienie
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
                <asp:TextBox ID="Pilotowanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Tropienie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox5" runat="server" />
            Archeologia
            </div>
            <div class="col col-lg-2">
            Majętność
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox7" runat="server" />
            Plywanie
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox8" runat="server" />
            Ukrywanie
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Archeologia" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Majetnosc" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Plywanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Ukrywanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox6" runat="server" />
            Broń Palna (Karabin/Strzelba)
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox38" runat="server" />
            Mechanika
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox9" runat="server" />
            Prawo
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox10" runat="server" />
            Unik
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="BronPalnaDluga" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Mechanika" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Prawo" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Unik" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox11" runat="server" />
            Broń Palna (Krótka)
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox39" runat="server" />
            Medycyna
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox12" runat="server" />
            Prowadzenie Samochodu
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox13" runat="server" />
            Urok Osobisty
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="BronPalnaKrotka" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Medycyna" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="ProwadzenieSamochodu" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="UrokOsobisty" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox14" runat="server" />
            Charakteryzacja
            </div>
            <div class="col col-lg-2">
            Mity Cthulhu
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox15" runat="server" />
            Psychoanaliza
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox16" runat="server" />
            Walka Wręcz (Bijatyka)
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Charakteryzacja" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="MityCthulhu" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Psychoanaliza" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="WalkaWrecz" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox17" runat="server" />
            Elektryka
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox41" runat="server" />
            Nasłuchiwanie
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox18" runat="server" />
            Psychologia
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox19" runat="server" />
            Wiedza o Naturze
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Elektryka" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Nasluchiwanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Psychologia" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="WiedzaONaturze" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox20" runat="server" />
            Gadanina
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox40" runat="server" />
            Nauka
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox21" runat="server" />
            Rzucanie
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox22" runat="server" />
            Wspinaczka
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Gadanina" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Nauka" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Rzucanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Wspinaczka" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox23" runat="server" />
            Historia
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox42" runat="server" />
            Nawigacja
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox24" runat="server" />
            Skakanie
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox25" runat="server" />
            Wycena
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Historia" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Nawigacja" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Skakanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Wycena" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox26" runat="server" />
            Jeździectwo
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox43" runat="server" />
            Obsługa Ciężkiego Sprzętu
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox27" runat="server" />
            Spostrzegawczość
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox28" runat="server" />
            Zastraszanie
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="Jezdziectwo" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="ObslugaCiezkiegoSprzetu" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Spostrzegawczosc" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Zastraszanie" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox29" runat="server" />
            Język Obcy
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox44" runat="server" />
            Okultyzm
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox30" runat="server" />
            Sztuka/Rzemiosło
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox31" runat="server" />
            Zręczne Palce
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="JezykObcy" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Okultyzm" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="SztukaRzemioslo" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="ZrecznePalce" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox32" runat="server" />
            Język Ojczysty
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox45" runat="server" />
            Perswazja
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox33" runat="server" />
            Sztuka Przetrwania
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="JezykOjczysty" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Perswazja" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="SztukaPrzetrwania" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox35" runat="server" />
            Korzystanie z Bibliotek
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox34" runat="server" />
            Pierwsza Pomoc
            </div>
            <div class="col col-lg-2">
                <asp:CheckBox ID="CheckBox36" runat="server" />
            Ślusarstwo
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
        <div class="row justify-content-md-center">
        
            <div class="col col-lg-2">
                <asp:TextBox ID="KorzystanieZBibliotek" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="PierwszaPomoc" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
                <asp:TextBox ID="Slusarstwo" runat="server" Height="18px" Width="27px"></asp:TextBox>
            </div>
            <div class="col col-lg-2">
            </div>
        </div>
    </div>
    <hr />
    <h3 class="text-center">
        UZBROJENIE
    </h3>
    <h4 class="text-center">
        Modyfikator Obrażeń
    </h4>
    <h4 class="text-center">
        <asp:Label ID="MOLabel" runat="server" Text="Label"></asp:Label>
    </h4>
    <div class="text-center">
        <asp:DropDownList ID="Uzbrojenie1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Nazwa_uzbr] FROM [Uzbrojenie]"></asp:SqlDataSource>
    </div>
    <div class="text-center">
        <h4>Umiejętność | Obrażenia | Zasięg | Liczba użyć na rundę | Pociski/Magazynek | Koszt | Zawodność</h4>
        </div>
    <div class="text-center">
        <asp:Label ID="Uzbrojenie1Label" runat="server" Text=""></asp:Label>
        </div>
    <br />
    <div class="text-center">
        <asp:DropDownList ID="Uzbrojenie2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Nazwa_uzbr] FROM [Uzbrojenie]"></asp:SqlDataSource>
    </div>
    <div class="text-center">
        <asp:Label ID="Uzbrojenie2Label" runat="server" Text=""></asp:Label>
        </div>
    <br />
    <div class="text-center">
        <asp:DropDownList ID="Uzbrojenie3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Nazwa_uzbr] FROM [Uzbrojenie]"></asp:SqlDataSource>
    </div>
    <div class="text-center">
        <asp:Label ID="Uzbrojenie3Label" runat="server" Text=""></asp:Label>
        </div>
    <br />
    <div class="text-center">
        <asp:DropDownList ID="Uzbrojenie4" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nazwa_uzbr" DataValueField="Nazwa_uzbr"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CthulhuDBConnectionString %>" SelectCommand="SELECT [Nazwa_uzbr] FROM [Uzbrojenie]"></asp:SqlDataSource>
    </div>
    <div class="text-center">
        <asp:Label ID="Uzbrojenie4Label" runat="server" Text=""></asp:Label>
        </div>
    <br />
    <br />
    <h3 class="text-center">
        HISTORIA BADACZA
    </h3>
    <div class="text-center">
        <asp:TextBox ID="HistoriaBadacza" runat="server" Height="254px" Width="1171px" TextMode="MultiLine"></asp:TextBox>
    </div>
    <br />
    <h3 class="text-center">
        EKWIPUNEK
    </h3>
    <div class="text-center">
        <asp:TextBox ID="Ekwipunek" runat="server" Height="185px" Width="820px" TextMode="MultiLine"></asp:TextBox>
    </div>
    <br />
    <div class="text-center">
    <asp:Button ID="Edytuj" runat="server" Text="Edytuj" OnClick="Edytuj_Click" />
        </div>
    </body>
</asp:Content>

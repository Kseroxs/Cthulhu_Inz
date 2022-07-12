using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cthulhu_Inz
{
    public partial class Sesja : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        string kampaniaid;
        string postacid;
        string discord;
        protected void Page_Load(object sender, EventArgs e)
        {

            postacid = Page.Request.QueryString["IDPostaci"].ToString();
            if (!IsPostBack)
                {
                     
                PrzypiszWartosci();
            }
            PrzypiszWartosci();
            WczytanieKampanii();
        }
        //przypisanie wszystkich wartości postaci
        private void PrzypiszWartosci()
        {
            myConnection.Open();
            string query1 = "Select * from [dbo].Postac where IDPostaci='" + postacid + "'";
            SqlCommand command = new SqlCommand(query1, myConnection);
            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            string imie = (string)dataReader["Imię"];
            string nazwisko = (string)dataReader["Nazwisko"];
            Profesja.Text = (string)dataReader["Profesja"];
            Wiek.Text= "Wiek: "+ Convert.ToString((int)dataReader["Wiek"]);
            Sila.Text = Convert.ToString((int)dataReader["S"]);
            Zrecznosc.Text = Convert.ToString((int)dataReader["ZR"]);
            Moc.Text = Convert.ToString((int)dataReader["MOC"]);
            Nazwa_postaci.Text = imie+" "+nazwisko;
            Kondycja.Text = Convert.ToString((int)dataReader["KON"]);
            Wyglad.Text = Convert.ToString((int)dataReader["WYG"]);
            Wyksztalcenie.Text = Convert.ToString((int)dataReader["WYK"]);
            Budowa_ciala.Text = Convert.ToString((int)dataReader["BC"]);
            Inteligencja.Text = Convert.ToString((int)dataReader["INT"]);
            Ruch.Text = Convert.ToString((int)dataReader["Ruch"]);
            PktPoczytalnosci.Text = Convert.ToString((int)dataReader["Poczytalność"]);
            Szczescie.Text = Convert.ToString((int)dataReader["Szczęście"]);
            PktWytrzymalosci.Text = Convert.ToString((int)dataReader["Punkty Wytrzymałości"]);
            PktMagii.Text = Convert.ToString((int)dataReader["Punkty Magii"]);
            Antropologia.Text= Convert.ToString((int)dataReader["Antropologia"]);
            Ksiegowosc.Text= Convert.ToString((int)dataReader["Księgowość"]);
            Plywanie.Text= Convert.ToString((int)dataReader["Pływanie"]);
            Unik.Text= Convert.ToString((int)dataReader["Unik"]);
            Archeologia.Text = Convert.ToString((int)dataReader["Archeologia"]);
            Majetnosc.Text = Convert.ToString((int)dataReader["Majętność"]);
            Prawo.Text = Convert.ToString((int)dataReader["Prawo"]);
            UrokOsobisty.Text = Convert.ToString((int)dataReader["Urok osobisty"]);
            Pilotowanie.Text = Convert.ToString((int)dataReader["Pilotowanie"]);
            Tropienie.Text = Convert.ToString((int)dataReader["Tropienie"]);
            Ukrywanie.Text = Convert.ToString((int)dataReader["Ukrywanie"]);
            BronPalnaDluga.Text = Convert.ToString((int)dataReader["Broń palna długa"]);
            Mechanika.Text = Convert.ToString((int)dataReader["Mechanika"]);
            BronPalnaKrotka.Text = Convert.ToString((int)dataReader["Broń palna krótka"]);
            Medycyna.Text = Convert.ToString((int)dataReader["Medycyna"]);
            ProwadzenieSamochodu.Text = Convert.ToString((int)dataReader["Prowadzenie samochodu"]);
            UrokOsobisty.Text = Convert.ToString((int)dataReader["Urok osobisty"]);
            Charakteryzacja.Text = Convert.ToString((int)dataReader["Charakteryzacja"]);
            MityCthulhu.Text = Convert.ToString((int)dataReader["Mity Cthulhu"]);
            Psychoanaliza.Text = Convert.ToString((int)dataReader["Psychoanaliza"]);
            WalkaWrecz.Text = Convert.ToString((int)dataReader["Walka wręcz/Bijatyka"]);
            Elektryka.Text = Convert.ToString((int)dataReader["Elektryka"]);
            Nasluchiwanie.Text = Convert.ToString((int)dataReader["Nasłuchiwanie"]);
            Psychologia.Text = Convert.ToString((int)dataReader["Psychologia"]);
            WiedzaONaturze.Text = Convert.ToString((int)dataReader["Wiedza o naturze"]);
            Gadanina.Text = Convert.ToString((int)dataReader["Gadanina"]);
            Nauka.Text = Convert.ToString((int)dataReader["Nauka"]);
            Rzucanie.Text = Convert.ToString((int)dataReader["Rzucanie"]);
            Wspinaczka.Text = Convert.ToString((int)dataReader["Wspinaczka"]);
            Historia.Text = Convert.ToString((int)dataReader["Historia"]);
            Nawigacja.Text = Convert.ToString((int)dataReader["Nawigacja"]);
            Skakanie.Text = Convert.ToString((int)dataReader["Skakanie"]);
            Wycena.Text = Convert.ToString((int)dataReader["Wycena"]);
            Jezdziectwo.Text = Convert.ToString((int)dataReader["Jeździectwo"]);
            ObslugaCiezkiegoSprzetu.Text = Convert.ToString((int)dataReader["Obsługa ciężkiego sprzętu"]);
            Spostrzegawczosc.Text = Convert.ToString((int)dataReader["Spostrzegawczość"]);
            Zastraszanie.Text = Convert.ToString((int)dataReader["Zastraszanie"]);
            JezykObcy.Text = Convert.ToString((int)dataReader["Język obcy"]);
            Okultyzm.Text = Convert.ToString((int)dataReader["Okultyzm"]);
            SztukaRzemioslo.Text = Convert.ToString((int)dataReader["Sztuka/Rzemiosło"]);
            ZrecznePalce.Text = Convert.ToString((int)dataReader["Zręczne palce"]);
            JezykOjczysty.Text = Convert.ToString((int)dataReader["Język ojczysty"]);
            Perswazja.Text = Convert.ToString((int)dataReader["Perswazja"]);
            SztukaPrzetrwania.Text = Convert.ToString((int)dataReader["Sztuka przetrwania"]);
            KorzystanieZBibliotek.Text = Convert.ToString((int)dataReader["Korzystanie z bibliotek"]);
            PierwszaPomoc.Text = Convert.ToString((int)dataReader["Pierwsza pomoc"]);
            Slusarstwo.Text = Convert.ToString((int)dataReader["Ślusarstwo"]);
            HistoriaBadacza.Text = (string)dataReader["Historia badacza"];
            Ekwipunek.Text = (string)dataReader["Ekwipunek"];
            MOLabel.Text = (string)dataReader["Modyfikator obrażeń"];
            string uzbrojenie1 = (string)dataReader["Uzbrojenie1"];
            Uzbrojenie1.Text = uzbrojenie1;
            string uzbrojenie2 = (string)dataReader["Uzbrojenie2"];
            Uzbrojenie2.Text = uzbrojenie2;
            string uzbrojenie3 = (string)dataReader["Uzbrojenie3"];
            Uzbrojenie3.Text = uzbrojenie3;
            string uzbrojenie4 = (string)dataReader["Uzbrojenie4"];
            Uzbrojenie4.Text = uzbrojenie4;
            kampaniaid = Convert.ToString((int)dataReader["IDKampanii"]);
            myConnection.Close();

            myConnection.Open();
            string query2 = "Select * from [dbo].Uzbrojenie where Nazwa_uzbr='" + uzbrojenie1 + "'";
            SqlCommand command2 = new SqlCommand(query2, myConnection);
            SqlDataReader dataReader2 = command2.ExecuteReader();
            dataReader2.Read();
            string umiejetnosc = (string)dataReader2["Umiejetnosc"];
            string obrazenia = (string)dataReader2["Obrazenia"];
            string zasieg = (string)dataReader2["Zasieg"];
            string liczba_uzyc = (string)dataReader2["Liczba_uzyc_runda"];
            string pociski_magazynek = (string)dataReader2["Pociski_magazynek"];
            string koszt = (string)dataReader2["Koszt"];
            string zawodnosc = Convert.ToString((int)dataReader2["Zawodnosc"]);
            Uzbrojenie1Label.Text = umiejetnosc + " | " + obrazenia + " | "+zasieg+" | "+liczba_uzyc+" | "+pociski_magazynek+" | "+koszt+" | "+zawodnosc;
            myConnection.Close();

            myConnection.Open();
            string query3 = "Select * from [dbo].Uzbrojenie where Nazwa_uzbr='" + uzbrojenie2 + "'";
            SqlCommand command3 = new SqlCommand(query3, myConnection);
            SqlDataReader dataReader3 = command3.ExecuteReader();
            dataReader3.Read();
            string umiejetnosc2 = (string)dataReader3["Umiejetnosc"];
            string obrazenia2 = (string)dataReader3["Obrazenia"];
            string zasieg2 = (string)dataReader3["Zasieg"];
            string liczba_uzyc2 = (string)dataReader3["Liczba_uzyc_runda"];
            string pociski_magazynek2 = (string)dataReader3["Pociski_magazynek"];
            string koszt2 = (string)dataReader3["Koszt"];
            string zawodnosc2 = Convert.ToString((int)dataReader3["Zawodnosc"]);
            Uzbrojenie2Label.Text = umiejetnosc2 + " | " + obrazenia2 + " | " + zasieg2 + " | " + liczba_uzyc2 + " | " + pociski_magazynek2 + " | " + koszt2 + " | " + zawodnosc2;
            myConnection.Close();

            myConnection.Open();
            string query4 = "Select * from [dbo].Uzbrojenie where Nazwa_uzbr='" + uzbrojenie3 + "'";
            SqlCommand command4 = new SqlCommand(query4, myConnection);
            SqlDataReader dataReader4 = command4.ExecuteReader();
            dataReader4.Read();
            string umiejetnosc3 = (string)dataReader4["Umiejetnosc"];
            string obrazenia3 = (string)dataReader4["Obrazenia"];
            string zasieg3 = (string)dataReader4["Zasieg"];
            string liczba_uzyc3 = (string)dataReader4["Liczba_uzyc_runda"];
            string pociski_magazynek3 = (string)dataReader4["Pociski_magazynek"];
            string koszt3 = (string)dataReader4["Koszt"];
            string zawodnosc3 = Convert.ToString((int)dataReader4["Zawodnosc"]);
            Uzbrojenie3Label.Text = umiejetnosc3 + " | " + obrazenia3 + " | " + zasieg3 + " | " + liczba_uzyc3 + " | " + pociski_magazynek3 + " | " + koszt3 + " | " + zawodnosc3;
            myConnection.Close();

            myConnection.Open();
            string query5 = "Select * from [dbo].Uzbrojenie where Nazwa_uzbr='" + uzbrojenie2 + "'";
            SqlCommand command5 = new SqlCommand(query5, myConnection);
            SqlDataReader dataReader5 = command5.ExecuteReader();
            dataReader5.Read();
            string umiejetnosc4 = (string)dataReader5["Umiejetnosc"];
            string obrazenia4 = (string)dataReader5["Obrazenia"];
            string zasieg4 = (string)dataReader5["Zasieg"];
            string liczba_uzyc4 = (string)dataReader5["Liczba_uzyc_runda"];
            string pociski_magazynek4 = (string)dataReader5["Pociski_magazynek"];
            string koszt4 = (string)dataReader5["Koszt"];
            string zawodnosc4 = Convert.ToString((int)dataReader5["Zawodnosc"]);
            Uzbrojenie4Label.Text = umiejetnosc4 + " | " + obrazenia4 + " | " + zasieg4 + " | " + liczba_uzyc4 + " | " + pociski_magazynek4 + " | " + koszt4 + " | " + zawodnosc4;
            myConnection.Close();


        }
        //przycisk kończący edycje
        protected void Edytuj_Click(object sender, EventArgs e)
        {
            EdytujWartosci();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Postać została edytowana!');window.location ='Konto.aspx';", true);
        }
        //edytowanie wartości postaci w bazie
        private void EdytujWartosci()
        {
            myConnection.Open();
            string query = "UPDATE Postac " +
                "SET Poczytalność ='" + PktPoczytalnosci.Text + "' , [Punkty Magii] ='" + PktMagii.Text + "', Szczęście ='" + Szczescie.Text + "',[Punkty Wytrzymałości] ='" + PktWytrzymalosci.Text + "', Antropologia ='" + Antropologia.Text + "'," +
                "Księgowość ='" + Ksiegowosc.Text + "',Pilotowanie ='" + Pilotowanie.Text + "',Tropienie='" + Tropienie.Text + "', Archeologia='" + Archeologia.Text + "', Majętność='" + Majetnosc.Text + "', Pływanie='" + Plywanie.Text + "', Ukrywanie='" + Ukrywanie.Text + "'," +
                "[Broń palna długa]='" + BronPalnaDluga.Text + "', Mechanika='" + Mechanika.Text + "',Prawo='" + Prawo.Text + "',Unik='" + Unik.Text + "',[Broń palna krótka]='" + BronPalnaKrotka.Text + "',Medycyna='" + Medycyna.Text + "'," +
                "[Prowadzenie samochodu]='" + ProwadzenieSamochodu.Text + "',[Urok osobisty]='" + UrokOsobisty.Text + "',Charakteryzacja='" + Charakteryzacja.Text + "',[Mity Cthulhu]='" + MityCthulhu.Text + "',Psychoanaliza='" + Psychoanaliza.Text + "'," +
                "[Walka wręcz/Bijatyka]='" + WalkaWrecz.Text + "',Elektryka='" + Elektryka.Text + "',Nasłuchiwanie='" + Nasluchiwanie.Text + "',Psychologia='" + Psychologia.Text + "',[Wiedza o naturze]='" + WiedzaONaturze.Text + "',Gadanina='" + Gadanina.Text + "'," +
                "Nauka='" + Nauka.Text + "',Rzucanie='" + Rzucanie.Text + "',Wspinaczka='" + Wspinaczka.Text + "',Historia='" + Historia.Text + "',Nawigacja='" + Nawigacja.Text + "',Skakanie='" + Skakanie.Text + "',Wycena='" + Wycena.Text + "'," +
                "Jeździectwo='" + Jezdziectwo.Text + "',[Obsługa ciężkiego sprzętu]='" + ObslugaCiezkiegoSprzetu.Text + "',Spostrzegawczość='" + Spostrzegawczosc.Text + "',Zastraszanie='" + Zastraszanie.Text + "',[Język obcy]='" + JezykObcy.Text + "'," +
                "Okultyzm='" + Okultyzm.Text + "',[Sztuka/Rzemiosło]='" + SztukaRzemioslo.Text + "',[Zręczne palce]='" + ZrecznePalce.Text + "',[Język ojczysty]='" + JezykOjczysty.Text + "',Perswazja='" + Perswazja.Text + "',[Sztuka przetrwania]='" + SztukaPrzetrwania.Text + "'," +
                "[Korzystanie z bibliotek]='" + KorzystanieZBibliotek.Text + "',[Pierwsza pomoc]='" + PierwszaPomoc.Text + "',Ślusarstwo='" + Slusarstwo.Text + "',Uzbrojenie1='" + Uzbrojenie1.Text + "',Uzbrojenie2='" + Uzbrojenie2.Text + "'," +
                "Uzbrojenie3='" + Uzbrojenie3.Text + "',Uzbrojenie4='" + Uzbrojenie4.Text + "',[Historia badacza]='" + HistoriaBadacza.Text + "',Ekwipunek='" + Ekwipunek.Text + "'"+
                "WHERE IDPostaci='" + postacid + "';";
            SqlCommand update = new SqlCommand(query, myConnection);
            update.ExecuteNonQuery();
            myConnection.Close();
        }
        //metoda wysyłania wiadomości na Discord
        public static void DiscordSendMessage(string url, string username, string content)
        {
            WebClient wc = new WebClient();
            try
            {
                wc.UploadValues(url, new NameValueCollection
            {
                {
                    "content",content
                },
                {
                    "username", username
                }
            });
            }
            catch (WebException ex)
            {
                //Label1.Text = ex.ToString();
            }

        }
        //wczytanie DiscordWebHook
        private void WczytanieKampanii()
        {
            myConnection.Open();
            string query1 = "Select DiscordWebHook from [dbo].Kampania where IDKampanii='" + kampaniaid + "'";
            SqlCommand command = new SqlCommand(query1, myConnection);
            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            discord = (string)dataReader["DiscordWebHook"];
            myConnection.Close();
        }
        //rzut kością k100
        protected void Rzut_k100_Click(object sender, EventArgs e)
        {
            Random kostkak100 = new Random();
            string message = "Wynik rzutu kością k100: "+ kostkak100.Next(1, 100 + 1).ToString();
            DiscordSendMessage(discord, Nazwa_postaci.Text, message);
            Wynik_rzutu.Text = message;
        }
        //rzut kością k4
        protected void Rzut_k4_Click(object sender, EventArgs e)
        {
            Random kostkak4 = new Random();
            string message = "Wynik rzutu kością k4: " + kostkak4.Next(1, 4 + 1).ToString();
            DiscordSendMessage(discord, Nazwa_postaci.Text, message);
            Wynik_rzutu.Text = message;
        }
        //rzut kością k6
        protected void Rzut_k6_Click(object sender, EventArgs e)
        {
            Random kostkak6 = new Random();
            string message = "Wynik rzutu kością k6: " + kostkak6.Next(1, 6 + 1).ToString();
            DiscordSendMessage(discord, Nazwa_postaci.Text, message);
            Wynik_rzutu.Text = message;
        }
        //rzut kością k8
        protected void Rzut_k8_Click(object sender, EventArgs e)
        {
            Random kostkak8 = new Random();
            string message = "Wynik rzutu kością k8: " + kostkak8.Next(1, 8 + 1).ToString();
            DiscordSendMessage(discord, Nazwa_postaci.Text, message);
            Wynik_rzutu.Text = message;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cthulhu_Inz
{
    public partial class Sesja : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        string postacid;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
                if (!IsPostBack)
                {
                     postacid = Page.Request.QueryString["IDPostaci"].ToString();
                    PrzypiszWartosci();
                }

            

        }

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
            Uzbrojenie1.Text = (string)dataReader["Uzbrojenie1"];
            myConnection.Close();
        }

    }
}
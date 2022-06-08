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
            string query1 = "Select [Imię], Nazwisko, Profesja,S,ZR,MOC,KON,WYG,WYK,BC,[INT],Ruch,Poczytalność,[Punkty Magii],Szczęście,[Punkty Wytrzymałości],Antropologia" +
                ",Archeologia,[Broń palna długa],[Broń palna krótka],Charakteryzacja,Elektryka,Gadanina,Historia,Jeździectwo,[Język obcy],[Język ojczysty],[Korzystanie z bibliotek],Księgowość,Majętność,Mechanika,Medycyna,[Mity Cthulhu],Nasłuchiwanie,Nauka" +
                ",Nawigacja,[Obsługa ciężkiego sprzętu],Okultyzm,Perswazja,[Pierwsza pomoc],Pilotowanie,Pływanie,Prawo,[Prowadzenie samochodu],Psychoanaliza,Psychologia,Rzucanie,Skakanie,Spostrzegawczość,[Sztuka/Rzemiosło],[Sztuka przetrwania],Ślusarstwo," +
                "Tropienie,Ukrywanie,Unik,[Urok osobisty],[Walka wręcz/Bijatyka],[Wiedza o naturze],Wspinaczka,Wycena,Zastraszanie,[Zręczne palce],Uzbrojenie1,Uzbrojenie2,Uzbrojenie3,Uzbrojenie4,[Historia badacza],Ekwipunek,[Poziom wydatków],Gotówka,Dobytek," +
                "[Modyfikator obrażeń],Krzepa from [dbo].[Postac] where IDPostaci = '" + postacid + "'";
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
            Antropologia.Text= Convert.ToString((int)dataReader["Antropologia"]);
            Ksiegowosc.Text= Convert.ToString((int)dataReader["Księgowość"]);
            Plywanie.Text= Convert.ToString((int)dataReader["Pływanie"]);
            Unik.Text= Convert.ToString((int)dataReader["Unik"]);
            myConnection.Close();
        }

    }
}
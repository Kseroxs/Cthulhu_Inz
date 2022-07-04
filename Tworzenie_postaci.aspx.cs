using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cthulhu_Inz
{
    public partial class Tworzenie_postaci : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        public int[] k6_2 = new int[3];

        public int[] k6 = new int[8];

        public string Liczba_pkt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //jeden rzut kością k6
        Random kostkak6 = new Random();
        Random kostkak100 = new Random();
        Random kostkak10 = new Random();
        public int Roll_k6()
        {

            return kostkak6.Next(1, 6 + 1);
        }
        public int Roll_k100()
        {
            return kostkak100.Next(1, 100 + 1);
        }
        public int Roll_k10()
        {
            return kostkak10.Next(1, 10 + 1);
        }

        public void Roll_cechy(object sender, EventArgs e)
        {
            int ruch=0;
            //rzut kością 3k6*5 do wylosowania wartości cech
            int suma = 0;
            for (int i = 0; i < k6.Length; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    suma += Roll_k6();

                }

                k6[i] = suma * 5;
                suma = 0;

            }
            //rzut koscia (2k6 + 6) * 5 do wylosowania cech
            for (int i = 0; i < k6_2.Length; i++)
            {
                for (int j = 0; j < 2; j++)
                {
                    suma += Roll_k6();

                }

                k6_2[i] = (suma+6) * 5;
                suma = 0;

            }

            //zmiana cech przez wiek
            int wiek = Convert.ToInt32(WiekTextBox.Text);
            int rozwojtest=0;
            if (wiek >= 15 & wiek <= 19)
            {
                //dwa rzuty na szczescie i wyzszy wynik
                for (int i = 5; i < 7; i++)
                {
                    int najwiekszy = k6[i+1];
                    if (k6[i] < najwiekszy)
                    {
                        k6[5] = najwiekszy;
                    }
                }
                k6[0] -= 5;
                k6_2[0] -= 5;
                

            }
            if (wiek >= 20 & wiek <= 39)
            {
                //test rozwoju WYK
                rozwojtest = Roll_k100();
                if (rozwojtest>k6_2[2])
                {
                    k6_2[2] += Roll_k10();
                }
            }
            if (wiek >= 40 & wiek <= 49)
            {
                //dwa testy rozwoju WYK
                for (int i = 0; i < 2; i++)
                {
                    rozwojtest = Roll_k100();
                    if (rozwojtest > k6_2[2])
                    {
                        k6_2[2] += Roll_k10();
                    }

                }
                k6[0] -= 5;
                k6[3] -= 5;
                k6[1] -= 5;
                k6[4] -= 5;
            }
            if (wiek >= 50 & wiek <= 59)
            {
                //trzy testy rozwoju WYK
                for (int i = 0; i < 3; i++)
                {
                    rozwojtest = Roll_k100();
                    if (rozwojtest > k6_2[2])
                    {
                        k6_2[2] += Roll_k10();
                    }

                }
                k6[0] -= 10;
                k6[3] -= 10;
                k6[1] -= 10;
                k6[4] -= 10;
            }
            if (wiek >= 60 & wiek <= 69)
            {
                //cztery testy rozwoju WYK
                for (int i = 0; i < 4; i++)
                {
                    rozwojtest = Roll_k100();
                    if (rozwojtest > k6_2[2])
                    {
                        k6_2[2] += Roll_k10();
                    }

                }
                k6[0] -= 20;
                k6[3] -= 20;
                k6[1] -= 20;
                k6[4] -= 15;

            }
            if (wiek >= 70 & wiek <= 79)
            {
                //cztery testy rozwoju WYK
                for (int i = 0; i < 4; i++)
                {
                    rozwojtest = Roll_k100();
                    if (rozwojtest > k6_2[2])
                    {
                        k6_2[2] += Roll_k10();
                    }

                }
                k6[0] -= 40;
                k6[3] -= 40;
                k6[1] -= 40;
                k6[4] -= 20;

            }
            if (wiek >= 80 & wiek <= 90)
            {
                //cztery testy rozwoju WYK
                for (int i = 0; i < 4; i++)
                {
                    rozwojtest = Roll_k100();
                    if (rozwojtest > k6_2[2])
                    {
                        k6_2[2] += Roll_k10();
                    }

                }
                k6[0] -= 80;
                k6[3] -= 80;
                k6[1] -= 80;
                k6[4] -= 25;
            }
            // ustawienie min i max wartości dla cech
            for (int i = 0; i < 5; i++)
            {
                if (k6[i] < 1)
                {
                    k6[i] = 1;
                }

            }
            if (k6_2[2] > 99)
            {
                k6_2[2] = 99;
            }
            //określenie wartości Ruch
            if (k6[0] < k6_2[0] & k6[1] < k6_2[0])
            {
                ruch = 7;
                Ruch.Text = ruch.ToString();
            }
            if (k6[0] >= k6_2[0] | k6[1] >= k6_2[0])
            {
                ruch = 8;
                Ruch.Text = ruch.ToString();
            }
            if (k6[0] > k6_2[0] & k6[1] > k6_2[0])
            {
                ruch = 9;
                Ruch.Text = ruch.ToString();
            }

            //przypisanie wylosowanych wartości 3k6*5
            Sila.Text = k6[0].ToString();
            Zrecznosc.Text = k6[1].ToString();
            Moc.Text = k6[2].ToString();
            Kondycja.Text = k6[3].ToString();
            Wyglad.Text = k6[4].ToString();
            Szczescie.Text = k6[5].ToString();
            Pkt_poczytalnosci.Text = k6[2].ToString();
            Pkt_magii.Text = (k6[2] / 5).ToString();
            Pkt_wytrzymalosci.Text = ((k6_2[0] + k6[3]) / 10).ToString();
            //przypisanie wylosowanych wartości (2k6 + 6) * 5
            Budowa_Ciala.Text = k6_2[0].ToString();
            Inteligencja.Text = k6_2[1].ToString();
            Wyksztalcenie.Text = k6_2[2].ToString();
            Jezyk_ojczysty.Text = k6_2[2].ToString();

            
            //zmniejszenie ruchu przez wiek
            
            if (wiek >= 40 & wiek <= 49)
            {
                ruch -= 1;
                Ruch.Text = ruch.ToString();
            }
            if (wiek >= 50 & wiek <= 59)
            {
                ruch -= 2;
                Ruch.Text = ruch.ToString();
            }
            if (wiek >= 60 & wiek <= 69)
            {
                ruch -= 3;
                Ruch.Text = ruch.ToString();

            }
            if (wiek >= 70 & wiek <= 79)
            {
                ruch -= 4;
                Ruch.Text = ruch.ToString();

            }
            if (wiek >= 80 & wiek <= 89)
            {
                ruch -= 5;
                Ruch.Text = ruch.ToString();
            }
            
            
            //połączenie z bazą i wypisanie umiejętności, które można rozwinąć
            using (SqlCommand cmd = new SqlCommand(
                    "Select [Umiejetnosc1],[Umiejetnosc2],[Umiejetnosc3],[Umiejetnosc4],[Umiejetnosc5],[Umiejetnosc6],[Umiejetnosc7],[Umiejetnosc8],[Liczba_pkt] from[dbo].[Profesja] where Nazwa_Profesji = '" + DropDownList1.Text.Trim() + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = myConnection;

                    myConnection.Open();
                    SqlDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    if (dataReader.Read())
                    {
                        string Um1 = dataReader["Umiejetnosc1"].ToString();
                        string Um2 = dataReader["Umiejetnosc2"].ToString();
                        string Um3 = dataReader["Umiejetnosc3"].ToString();
                        string Um4 = dataReader["Umiejetnosc4"].ToString();
                        string Um5 = dataReader["Umiejetnosc5"].ToString();
                        string Um6 = dataReader["Umiejetnosc6"].ToString();
                        string Um7 = dataReader["Umiejetnosc7"].ToString();
                        string Um8 = dataReader["Umiejetnosc8"].ToString();
                        Liczba_pkt = dataReader["Liczba_pkt"].ToString();
                        string label = Um1 + " | " + Um2 + " | " + Um3 + " | " + Um4 + " | " + Um5 + " | " + Um6 + " | " + Um7 + " | " + Um8;

                        Umiejetnosci_dodawanie.Visible = true;
                        Umiejetnosci_dodawanie.Text = label;
                    }

                    myConnection.Close();
                }
            
            //obliczenie wartości puli punktów do wykorzystania na rozwój
            int pula_pkt = 0;
            if (Liczba_pkt == "WYKx4")
            {
                pula_pkt = k6_2[2] * 4;
            }
            if (Liczba_pkt == "WYKx2+(MOCx2 lub ZRx2)")
            {
                pula_pkt = k6_2[2] * 2;
                if (k6[2] > k6[1])
                {
                    pula_pkt += k6[2] * 2;
                }
                if (k6[2] < k6[1])
                {
                    pula_pkt += k6[1] * 2;
                }
            }
            if (Liczba_pkt == "WYKx2+(ZRx2 lub Sx2)")
            {
                pula_pkt = k6_2[2] * 2;
                if (k6[1] > k6[0])
                {
                    pula_pkt += k6[1] * 2;
                }
                if (k6[1] < k6[0])
                {
                    pula_pkt += k6[0] * 2;
                }

            }
            Pula_pkt.Visible = true;
            Pula_pkt.Text = "Pula punktów do wykorzystania na poniższe umiejętności: "+ pula_pkt.ToString();
            //punkty z zainteresowań
            Umiejetnosci_zainteresowania.Text="Dodatkowo jako zainteresowania możesz rozdysponować "+k6_2[1]*2+" punktów na wszystkie umiejętności";
            Umiejetnosci_zainteresowania.Visible = true;
            Unik.Text = (k6[1] / 2).ToString();


        }


        protected void Koniec_Click(object sender, EventArgs e)
        {

        string MO="";
        int Krzepa = 0;
        string Gotowka="";
        string Dobytek="";
        string Poziom_wydatkow="";

            //określenie modyfikatora obrażeń i krzepy
            int SiBC = Convert.ToInt32(Sila.Text) + Convert.ToInt32(Budowa_Ciala.Text);
            if (SiBC >= 2 & SiBC <= 64)
            {
                MO = "-2";
                Krzepa = -2;
            }
            if (SiBC >= 65 & SiBC <= 84)
            {
                MO = "-1";
                Krzepa = -1;
            }
            if (SiBC >= 85 & SiBC <= 124)
            {
                MO = "0";
                Krzepa = 0;
            }
            if (SiBC >= 125 & SiBC <= 164)
            {
                MO = "+1K4";
                Krzepa = 1;
            }
            if (SiBC >= 165 & SiBC <= 204)
            {
                MO = "+1K6";
                Krzepa = 2;
            }
            if (SiBC >= 205 & SiBC <= 284)
            {
                MO = "+2K6";
                Krzepa = 3;
            }
            if (SiBC >= 285 & SiBC <= 364)
            {
                MO = "+3K6";
                Krzepa = 4;
            }
            if (SiBC >= 365 & SiBC <= 444)
            {
                MO = "+4K6";
                Krzepa = 5;
            }
            if (SiBC >= 445 & SiBC <= 524)
            {
                MO = "+5K6";
                Krzepa = 6;
            }
            if (SiBC >= 525)
            {
                MO = "+6K6";
                Krzepa = 7;
            }
            int majestnosc = Convert.ToInt32(Majetnosc.Text);
            //określenie wartości finansów
            if (majestnosc == 0)
            {
                Gotowka = "0,50$";
                Dobytek = "-";
                Poziom_wydatkow = "0,50$";
            }
            if (majestnosc >=1 & majestnosc<=9)
            {

                Gotowka = majestnosc +"$";
                Dobytek = majestnosc*10 + "$";
                Poziom_wydatkow = "2$";
            }
            if (majestnosc >= 10 & majestnosc <= 49)
            {

                Gotowka = majestnosc*2 + "$";
                Dobytek = majestnosc * 50 + "$";
                Poziom_wydatkow = "10$";
            }
            if (majestnosc >= 50 & majestnosc <= 89)
            {

                Gotowka = majestnosc*5 + "$";
                Dobytek = majestnosc * 500 + "$";
                Poziom_wydatkow = "50$";
            }
            if (majestnosc >= 90 & majestnosc <= 98)
            {

                Gotowka = majestnosc * 20 + "$";
                Dobytek = majestnosc * 2000 + "$";
                Poziom_wydatkow = "250$";
            }
            if (majestnosc >= 99)
            {

                Gotowka = "50000$";
                Dobytek = "5mln$";
                Poziom_wydatkow = "5000$";
            }

            //zapis wszystkiego do bazy


            myConnection.Open();
            //sprawdzenie IDUzytkownika
            string query1 = "Select [IDUzytkownika] from[dbo].[Uzytkownicy] where Login = '" + User.Identity.Name + "'";
            SqlCommand command = new SqlCommand(query1, myConnection);
            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            int UzytkownikID = (int)dataReader["IDUzytkownika"];
            myConnection.Close();
            //dodanie do bazy postaci
            myConnection.Open();
            string query = "Insert into [dbo].[Postac] (IDUzytkownika,Imię,Nazwisko,Profesja,Wiek,[Miejsce zamieszkania],[Miejsce urodzenia],S,ZR,MOC,KON,WYG,WYK,BC,INT,Ruch,Poczytalność,[Punkty Magii],Szczęście,[Punkty Wytrzymałości],Antropologia" +
                ",Archeologia,[Broń palna długa],[Broń palna krótka],Charakteryzacja,Elektryka,Gadanina,Historia,Jeździectwo,[Język obcy],[Język ojczysty],[Korzystanie z bibliotek],Księgowość,Majętność,Mechanika,Medycyna,[Mity Cthulhu],Nasłuchiwanie,Nauka" +
                ",Nawigacja,[Obsługa ciężkiego sprzętu],Okultyzm,Perswazja,[Pierwsza pomoc],Pilotowanie,Pływanie,Prawo,[Prowadzenie samochodu],Psychoanaliza,Psychologia,Rzucanie,Skakanie,Spostrzegawczość,[Sztuka/Rzemiosło],[Sztuka przetrwania],Ślusarstwo," +
                "Tropienie,Ukrywanie,Unik,[Urok osobisty],[Walka wręcz/Bijatyka],[Wiedza o naturze],Wspinaczka,Wycena,Zastraszanie,[Zręczne palce],Uzbrojenie1,Uzbrojenie2,Uzbrojenie3,Uzbrojenie4,[Historia badacza],Ekwipunek,[Poziom wydatków],Gotówka,Dobytek," +
                "[Modyfikator obrażeń],Krzepa) " +

                "Values (@uzytkownikID,@imie,@nazwisko,@DropDownList1,@wiek,@miejsce_zamieszkania,@Miejsce_urodzenia,@S,@ZR,@MOC,@KON,@WYG,@WYK,@BC,@INT,@Ruch,@Poczytalność,@Punkty_Magii,@Szczęście,@Punkty_Wytrzymałości,@Antropologia" +
                ",@Archeologia,@Broń_palna_długa,@Broń_palna_krótka,@Charakteryzacja,@Elektryka,@Gadanina,@Historia,@Jeździectwo,@Język_obcy,@Język_ojczysty,@Korzystanie_z_bibliotek,@Księgowość,@Majętność,@Mechanika,@Medycyna,@Mity_Cthulhu,@Nasłuchiwanie,@Nauka" +
                ",@Nawigacja,@Obsługa_ciężkiego_sprzętu,@Okultyzm,@Perswazja,@Pierwsza_pomoc,@Pilotowanie,@Pływanie,@Prawo,@Prowadzenie_samochodu,@Psychoanaliza,@Psychologia,@Rzucanie,@Skakanie,@Spostrzegawczość,@Sztuka_Rzemiosło,@Sztuka_przetrwania,@Ślusarstwo," +
                "@Tropienie,@Ukrywanie,@Unik,@Urok_osobisty,@Walka_wręcz_Bijatyka,@Wiedza_o_naturze,@Wspinaczka,@Wycena,@Zastraszanie,@Zręczne_palce,@Uzbrojenie1,@Uzbrojenie2,@Uzbrojenie3,@Uzbrojenie4,@Historia_badacza,@Ekwipunek,@Poziom_wydatków,@Gotówka,@Dobytek," +
                "@Modyfikator_obrażeń,@Krzepa)";
            SqlCommand insertCommand = new SqlCommand(query, myConnection);
            insertCommand.Parameters.AddWithValue("@uzytkownikID", UzytkownikID);
            insertCommand.Parameters.AddWithValue("@imie", imie.Text);
            insertCommand.Parameters.AddWithValue("@nazwisko", nazwisko.Text);
            insertCommand.Parameters.AddWithValue("@DropDownList1", DropDownList1.Text);
            insertCommand.Parameters.AddWithValue("@wiek", WiekTextBox.Text);
            insertCommand.Parameters.AddWithValue("@miejsce_zamieszkania", Miejsce_zamieszkania.Text);
            insertCommand.Parameters.AddWithValue("@Miejsce_urodzenia", Miejsce_urodzenia.Text);
            insertCommand.Parameters.AddWithValue("@S", Sila.Text);
            insertCommand.Parameters.AddWithValue("@ZR", Zrecznosc.Text);
            insertCommand.Parameters.AddWithValue("@MOC", Moc.Text);
            insertCommand.Parameters.AddWithValue("@KON", Kondycja.Text);
            insertCommand.Parameters.AddWithValue("@WYG", Wyglad.Text);
            insertCommand.Parameters.AddWithValue("@WYK", Wyksztalcenie.Text);
            insertCommand.Parameters.AddWithValue("@BC", Budowa_Ciala.Text);
            insertCommand.Parameters.AddWithValue("@INT", Inteligencja.Text);
            insertCommand.Parameters.AddWithValue("@Ruch", Ruch.Text);
            insertCommand.Parameters.AddWithValue("@Poczytalność", Pkt_poczytalnosci.Text);
            insertCommand.Parameters.AddWithValue("@Punkty_Magii", Pkt_magii.Text);
            insertCommand.Parameters.AddWithValue("@Szczęście", Szczescie.Text);
            insertCommand.Parameters.AddWithValue("@Punkty_Wytrzymałości", Pkt_wytrzymalosci.Text);
            insertCommand.Parameters.AddWithValue("@Antropologia", Antropologia.Text);
            insertCommand.Parameters.AddWithValue("@Archeologia", Archeologia.Text);
            insertCommand.Parameters.AddWithValue("@Broń_palna_długa", Bron_palna_dluga.Text);
            insertCommand.Parameters.AddWithValue("@Broń_palna_krótka", Bron_palna_krotka.Text);
            insertCommand.Parameters.AddWithValue("@Charakteryzacja", Charakteryzacja.Text);
            insertCommand.Parameters.AddWithValue("@Elektryka", Elektryka.Text);
            insertCommand.Parameters.AddWithValue("@Gadanina", Gadanina.Text);
            insertCommand.Parameters.AddWithValue("@Historia", Historia.Text);
            insertCommand.Parameters.AddWithValue("@Jeździectwo", Jezdziectwo.Text);
            insertCommand.Parameters.AddWithValue("@Język_obcy", Jezyk_obcy.Text);
            insertCommand.Parameters.AddWithValue("@Język_ojczysty", Jezyk_ojczysty.Text);
            insertCommand.Parameters.AddWithValue("@Korzystanie_z_bibliotek", Korzystanie_z_bibliotek.Text);
            insertCommand.Parameters.AddWithValue("@Księgowość", Ksiegowosc.Text);
            insertCommand.Parameters.AddWithValue("@Majętność", Majetnosc.Text);
            insertCommand.Parameters.AddWithValue("@Mechanika", Mechanika.Text);
            insertCommand.Parameters.AddWithValue("@Medycyna", Medycyna.Text);
            insertCommand.Parameters.AddWithValue("@Mity_Cthulhu", Mity_cthulhu.Text);
            insertCommand.Parameters.AddWithValue("@Nasłuchiwanie", Nasluchiwanie.Text);
            insertCommand.Parameters.AddWithValue("@Nauka", Nauka.Text);
            insertCommand.Parameters.AddWithValue("@Nawigacja", Nawigacja.Text);
            insertCommand.Parameters.AddWithValue("@Obsługa_ciężkiego_sprzętu", Obsluga_ciezkiego_sprzetu.Text);
            insertCommand.Parameters.AddWithValue("@Okultyzm", Okultyzm.Text);
            insertCommand.Parameters.AddWithValue("@Perswazja", Perswazja.Text);
            insertCommand.Parameters.AddWithValue("@Pierwsza_pomoc", Pierwsza_pomoc.Text);
            insertCommand.Parameters.AddWithValue("@Pilotowanie", Pilotowanie.Text);
            insertCommand.Parameters.AddWithValue("@Pływanie", Plywanie.Text);
            insertCommand.Parameters.AddWithValue("@Prawo", Prawo.Text);
            insertCommand.Parameters.AddWithValue("@Prowadzenie_samochodu", Prowadzenie_Samochodu.Text);
            insertCommand.Parameters.AddWithValue("@Psychoanaliza", Psychoanaliza.Text);
            insertCommand.Parameters.AddWithValue("@Psychologia", Psychologia.Text);
            insertCommand.Parameters.AddWithValue("@Rzucanie", Rzucanie.Text);
            insertCommand.Parameters.AddWithValue("@Skakanie", Skakanie.Text);
            insertCommand.Parameters.AddWithValue("@Spostrzegawczość", Spostrzegawczosc.Text);
            insertCommand.Parameters.AddWithValue("@Sztuka_Rzemiosło", Sztuka_rzemioslo.Text);
            insertCommand.Parameters.AddWithValue("@Sztuka_przetrwania", Sztuka_przetrwania.Text);
            insertCommand.Parameters.AddWithValue("@Ślusarstwo", Slusarstwo.Text);
            insertCommand.Parameters.AddWithValue("@Tropienie", Tropienie.Text);
            insertCommand.Parameters.AddWithValue("@Ukrywanie", Ukrywanie.Text);
            insertCommand.Parameters.AddWithValue("@Unik", Unik.Text);
            insertCommand.Parameters.AddWithValue("@Urok_osobisty", Urok_osobisty.Text);
            insertCommand.Parameters.AddWithValue("@Walka_wręcz_Bijatyka", Walka_wrecz.Text);
            insertCommand.Parameters.AddWithValue("@Wiedza_o_naturze", Wiedza_o_naturze.Text);
            insertCommand.Parameters.AddWithValue("@Wspinaczka", Wspinaczka.Text);
            insertCommand.Parameters.AddWithValue("@Wycena", Wycena.Text);
            insertCommand.Parameters.AddWithValue("@Zastraszanie", Zastraszanie.Text);
            insertCommand.Parameters.AddWithValue("@Zręczne_palce", Zreczne_palce.Text);
            insertCommand.Parameters.AddWithValue("@Uzbrojenie1", DropDownList2.Text);
            insertCommand.Parameters.AddWithValue("@Uzbrojenie2", DropDownList3.Text);
            insertCommand.Parameters.AddWithValue("@Uzbrojenie3", DropDownList4.Text);
            insertCommand.Parameters.AddWithValue("@Uzbrojenie4", DropDownList5.Text);
            insertCommand.Parameters.AddWithValue("@Historia_badacza", Historia_Badacza.Text);
            insertCommand.Parameters.AddWithValue("@Ekwipunek", Ekwipunek.Text);
            insertCommand.Parameters.AddWithValue("@Poziom_wydatków", Poziom_wydatkow);
            insertCommand.Parameters.AddWithValue("@Gotówka", Gotowka);
            insertCommand.Parameters.AddWithValue("@Dobytek", Dobytek);
            insertCommand.Parameters.AddWithValue("@Modyfikator_obrażeń", MO);
            insertCommand.Parameters.AddWithValue("@Krzepa", Krzepa);
            insertCommand.ExecuteNonQuery();
            myConnection.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Postać została dodana!');window.location ='Konto.aspx';", true);



        }

    }
    
}
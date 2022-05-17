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
        string login;

        public string Liczba_pkt;
        protected void Page_Load(object sender, EventArgs e)
        {
            login = User.Identity.Name;
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
            if (Liczba_pkt == "WYKx2 + (ZRx2 lub Sx2")
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


        }

        protected void Koniec_Click(object sender, EventArgs e)
        {
            //zapis wszystkiego do bazy


                myConnection.Open();
            //sprawdzenie IDUzytkownika
            string query1 = "Select [IDUzytkownika] from[dbo].[Users] where Login = '" + login + "'";
            SqlCommand command = new SqlCommand(query1, myConnection);
            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            int UzytkownikID = (int)dataReader["IDUzytkownika"];
            myConnection.Close();
            //dodanie do bazy postaci
            myConnection.Open();
            string query = "Insert into [dbo].[Postac] (IDUzytkownika,Imie,Nazwisko,Profesja,Wiek) Values (@UzytkownikID,@imie,@nazwisko,@DropDownList1,@wiek)";
            SqlCommand insertCommand = new SqlCommand(query, myConnection);
            insertCommand.Parameters.AddWithValue("@UzytkownikID", UzytkownikID);
            insertCommand.Parameters.AddWithValue("@imie", imie.Text);
            insertCommand.Parameters.AddWithValue("@nazwisko", nazwisko.Text);
            insertCommand.Parameters.AddWithValue("@DropDownList1", DropDownList1.Text);
            insertCommand.Parameters.AddWithValue("@wiek", WiekTextBox.Text);
            insertCommand.ExecuteNonQuery();
            myConnection.Close();

                Label1.Visible = true;
            


        }

    }
    
}
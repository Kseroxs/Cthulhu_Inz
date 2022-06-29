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
    public partial class Kampania : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.DataSource = this.ListaKampanii();
            GridView2.DataBind();
            GridView1.DataSource = this.ListaKampaniiUzytkownika();
            GridView1.DataBind();

        }
        //otwieranie kontrolek do tworzenia kampanii
        protected void Stworz_kampanie_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Nazwa_kampanii.Visible = true;
            Opis.Visible = true;
            Dodaj_kampanie.Visible = true;
            
        }
        //dodawanie kampanii do bazy
        protected void Dodaj_kampanie_Click(object sender, EventArgs e)
        {
            myConnection.Open();
            string query = "Insert into [dbo].[Kampania] (Nazwa,Opis,Straznik) Values (@Nazwa,@Opis,@Straznik)";
            SqlCommand insertCommand = new SqlCommand(query, myConnection);
            insertCommand.Parameters.AddWithValue("@Nazwa", Nazwa_kampanii.Text);
            insertCommand.Parameters.AddWithValue("@Opis", Opis.Text);
            insertCommand.Parameters.AddWithValue("@Straznik", User.Identity.Name);
            insertCommand.ExecuteNonQuery();
            myConnection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Udało się stworzyć kampanię "+ Nazwa_kampanii +"');window.location ='Kampania.aspx';", true);

        }
        //lista kampanii użytkownika
        public List<Kampanie> ListaKampaniiUzytkownika()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT IDKampanii,Nazwa,Straznik FROM Kampania where Straznik= '" + User.Identity.Name + "'", myConnection))
            {
                List<Kampanie> kampanie = new List<Kampanie>();
                cmd.CommandType = CommandType.Text;
                myConnection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        kampanie.Add(new Kampanie
                        {
                            IDKampanii = Convert.ToInt32(sdr["IDKampanii"]),
                            Nazwa = sdr["Nazwa"].ToString(),
                            Straznik = sdr["Straznik"].ToString()

                        });
                    }
                }
                myConnection.Close();
                return kampanie;
            }

        }
        //lista kampanii, w których biorą udział postacie użytkownika
        public List<Kampanie> ListaKampanii()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Postac.Imię,Postac.IDPostaci, Uzytkownicy.IDUzytkownika,Postac.IDUzytkownika,Uzytkownicy.[Login], Kampania.IDKampanii,Nazwa,Straznik FROM Kampania" +
                " inner join Postac on Postac.IDKampanii = Kampania.IDKampanii" +
                " inner join Uzytkownicy on Uzytkownicy.[IDUzytkownika] = Postac.IDUzytkownika " +
                "where[Login] = '"+User.Identity.Name+"' and Kampania.IDKampanii = Postac.IDKampanii", myConnection))
            {
                List<Kampanie> kampanie = new List<Kampanie>();
                cmd.CommandType = CommandType.Text;
                myConnection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        kampanie.Add(new Kampanie
                        {
                            IDPostaci=Convert.ToInt32(sdr["IDPostaci"]),
                            Imie = sdr["Imię"].ToString(),
                            IDKampanii = Convert.ToInt32(sdr["IDKampanii"]),
                            Nazwa = sdr["Nazwa"].ToString(),
                            Straznik = sdr["Straznik"].ToString()

                        });
                    }
                }
                myConnection.Close();
                return kampanie;
            }

        }
    }
}
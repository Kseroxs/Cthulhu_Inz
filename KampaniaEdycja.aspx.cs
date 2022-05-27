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
    public partial class KampaniaEdycja : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        string kampaniaid;
        protected void Page_Load(object sender, EventArgs e)
        {
            //wczytanie id kampanii i wywolanie przypisania wartosci do txtbox
            if (!IsPostBack)
            {
                kampaniaid = Page.Request.QueryString["IDKampanii"].ToString();
                PrzypiszWartosciTxt();
            }
            kampaniaid = Page.Request.QueryString["IDKampanii"].ToString();
            //wywolanie listy czlonkow kampanii
            GridView2.DataSource = this.ListaCzlonkowie();
            GridView2.DataBind();

        }

        //edytowanie kampanii w bazie
        protected void Edytuj_kampanie_Click(object sender, EventArgs e)
        {
            myConnection.Open();
            string query = "UPDATE Kampania SET Nazwa = '" + Nazwa_kampanii.Text + "', Opis = '" + Opis.Text + "' where IDKampanii = '"+kampaniaid+"'";
            SqlCommand update = new SqlCommand(query, myConnection);
            update.ExecuteNonQuery();
            myConnection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Udało się edytować kampanię');window.location ='Kampania.aspx';", true);
        }
        //tworzenie listy postaci gracza, które można dodać do kampanii
        protected void Szukaj_Click(object sender, EventArgs e)
        {
            
                GridView1.DataSource = this.Lista();
                GridView1.DataBind();
            
        }
        //lista postaci gracza
        public List<Postac> Lista()
        {
            using (SqlCommand cmd = new SqlCommand("select Postac.IDPostaci,Postac.IDUzytkownika,Users.[Login],Postac.Imię,Postac.Nazwisko,Postac.Profesja from Postac " +
                "INNER JOIN Users on Postac.IDUzytkownika = Users.IDUzytkownika " +
                "where[Login] = '" + LoginTxt.Text + "' and IDKampanii is null;", myConnection))
            {
                List<Postac> postacie = new List<Postac>();
                cmd.CommandType = CommandType.Text;
                myConnection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        
                            postacie.Add(new Postac
                            {
                                IDPostaci = Convert.ToInt32(sdr["IDPostaci"].ToString()),
                                Imie = sdr["Imię"].ToString(),
                                Nazwisko = sdr["Nazwisko"].ToString(),
                                Profesja = sdr["Profesja"].ToString()

                            });
                        
                    }
                    if (sdr.HasRows)
                    {
                        PostacieGraczaLabel.Visible = true;
                    }
                    else
                    {
                        BrakPostaciLabel.Visible = true;
                    }
                }
                myConnection.Close();
                return postacie;
            }

        }
        //lista członków kampanii
        public List<Postac> ListaCzlonkowie()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT IDPostaci,Imię, Nazwisko, Profesja FROM Postac where IDKampanii= '" + kampaniaid + "'", myConnection))
            {
                List<Postac> czlonkowie = new List<Postac>();
                cmd.CommandType = CommandType.Text;
                myConnection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        czlonkowie.Add(new Postac
                        {
                            IDPostaci = Convert.ToInt32(sdr["IDPostaci"]),
                            Imie = sdr["Imię"].ToString(),
                            Nazwisko = sdr["Nazwisko"].ToString(),
                            Profesja = sdr["Profesja"].ToString()

                        });
                    }
                }
                myConnection.Close();
                return czlonkowie;
            }

        }
        //usuwanie kampanii
        protected void Usun_kampanie_Click(object sender, EventArgs e)
        {
            myConnection.Open();
            string query = "Delete from Kampania where IDKampanii= '"+ kampaniaid+"'";
            SqlCommand delete = new SqlCommand(query, myConnection);
            delete.ExecuteNonQuery();
            myConnection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Kampania została usunięta!');window.location ='Kampania.aspx';", true);

        }
        //przypisanie wartosci do txtbox
        private void PrzypiszWartosciTxt()
        {
            myConnection.Open();
            string query1 = "Select Nazwa,Opis  from [dbo].[Kampania] where IDKampanii = '" + kampaniaid + "'";
            SqlCommand command = new SqlCommand(query1, myConnection);
            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            Nazwa_kampanii.Text = dataReader["Nazwa"].ToString();
            Opis.Text = dataReader["Opis"].ToString();
            myConnection.Close();
        }
        //usuwanie członków z kampanii
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UsunButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int postacid = Convert.ToInt32(GridView2.Rows[index].Cells[1].Text);
                string imie = GridView2.Rows[index].Cells[2].Text;
                string nazwisko = GridView2.Rows[index].Cells[3].Text;
                myConnection.Open();
                string query = "UPDATE Postac SET IDKampanii=null WHERE IDPostaci = '" + postacid + "'";
                SqlCommand update = new SqlCommand(query, myConnection);
                update.ExecuteNonQuery();
                myConnection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Usunąłeś " + imie + " " + nazwisko + " z kampanii!');window.location ='Kampania.aspx';", true);

            }
        }
        //dodawanie członków do kampanii z listy postaci gracza
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DodajButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int postacid = Convert.ToInt32(GridView1.Rows[index].Cells[1].Text);
                string imie = GridView1.Rows[index].Cells[2].Text;
                string nazwisko= GridView1.Rows[index].Cells[3].Text;
                myConnection.Open();
                string query = "UPDATE Postac SET IDKampanii = '" + kampaniaid + "' WHERE IDPostaci = '" + postacid + "'";
                SqlCommand update = new SqlCommand(query, myConnection);
                update.ExecuteNonQuery();
                myConnection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Dodałeś "+imie+" "+nazwisko+" do kampanii!');window.location ='Kampania.aspx';", true);

            }
        }
    }
}
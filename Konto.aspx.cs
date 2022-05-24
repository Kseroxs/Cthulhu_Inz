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
    public partial class Konto : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        public int UzytkownikID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                WelcomeBackMessage.Text = "Witamy z powrotem, " + User.Identity.Name + "!";
                AuthenticatedMessagePanel.Visible = true;
            }
            myConnection.Open();
            //sprawdzenie IDUzytkownika
            string query1 = "Select [IDUzytkownika] from[dbo].[Users] where Login = '" + User.Identity.Name + "'";
            SqlCommand command = new SqlCommand(query1, myConnection);
            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            UzytkownikID = (int)dataReader["IDUzytkownika"];
            myConnection.Close();
        GridView1.DataSource = this.Lista();
        GridView1.DataBind();
            
        }
        public List<Postac> Lista()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT IDPostaci,Imię, Nazwisko, Profesja FROM Postac where IDUzytkownika= '" + UzytkownikID + "'", myConnection))
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
                            IDPostaci = Convert.ToInt32(sdr["IDPostaci"]),
                            Imie = sdr["Imię"].ToString(),
                            Nazwisko = sdr["Nazwisko"].ToString(),
                            Profesja = sdr["Profesja"].ToString()

                        });
                    }
                }
                myConnection.Close();
                return postacie;
            }

        }
    }
    
}
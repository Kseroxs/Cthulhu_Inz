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
    public partial class Kampania : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Stworz_kampanie_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Nazwa_kampanii.Visible = true;
            Opis.Visible = true;
            Dodaj_kampanie.Visible = true;
            
        }

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

        }
    }
}
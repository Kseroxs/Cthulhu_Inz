using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Azure.Management.ResourceManager.Models;

namespace Cthulhu_Inz
{
    public partial class Rejestracja : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Zarejestruj_Click(object sender, EventArgs e)
        {
            myConnection.Open();
            string query1 = "Select count(*) from[dbo].[Users] where Login = '" + login.Text.Trim()+ "'";
            SqlCommand command = new SqlCommand(query1, myConnection);
            int loginIstnieje = int.Parse(command.ExecuteScalar().ToString());
            if (loginIstnieje > 0)
            {

                InvalidCredentialsMessage.Visible = true;
            }
            else
            {
                string query = "Insert into [dbo].[Users] (Login,Email,Haslo) Values (@login,@email,@haslo)";
                SqlCommand insertCommand = new SqlCommand(query, myConnection);
                insertCommand.Parameters.AddWithValue("@login", login.Text);
                insertCommand.Parameters.AddWithValue("@email", email.Text);
                insertCommand.Parameters.AddWithValue("@haslo", haslo.Text);
                insertCommand.ExecuteNonQuery();
                myConnection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(),"alert","alert('Konto zostało zapisane.');window.location ='Logowanie.aspx';",true);
            }

        }

        protected void Sample_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


    }
}
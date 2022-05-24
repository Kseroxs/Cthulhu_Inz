using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Cthulhu_Inz
{
    public partial class Logowanie : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Zalogowanie_Click(object sender, EventArgs e)
        {
            myConnection.Open();
            string query = "Select count(*) from [dbo].[Users] where Login = '" + login.Text.Trim() + "' and Haslo = '" + haslo.Text + "'";
            SqlCommand command = new SqlCommand(query, myConnection);
            int kontoIstnieje = int.Parse(command.ExecuteScalar().ToString());
            myConnection.Close();

            if (kontoIstnieje > 0)
            {

                FormsAuthentication.RedirectFromLoginPage(login.Text, RememberMe.Checked);

            }
            InvalidCredentialsMessage.Visible = true;

        }
    }
}
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
    public partial class PostacEdycja : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        string postacid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                postacid = Page.Request.QueryString["IDPostaci"].ToString();
                BindTextBoxvalues();
            }

        }
        private void BindTextBoxvalues()
        {
            myConnection.Open();
            string query1 = "Select [Imię] from [dbo].[Postac] where IDPostaci = " + postacid;
            SqlCommand command = new SqlCommand(query1, myConnection);
            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            string imie = (string)dataReader["Imię"];
            Label1.Text = imie.ToString();
            myConnection.Close();
        }
    }
}
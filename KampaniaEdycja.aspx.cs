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
    public partial class KampaniaEdycja : System.Web.UI.Page
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CthulhuDBConnectionString"].ConnectionString);
        string gracz;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Edytuj_kampanie_Click(object sender, EventArgs e)
        {

        }

        protected void Szukaj_Click(object sender, EventArgs e)
        {

        }
    }
}
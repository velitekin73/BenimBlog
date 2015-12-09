using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSitesi
{
    public partial class Iletisim : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYorum_Click(object sender, EventArgs e)
        {
            SqlCommand cmdEkle = new SqlCommand("insert into Iletisim (IletisimAdSoyad,IletisimEmail,IletisimIcerik) values('"+txtAdSoyad.Text+"','"+txtEmail.Text+"','"+txtMesaj.Text+"')", baglan.baglan());
            cmdEkle.ExecuteNonQuery();
            
            txtAdSoyad.Text = "";
            txtEmail.Text = "";
            txtMesaj.Text = "";
            lblBilgi.Text = "Mesajınız Alındı.";
            
        }
    }
}
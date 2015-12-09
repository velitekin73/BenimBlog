using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSitesi.Admin
{
    public partial class mesajlar : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string IletisimId = "";
        string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            IletisimId = Request.QueryString["IletisimId"];
            islem = Request.QueryString["islem"];
            if (Page.IsPostBack==false)
            {
                pnlMesajEkle.Visible = false;
            }

            SqlCommand cmdMesaj = new SqlCommand("select * from Iletisim",baglan.baglan());
            SqlDataReader drMEsaj = cmdMesaj.ExecuteReader();
            dlMesaj.DataSource = drMEsaj;
            dlMesaj.DataBind();

            //mesajların silinmesi
            if (islem=="sil")
            {
                SqlCommand cmdSil = new SqlCommand("delete from Iletisim where IletisimId = '" + IletisimId + "'", baglan.baglan());
                cmdSil.ExecuteNonQuery();
                Response.Redirect("mesajlar.aspx");
            }
            
        }

        protected void btnMesajEkleArti_Click(object sender, EventArgs e)
        {
            pnlMesajEkle.Visible = true;
        }

        protected void btnMesajEkleEksi_Click(object sender, EventArgs e)
        {
            pnlMesajEkle.Visible = false;
        }
    }
}
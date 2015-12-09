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
    public partial class yorumCevap : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string MakaleId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

        }

        protected void btnYorumCevap_Click(object sender, EventArgs e)
        {
            MakaleId = Request.QueryString["MakaleId"];
            SqlCommand cmdYorumEkle = new SqlCommand("insert into Yorum (YorumAdSoyad,YorumIcerik,YorumResim,MakaleId) values('" + txtAdSoyad.Text + "','" + txtYorumIcerik.Text + "','/Temalar/admin.png','" + MakaleId + "')", baglan.baglan());
            cmdYorumEkle.ExecuteNonQuery();
            Response.Redirect("yorumlar.aspx");
        }
    }
}
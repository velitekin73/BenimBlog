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
    public partial class yorumlar : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string YorumId = "";
        string islem = "";//oonaysız yorumları silmek için
        string islemiki = "";//onaylanan yorumları silmek için
        string MakaleId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            YorumId = Request.QueryString["YorumId"];
            islem = Request.QueryString["islem"];
            islemiki=Request.QueryString["islemiki"];
            MakaleId = Request.QueryString["MakaleId"];
            if (islem=="sil")
            {
                SqlCommand cmdSil = new SqlCommand("delete from Yorum where YorumId='"+YorumId+"'",baglan.baglan());
                cmdSil.ExecuteNonQuery();
                Response.Redirect("yorumlar.aspx");
            }
            if (islemiki == "siliki")
            {
                SqlCommand cmdSil = new SqlCommand("delete from Yorum where YorumId='" + YorumId + "'", baglan.baglan());
                cmdSil.ExecuteNonQuery();

                SqlCommand cmdAzalt = new SqlCommand("update Makale Set MakaleYorumSayisi=MakaleYorumSayisi-1 where MakaleId='"+MakaleId+"'",baglan.baglan());
                cmdAzalt.ExecuteNonQuery();
                Response.Redirect("yorumlar.aspx");
            }
            if (Page.IsPostBack==false)
            {
                pnlOnaysizYorum.Visible = false;
                pnlOnayliYorum.Visible = false;
            
                //Onaysız yorumlar
            SqlCommand cmdOnaysizYorum = new SqlCommand("SELECT dbo.Makale.MakaleId, dbo.Makale.MakaleBaslik, dbo.Makale.MakaleYorumSayisi, dbo.Yorum.YorumId, dbo.Yorum.YorumAdSoyad, dbo.Yorum.YorumEmail, dbo.Yorum.YorumIcerik, dbo.Yorum.YorumTarih,dbo.Yorum.YorumOnay, dbo.Yorum.YorumResim FROM dbo.Makale INNER JOIN dbo.Yorum ON dbo.Makale.MakaleId = dbo.Yorum.MakaleId where YorumOnay=0", baglan.baglan());
            SqlDataReader drOnaysizYorum = cmdOnaysizYorum.ExecuteReader();


            dlOnaysizYorum.DataSource = drOnaysizYorum;
            dlOnaysizYorum.DataBind();

            //Onaylanan yorumlar
            SqlCommand cmdOnaylananYorum = new SqlCommand("SELECT dbo.Makale.MakaleId, dbo.Makale.MakaleBaslik, dbo.Makale.MakaleYorumSayisi, dbo.Yorum.YorumId, dbo.Yorum.YorumAdSoyad, dbo.Yorum.YorumEmail, dbo.Yorum.YorumIcerik, dbo.Yorum.YorumTarih,dbo.Yorum.YorumOnay, dbo.Yorum.YorumResim FROM dbo.Makale INNER JOIN dbo.Yorum ON dbo.Makale.MakaleId = dbo.Yorum.MakaleId where YorumOnay=1", baglan.baglan());
            SqlDataReader drOnaylananYorum = cmdOnaylananYorum.ExecuteReader();


            dlOnayliYorum.DataSource = drOnaylananYorum;
            dlOnayliYorum.DataBind();
        }
        }

        protected void btnOnaysizYorumEkleArti_Click(object sender, EventArgs e)
        {
            pnlOnaysizYorum.Visible = true;
        }

        protected void btnOnaysizYorumEkleEksi_Click(object sender, EventArgs e)
        {
            pnlOnaysizYorum.Visible = false;
        }

        protected void btnOnayliYorumEkleArti_Click(object sender, EventArgs e)
        {
            pnlOnayliYorum.Visible = true;
        }

        protected void btnOnayliYorumEkleEksi_Click(object sender, EventArgs e)
        {
            pnlOnayliYorum.Visible = false;
        }
    }
}
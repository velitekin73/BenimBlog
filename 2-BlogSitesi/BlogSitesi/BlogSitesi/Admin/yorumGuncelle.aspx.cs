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
    public partial class yorumGuncelle : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string YorumId = "";
        string MakaleId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            YorumId = Request.QueryString["YorumId"];
            if (Page.IsPostBack == false)
            {
                SqlCommand cmdYorumGetir = new SqlCommand("select * from Yorum where YorumId='" + YorumId + "'", baglan.baglan());
                SqlDataReader drYorumGetir = cmdYorumGetir.ExecuteReader();

                DataTable dtYorumGetir = new DataTable("tablo");
                dtYorumGetir.Load(drYorumGetir);

                DataRow row = dtYorumGetir.Rows[0];
                txtAdSoyad.Text = row["YorumAdSoyad"].ToString();
                txtIcerik.Text = row["YorumIcerik"].ToString();


            }

        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {

            MakaleId = Request.QueryString["MakaleId"];

            
                SqlCommand cmdOnay = new SqlCommand("update Yorum Set YorumAdSoyad='" + txtAdSoyad.Text + "', YorumIcerik='" + txtIcerik.Text + "', YorumOnay='" + cbOnayla.Checked + "' where YorumId='" + YorumId + "'", baglan.baglan());
                cmdOnay.ExecuteNonQuery();
                

                //makaleye yapılan yorum sayısını arttıracağız
                if (cbOnayla.Checked == true)//yoruma onaylama yapılırsa sayısını arttırsın
                {
                    SqlCommand cmdEkle = new SqlCommand("update Makale Set MakaleYorumSayisi=MakaleYorumSayisi+1 where MakaleId='" + MakaleId + "'", baglan.baglan());
                    cmdEkle.ExecuteNonQuery();

                    Response.Redirect("yorumlar.aspx");
                }

                

        }
    }
}
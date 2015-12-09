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
    public partial class makaleGuncelle : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string MakaleId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            MakaleId = Request.QueryString["MakaleId"];
            if (Page.IsPostBack==false)
            {
                SqlCommand cmdmGuncelle = new SqlCommand("select * from Makale where MakaleId='"+MakaleId+"'",baglan.baglan());
                SqlDataReader dr = cmdmGuncelle.ExecuteReader();

                //okuduğumuz bilgileri bir tabloya kaydedip ilk satırı okuyacağız
                DataTable dt = new DataTable("tablo");
                dt.Load(dr);

                DataRow row = dt.Rows[0];
                txtBaslik.Text=row["MakaleBaslik"].ToString();
                txtOzet.Text=row["MakaleOzet"].ToString();
                ckicerik.Text=row["MakaleIcerik"].ToString();
                txtYorum.Text = row["MakaleYorumSayisi"].ToString();
                //fuResim.FileName=row["KategoriResim"].ToString();
            }

        }

        protected void btnMakaleGuncelle_Click(object sender, EventArgs e)
        {
            if (fuSlider.HasFile)
            {
                fuSlider.SaveAs(Server.MapPath("/SliderResim/" + fuSlider.FileName));
                SqlCommand cmdguncelle = new SqlCommand("update Makale set MakaleBaslik='" + txtBaslik.Text + "' , MakaleOzet='" + txtOzet.Text + "' , MakaleIcerik='" + ckicerik.Text + "' , MakaleYorumSayisi='" + txtYorum.Text + "' ,MakaleResim='/SliderResim/" + fuSlider.FileName + "' where MakaleId='" + MakaleId + "' ", baglan.baglan());
                cmdguncelle.ExecuteNonQuery();
                Response.Redirect("makaleler.aspx");
            }
            else//eğer resim yoksa
            {
                SqlCommand cmdguncelle2 = new SqlCommand("update Makale Set MakaleBaslik='" + txtBaslik.Text + "', MakaleOzet='" + txtOzet.Text + "', MakaleIcerik='" + ckicerik.Text + "',MakaleYorumSayisi='" + txtYorum.Text + "'  where MakaleId='" + MakaleId + "'", baglan.baglan());
                cmdguncelle2.ExecuteNonQuery();
                Response.Redirect("makaleler.aspx");
            }
        }
    }
}
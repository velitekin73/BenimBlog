using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSitesi
{
    public partial class MakaleDetay : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string MakaleId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            MakaleId=Request.QueryString["MakaleId"];
            if (Page.IsPostBack==false)
            {

                //Makale Getir
                SqlCommand cmdMakale = new SqlCommand("SELECT dbo.Makale.MakaleBaslik, dbo.Makale.MakaleIcerik, dbo.Makale.MakaleTarih, dbo.Makale.MakaleOkunmaSayisi, dbo.Makale.MakaleYorumSayisi, dbo.Kategori.KategoriResim, dbo.Kategori.KategoriId,dbo.Makale.MakaleId FROM dbo.Kategori INNER JOIN dbo.Makale ON dbo.Kategori.KategoriId = dbo.Makale.KategoriId where dbo.Makale.MakaleId='" + MakaleId + "'", baglan.baglan());

                SqlDataReader drMakale = cmdMakale.ExecuteReader();
                dlMakale.DataSource = drMakale;
                dlMakale.DataBind();

                //okunma sayısı tıklanma sayısı göz
                SqlCommand cmdOkuma = new SqlCommand("update Makale set MakaleOkunmaSayisi=MakaleOkunmaSayisi+1 where MakaleId='"+MakaleId+"'",baglan.baglan());
                cmdOkuma.ExecuteNonQuery();

                //yapılan yorumları getirme
                SqlCommand cmdYorumGetir = new SqlCommand("select * from Yorum where MakaleId='"+MakaleId+"' and YorumOnay=1",baglan.baglan());

                SqlDataReader drYorumGetir = cmdYorumGetir.ExecuteReader();
                dlYorumGetir.DataSource = drYorumGetir;
                dlYorumGetir.DataBind();
                
            }
        }

        protected void btnYorum_Click(object sender, EventArgs e)
        {
            SqlCommand cmdYorumEkle = new SqlCommand("insert into Yorum(YorumAdSoyad,YorumEmail,YorumIcerik,YorumResim,MakaleId)values('"+txtAdSoyad.Text+"','"+txtEmail.Text+"','"+txtYorum.Text+"','/Temalar/yorumcu.png','"+MakaleId+"')",baglan.baglan());
            cmdYorumEkle.ExecuteNonQuery();

            lblBilgi.Text = "Yorumunuz Alındı";
            //textboxların içeriğinide boşaltalım
            txtYorum.Text = "";
            txtAdSoyad.Text = "";
            txtEmail.Text = "";
        }
    }
}
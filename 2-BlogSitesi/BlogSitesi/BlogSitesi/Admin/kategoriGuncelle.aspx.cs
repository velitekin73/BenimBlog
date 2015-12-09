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
    
    public partial class kategoriGuncelle : System.Web.UI.Page
    {
       esqlbaglantisi baglan = new esqlbaglantisi();
        string KategoriId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            KategoriId=Request.QueryString["KategoriId"];

            if (Page.IsPostBack==false)
            {

                SqlCommand cmdKategoriGuncelle = new SqlCommand("select * from Kategori where KategoriId='"+KategoriId+"'",baglan.baglan());
                SqlDataReader dr = cmdKategoriGuncelle.ExecuteReader();

                //okuduğumuz bilgileri bir tabloya kaydedip ilk satırı okuyacağız
                DataTable dt = new DataTable("tablo");
                dt.Load(dr);

                DataRow row = dt.Rows[0];
                txtkategoriAdi.Text=row["KategoriAdi"].ToString();
                txtSira.Text=row["KategoriSira"].ToString();
                txtAdet.Text=row["KategoriAdet"].ToString();
                //fuResim.FileName=row["KategoriResim"].ToString();
                
            }
        }

        protected void btnKategoriGuncelle_Click(object sender, EventArgs e)
        {
            if (fuResim.HasFile)
            {
                fuResim.SaveAs(Server.MapPath("/KategoriResim/"+fuResim.FileName));
                SqlCommand cmdguncelle = new SqlCommand("update Kategori set KategoriAdi='"+txtkategoriAdi.Text+"' , KategoriSira='"+txtSira.Text+"' , KategoriAdet='"+txtAdet.Text+"' ,KategoriResim='/KategoriResim/"+fuResim.FileName+"' where KategoriId='"+KategoriId+"' ",baglan.baglan());
                cmdguncelle.ExecuteNonQuery();
                Response.Redirect("kategoriler.aspx");
            }
            else//eğer resim yoksa
            {
                SqlCommand cmdguncelle2 = new SqlCommand("update Kategori Set KategoriAdi='"+txtkategoriAdi.Text+"', KategoriSira='"+txtSira.Text+"', KategoriAdet='"+txtAdet.Text+"' where KategoriId='"+KategoriId+"'",baglan.baglan());
                cmdguncelle2.ExecuteNonQuery();
                Response.Redirect("kategoriler.aspx");
            }
        }

    }
}
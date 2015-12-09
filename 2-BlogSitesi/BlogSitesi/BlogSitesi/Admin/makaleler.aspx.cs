using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSitesi.Admin
{
    public partial class makaleler : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string MakaleId = "";
        string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"]==null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            MakaleId = Request.QueryString["MakaleId"];
            islem = Request.QueryString["islem"];
            if (islem == "sil")
            {
                SqlCommand cmdsil = new SqlCommand("delete from Makale where MakaleId='" + MakaleId + "'", baglan.baglan());
                cmdsil.ExecuteNonQuery();
            }

            if (Page.IsPostBack == false)
            {
                pnlMakaleEkle.Visible = false;
                pnlMakaleDuzenle.Visible = false;
                pnlMakaleDosya.Visible = false;
                //kategorileri getir dropdownlist 
                SqlCommand cmdgetir = new SqlCommand("select * from Kategori", baglan.baglan());
                SqlDataReader drgetir = cmdgetir.ExecuteReader();
                ddlKategori.DataTextField = "KategoriAdi";
                ddlKategori.DataValueField = "KategoriId";

                ddlKategori.DataSource = drgetir;
                ddlKategori.DataBind();
                //drgetir.Close();

                //makale getir dataliste
                SqlCommand cmdmgetir = new SqlCommand("select * from Makale", baglan.baglan());
                SqlDataReader drmgetir = cmdmgetir.ExecuteReader();

                dlmakalegetir.DataSource = drmgetir;
                dlmakalegetir.DataBind();
                //drmakalegetir.Close();
            }

        }

        protected void btnMakaleEkleArti_Click(object sender, EventArgs e)
        {
            pnlMakaleEkle.Visible = true;
        }

        protected void btnMakaleEkleEksi_Click(object sender, EventArgs e)
        {
            pnlMakaleEkle.Visible = false;
        }

        protected void btnMakaleEkle_Click(object sender, EventArgs e)
        {
            if (fuResim.HasFile)
            {
                fuResim.SaveAs(Server.MapPath("/SliderResim/" + fuResim.FileName));
                SqlCommand cmdekle = new SqlCommand("insert into Makale(MakaleBaslik,MakaleIcerik,MakaleOzet,MakaleResim,KategoriId) values('" + txtBaslik.Text + "','" + ckicerik.Text + "','" + txtOzet.Text + "','/SliderResim/" + fuResim.FileName + "','" + ddlKategori.SelectedValue + "')", baglan.baglan());
                cmdekle.ExecuteNonQuery();

                SqlCommand cmdKategoriAdet = new SqlCommand("update Kategori set KategoriAdet=KategoriAdet+1 where KategoriId='"+ddlKategori.SelectedValue+"'",baglan.baglan());
                cmdKategoriAdet.ExecuteNonQuery();
                Response.Redirect("makaleler.aspx");
            }
            else
            {
                btnMakaleEkle.Text = "Resim Ekle !!!";
            }
        }

        protected void btnMakaleDuzenlemeArti_Click(object sender, EventArgs e)
        {
            pnlMakaleDuzenle.Visible = true;
        }

        protected void btnMakaleDuzenlemeEksi_Click(object sender, EventArgs e)
        {
            pnlMakaleDuzenle.Visible = false;
        }

        protected void btnMakaleDosyaArti_Click(object sender, EventArgs e)
        {
            pnlMakaleDosya.Visible = true;
        }

        protected void btnMakaleDosyaEksi_Click(object sender, EventArgs e)
        {
            pnlMakaleDosya.Visible = false;
        }

        protected void btnMakaleDosyaEkle_Click(object sender, EventArgs e)
        {
            //dosya ekleme yeri word exel gibi
            if (fuDosya.HasFile)
            {
                fuDosya.SaveAs(Server.MapPath("/Dosyalar/"+fuDosya.FileName));
                Response.Redirect("makaleler.aspx");
            }
            else
            {
                btnMakaleDosyaEkle.Text = "Dosya Ekle !!!";
            }
        }


    }
}
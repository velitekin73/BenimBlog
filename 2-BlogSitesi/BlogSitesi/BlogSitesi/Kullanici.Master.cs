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
    public partial class Kullanici : System.Web.UI.MasterPage
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Slider
            //ilk 5 makaleyi getirsin ve Makalenin okunma sayısına göre getirip sıralasın
            //ençok okunanı en başa getirir
            SqlCommand cmdSliderGetir = new SqlCommand("select top 5 * from Makale order by MakaleOkunmaSayisi desc",baglan.baglan());
            SqlDataReader drSlider = cmdSliderGetir.ExecuteReader();

            dlSliderResim.DataSource = drSlider;
            dlSliderResim.DataBind();

            //Duyurular
            //duyurularıda ilk 5 tanesine göre getirsin idye göre
            SqlCommand cmdDuyuru = new SqlCommand("select top 5 * from Duyuru order by DuyuruId desc",baglan.baglan());
            SqlDataReader drDuyuru = cmdDuyuru.ExecuteReader();
            dlDuyuru.DataSource = drDuyuru;
            dlDuyuru.DataBind();
            //Kategoriler
            SqlCommand cmdKategori = new SqlCommand("select * from Kategori"+" order by[KategoriSira]",baglan.baglan());
            SqlDataReader drKategori = cmdKategori.ExecuteReader();
            dlKategori.DataSource = drKategori;
            dlKategori.DataBind();
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            Response.Redirect("AraDetay.aspx?ArananKelime="+txtAra.Text);
        }

        
    }
}
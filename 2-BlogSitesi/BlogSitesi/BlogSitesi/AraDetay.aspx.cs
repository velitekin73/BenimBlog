using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace BlogSitesi
{
    public partial class AraDetay : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string ArananKelime = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //sayfalar arasına bununla taşıyoruz
            ArananKelime = Request.QueryString["ArananKelime"];
            if (Page.IsPostBack==false)
            {
                //like ile arama yapıyoruz makale başlığına makaleozetine ve makaleiçeriğine göre ve % ile her yarde arasın
                SqlCommand cmdAra = new SqlCommand("SELECT dbo.Makale.MakaleBaslik, dbo.Makale.MakaleOzet,dbo.Makale.MakaleIcerik, dbo.Makale.MakaleTarih, dbo.Makale.MakaleOkunmaSayisi, dbo.Makale.MakaleYorumSayisi, dbo.Makale.MakaleId, dbo.Kategori.KategoriResim FROM dbo.Kategori INNER JOIN dbo.Makale ON dbo.Kategori.KategoriId = dbo.Makale.KategoriId where MakaleBaslik like '%" + ArananKelime + "%' or MakaleOzet like '%" + ArananKelime + "%' or MakaleIcerik like '%" + ArananKelime + "%'", baglan.baglan());

                SqlDataReader drAra = cmdAra.ExecuteReader();
                dlAra.DataSource = drAra;
                dlAra.DataBind();
            }
        }
    }
}
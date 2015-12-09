using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSitesi
{
    public partial class kategoriDetay : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string KategoriId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            KategoriId = Request.QueryString["KategoriId"];
            if (Page.IsPostBack==false)
            {
                SqlCommand cmkKategori = new SqlCommand("SELECT dbo.Makale.MakaleBaslik, dbo.Makale.MakaleOzet, dbo.Makale.MakaleTarih, dbo.Makale.MakaleOkunmaSayisi, dbo.Makale.MakaleYorumSayisi, dbo.Kategori.KategoriResim, dbo.Kategori.KategoriId, dbo.Makale.MakaleId FROM dbo.Kategori INNER JOIN dbo.Makale ON dbo.Kategori.KategoriId = dbo.Makale.KategoriId where dbo.Kategori.KategoriId='"+KategoriId+"'", baglan.baglan());
                SqlDataReader drKategori = cmkKategori.ExecuteReader();
                dlKategori.DataSource = drKategori;
                dlKategori.DataBind();

            }

        }
    }
}
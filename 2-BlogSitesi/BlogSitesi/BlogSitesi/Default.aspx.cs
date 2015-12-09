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
    public partial class Default : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        protected void Page_Load(object sender, EventArgs e)
        {
            //makale ıd ye göre sıralasın ve enson ekleneni ilk başa getirsin desc ile
            SqlCommand cmdMakale = new SqlCommand("SELECT dbo.Makale.MakaleBaslik, dbo.Makale.MakaleOzet, dbo.Makale.MakaleTarih, dbo.Makale.MakaleOkunmaSayisi, dbo.Makale.MakaleYorumSayisi, dbo.Makale.MakaleId, dbo.Kategori.KategoriResim FROM dbo.Kategori INNER JOIN dbo.Makale ON dbo.Kategori.KategoriId = dbo.Makale.KategoriId order by MakaleId desc", baglan.baglan());

            SqlDataReader drMakaleGetir = cmdMakale.ExecuteReader();
            dlMakale.DataSource = drMakaleGetir;
            dlMakale.DataBind();

        }
    }
}
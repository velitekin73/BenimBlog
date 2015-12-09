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
    public partial class duyuruGuncelle : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string DuyuruId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            DuyuruId = Request.QueryString["DuyuruId"];
            if (Page.IsPostBack==false)
            {
                SqlCommand cmdDGuncelle = new SqlCommand("select * from Duyuru where DuyuruId='" + DuyuruId + "'", baglan.baglan());
                SqlDataReader dr = cmdDGuncelle.ExecuteReader();

                //okuduğumuz bilgileri bir tabloya kaydedip ilk satırı okuyacağız
                DataTable dt = new DataTable("tablo");
                dt.Load(dr);

                DataRow row = dt.Rows[0];
                txtDuyuruBaslik.Text = row["DuyuruBaslik"].ToString();
                ckDuyuruIcerik.Text = row["DuyuruIcerik"].ToString();
                
            }
        }

        protected void btnDuyuruGuncelle_Click(object sender, EventArgs e)
        {
            SqlCommand cmdguncelle = new SqlCommand("update Duyuru set DuyuruBaslik='" + txtDuyuruBaslik.Text + "' , DuyuruIcerik='" + ckDuyuruIcerik.Text + "' where DuyuruId='" + DuyuruId + "' ", baglan.baglan());
            cmdguncelle.ExecuteNonQuery();
            Response.Redirect("duyurular.aspx");
        }
    }
}
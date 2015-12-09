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
    public partial class kategoriler : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi();
        string KategoriId = "";
        string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            KategoriId = Request.QueryString["KategoriId"];
            islem = Request.QueryString["islem"];

            if (islem=="sil")
            {
                SqlCommand cmdsil = new SqlCommand("delete from Kategori where KategoriId='"+KategoriId+"'",baglan.baglan());
                cmdsil.ExecuteNonQuery();
                

            }
            if (Page.IsPostBack==false)
            {
                //başlangıçta paneller görünmesin
                pnlKategoriEkle.Visible = false;
                pnlKategoriDuzenle.Visible = false;
            }
            //eğer datareader kullanırsak executereader kullanırız
            //ama sil ekle guncelle kullanırsak executenonquery kullanırız
            //kategorileri dataliste getirme
            SqlCommand cmd = new SqlCommand("select * from Kategori",baglan.baglan());
            SqlDataReader dr = cmd.ExecuteReader();
            dlKategoriGetir.DataSource = dr;
            dlKategoriGetir.DataBind();
        }

        protected void btnKategoriEkleArti_Click(object sender, EventArgs e)
        {
            //paneldeki + butonuna basınca panel açılsın
            pnlKategoriEkle.Visible = true;
        }

        protected void btnKategoriEkleEksi_Click(object sender, EventArgs e)
        {
            //e butonuna basınca da görünmesin
            pnlKategoriEkle.Visible = false;
        }

        protected void btnKategoriEkle_Click(object sender, EventArgs e)
        {
            if (fuResim.HasFile)//eğer  fileuploadın içinde resim varsa bunu bir yere kaydetsin
            {
                fuResim.SaveAs(Server.MapPath("/KategoriResim/" + fuResim.FileName));//kaydedeceğimizi yeri ve ismini ekledik
                //yani eklediğimiz resmi KategoriResmin içine resmin kendi adıyla birlikte kaydet demek

                SqlCommand cmd = new SqlCommand("insert into Kategori(KategoriAdi,KategoriSira,KategoriResim) values('"+txtKategoriAdi.Text+"','"+txtSira.Text+"','/KategoriResim/"+fuResim.FileName+"')", baglan.baglan());
                cmd.ExecuteNonQuery();
                Response.Redirect("kategoriler.aspx");

            }
            else
            {
                btnKategoriEkle.Text = "Resim Ekle!";//Resim Eklemezse Butonun ustune bu uyarıyı versin
            }
        }

        protected void btnKategoriDuzenleArti_Click(object sender, EventArgs e)
        {
            pnlKategoriDuzenle.Visible = true;
        }

        protected void btnKategoriDuzenleEksi_Click(object sender, EventArgs e)
        {
            pnlKategoriDuzenle.Visible = false;
        }
    }
}
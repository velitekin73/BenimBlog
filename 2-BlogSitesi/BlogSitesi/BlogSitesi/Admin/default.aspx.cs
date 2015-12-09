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
    public partial class _default : System.Web.UI.Page
    {
        esqlbaglantisi baglan = new esqlbaglantisi(); 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Yonetici where YoneticiKullanici='"+txtKullanici.Text+"' and YoneticiSifre='"+txtSifre.Text+"'",baglan.baglan());
            SqlDataReader dr = cmd.ExecuteReader();//okuyoruz
            if (dr.Read())
            {
                //sayfalar arasında gezerken şifre bilmeden giriş yapmasını engellemek için
                //session(oturum) kullanacağız
                //yani adam oturum açmadan mesajlarıma girmek istediğinde giremeyecek önce oturum açması lazım
                //işte burda onu session larla yapacağız
                Session["YoneticiKullanici"] = dr["YoneticiKullanici"];
                //session a bu bilgiyi aktardık ve artık istediğimiz sayfada kullanabiliriz
                Response.Redirect("duyurular.aspx");
            }
            else
            {
                lblBilgi.Text = "Hatalı Giriş Yaptınız!";
            }
        }
    }
}
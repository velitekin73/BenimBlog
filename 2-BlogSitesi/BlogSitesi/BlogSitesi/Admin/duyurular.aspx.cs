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
    public partial class duyurular : System.Web.UI.Page
    {


        esqlbaglantisi baglan = new esqlbaglantisi();
        string DuyuruId = "";
        string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YoneticiKullanici"] == null)//yani oturum açılmamışsa
            {
                Response.Redirect("default.aspx");//eğer oturum açmamışsa oturum açma sayfasına gönderelim
            }

            DuyuruId=Request.QueryString["DuyuruId"];
            islem=Request.QueryString["islem"];
            if (islem=="sil")
            {
                SqlCommand cmdsil = new SqlCommand("delete from Duyuru where DuyuruId='"+DuyuruId+"'",baglan.baglan());
                cmdsil.ExecuteNonQuery();
                /*şu şekilde de yapılabilir
                SqlCommand cmdsil = new SqlCommand("delete from Duyuru where DuyuruId="+DuyuruId,baglan.baglan());
                */                
               
                
            }
            if (Page.IsPostBack==false)
            {
                pnlDuyuruEkle.Visible = false;
                pnlDuyuruDuzenleme.Visible = false;
                //Duyuruları dataliste getirme
                SqlCommand cmdgetir = new SqlCommand("select * from Duyuru", baglan.baglan());
                SqlDataReader dr = cmdgetir.ExecuteReader();
                dlDuyuruDuzenleme.DataSource = dr;
                dlDuyuruDuzenleme.DataBind();
            }
            /* burda da yapılabilir
             //Duyuruları dataliste getirme
                SqlCommand cmdgetir = new SqlCommand("select * from Duyuru", baglan.baglan());
                SqlDataReader dr = cmdgetir.ExecuteReader();
                dlDuyuruDuzenleme.DataSource = dr;
                dlDuyuruDuzenleme.DataBind();
             */


        }

        protected void btnDuyuruEkleArti_Click(object sender, EventArgs e)
        {
            pnlDuyuruEkle.Visible = true;
        }

        protected void btnDuyuruEkleEksi_Click(object sender, EventArgs e)
        {
            pnlDuyuruEkle.Visible = false;
        }

        protected void btnDuyuruEkle_Click(object sender, EventArgs e)
        {
            SqlCommand cmdEkle = new SqlCommand("insert into Duyuru(DuyuruBaslik,DuyuruIcerik,DuyuruResim) values('" + txtDuyuruEkleBaslik.Text + "','" + ckDuyuruEkleicerik.Text + "','/Temalar/duyuru.png')", baglan.baglan());
            cmdEkle.ExecuteNonQuery();
            Response.Redirect("duyurular.aspx");
        }

        protected void btnDuyuruDuzenlemeArti_Click(object sender, EventArgs e)
        {
            pnlDuyuruDuzenleme.Visible = true;
        }

        protected void btnDuyuruDuzenlemeEksi_Click(object sender, EventArgs e)
        {
            pnlDuyuruDuzenleme.Visible = false;
        }     
        
            
        }
    }

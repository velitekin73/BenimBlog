using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace BlogSitesi
{
    public class esqlbaglantisi
    {
        public SqlConnection baglan()
        {
            SqlConnection baglanti = new SqlConnection("Data Source=.; Initial Catalog=BlogDB; Integrated Security=true;");
            baglanti.Open();

            SqlConnection.ClearPool(baglanti);//BAGlantı havuzlarını temizler
            SqlConnection.ClearAllPools();//tüm havuzu temizler hataları temizler

            return (baglanti);
        }
    }
}
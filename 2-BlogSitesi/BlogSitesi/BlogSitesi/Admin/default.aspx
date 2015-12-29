<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="BlogSitesi.Admin._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Sayfa Girişi</title>
    <style type="text/css">
        * {
            margin:0;
            padding:0;
            border:0;
        }
    </style>
</head>
<body style="background-color:#e1e1e1">
    <form id="form1" runat="server">
    <div style="height: 50px; background-color:#2a595c; color:#fff;">
    <div style="float: left; margin-top: 20px; width:300px;">Kullanıcı Adı: <asp:TextBox ID="txtKullanici" runat="server" Height="25px" Width="214px"></asp:TextBox></div>
    <div style="float: left; margin-top: 20px; width:220px;">Şifre: <asp:TextBox ID="txtSifre" runat="server" Height="25px" TextMode="Password" Width="170px"></asp:TextBox></div>
    <div style="float: left; margin-top: 20px; width:120px;"><asp:Button ID="btnGiris" runat="server" Text="Giris Yap" Height="25px" Width="80px" ForeColor="Red" OnClick="btnGiris_Click"/></div>
    <div style="float: right; margin-top: 20px; width:300px; text-align:right;">
        <asp:Label ID="lblBilgi" runat="server" ForeColor="White" Text="Yönetici Paneli"></asp:Label></div>
    </div>
    </form>
</body>
</html>

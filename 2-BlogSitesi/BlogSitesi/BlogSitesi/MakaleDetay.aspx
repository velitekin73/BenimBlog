<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.Master" AutoEventWireup="true" CodeBehind="MakaleDetay.aspx.cs" Inherits="BlogSitesi.MakaleDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 12px;
            height: 12px;
        }

        .auto-style3 {
            width: 12px;
            height: 12px;
        }

        .auto-style4 {
            width: 12px;
            height: 12px;
        }
        .auto-style5 {
            height: 29px;
            width: 324px;
        }
        .auto-style6 {
            width: 324px;
        }
        .auto-style7 {
            width: 324px;
            height: 27px;
        }
        .auto-style8 {
            width: 324px;
            height: 18px;
        }
        .auto-style9 {
            width: 324px;
            height: 14px;
        }
        .auto-style10 {
            width: 324px;
            height: 19px;
        }
        .auto-style11 {
            width: 12px;
            height: 12px;
        }
        .auto-style12 {
            width: 12px;
            height: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 690px; height: auto; margin: 0 auto;">
        <asp:DataList ID="dlMakale" runat="server" Width="690px">
            <ItemTemplate>
                <div style="width: 690px; margin: 0 auto; height: auto;">
                    <div style="width: 690px; height: 40px; float: left;">
                        <div style="width: 40px; height: 40px; float: left">
                            <asp:Image ID="Image3" runat="server" Height="40px" ImageUrl='<%# Eval("KategoriResim") %>' Width="40px" />
                        </div>
                        <div style="width: 650px; height: 40px; float: left; background-image: url('Temalar/makalebaslik.png'); background-repeat: repeat-x; line-height: 40px;">
                            <asp:Label ID="Label1" runat="server" Font-Size="20px" Text='<%# Eval("MakaleBaslik") %>' ForeColor="#484848"></asp:Label>
                        </div>
                    </div>
                    <div style="float: left; height: auto; width: 690px; background-image: url('Temalar/ozetarka.png'); background-repeat: inherit; padding-bottom: 10px;">

                        <asp:Label ID="Label5" runat="server" Font-Size="18px" Text='<%# Eval("MakaleIcerik") %>' ForeColor="#4D4D4D"></asp:Label>

                    </div>
                    <div style="width: 690px; height: 20px; line-height: 20px; font-size: 12px; float: left; background-image: url('Temalar/makalegri.png'); background-repeat: inherit;">
                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            &nbsp;<img alt="" width="12" height="12" class="auto-style11" src="Temalar/saat.png" /><asp:Label ID="Label2" runat="server" Text='<%# Eval("MakaleTarih","{0:dd MMMM yyyy}") %>' ForeColor="#666666"></asp:Label>
                        </div>
                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            &nbsp;<img alt="" width="12" height="12" class="auto-style12" src="Temalar/goz.png" /><asp:Label ID="Label3" runat="server" Text='<%# Eval("MakaleOkunmaSayisi") %>' ForeColor="#666666"></asp:Label>
                        </div>
                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            &nbsp;<img alt="" width="12" height="12" class="auto-style11" src="Temalar/yorum.png" /><asp:Label ID="Label4" runat="server" Text='<%# Eval("MakaleYorumSayisi") %>' ForeColor="#666666"></asp:Label>
                        </div>
                    </div>
                    <div style="width: 100%; height: 40px; float: left; background-color: #e6e6e6;"></div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div style="height: 30px; width: 100%;"></div>
    <div style="background-color: #658A8D; color: #fff; height: 30px; width: 100%; text-align: center; font-size: 24px; font-weight: bolder;">Makaleye Yapılan Yorumlar</div>
        <div style="height: 10px; width: 100%;"></div>
    
    <div style="width:690px; height:auto;margin:0 auto;">
        <asp:DataList ID="dlYorumGetir" runat="server">
            <ItemTemplate>
                <div style="width: 690px; height: auto; float: left; ">
                    <div style="float: left; width: 50px; height: 60px; border: 1px dotted #658A8D">
                        <asp:Image ID="Image4" runat="server" Height="60px" ImageUrl='<%# Eval("YorumResim") %>' Width="50px" />
                    </div>
                    <div style="float: left; width: 630px; height: auto">
                        <div style="float: left; width: 630px; height: 25px">
                            &nbsp;
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("YorumAdSoyad") %>' Font-Size="18px" ForeColor="#333333"></asp:Label> - <asp:Label ID="Label7" runat="server" Text='<%# Eval("YorumTarih","{0:dd MMMM yyyy}") %>' Font-Size="12px" ForeColor="#999999"></asp:Label>
                        </div>
                        <div style="float:left;width:630px;height:auto;">
                            &nbsp;
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("YorumIcerik") %>' ForeColor="Gray"></asp:Label>
                        </div>
                    </div>
                </div>
                <div style="float: left; width: 690px; height: 20px">
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div style="height: 30px; width: 100%;"></div>
    <div style="background-color: #658A8D; color: #fff; height: 30px; width: 100%; text-align: center; font-size: 24px; font-weight: bolder;">Yorum Yap</div>
    <div style="height: 10px; width: 100%;"></div>
    <div style="height: 200px">



        <div style="width: 340px; height: 200px; float: left; border: 1px dotted #658A8D; margin-left: 5px;">
            <asp:TextBox ID="txtYorum" runat="server" Height="200px" placeHolder="Buraya Yorumunuzu Giriniz." TextMode="MultiLine" Width="330px"></asp:TextBox>
        </div>
        <div style="float: right; width: 330px; height: 200px; border: 1px dotted #658A8D; margin-right: 5px;">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5" style="text-align: center">
                        <asp:TextBox ID="txtAdSoyad" runat="server" placeHolder="Adınız Soyadınız" CssClass="textboxGorsel" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" style="text-align: center">
                        <asp:TextBox ID="txtEmail" runat="server" placeHolder="E-mail Adresiniz" CssClass="textboxGorsel" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" style="text-align: center">
                        <asp:Button ID="btnYorum" runat="server"  CssClass="butonGorsel" Text="Gönder" OnClick="btnYorum_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10" style="text-align: center">
                        <asp:Label ID="lblBilgi" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" style="text-align: center">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYorum" ForeColor="#990000">Yorum Yazınız!!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: center">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAdSoyad" ForeColor="#990000">Adınız Soyadınız!!</asp:RequiredFieldValidator>
&nbsp;
                        </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: center">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ForeColor="#990000">E-mail Adresiniz!!</asp:RequiredFieldValidator>
&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ForeColor="#990000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Hatalı E-mail!!</asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </div>

        
    </div>
<div style="height: 10px; width: 100%;"></div>
</asp:Content>

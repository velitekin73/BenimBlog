<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="BlogSitesi.Iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height:21px;
        }
        .auto-style4 {
            width: 42px;
        }
        .auto-style5 {
            width: 24px;
        }
        .auto-style6 {
            width: 24px;
            height: 24px;
        }
        .auto-style7 {
            width: 213px;
        }
        .auto-style8 {
            width: 206px;
        }
        .auto-style9 {
            width: 202px;
        }
        .auto-style10 {
            width: 201px;
        }
        .auto-style11 {
            width: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="height:auto;width:100%;float:left; color: #666666;">
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;
                    <img alt="" class="auto-style6" src="Temalar/facebook.png" /></td>
                <td>facebook.com/welitekin73</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;
                    <img alt="" class="auto-style6" src="Temalar/twitter.png" /></td>
                <td>twitter.com/velitekin73</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;
                    <img alt="" class="auto-style6" src="Temalar/gmail.png" /></td>
                <td>welitekin73@gmail.com</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;
                    <img alt="" class="auto-style6" src="Temalar/mail.png" /></td>
                <td>veli_tekin73@hotmail.com</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    
    <div style="height:40px;width:100%;float:left; font-weight: bolder; color: #666666;">&nbsp;&nbsp; Mesajınızı Alttaki Panelden Gönderebilirsiniz.</div> 
    
    <div style="height: 200px">


        <div style="width: 340px; height: 200px; float: left; border: 1px dotted #2a595c; margin-left: 5px;">
            <asp:TextBox ID="txtMesaj" runat="server" Height="200px" placeHolder="Buraya Mesajınızı Yazınız." TextMode="MultiLine" Width="330px"></asp:TextBox>
        </div>
        <div style="float: right; width: 330px; height: 200px; border: 1px dotted #2a595c; margin-right: 5px;">
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
                        <asp:Button ID="btnYorum" runat="server"  CssClass="butonGorsel" Text="Gönder" OnClick="btnYorum_Click"  />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10" style="text-align: center">
                        <asp:Label ID="lblBilgi" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" style="text-align: center">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMesaj" ForeColor="#990000">Yorum Yazınız!!</asp:RequiredFieldValidator>
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

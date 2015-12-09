<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="makaleGuncelle.aspx.cs" Inherits="BlogSitesi.Admin.makaleGuncelle" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 198px;
        }
        .auto-style3 {
            width: 198px;
            height: 27px;
        }
        .auto-style4 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1" style="background-color: #669999; color: #FFFFFF;">
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;Başlık:</td>
            <td>
                <asp:TextBox ID="txtBaslik" runat="server" CssClass="textboxGorsel" Width="470px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Özet:</td>
            <td>
                <asp:TextBox ID="txtOzet" runat="server" CssClass="textboxGorsel" Height="100px" TextMode="MultiLine" Width="470px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">İçerik:</td>
            <td>
                <CKEditor:CKEditorControl ID="ckicerik" BasePath="/ckeditor/" runat="server" Width="470px" ></CKEditor:CKEditorControl></td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Slider:</td>
            <td class="auto-style4">
                <asp:FileUpload ID="fuSlider" runat="server" Width="470px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Yorum Sayısı:</td>
            <td>
                <asp:TextBox ID="txtYorum" runat="server" CssClass="textboxGorsel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>
                <asp:Button ID="btnMakaleGuncelle" runat="server" CssClass="butonGorsel" Text="Güncelle" OnClick="btnMakaleGuncelle_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="duyuruGuncelle.aspx.cs" Inherits="BlogSitesi.Admin.duyuruGuncelle" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 198px;
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
            <td class="auto-style2" style="text-align: right">Başlık yaz</td>
            <td>
                <asp:TextBox ID="txtDuyuruBaslik" runat="server" CssClass="textboxGorsel" Width="420px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">İçerik yaz:</td>
            <td>
                 <CKEditor:CKEditorControl ID="ckDuyuruIcerik" BasePath="/ckeditor/" runat="server" Width="420px" ></CKEditor:CKEditorControl> </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>
                <asp:Button ID="btnDuyuruGuncelle" runat="server" CssClass="butonGorsel" Text="Update" OnClick="btnDuyuruGuncelle_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

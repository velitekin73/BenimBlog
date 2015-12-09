<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="makaleler.aspx.cs" Inherits="BlogSitesi.Admin.makaleler" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style3 {
            width: 129px;
        }

        .auto-style4 {
            width: 500px;
            height: 37px;
        }

        .auto-style5 {
            width: 83px;
        }

        .auto-style6 {
            width: 50px;
            height: 32px;
        }

        .auto-style7 {
            height: 37px;
        }

        .auto-style8 {
            height: 37px;
            width: 96px;
        }
        .auto-style9 {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder;">
            &nbsp;
            <asp:Button ID="btnMakaleEkleArti" runat="server" Height="25px" OnClick="btnMakaleEkleArti_Click" Text="+" Width="20px" />
            &nbsp;
            <asp:Button ID="btnMakaleEkleEksi" runat="server" Height="25px" OnClick="btnMakaleEkleEksi_Click" Text="-" Width="20px" />
            &nbsp; Makale Ekleme Paneli
        </div>
        <asp:Panel ID="pnlMakaleEkle" runat="server" BackColor="#669999" ForeColor="White">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">Kategori:</td>
                    <td>
                        <asp:DropDownList ID="ddlKategori" runat="server" AutoPostBack="True" CssClass="dropdownlistGorsel">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">Başlık:</td>
                    <td>
                        <asp:TextBox ID="txtBaslik" runat="server" CssClass="textboxGorsel" Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">Özet:</td>
                    <td>
                        <asp:TextBox ID="txtOzet" runat="server" CssClass="textboxGorsel" Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">İçerik:</td>
                    <td>
                        <CKEditor:CKEditorControl ID="ckicerik" BasePath="/ckeditor/" runat="server" Width="500px"></CKEditor:CKEditorControl></td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">Slider:</td>
                    <td>
                        <asp:FileUpload ID="fuResim" runat="server" CssClass="textboxGorsel" Width="500px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnMakaleEkle" runat="server" CssClass="butonGorsel" Text="Ekle" OnClick="btnMakaleEkle_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <div style="height: 30px;"></div>
        <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder;">
            &nbsp;
            <asp:Button ID="btnMakaleDuzenlemeArti" runat="server" Height="25px" OnClick="btnMakaleDuzenlemeArti_Click" Text="+" Width="20px" />
            &nbsp;
            <asp:Button ID="btnMakaleDuzenlemeEksi" runat="server" Height="25px" OnClick="btnMakaleDuzenlemeEksi_Click" Text="-" Width="20px" />
            &nbsp; Makale Düzenleme Paneli
        </div>
        <asp:Panel ID="pnlMakaleDuzenle" runat="server" BackColor="#669999" ForeColor="White">
            <asp:DataList ID="dlmakalegetir" runat="server" Width="699px">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4">MAKALE ADI</td>
                            <td class="auto-style5">GÜNCELLE</td>
                            <td>SİL</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4">
                                <asp:Literal ID="ltrlMakaleBaslik" runat="server" Text='<%# Eval("MakaleBaslik") %>'></asp:Literal>
                            </td>
                            <td class="auto-style8">
                                <a href="makaleGuncelle.aspx?MakaleId=<%#Eval("MakaleId") %>">
                                    <img alt="" class="auto-style6" src="../Temalar/duzenle.png" /></a>
                            </td>
                            <td class="auto-style7">
                                <a href="makaleler.aspx?MakaleId=<%#Eval("MakaleId") %>&islem=sil">
                                    <img alt="" class="auto-style6" src="../Temalar/sil.png" /></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
        <div style="height: 30px;"></div>
        <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder;">
            &nbsp;
            <asp:Button ID="btnMakaleDosyaArti" runat="server" Height="25px" OnClick="btnMakaleDosyaArti_Click" Text="+" Width="20px" />
            &nbsp;
            <asp:Button ID="btnMakaleDosyaEksi" runat="server" Height="25px" OnClick="btnMakaleDosyaEksi_Click" Text="-" Width="20px" />
            &nbsp; Makale Dosya Ekleme Paneli
        </div>
        <asp:Panel ID="pnlMakaleDosya" runat="server" BackColor="#669999" ForeColor="White">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style9" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: right">Dosya Seç:</td>
                    <td>
                        <asp:FileUpload ID="fuDosya" runat="server" CssClass="textboxGorsel" Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnMakaleDosyaEkle" runat="server" CssClass="butonGorsel" OnClick="btnMakaleDosyaEkle_Click" Text="Ekle" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: right">NOT:</td>
                    <td>Ekleme işlemi /Dosyalar/ eklenen dosya.uzantı şeklinde kullanılacak</td>
                </tr>
            </table>
        </asp:Panel>
        <div style="height: 30px;"></div>
    </div>
</asp:Content>

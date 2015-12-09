<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="duyurular.aspx.cs" Inherits="BlogSitesi.Admin.duyurular" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 194px;
        }
        .auto-style3 {
            width: 480px;
        }
        .auto-style4 {
            width: 101px;
        }
        .auto-style5 {
            width: 50px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder;">
            &nbsp;
            <asp:Button ID="btnDuyuruEkleArti" runat="server" Height="25px" OnClick="btnDuyuruEkleArti_Click" Text="+" Width="20px" />
            &nbsp;
            <asp:Button ID="btnDuyuruEkleEksi" runat="server" Height="25px" OnClick="btnDuyuruEkleEksi_Click" Text="-" Width="20px" />
            &nbsp; Duyuru Ekleme Paneli
        </div>
        <asp:Panel ID="pnlDuyuruEkle" runat="server" BackColor="#669999" ForeColor="White">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Başlık:</td>
                    <td>
                        <asp:TextBox ID="txtDuyuruEkleBaslik" runat="server" CssClass="textboxGorsel" Width="420px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">İçerik:</td>
                    <td><CKEditor:CKEditorControl ID="ckDuyuruEkleicerik" BasePath="/ckeditor/" runat="server" Width="420px" ></CKEditor:CKEditorControl> </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>
                        
                        <asp:Button ID="btnDuyuruEkle" runat="server" Text="Ekle" CssClass="butonGorsel" OnClick="btnDuyuruEkle_Click"  />
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            </asp:Panel>
        <div style="height:30px;"></div>
        <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder;">
            &nbsp;
            <asp:Button ID="btnDuyuruDuzenlemeArti" runat="server" Height="25px" OnClick="btnDuyuruDuzenlemeArti_Click" Text="+" Width="20px" />
            &nbsp;
            <asp:Button ID="btnDuyuruDuzenlemeEksi" runat="server" Height="25px" OnClick="btnDuyuruDuzenlemeEksi_Click" Text="-" Width="20px" />
            &nbsp; Duyuru Düzenleme Paneli
        </div>
        <asp:Panel ID="pnlDuyuruDuzenleme" runat="server" BackColor="#669999" ForeColor="White">
            <asp:DataList ID="dlDuyuruDuzenleme" runat="server">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style3">DUYURU BAŞLIK</td>
                            <td class="auto-style4">GÜNCELLE</td>
                            <td>SİL</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style3">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("DuyuruBaslik") %>'></asp:Literal>
                            </td>
                            <td class="auto-style4">
                                <a href="duyuruGuncelle.aspx?DuyuruId=<%#Eval("DuyuruId") %>"><img alt="" class="auto-style5" src="../Temalar/duzenle.png" /></a>
                            </td>
                            <td>
                                <a href="duyurular.aspx?DuyuruId=<%#Eval("DuyuruId") %>&islem=sil"><img alt="" class="auto-style5" src="../Temalar/sil.png" /></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            </asp:Panel>
    </div>
</asp:Content>

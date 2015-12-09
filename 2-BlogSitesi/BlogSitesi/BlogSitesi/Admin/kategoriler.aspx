<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="BlogSitesi.Admin.kategoriler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 201px;
        }
        .auto-style7 {
            height: 27px;
            width: 109px;
        }
        .auto-style8 {
            width: 471px;
        }
        .auto-style9 {
            width: 50px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height:25px; background-color:#2c595c; color:#fff; font-weight:bolder;">&nbsp;
            <asp:Button ID="btnKategoriEkleArti" runat="server" Height="25px" OnClick="btnKategoriEkleArti_Click" Text="+" Width="20px" />
&nbsp;
            <asp:Button ID="btnKategoriEkleEksi" runat="server" Height="25px" OnClick="btnKategoriEkleEksi_Click" Text="-" Width="20px" />
&nbsp; Kategori Ekleme Paneli</div>
        <asp:Panel ID="pnlKategoriEkle" runat="server" BackColor="#669999" ForeColor="White">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Kategori Adı:</td>
                    <td>
                        <asp:TextBox ID="txtKategoriAdi" runat="server" CssClass="textboxGorsel"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Sıra:</td>
                    <td>
                        <asp:TextBox ID="txtSira" runat="server" CssClass="textboxGorsel"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Resmi:</td>
                    <td>
                        <asp:FileUpload ID="fuResim" runat="server" CssClass="textboxGorsel" Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnKategoriEkle" runat="server" CssClass="butonGorsel" OnClick="btnKategoriEkle_Click" Text="Ekle" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <div style="height:30px;"></div>
        <div style="height:25px; background-color:#2c595c; color:#fff; font-weight:bolder;">&nbsp;
            <asp:Button ID="btnKategoriDuzenleArti" runat="server" Height="25px"  Text="+" Width="20px" OnClick="btnKategoriDuzenleArti_Click" />
&nbsp;
            <asp:Button ID="btnKategoriDuzenleEksi" runat="server" Height="25px"  Text="-" Width="20px" OnClick="btnKategoriDuzenleEksi_Click" />
&nbsp; Kategori Düzenleme Paneli</div>
        <asp:Panel ID="pnlKategoriDuzenle" runat="server" BackColor="#669999" ForeColor="White">
            <asp:DataList ID="dlKategoriGetir" runat="server" Width="700px">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style8">KATEGORİ ADI</td>
                            <td class="auto-style7">GÜNCELLE</td>
                            <td>SİL</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style8">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("KategoriAdi") %>'></asp:Literal>
                            </td>
                            <td class="auto-style7">
                               <a href="kategoriGuncelle.aspx?KategoriId=<%# Eval("KategoriId") %>"> <img alt="" class="auto-style9" src="../Temalar/duzenle.png" /></a>
                            </td>
                            <td> 
                                <a href="kategoriler.aspx?KategoriId=<%# Eval("KategoriId") %>&islem=sil"><img alt="" class="auto-style9" src="../Temalar/sil.png" /></a>
                            </td>  
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            </asp:Panel>
        <div style="height:30px;"></div>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.Master" AutoEventWireup="true" CodeBehind="KategoriDetay.aspx.cs" Inherits="BlogSitesi.kategoriDetay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 12px;
            height: 12px;
        }
        .auto-style3 {
            width: 12px;
            height: 6px;
        }
        .auto-style4 {
            width: 12px;
            height: 12px;
        }
        .auto-style6 {
            width: 12px;
            height: 12px;
        }
        .auto-style7 {
            width: 12px;
            height: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:690px;height:auto;margin:0 auto;">
        <asp:DataList ID="dlKategori" runat="server" Width="690px">
            <ItemTemplate>
                <div style="width:690px; margin:0 auto;height:auto;">
                    <div style="width: 690px; height: 40px; float: left;">
                        <div style="width: 40px; height: 40px; float: left">
                            <asp:Image ID="Image3" runat="server" Height="40px" ImageUrl='<%# Eval("KategoriResim") %>' Width="40px" />
                        </div>
                        <div style="width: 650px; height: 40px; float: left; background-image: url('Temalar/makalebaslik.png'); background-repeat: repeat-x; line-height: 40px;">
                           <a href="MakaleDetay.aspx?MakaleId=<%#Eval("MakaleId") %>"> <asp:Label ID="Label1" runat="server" Font-Size="20px" Text='<%# Eval("MakaleBaslik") %>' ForeColor="#484848"></asp:Label></a>
                        </div>
                    </div>
                    <div style="float:left;height:auto;width:690px; background-image: url('Temalar/ozetarka.png'); background-repeat: inherit; padding-bottom: 10px;">

                        <asp:Label ID="Label5" runat="server" Font-Size="18px" Text='<%# Eval("MakaleOzet") %>' ForeColor="#4D4D4D"></asp:Label>

                    </div>
                    <div style="width:690px;height:20px;line-height:20px;font-size:12px; float:left; background-image: url('Temalar/makalegri.png'); background-repeat: inherit;">
                        <div style="width:auto;height:20px;float:left;margin-right:15px;">
                            &nbsp;<img alt="" width="12" height="12" class="auto-style6" src="Temalar/saat.png" /><asp:Label ID="Label2" runat="server" Text='<%# Eval("MakaleTarih","{0:dd MMMM yyyy}") %>' ForeColor="#666666"></asp:Label>
                        </div>
                        <div style="width:auto;height:20px;float:left;margin-right:15px;">
                            &nbsp;<img alt="" width="12" height="12" class="auto-style7" src="Temalar/goz.png" /><asp:Label ID="Label3" runat="server" Text='<%# Eval("MakaleOkunmaSayisi") %>' ForeColor="#666666"></asp:Label>
                        </div>
                        <div style="width:auto;height:20px;float:left;margin-right:15px;">
                            &nbsp;<img alt="" width="12" height="12" class="auto-style6" src="Temalar/yorum.png" /><asp:Label ID="Label4" runat="server" Text='<%# Eval("MakaleYorumSayisi") %>' ForeColor="#666666"></asp:Label>
                        </div>
                    </div>
                    <div style="width:100%;height:40px;float:left; background-color: #e6e6e6;"></div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="yorumlar.aspx.cs" Inherits="BlogSitesi.Admin.yorumlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 434px;
            height: 30px;
        }

        .auto-style3 {
            width: 24px;
            height: 23px;
        }

        .auto-style4 {
            width: 24px;
            height: 24px;
        }

        .auto-style5 {
            width: 24px;
            height: 24px;
        }
        .auto-style6 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder; line-height: 25px;">
            &nbsp;
            <asp:Button ID="btnOnaysizYorumEkleArti" runat="server" Height="25px" OnClick="btnOnaysizYorumEkleArti_Click" Text="+" Width="20px" />
            &nbsp;
            <asp:Button ID="btnOnaysizYorumEkleEksi" runat="server" Height="25px" OnClick="btnOnaysizYorumEkleEksi_Click" Text="-" Width="20px" />
            &nbsp; Onaysız Yorum Paneli
        </div>
        <asp:Panel ID="pnlOnaysizYorum" runat="server" ForeColor="White">
            <asp:DataList ID="dlOnaysizYorum" runat="server" Width="700px">
                <ItemTemplate>
                    <div style="width: 690px; height: auto">
                        <div style="width: 100px; height: 60px; float: left">
                            <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl='<%# Eval("YorumResim") %>' Width="60px" />
                        </div>
                        <div style="width: 590px; height: auto; float: left">
                            <div style="float: left; width: 590px; height: 25px; background-color: #669999; color: #FFFFFF;">
                                <asp:Label ID="Label1" runat="server" Font-Size="18pt" Text='<%# Eval("YorumAdSoyad") %>' ForeColor="White"></asp:Label>
                                &nbsp;-
                            <asp:Label ID="Label2" runat="server" Font-Size="12px" Text='<%# Eval("YorumEmail") %>' ForeColor="White"></asp:Label>
                                &nbsp;-
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("YorumTarih","{0:dd MMMM yyyy}") %>' Font-Size="12px" ForeColor="White"></asp:Label>
                            </div>
                            <div style="width: 590px; height: 25px; float: left; color: #EFEFEF; background-color: #8ab0b0;">
                                Makale:&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Eval("MakaleBaslik") %>' ForeColor="White"></asp:Label>
                            </div>
                            <div style="width: 590px; height: auto; float: left; background-color: #b3cccc;">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("YorumIcerik") %>' ForeColor="#666666"></asp:Label>
                            </div>
                            <div style="width: 590px; height: 25px; float: left;">
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style2" style="text-align: right">
                                            <a href="yorumGuncelle.aspx?YorumId=<%#Eval("YorumId") %>&MakaleId=<%#Eval("MakaleId") %>"><img alt="" class="auto-style3" src="../Temalar/duzenle.png" /></a>
                                        </td>
                                        <td style="text-align: right" class="auto-style6">
                                            <a href="yorumlar.aspx?YorumId=<%#Eval("YorumId") %>&islem=sil"><img alt="" class="auto-style4" src="../Temalar/sil.png" /></a>
                                        </td>
                                        <td style="text-align: right" class="auto-style6">
                                            <a href="yorumCevap.aspx?MakaleId=<%#Eval("MakaleId") %>"><img alt="" class="auto-style5" src="../Temalar/cevap.png" /></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div style="height: 30px; width: 690px;"></div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
        </div>
        <div style="height:30px;"></div>
        <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder; line-height: 25px;">
            &nbsp;
            <asp:Button ID="btnOnayliEkleArti" runat="server" Height="25px" OnClick="btnOnayliYorumEkleArti_Click" Text="+" Width="20px" />
            &nbsp;
            <asp:Button ID="btnOnayliEkleEksi" runat="server" Height="25px" OnClick="btnOnayliYorumEkleEksi_Click" Text="-" Width="20px" />
            &nbsp; Onaylanan Yorum Paneli
        </div>
        <asp:Panel ID="pnlOnayliYorum" runat="server" ForeColor="White">
            <asp:DataList ID="dlOnayliYorum" runat="server" Width="700px">
                <ItemTemplate>
                    <div style="width: 690px; height: auto">
                        <div style="width: 100px; height: 60px; float: left">
                            <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl='<%# Eval("YorumResim") %>' Width="60px" />
                        </div>
                        <div style="width: 590px; height: auto; float: left">
                            <div style="float: left; width: 590px; height: 25px; background-color: #669999; color: #FFFFFF;">
                                <asp:Label ID="Label1" runat="server" Font-Size="18pt" Text='<%# Eval("YorumAdSoyad") %>' ForeColor="White"></asp:Label>
                                &nbsp;-
                            <asp:Label ID="Label2" runat="server" Font-Size="12px" Text='<%# Eval("YorumEmail") %>' ForeColor="White"></asp:Label>
                                &nbsp;-
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("YorumTarih","{0:dd MMMM yyyy}") %>' Font-Size="12px" ForeColor="White"></asp:Label>
                            </div>
                            <div style="width: 590px; height: 25px; float: left; color: #EFEFEF; background-color: #8ab0b0;">
                                Makale:&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Eval("MakaleBaslik") %>' ForeColor="White"></asp:Label>
                            </div>
                            <div style="width: 590px; height: auto; float: left; background-color: #b3cccc;">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("YorumIcerik") %>' ForeColor="#666666"></asp:Label>
                            </div>
                            <div style="width: 590px; height: 25px; float: left;">
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style2" style="text-align: right">
                                            &nbsp;</td>
                                        <td style="text-align: right" class="auto-style6">
                                            &nbsp;</td>
                                        <td style="text-align: right" class="auto-style6">
                                            <a href="yorumlar.aspx?YorumId=<%#Eval("YorumId") %>&islemiki=siliki&MakaleId=<%#Eval("MakaleId") %>" /><img alt="" class="auto-style4" src="../Temalar/sil.png" /></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div style="height: 30px; width: 690px;"></div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
    <div style="height:30px;"></div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="mesajlar.aspx.cs" Inherits="BlogSitesi.Admin.mesajlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 24px;
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 25px; background-color: #2c595c; color: #fff; font-weight: bolder;">
            &nbsp;
            <asp:Button ID="btnMesajEkleArti" runat="server" Height="25px"  Text="+" Width="20px" OnClick="btnMesajEkleArti_Click" />
            &nbsp;
            <asp:Button ID="btnMesajEkleEksi" runat="server" Height="25px"  Text="-" Width="20px" OnClick="btnMesajEkleEksi_Click" />
            &nbsp; Mesaj Paneli
        </div>
        <asp:Panel ID="pnlMesajEkle" runat="server" BackColor="#669999" ForeColor="White">
            <asp:DataList ID="dlMesaj" runat="server" Width="700px">

                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td style="width: 200px">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18px" ForeColor="Yellow" Text='<%# Eval("IletisimAdSoyad") %>'></asp:Label>
                            </td>
                            <td style="width: 200px">
                                <asp:Label ID="Label2" runat="server" Font-Size="12px" Text='<%# Eval("IletisimEmail") %>'></asp:Label>
                            </td>
                            <td style="width: 200px">
                                <asp:Label ID="Label3" runat="server" Font-Size="12px" Text='<%# Eval("IletisimTarih","{0:dd MMMM yyyy}") %>'></asp:Label>
                            </td>
                            <td style="width: 100px; text-align: right;">
                                <a href="mesajlar.aspx?IletisimId=<%#Eval("IletisimId") %>&islem=sil"><img alt="" class="auto-style2" src="../Temalar/sil.png" /></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("IletisimIcerik") %>'></asp:Label>
                                &nbsp; </td>
                        </tr>
                        <tr>
                            <td colspan="4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4">&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>

            </asp:DataList>
            </asp:Panel>
     <div style="height:30px;"></div>
</asp:Content>

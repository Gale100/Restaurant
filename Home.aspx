<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <p>
    Hello Welcome to Gale&#39;s Restaurant. Here are your Favourite and our famous meals for you.</p>
<p>
    <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="XmlDataSource1" Height="500px" Width="800px"  />
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/adsPage.xml"></asp:XmlDataSource>
</p>
</asp:Content>



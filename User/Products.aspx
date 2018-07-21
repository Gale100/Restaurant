<%@ Page Title="Products Page" Language="C#" Theme="GaleTheme" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="User_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 104px;
        }
        .auto-style4 {
            height: 104px;
            width: 93px;
        }
        .auto-style5 {
            width: 93px;
        }
        .auto-style6 {
            height: 104px;
            width: 109px;
        }
        .auto-style7 {
            width: 109px;
        }
        .auto-style8 {
            height: 104px;
            width: 107px;
        }
        .auto-style9 {
            width: 107px;
        }
        .auto-style11 {
            width: 125px;
            height: 23px;
        }
        .auto-style12 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style4">
                <asp:Image ID="Chicken" runat="server" AlternateText="Chicken Mandi" Height="100px" ImageUrl="~/Images/chicken.jpg" Width="100px" />
            </td>
            <td class="auto-style6">
                <br />
                Chicken Mandi<br />
                Price : $15<br />
                <br />
                <asp:DropDownList ID="ddChknQuantity" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
            <td class="auto-style8">
                <asp:Image ID="Veg" runat="server" AlternateText="Veg Mandi" Height="100px" ImageUrl="~/Images/veg.jpg" Width="100px" />
            </td>
            <td class="auto-style3">Veg Mandi<br />
                Price : $12<br />
                <br />
                <asp:DropDownList ID="ddVegQuantity" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Image ID="Fish" runat="server" AlternateText="Fish Mandi" Height="100px" ImageUrl="~/Images/fish.jpg" Width="100px" />
            </td>
            <td class="auto-style7">Fish Mandi<br />
                Price : $18<br />
                <br />
                <asp:DropDownList ID="ddFishQuantity" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style9">
                <asp:Image ID="Meat" runat="server" AlternateText="Meat Mandi" Height="100px" ImageUrl="~/Images/meat.jpg" Width="100px" />
            </td>
            <td>Meat Mandi<br />
                Price : $25<br />
                <br />
                <asp:DropDownList ID="ddMeatQuantity" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Button ID="btnAddCart" runat="server" OnClick="btnAddCart_Click" Text="Add to Cart" SkinID="btnskin" />
            </td>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style9">
                <asp:Button ID="btnOrder" runat="server" OnClick="btnOrder_Click" Text="Place Order" SkinID="btnskin" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5"><strong>Edit Cart:</strong></td>
            <td class="auto-style7">
                <asp:DropDownList ID="ddEditCart" runat="server">
                    <asp:ListItem>chicken</asp:ListItem>
                    <asp:ListItem>veg</asp:ListItem>
                    <asp:ListItem>fish</asp:ListItem>
                    <asp:ListItem>meat</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtEditCart" runat="server" placeholder="Please Enter a Number"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit Cart" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style7">
                <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:RangeValidator ID="rangevld" runat="server" ControlToValidate="txtEditCart" ErrorMessage="Enter a value between 0 and 10" MaximumValue="10" MinimumValue="0" Type="Integer" ForeColor="Red"></asp:RangeValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="lblEdited" runat="server" ForeColor="Lime"></asp:Label>
    <br />
    <table class="auto-style2">
        <tr>
            <td class="auto-style11"><strong>Cart Contents:</strong></td>
            <td class="auto-style12">
                <asp:Label ID="lblContents" runat="server" SkinID="lblskin"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"><strong>Total Charge:</strong></td>
            <td class="auto-style12">
                <asp:Label ID="lblOutput" runat="server" SkinID="lblskin"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>


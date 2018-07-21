<%@ Page Title="Payments Page" Language="C#" Theme="GaleTheme" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payments.aspx.cs" Inherits="User_Payments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 160px;
        }
        .auto-style4 {
            width: 189px;
        }
        .auto-style5 {
            width: 160px;
            height: 52px;
        }
        .auto-style6 {
            width: 189px;
            height: 52px;
        }
        .auto-style7 {
            height: 52px;
        }
        .auto-style8 {
            width: 160px;
            height: 61px;
        }
        .auto-style9 {
            width: 189px;
            height: 61px;
        }
        .auto-style10 {
            height: 61px;
        }
        .auto-style11 {
            width: 160px;
            height: 26px;
        }
        .auto-style12 {
            width: 189px;
            height: 26px;
        }
        .auto-style13 {
            height: 26px;
        }
        .auto-style14 {
            width: 155px;
        }
        .auto-style15 {
            height: 26px;
            width: 155px;
        }
        .auto-style16 {
            height: 61px;
            width: 155px;
        }
        .auto-style17 {
            height: 52px;
            width: 155px;
        }
        .auto-style18 {
            width: 111px;
        }
        .auto-style19 {
            height: 26px;
            width: 111px;
        }
        .auto-style20 {
            height: 61px;
            width: 111px;
        }
        .auto-style21 {
            height: 52px;
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Please Proceed and Fill in the details to Confirm Your Order!!!</p>
    <p>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">Name:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">Email Address:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:RegularExpressionValidator ID="rgvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Order Type:</td>
                <td class="auto-style4">
                    <asp:RadioButtonList ID="radOrderType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="radOrderType_SelectedIndexChanged">
                        <asp:ListItem>Pick Up</asp:ListItem>
                        <asp:ListItem>Delivery</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style14">
                    <asp:Label ID="lblOrderType" runat="server" SkinID="lblskin"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvOrderType" runat="server" ControlToValidate="radOrderType" ErrorMessage="*Required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Delivery Address:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtDelAddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Delivery Date:</td>
                <td class="auto-style4">
                    <asp:Calendar ID="calDelivery" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnDayRender="calDelivery_DayRender" OnSelectionChanged="calDelivery_SelectionChanged" Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td>
                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPrice" runat="server" SkinID="lblskin"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Payment Type:</td>
                <td class="auto-style4">
                    <asp:RadioButtonList ID="radPayment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="radPayment_SelectedIndexChanged">
                        <asp:ListItem>Credit Card</asp:ListItem>
                        <asp:ListItem>Debit Card</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style14">
                    <asp:RequiredFieldValidator ID="rfvPayment" runat="server" ControlToValidate="radPayment" ErrorMessage="*Required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Credit Card Number:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtCredit" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:RegularExpressionValidator ID="regfvCredit" runat="server" ControlToValidate="txtCredit" ErrorMessage="Card Number must be 16 digit" SetFocusOnError="True" ValidationExpression="\d{16}" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvCredit" runat="server" ControlToValidate="txtCredit" ErrorMessage="*Required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Label ID="lblConf" runat="server" SkinID="lblskin"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Expiry Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year<br />
                    <asp:DropDownList ID="ddExpMonth" runat="server" Height="16px" Width="92px">
                        <asp:ListItem>Select Month</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtYear" runat="server" Width="49px" placeholder="Year"></asp:TextBox>
                </td>
                <td class="auto-style6">CVV:<br />
                    <asp:TextBox ID="txtCvv" runat="server" Width="35px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCvv" runat="server" ControlToValidate="txtCvv" ErrorMessage="*Required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style17">PIN:<br />
&nbsp;<asp:TextBox ID="txtPin" runat="server" Width="96px"></asp:TextBox>
                </td>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:RangeValidator ID="rangeYear" runat="server" ControlToValidate="txtYear" ErrorMessage="Range Must be From 2018 to 2028" MaximumValue="2028" MinimumValue="2018" SetFocusOnError="True" Type="Integer" ForeColor="Red"></asp:RangeValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="txtYear" ErrorMessage="*Required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvCreditMonth" runat="server" ControlToValidate="ddExpMonth" ErrorMessage="Select Month of Expiry" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style6">
                    <asp:RangeValidator ID="rangeCvv" runat="server" ControlToValidate="txtCvv" ErrorMessage="Enter 3 digit Valid Number" MaximumValue="999" MinimumValue="001" SetFocusOnError="True" Type="Integer" ForeColor="Red"></asp:RangeValidator>
                </td>
                <td class="auto-style17">
                    <asp:RangeValidator ID="rangePin" runat="server" ControlToValidate="txtPin" ErrorMessage="Enter a 4 digit pin" MaximumValue="9999" MinimumValue="0000" SetFocusOnError="True" ForeColor="Red"></asp:RangeValidator>
                </td>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style7"><strong>Submit Feedback/Comment:</strong><br />
                    <asp:TextBox ID="txtFeedback" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" SkinID="btnskin" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblError" runat="server" ForeColor="#FF3300" SkinID="Errorskin"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="btnCompletePayment" runat="server" OnClick="btnCompletePayment_Click" Text="Complete Payment" />
                </td>
                <td class="auto-style14">
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>


<%@ Page Title="My Orders" Language="C#" Theme="GaleTheme" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="User_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Your Orders :</p>
    <p>
        &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SQLDSOrderID" DataTextField="OrderId" DataValueField="OrderId">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SQLDSOrderID" runat="server" ConnectionString="<%$ ConnectionStrings:NewDB %>" SelectCommand="SELECT [OrderId] FROM [Orders] WHERE ([UserName] = @UserName)">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="userName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SQLDSOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:NewDB %>" SelectCommand="SELECT [OrderType], [DeliveryAddress], [DeliveryDate], [PaymentType], [TotalPrice], [Details] FROM [Orders] WHERE ([OrderId] = @OrderId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="OrderId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" DataSourceID="SQLDSOrderDetails" Height="50px"  Width="125px" AutoGenerateRows="False">
            <Fields>
                <asp:BoundField DataField="OrderType" HeaderText="OrderType" SortExpression="OrderType" />
                <asp:BoundField DataField="DeliveryAddress" HeaderText="DeliveryAddress" SortExpression="DeliveryAddress" />
                <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate" SortExpression="DeliveryDate" />
                <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        <strong>Comments/Feedback:<asp:SqlDataSource ID="SQLDSComment" runat="server" ConnectionString="<%$ ConnectionStrings:NewDB %>" SelectCommand="SELECT [Comment] FROM [CommentsTB] WHERE ([OrderId] = @OrderId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="No Comments Yet!!!" Name="OrderId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </strong></p>
    <p>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="SQLDSComment" ForeColor="#333333">
            <EditItemTemplate>
                Comment:
                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                Comment:
                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Comment:
                <asp:Label ID="CommentLabel" runat="server" Text='<%# Bind("Comment") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>


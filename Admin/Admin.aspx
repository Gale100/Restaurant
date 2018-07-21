<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Button ID="btnAllOrder" runat="server" OnClick="btnOrder_Click" Text="All Orders" />
        <asp:Button ID="btnAllUsers" runat="server" OnClick="btnAllUsers_Click" Text="All users" />
    </p>
    <p>
        Enter a UserName to Get Order Details:
        <asp:TextBox ID="txtUserOrder" runat="server"></asp:TextBox>
        <asp:Button ID="btnUserOrders" runat="server" OnClick="btnUserOrders_Click" Text="User Orders" />
        <asp:SqlDataSource ID="SQLDSUserOrders" runat="server" ConnectionString="<%$ ConnectionStrings:NewDB %>" SelectCommand="SELECT * FROM [Orders] WHERE ([UserName] = @UserName)" DeleteCommand="DELETE FROM [Orders] WHERE [OrderId] = @original_OrderId" InsertCommand="INSERT INTO [Orders] ([OrderId], [OrderType], [DeliveryAddress], [DeliveryDate], [PaymentType], [TotalPrice], [Details], [UserName]) VALUES (@OrderId, @OrderType, @DeliveryAddress, @DeliveryDate, @PaymentType, @TotalPrice, @Details, @UserName)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Orders] SET [OrderType] = @OrderType, [DeliveryAddress] = @DeliveryAddress, [DeliveryDate] = @DeliveryDate, [PaymentType] = @PaymentType, [TotalPrice] = @TotalPrice, [Details] = @Details, [UserName] = @UserName WHERE [OrderId] = @original_OrderId">
            <DeleteParameters>
                <asp:Parameter Name="original_OrderId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
                <asp:Parameter Name="OrderType" Type="String" />
                <asp:Parameter Name="DeliveryAddress" Type="String" />
                <asp:Parameter Name="DeliveryDate" Type="String" />
                <asp:Parameter Name="PaymentType" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUserOrder" Name="UserName" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrderType" Type="String" />
                <asp:Parameter Name="DeliveryAddress" Type="String" />
                <asp:Parameter Name="DeliveryDate" Type="String" />
                <asp:Parameter Name="PaymentType" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="original_OrderId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="LVUserOrders" runat="server" DataKeyNames="OrderId" DataSourceID="SQLDSUserOrders" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderTypeLabel" runat="server" Text='<%# Eval("OrderType") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DeliveryAddressLabel" runat="server" Text='<%# Eval("DeliveryAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PaymentTypeLabel" runat="server" Text='<%# Eval("PaymentType") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TotalPriceLabel" runat="server" Text='<%# Eval("TotalPrice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DetailsLabel" runat="server" Text='<%# Eval("Details") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="OrderIdLabel1" runat="server" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderTypeTextBox" runat="server" Text='<%# Bind("OrderType") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DeliveryAddressTextBox" runat="server" Text='<%# Bind("DeliveryAddress") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DeliveryDateTextBox" runat="server" Text='<%# Bind("DeliveryDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PaymentTypeTextBox" runat="server" Text='<%# Bind("PaymentType") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TotalPriceTextBox" runat="server" Text='<%# Bind("TotalPrice") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderIdTextBox" runat="server" Text='<%# Bind("OrderId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderTypeTextBox" runat="server" Text='<%# Bind("OrderType") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DeliveryAddressTextBox" runat="server" Text='<%# Bind("DeliveryAddress") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DeliveryDateTextBox" runat="server" Text='<%# Bind("DeliveryDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PaymentTypeTextBox" runat="server" Text='<%# Bind("PaymentType") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TotalPriceTextBox" runat="server" Text='<%# Bind("TotalPrice") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderTypeLabel" runat="server" Text='<%# Eval("OrderType") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DeliveryAddressLabel" runat="server" Text='<%# Eval("DeliveryAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PaymentTypeLabel" runat="server" Text='<%# Eval("PaymentType") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TotalPriceLabel" runat="server" Text='<%# Eval("TotalPrice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DetailsLabel" runat="server" Text='<%# Eval("Details") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">OrderId</th>
                                    <th runat="server">OrderType</th>
                                    <th runat="server">DeliveryAddress</th>
                                    <th runat="server">DeliveryDate</th>
                                    <th runat="server">PaymentType</th>
                                    <th runat="server">TotalPrice</th>
                                    <th runat="server">Details</th>
                                    <th runat="server">UserName</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderTypeLabel" runat="server" Text='<%# Eval("OrderType") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DeliveryAddressLabel" runat="server" Text='<%# Eval("DeliveryAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PaymentTypeLabel" runat="server" Text='<%# Eval("PaymentType") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TotalPriceLabel" runat="server" Text='<%# Eval("TotalPrice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DetailsLabel" runat="server" Text='<%# Eval("Details") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <asp:GridView ID="GVOrders" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrderId" DataSourceID="SqlDSAllOrders" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="OrderId" ReadOnly="True" SortExpression="OrderId" />
                <asp:BoundField DataField="OrderType" HeaderText="OrderType" SortExpression="OrderType" />
                <asp:BoundField DataField="DeliveryAddress" HeaderText="DeliveryAddress" SortExpression="DeliveryAddress" />
                <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate" SortExpression="DeliveryDate" />
                <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDSAllOrders" runat="server" ConnectionString="<%$ ConnectionStrings:NewDB %>" SelectCommand="SELECT * FROM [Orders]" DeleteCommand="DELETE FROM [Orders] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [Orders] ([OrderId], [OrderType], [DeliveryAddress], [DeliveryDate], [PaymentType], [TotalPrice], [Details], [UserName]) VALUES (@OrderId, @OrderType, @DeliveryAddress, @DeliveryDate, @PaymentType, @TotalPrice, @Details, @UserName)" UpdateCommand="UPDATE [Orders] SET [OrderType] = @OrderType, [DeliveryAddress] = @DeliveryAddress, [DeliveryDate] = @DeliveryDate, [PaymentType] = @PaymentType, [TotalPrice] = @TotalPrice, [Details] = @Details, [UserName] = @UserName WHERE [OrderId] = @OrderId">
            <DeleteParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
                <asp:Parameter Name="OrderType" Type="String" />
                <asp:Parameter Name="DeliveryAddress" Type="String" />
                <asp:Parameter Name="DeliveryDate" Type="String" />
                <asp:Parameter Name="PaymentType" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrderType" Type="String" />
                <asp:Parameter Name="DeliveryAddress" Type="String" />
                <asp:Parameter Name="DeliveryDate" Type="String" />
                <asp:Parameter Name="PaymentType" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="OrderId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDSAllUsers">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">UserName</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDSAllUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
    </p>
</asp:Content>


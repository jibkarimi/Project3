<%-- 
    Date        Author      Note
    11/17/19    JIB KARIMI  Project 03
    11/24/19    JIB KARIMI  Project 04                  
     
                --%>



<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" Inherits="WebApplication1.Borrower" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <p>
        <br />
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="borrower_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="phone_numLabel" runat="server" Text='<%# Eval("phone_num") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>

            <%-- Table Edit RequiredFieldValidator and RegularExpressionValidator --%>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66; color: #000080;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="edit"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />

                    </td>
                    <td>
                        <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="Required" ControlToValidate="fnameTextBox" ValidationGroup="edit" 
                            CssClass="text-danger"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Required" ControlToValidate="lnameTextBox" ValidationGroup="edit" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox ID="phone_numTextBox" runat="server" Text='<%# Bind("phone_num") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="Required" ControlToValidate="phone_numTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="use format 000-000-0000" ValidationGroup="edit" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                            ControlToValidate="phone_numTextBox" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </EditItemTemplate>

            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <%-- Table Insert RequiredFieldValidator and RegularExpressionValidator --%>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="Required" ControlToValidate="fnameTextBox" ValidationGroup="insert" 
                            CssClass="text-danger"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="Required" ControlToValidate="lnameTextBox" ValidationGroup="insert" 
                            CssClass="text-danger"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="phone_numTextBox" runat="server" Text='<%# Bind("phone_num") %>' />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="Required" ControlToValidate="phone_numTextBox" ValidationGroup="insert"
                            CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="use format 000-000-0000" ValidationGroup="insert" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                            ControlToValidate="phone_numTextBox" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </InsertItemTemplate>

            <ItemTemplate>
                <tr style="background-color: #FFFBD6; color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="phone_numLabel" runat="server" Text='<%# Eval("phone_num") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                    <th runat="server">Edits</th>
                                    <th runat="server">Borrower Id</th>
                                    <th runat="server">Fist Name</th>
                                    <th runat="server">Last Name</th>
                                    <th runat="server">Phone</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
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
                <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="phone_numLabel" runat="server" Text='<%# Eval("phone_num") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>

        <%-- Store procedures --%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:disk_inventoryjkConnectionString2 %>"
            DeleteCommand="execute sp_DelBorrower @borrower_id"
            InsertCommand="execute sp_InsBorrower @fname, @phone_num, @lname"
            SelectCommand="SELECT [borrower_id], [fname], [lname], [phone_num] FROM [borrower] ORDER BY [lname], [fname]"
            UpdateCommand="execute sp_UpdBorrower @borrower_id, @fname,  @lname, @phone_num">
            <DeleteParameters>
                <asp:Parameter Name="borrower_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="phone_num" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="phone_num" Type="String" />
                <asp:Parameter Name="borrower_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>


</asp:Content>

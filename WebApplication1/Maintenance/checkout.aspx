<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="checkout.aspx.cs" Inherits="WebApplication1.Maintenance.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">





   

       <h2> <p>
        <br />
        Disk Checkout
        </p></h2>
    <br />
    <p>
        Select a Disk:</p>
    <p>
    <%-- DropDown Disk, validator and connection string db --%>
    <asp:DropDownList ID="ddlDisk" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="disk_name" DataValueField="disk_id" OnDataBound="ddlDisk_DataBound" >
    </asp:DropDownList>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger"
            ErrorMessage=" *Disk Selection is Required" ControlToValidate="ddlDisk">
        </asp:RequiredFieldValidator>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryjkConnectionString2 %>" 
            SelectCommand="SELECT [disk_id], [disk_name] FROM [disk] 
                WHERE ([status_id] = @status_id) ORDER BY [disk_name]">
        <SelectParameters>
           <asp:Parameter DefaultValue="1" Name="status_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

         </p>
    <p>
        &nbsp;</p>
    <p>
        Select a Borrower:</p>
    <p>
         <%-- DropDown Borrower, validator and connection string db --%>
        <asp:DropDownList ID="ddlBorrower" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="lname" DataValueField="borrower_id" OnDataBound="ddlBorrower_DataBound" >
        </asp:DropDownList>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger"
            ErrorMessage=" *Select Borrower is Required" ControlToValidate="ddlBorrower">
        </asp:RequiredFieldValidator>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventoryjkConnectionString2 %>" 
            SelectCommand="SELECT [borrower_id], [lname] + ', ' + [fname] as lname 
            FROM [borrower] ORDER BY [lname]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        Select a Checkout Date:</p>
    <p>
         <%-- date txtbox validator and compareValidator to current date db --%>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger"
            ErrorMessage=" *Date selection is Required" ControlToValidate="txtDate" Display="Dynamic">
        </asp:RequiredFieldValidator>

        <asp:CompareValidator ID="CompareValidator1" Operator="LessThanEqual" Type="Date" 
            ControlToValidate="txtDate" ErrorMessage=" *Please Select Valid Date" Display="Dynamic" 
            CssClass="text-danger"
            runat="server" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <%-- Checkout button --%>
        <asp:Button ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" Text="Checkout" />
    </p>
    <p> 
        &nbsp;</p>
    <p>
        <%-- label for final message --%>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>



</asp:Content>



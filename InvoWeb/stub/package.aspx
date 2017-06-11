<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="package.aspx.cs" Inherits="package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-[Package Paypal]
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <h1>
   Account Plan Packages 
 </h1>
<div class="accountInfo">
<fieldset class="register">
<legend>Plan Package Selection</legend>

 <asp:GridView ID="gvPackage" runat="server" CssClass="mGrid" AllowPaging="True" 
        PageSize="10" AutoGenerateColumns="False" OnRowCommand = "gvPack_ItemCommmand" ShowHeaderWhenEmpty="True">
         <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Plan Name"><ItemTemplate><%#Eval("PackageName")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Duration"><ItemTemplate> <%#Eval("PackageDuration")%> Days</ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="No Of Invoice"><ItemTemplate> <%#Eval("NoOfInvoice")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="No Of Product"><ItemTemplate> <%#Eval("NoOfItem")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Price"><ItemTemplate>Rs.<%#Eval("Price")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Terms"><ItemTemplate><%#Eval("Term")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server"  CommandName="Edit" CommandArgument='<%#Eval("PackageId") %>' Style="margin:10px 10px 10px 10px;" Text="Choose Plan" CssClass="submit" />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
           <h2>No Package Data Found..!</h2>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
  </fieldset>
</div>
<br />
<div style="text-align: center; width: 100%">
    &nbsp;  <img alt="" src="Img/pay.png" />
</div>
</asp:Content>


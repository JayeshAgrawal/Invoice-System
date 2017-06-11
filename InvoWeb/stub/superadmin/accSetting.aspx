<%@ Page Title="" Language="C#" MasterPageFile="~/superadmin/supermain.master" AutoEventWireup="true" CodeFile="accSetting.aspx.cs" Inherits="companyadmin_accSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-[Account Setting]
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="upItem" runat="server">
     <ContentTemplate>
<h1>Account Setting</h1>
    <div class="accountInfo">
<fieldset class="register">
<legend>User Information</legend>
<table width="100%">
<tr>
<td>User Name:
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ControlToValidate="txtUserName" ErrorMessage="*" ForeColor="Red" 
        ValidationGroup="s"></asp:RequiredFieldValidator>
</td>
<td>
    &nbsp;<asp:TextBox ID="txtUserName" runat="server"  CssClass="text"></asp:TextBox></td>
</tr>
<tr>
<td>Email Id:
</td>
<td>
    &nbsp;<asp:Label ID="lblEmailId" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td>Password:
</td>
<td>
    <asp:Button ID="btnPassword" runat="server" Text="Change Password"  
        CssClass="text" onclick="btnPassword_Click"/>
        <asp:HiddenField ID="hfPas" runat="server" />
    <asp:Panel ID="pnlPassword" runat="server" Visible="False" 
        BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="1px" 
        HorizontalAlign="Center" Width="371px">
        <br />
        Old Password<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
            runat="server" ControlToValidate="txtOldPassword" ErrorMessage="*" 
            ForeColor="Red" ValidationGroup="p"></asp:RequiredFieldValidator>
        <br />
     <asp:TextBox ID="txtOldPassword" runat="server"  CssClass="text" 
            TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="lblPassMessage" runat="server" ForeColor="Red" 
            Text="Not Correct Password Entered" Visible="False"></asp:Label>
        <br />
        New Password<asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
            runat="server" ControlToValidate="txtNewPassword" ErrorMessage="*" 
            ForeColor="Red" ValidationGroup="p"></asp:RequiredFieldValidator>
        <br />
     <asp:TextBox ID="txtNewPassword" runat="server"  CssClass="text" 
            TextMode="Password"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="txtNewPassword" 
            ErrorMessage="Password must be 8-10 characters long&lt;/br&gt; with at least one numeric character." 
            ForeColor="Red" 
            ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" 
            ValidationGroup="p"></asp:RegularExpressionValidator>
        <br />
        Confirm Password<br />
     <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="text" 
            TextMode="Password"></asp:TextBox>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" 
            ErrorMessage="Your Password Does No Match!!" ForeColor="Red" 
            ValidationGroup="p"></asp:CompareValidator>
        <br />
     <asp:Button ID="btnSavePass" runat="server" Text="Save Password"  
            CssClass="submit" onclick="btnSavePass_Click" ValidationGroup="p"/>&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="btnCancel" runat="server" Text="Cancel Password"  
            CssClass="submit" onclick="btnCancel_Click"/>
        <br /> <br />
    </asp:Panel>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblSecurityQuestion" runat="server" Text="Security Question: "></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="ddlSecurityQuestion" ErrorMessage="*" ForeColor="Red" 
        ValidationGroup="s"></asp:RequiredFieldValidator>
   
</td>
<td>
    <asp:DropDownList ID="ddlSecurityQuestion" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>What was your School Name?</asp:ListItem>
    <asp:ListItem>What is your Favourite Food?</asp:ListItem>
    <asp:ListItem>What is your pet Name?</asp:ListItem>
    </asp:DropDownList>
</td>
 <td>
     &nbsp;</td>
</tr>

<tr>
<td>
    <asp:Label ID="lblAnswer" runat="server" Text="Answer:"></asp:Label>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="txtAnswer" ErrorMessage="*" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
</td>
<td>
   <asp:TextBox ID="txtAnswer" runat="server" CssClass="text" MaxLength="7"></asp:TextBox>
</td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td>
    &nbsp;</td>
<td>
    <asp:Button ID="btnSubmit" runat="server" Text="Save Account" CssClass="submit" 
         ValidationGroup="s" onclick="btnSubmit_Click" />
         <br />
          <asp:Label ID="lbleditMSG" runat="server" ForeColor="Red" 
            Text="Successfully saved" Visible="False"></asp:Label>
</td>
<td>
    &nbsp;</td>
</tr>
</table>
</fieldset>
</div>
 </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>


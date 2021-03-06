﻿<%@ Page Title="" Language="C#" MasterPageFile="~/superadmin/supermain.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="superadmin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-[Dashboard]
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Dashboard</h1>

<div class="accountInfo">
<fieldset class="register">
    <legend>Top Statistical</legend>
<table width="100%">
<tr>
<td width="420px" align="center" colspan="2">
<h2>Top Companies</h2>
</td>
<td width="420px" align="center" colspan="2">
<h2>Top Invoices</h2>
</td>

</tr>
<tr>
<td width="420px" align="center" colspan="2" >

    <asp:DataList ID="dlCust" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Horizontal" 
        Width="280px">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
             <table width="100%" style="padding: 0px 0px -10px 0px; margin: 0px 0px -20px 0px">
             <tr><td align="left">
             <asp:Label ID="CustomerNameLabel" runat="server" 
                  Text='<%# Eval("CompanyName") %>' />
               </td>
               <td align="right">
                   &nbsp;Rs.<asp:Label ID="NetAmountLabel" runat="server" 
                Text='<%# Eval("NetAmount") %>' /> </td>
                </tr>
              </table>
              <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:Label ID="lblcompany" runat="server" Text="No Record Found" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        
        SelectCommand="SELECT TOP (5) SUM(InvoiceMaster.NetAmount) AS NetAmount, CompanyMaster.CompanyName FROM InvoiceMaster INNER JOIN CompanyMaster ON InvoiceMaster.CompanyId = CompanyMaster.CompanyId GROUP BY InvoiceMaster.CompanyId, CompanyMaster.CompanyName ORDER BY NetAmount DESC">
    </asp:SqlDataSource>
</td>
<td width="420px" align="center" colspan="2">

  <asp:DataList ID="dlInvoice" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="Horizontal" 
        Width="280px">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
             <table width="100%" style="padding: 0px 0px -10px 0px; margin: 0px 0px -20px 0px">
             <tr><td align="left"> <asp:Label ID="Label1" runat="server" 
                  Text='<%# Eval("InvoiceNo") %>' /> 
               </td>
               <td align="right">
                   &nbsp;Rs.<asp:Label ID="NetAmountLabel" runat="server" 
                Text='<%# Eval("NetAmount") %>' /> </td>
                </tr>
              </table>
              <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:Label ID="lblInvoice" runat="server" Text="No Record Found" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        SelectCommand="SELECT TOP (5) NetAmount, InvoiceNo FROM InvoiceMaster ORDER BY NetAmount DESC">
    </asp:SqlDataSource>
</td>
</tr>
<tr>
<td align="center" style="background-color: #F6B300" width="280px">
<a href="packages.aspx" style="color: #FFE2B7; font-size: x-large;">Manage Packages</a><br />
&nbsp;<p 
        style="color: #FFFFFF; padding: 30px 28px 15px 28px; margin-top: -40px;">&#39;Manage package information. Add new Packages, and edit existing package information.&#39; 
       </p>
</td>
<td align="center" style="background-color: #F6B300" width="280px" colspan="2">
<a href="companies.aspx" style="color: #FFE2B7; font-size: x-large;">Manage Companies</a><br />
&nbsp;<p style="color: #FFFFFF; padding: 30px 24px 15px 24px; margin-top: -40px;">
        &#39;Manage 
        company information. Active and Deactive existing company information." 
       </p>
</td>
<td align="center" style="background-color: #F6B300" width="280px">
<a href="#" style="color: #FFE2B7; font-size: x-large;">Manage Invoices</a><br />
&nbsp;<p 
        style="color: #FFFFFF; padding: 30px 24px 15px 24px; margin-top: -40px; ">
        &#39;Manage Invoices information. edit and view existing Invoices 
        information.&#39; 
       </p>
</td>
</tr>
</table>
</fieldset> 
</div>


<div class="accountInfo">
<fieldset class="register">
    <legend> Performance</legend>
<table width="100%">
<tr>
<td align="center" width="50%">
<h2>Company Sales Performance</h2>
    <asp:Chart ID="Chartdaily" runat="server" BackColor="" 
        DataSourceID="SqlDataSource1" Width="420px" >
        <legends>
    <asp:Legend Alignment="Center" Docking="Bottom"
                IsTextAutoFit="False" Name="Default" />
  </legends>
        <series>
            <asp:Series Name="Series1" XValueMember="CompanyName" 
                YValueMembers="TotalAmount" ChartType="Pie" YValuesPerPoint="4" 
                IsValueShownAsLabel="True">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Pie" Name="Series2">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Days ]">
                </AxisX>
                <Area3DStyle Enable3D="True" IsClustered="True" IsRightAngleAxes="False" 
                    Perspective="10" PointGapDepth="900" Rotation="65" WallWidth="25" />
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        
        SelectCommand="SELECT TOP (5) SUM(InvoiceMaster.NetAmount) AS TotalAmount, CompanyMaster.CompanyName FROM InvoiceMaster INNER JOIN CompanyMaster ON InvoiceMaster.CompanyId = CompanyMaster.CompanyId GROUP BY CompanyMaster.CompanyName ORDER BY TotalAmount DESC" 
        >
    </asp:SqlDataSource>
    </td>
    <td align="center" width="50%">
    <h2>Monthly Sales Performance</h2>
    <asp:Chart ID="chartmonth" runat="server"  Width="420px" 
            AlternateText="No Information Available." DataSourceID="SqlDataSource2">
        <series>
            <asp:Series Name="Series1" XValueMember="Month" YValueMembers="TotalAmount" 
                YValuesPerPoint="6" ChartType="StackedColumn">
            </asp:Series>
        </series>
           <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Month ]">
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>"   
            
            SelectCommand="SELECT MONTH(CreatedDate) AS Month, SUM(NetAmount) AS TotalAmount FROM InvoiceMaster GROUP BY MONTH(CreatedDate) ORDER BY Month">
    </asp:SqlDataSource>
    </td>
</tr>
<tr>
<td align="center" width="50%">
<h2>Quarterly Sales Performance</h2>
    <asp:Chart ID="ChartQuarterly" runat="server" BackColor="" 
        DataSourceID="SqlDataSource3" Width="420px" >
        <series>
            <asp:Series Name="Series1" XValueMember="Quarters" 
                YValueMembers="TotalAmount" YValuesPerPoint="4" ChartType="StackedColumn" >
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Quarter ]">
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        SelectCommand="SELECT DATEPART(q, CreatedDate) AS Quarters, SUM(NetAmount) AS TotalAmount FROM InvoiceMaster GROUP BY DATEPART(q, CreatedDate)" 
        >
    </asp:SqlDataSource>
    </td>
    <td align="center" width="50%">
    <h2>Yearly Sales Performance</h2>
    <asp:Chart ID="chartYearly" runat="server"  Width="420px" 
            AlternateText="No Information Available." DataSourceID="SqlDataSource4">
        <series>
            <asp:Series Name="Series1" XValueMember="year" YValueMembers="TotalAmount" 
                YValuesPerPoint="6" ChartType="StackedColumn">
            </asp:Series>
        </series>
           <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Year ]">
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>"           
            
            SelectCommand="SELECT YEAR(CreatedDate) AS year, SUM(NetAmount) AS TotalAmount FROM InvoiceMaster GROUP BY YEAR(CreatedDate) ORDER BY year">
    </asp:SqlDataSource>
    </td>
</tr>
</table>
</fieldset> 
</div>

</asp:Content>


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;

public partial class companyadmin_CRCustomerDetail : System.Web.UI.Page
{
    CustomerDetail.CustomerMasterDataTable DT = new CustomerDetail.CustomerMasterDataTable();
    CustomerDetailTableAdapters.CustomerMasterTableAdapter Radapter = new CustomerDetailTableAdapters.CustomerMasterTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        FillDetail();
    }

  
    public void FillDetail()
    {
        int compid = Convert.ToInt16(Session["CompanyId"]);
        DT = Radapter.GetData(compid);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCustomerDetail.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
}
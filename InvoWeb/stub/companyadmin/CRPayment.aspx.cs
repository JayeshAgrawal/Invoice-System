using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;


public partial class companyadmin_CRPayment : System.Web.UI.Page
{
    CRPaymentStatus.PaymentDataTable DT = new CRPaymentStatus.PaymentDataTable();
    CRPaymentStatusTableAdapters.PaymentTableAdapter Radapter = new CRPaymentStatusTableAdapters.PaymentTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {

        int compid = Convert.ToInt16(Session["CompanyId"]);
        DT = Radapter.GetData(compid);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRPayment.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
   
}
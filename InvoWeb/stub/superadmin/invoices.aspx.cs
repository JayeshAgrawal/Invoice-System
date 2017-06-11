using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Data.Invoice;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;

public partial class companyadmin_invoices : System.Web.UI.Page
{
    InvoiceMaster _invMstr = new InvoiceMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataSet _ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }
    private void BindGridView()
    {
        _invMstr.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _ds.Tables.Add(_sobj.SA_SelectInvoice(_invMstr));
        gvInvoice.DataSource = _ds;
        gvInvoice.DataBind();
    }
 
    protected void gvInvoice_InvoiceCommmand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "View")
        {
            Response.Redirect("~/superadmin/InvoiceView.aspx?index=" + index + "&Chk=0");
        }
        else if (e.CommandName == "Delete")
        {
            _invMstr.InvoiceId = index;
            int flag = _obj.Remove_InvoiceMaster(_invMstr);
            if (flag == 0)
            {
                Response.Redirect("~/superadmin/invoices.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Delete Successfully Invoice..')</script>");
            }
        }
    }
    protected void ddlPayment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPayment.SelectedItem.Text == "All")
        {
            BindGridView();
            txtEndDate.Enabled = false;
            txtStartDate.Enabled = false;
            btnFilter.Enabled = false;
            txtStartDate.Text = "";
            txtEndDate.Text = "";
        }
        else
        {
            _invMstr.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _invMstr.PaymentStatus = Convert.ToInt16(ddlPayment.SelectedItem.Value);
            _ds.Tables.Add(_sobj.SA_SelectInvoiceStatus(_invMstr));
            gvInvoice.DataSource = _ds;
            gvInvoice.DataBind();
            txtEndDate.Enabled = true;
            txtStartDate.Enabled = true;
            btnFilter.Enabled = true;
        }
    }
    #region pager
    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvInvoice.PageIndex = e.NewPageIndex;
        gvInvoice.DataBind();
    }
    protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = gvInvoice.DataSource as DataTable;

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            gvInvoice.DataSource = dataView;
            gvInvoice.DataBind();
        }
    }
    private string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;

        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;

            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
    } 
    #endregion
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        if (ddlPayment.SelectedItem.Text == "All")
        {
            BindGridView();
            txtEndDate.Enabled = false;
            txtStartDate.Enabled = false;
            btnFilter.Enabled = false;
        }
        else
        {
            _invMstr.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _invMstr.PaymentStatus = Convert.ToInt16(ddlPayment.SelectedItem.Value);
            DateTime StartDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime EndDate = Convert.ToDateTime(txtEndDate.Text);
            _ds.Tables.Add(_sobj.SA_SelectInvoiceDate(_invMstr, StartDate, EndDate));
            gvInvoice.DataSource = _ds;
            gvInvoice.DataBind();
            txtEndDate.Enabled = true;
            txtStartDate.Enabled = true;
            btnFilter.Enabled = true;
        }
    }
}
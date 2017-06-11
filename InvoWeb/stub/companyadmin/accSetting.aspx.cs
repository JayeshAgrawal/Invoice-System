using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;
using Data.User;
public partial class companyadmin_accSetting : System.Web.UI.Page
{
    DataTable _dt = new DataTable();
    UserMaster _um = new UserMaster();
    SelectSP _obj = new SelectSP();
    ActionStoredProcedure _Editobj = new ActionStoredProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
         
            BindView();
        }
    }
    private void BindView()
    {
        _um.UserId = Convert.ToInt16(Session["UserId"]);
        _dt = _obj.Select_UserInfo(_um);
         foreach (DataRow row in _dt.Rows)
         {
           txtUserName.Text = row["UserName"].ToString();
           lblEmailId.Text = row["EmailId"].ToString();
           hfPas.Value = row["Password"].ToString();
           ddlSecurityQuestion.SelectedItem.Text = row["Question"].ToString();
           txtAnswer.Text = row["Answer"].ToString();
         }

    }
    protected void btnPassword_Click(object sender, EventArgs e)
    {
        btnPassword.Visible = false;
        pnlPassword.Visible = true;
        lblPassMessage.Visible = false;
        lbleditMSG.Visible = false;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        btnPassword.Visible = true;
        pnlPassword.Visible = false;
        lblPassMessage.Visible = false;
        lbleditMSG.Visible = false;
    }
    protected void btnSavePass_Click(object sender, EventArgs e)
    {
        if (txtOldPassword.Text == hfPas.Value)
        {
            _um.UserId = Convert.ToInt16(Session["UserId"]);
            _um.Password = txtNewPassword.Text.Trim();
            int flag = _Editobj.Edit_Password(_um, txtOldPassword.Text.Trim());
            if (flag == 0)
            {
                btnPassword.Visible = true;
                pnlPassword.Visible = false;
                lblPassMessage.Visible = false;
                lbleditMSG.Visible = false;
            }
            else
            {
                lblPassMessage.Visible = true;
            }
        }
        else
        {
            lblPassMessage.Visible = true;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        _um.UserId = Convert.ToInt16(Session["UserId"]);
        _um.UserName = txtUserName.Text.Trim();
        _um.Question = ddlSecurityQuestion.SelectedItem.Text;
        _um.Answer = txtAnswer.Text.Trim();
        _um.ModifiedDate = Convert.ToDateTime(DateTime.Now);
        int flag1 = _Editobj.Edit_UserMaster(_um);
        if (flag1 == 0)
        {
            lbleditMSG.Text = "Successfully saved";
            lbleditMSG.Visible =true;
        }
        else
        {
            lbleditMSG.Text = "Not Successfully saved";
            lbleditMSG.Visible = true;
        }
    }
}
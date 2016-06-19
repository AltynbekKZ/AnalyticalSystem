using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalyticalSystem
{
    public partial class takeexam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStart_OnClick(object sender, EventArgs e)
        {
            // 
            string sid, sname;

            sid = ddlSubjects.SelectedItem.Value;
            sname = ddlSubjects.SelectedItem.Text;
            Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()), Int32.Parse(sid), sname);
            exam.GetQuestions();
            Session.Add("questions", exam);
            Response.Redirect("examination.aspx");
        }
    }
}
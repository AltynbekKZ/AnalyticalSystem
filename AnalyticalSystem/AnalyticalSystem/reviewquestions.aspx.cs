using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalyticalSystem
{
    public partial class reviewquestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["questions"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            Examination exam = (Examination)Session["questions"];
            DataList1.DataSource = exam.questions;
            DataList1.DataBind();
        }
    }
}
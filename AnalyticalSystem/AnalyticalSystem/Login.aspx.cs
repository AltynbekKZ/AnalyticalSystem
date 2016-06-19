using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalyticalSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkBtnLogin_OnClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from oe_members where lname = @lname and pwd = @pwd", con);
                cmd.Parameters.Add("@lname", SqlDbType.VarChar, 10).Value = tbLogin.Value;
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 10).Value = tbPassword.Value;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session.Add("mid", dr["mid"]);
                    Session.Add("fullname", dr["fullname"]);
                    Session.Add("dlv", dr["dlv"]);
                    // update MEMBERS table for DLV
                    dr.Close();
                    cmd.CommandText = "update oe_members set dlv = getdate() where lname = @lname";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblMsg.Text = "Логин қате!";
                    dr.Close();
                }

            }
            catch (Exception ex)
            {
                lblMsg.Text = "Қате --> " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
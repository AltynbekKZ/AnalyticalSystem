using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalyticalSystem
{
    public partial class newuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOk_OnClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(AnalyticalSystem.DBUtil.ConnectionString);
            try
            {
                con.Open();
                // check whether login name is unique 
                SqlCommand cmd = new SqlCommand("select * from oe_members where lname = @lname", con);
                cmd.Parameters.Add("@lname", SqlDbType.VarChar, 10).Value = tbLogin.Value;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblMsg.Text = "Бұндай логин бар, басқа логин енгізіңіз!";
                    return;
                }
                dr.Close();

                // check whether email address is unique
                cmd.Parameters.Clear();
                cmd.CommandText = "select * from oe_members where email = @email";
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = tbEmail.Value;
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblMsg.Text = "Бұндай эл.адрес бар, басқа эл.адрес енгізіңіз!";
                    return;
                }
                dr.Close();

                // get next MID
                cmd.CommandText = "select  isnull(max(mid),0) + 1 from oe_members";
                int mid = (Int32)cmd.ExecuteScalar();
                // insert row into OE_MEMEBERS
                cmd.Parameters.Clear();
                cmd.CommandText = "insert into oe_members values(@mid,@lname,@pwd,@fullname,@email,null,getdate())";
                cmd.Parameters.Add("@mid", SqlDbType.Int).Value = mid;
                cmd.Parameters.Add("@lname", SqlDbType.VarChar, 10).Value = tbLogin.Value;
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 10).Value = tbPassword.Value;
                cmd.Parameters.Add("@fullname", SqlDbType.VarChar, 30).Value = tbFullName.Value;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 30).Value = tbEmail.Value;
                if (cmd.ExecuteNonQuery() > 0)
                {
                    lblMsg.ForeColor = Color.Chartreuse;
                    lblMsg.Text = "Тіркелу сәтті өтті. Келесі сілтемеге өтіңіз <a href=login.aspx>өту</a> !";
                }
                else
                {
                    
                    lblMsg.Text = "Кешіріңіз! Тіркелі кезінде қате болды!";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "қате --> " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
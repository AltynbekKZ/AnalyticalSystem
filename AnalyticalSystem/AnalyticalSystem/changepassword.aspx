<%@ Page Language="C#" MasterPageFile="~/main.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.Configuration" %>

<script runat="server">

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        // get connection
        SqlConnection con = new SqlConnection ( DBUtil.ConnectionString);
        try{
            con.Open();
            SqlCommand cmd = new SqlCommand("update oe_members set pwd = @pwd where mid = @mid and pwd = @oldpwd", con);
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar,10).Value  = txtNewpwd.Text;
            cmd.Parameters.Add("@mid", SqlDbType.Int).Value  = Int32.Parse( Session["mid"].ToString());
            cmd.Parameters.Add("@oldpwd", SqlDbType.VarChar,10).Value  = txtOldpwd.Text;
            
            if ( cmd.ExecuteNonQuery() > 0 )
               lblMsg.Text = "Password has been changed succesfully!";
            else
                lblMsg.Text  = "Sorry! Could not change password!";
              
            
        }
        catch(Exception ex)
        {
          lblMsg.Text = "Error --> " + ex.Message ;
        }
        finally{
            con.Close();
        }
    } 
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Change Password</h2>
    <table bgcolor="#eeeeee">
        <tr>
            <td >
                Old Password</td>
            <td >
                <asp:TextBox ID="txtOldpwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldpwd"
                    ErrorMessage="Old passsword is required!">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>New Password</td>
            <td >
                <asp:TextBox ID="txtNewpwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewpwd"
                    ErrorMessage="New password is required!">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Reenter New Password</td>
            <td >
                <asp:TextBox ID="txtConfirmpwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewpwd"
                    ControlToValidate="txtConfirmpwd" ErrorMessage="New and confirm password do not match!">*</asp:CompareValidator></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Change Password" OnClick="Button1_Click" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label><br />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Correct The Following Errors:"  />
    <br />
    <br />
</asp:Content>


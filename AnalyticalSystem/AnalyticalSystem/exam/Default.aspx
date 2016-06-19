<%@ Page Language="C#" MasterPageFile="~/NewSite.master" Title="Untitled Page" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        lblName.Text = "Қош келдіңіз,  " + Session["fullname"];
        lblDate.Text = "Соңғы кірген уақытыңыз : " + Session["dlv"];
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="right_col" role="main">
    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Names="Verdana"></asp:Label><br />
    <br />
    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Names="Verdana"></asp:Label>
    </div>
</asp:Content>


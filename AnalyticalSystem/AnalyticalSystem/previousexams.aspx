<%@ Page Title="" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="previousexams.aspx.cs" Inherits="AnalyticalSystem.previousexams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="right_col" role="main">
        <h2>
        Емтихан тарихы</h2>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
        PageSize="50" BorderColor="Black" CellPadding="3" CellSpacing="2"  Width="100%" AllowPaging="True">
        <RowStyle Font-Names="Verdana" Font-Size="10pt" />
        <HeaderStyle BackColor="#0000C0" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
            ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:examConnectionString %>"
        SelectCommand="SELECT sname as [Пән], e.noq as [Cұрақ саны], nocans as [Дұрыс жауап], e.noq - nocans  [Қате жауап], [Басталуы]=convert(varchar(10),stdate,103),&#13;&#10;[Уақыт] = datediff(mi,stdate,enddate)   FROM  oe_exams e, oe_subjects s&#13;&#10;where  e.sid = s.sid and   mid = @mid&#13;&#10;order by  stdate desc">
        <SelectParameters>
            <asp:SessionParameter Name="mid" SessionField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>

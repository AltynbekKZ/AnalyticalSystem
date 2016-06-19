<%@ Page Title="" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="showresult.aspx.cs" Inherits="AnalyticalSystem.showresult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="right_col" role="main">
    <br />
    <h2>
    Емтихан нәтижесі</h2>
    &nbsp;
    <br />
    <table bgcolor="#eeeeee" border=1>
        <tr>
            <td>
                Пән:
            </td>
            <td>
                <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td>
                Басталған уақыты :
            </td>
            <td>
                <asp:Label ID="lblStime" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
        <tr>
            <td>
                Кеткен уақыт, минутпен : 
            </td>
            <td>
                <asp:Label ID="lblMin" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
                <tr>
            <td>
               Сұрақтар саны :
            </td>
            <td>
                <asp:Label ID="lblNquestions" runat="server"></asp:Label></td>
        </tr>
        
                <tr>
            <td>
                Дұрыс сұрақтар саны :
            </td>
            <td>
                <asp:Label ID="lblNcans" runat="server" Text="Label"></asp:Label></td>
        </tr>

        <tr>
            <td>
                Дәреже : 
            </td>
            <td>
                <asp:Label ID="lblGrade" runat="server" Text="Label"></asp:Label></td>
        </tr>


    </table>
    <br />
    <a  href="reviewquestions.aspx">Сұрақтарды көру</a>
    <asp:LinkButton ID="lbRank" runat="server" OnClick="lbRank_OnClick">Нәтиже орны</asp:LinkButton><br />
    <br />
    <asp:Label ID="lblRank" runat="server"></asp:Label><br />
    
    </div>
</asp:Content>

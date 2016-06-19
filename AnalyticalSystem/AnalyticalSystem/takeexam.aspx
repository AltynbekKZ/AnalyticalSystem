<%@ Page Title="" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="takeexam.aspx.cs" Inherits="AnalyticalSystem.takeexam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="right_col" role="main">
         
             <h2>
        Емтихан алу</h2>
    Пәнді таңдаңыз :
    <asp:DropDownList ID="ddlSubjects" runat="server" DataSourceID="SqlDataSource1" DataTextField="sname"
        DataValueField="sid" Width="163px">
    </asp:DropDownList><br />
    <br />
    <asp:Button ID="btnStart" runat="server" Text="Емтиханды бастау" OnClick="btnStart_OnClick" /><br />
    <p/>
    <b>Қосымша</b>
    <ul>
    <li>Әр емтихан 5 сұрақтан тұрады</li><li>Сұрақтар арасында навигация жасау үшін Алға/Келесі батырмасын басыңыз</li><li>Нәтиже соңғы жауаптан соң шығады</li><li>Бітіру үшін Емтизанды бітіру батымасын басыңыз</li><li>Уақыттан шектеу жоқ</li></ul>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:examConnectionString %>"
        SelectCommand="SELECT [sid], [sname] FROM [oe_subjects]"></asp:SqlDataSource>
         
    </div>
</asp:Content>

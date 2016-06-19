<%@ Page Title="" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="reviewquestions.aspx.cs" Inherits="AnalyticalSystem.reviewquestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="right_col" role="main">
        <asp:DataList ID="DataList1" runat="server" Width="100%">
    <HeaderTemplate>
     <a href="showresult.aspx">Нәтижені көрсету</a>
     <h2>Сұрақтарды көру</h2>
     <hr size=5 style="color:red" />
    </HeaderTemplate>
    
    <ItemTemplate>
    <pre style="color:Red;background-color:#eeeeee"><%# DataBinder.Eval( Container.DataItem,"QuestionText")%></pre>
    <pre>1.<%# DataBinder.Eval( Container.DataItem,"Answer1") %></pre>
    <pre>2.<%# DataBinder.Eval( Container.DataItem,"Answer2") %></pre>
    <pre>3.<%# DataBinder.Eval( Container.DataItem,"Answer3") %></pre>
    <pre>4.<%# DataBinder.Eval( Container.DataItem,"Answer4") %></pre>
    <pre>Дұрыс жауап :<%# DataBinder.Eval( Container.DataItem,"CorrectAnswer") %></pre>
    <pre>Сіздің жауабыңыз    :<%# DataBinder.Eval( Container.DataItem,"YourAnswer") %></pre>
    </ItemTemplate>
    
     <SeparatorTemplate>
     <hr size="2" style="color:Red" />
    </SeparatorTemplate>
    
    
    
    <FooterTemplate>
      <hr size=5 style="color:red" />
      <a href="showresult.aspx">Нәтижені көрсету</a>
    </FooterTemplate>
    </asp:DataList>
    </div>
</asp:Content>

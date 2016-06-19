<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AnalyticalSystem.Login" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Жүйеге кіру </title>

    <!-- Bootstrap -->
    <link href="Scripts/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="Scripts/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="Content/new/css/custom.css" rel="stylesheet">
  </head>

  <body style="background:#F7F7F7;">
    <div class="">
      <a class="hiddenanchor" id="toregister"></a>
      <a class="hiddenanchor" id="tologin"></a>

      <div id="wrapper">
        <div id="login" class="form">
          <section class="login_content">
            <form runat="server">
              <h1>Жүйеге кіру</h1>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red"></asp:Label>
              <div>
                <input type="text" runat="server" ID="tbLogin" class="form-control" placeholder="Логин" required="" />
              </div>
              <div>
                <input type="password" runat="server" ID="tbPassword" class="form-control" placeholder="Құпия сөз" required="" />
              </div>
              <div>
                  <asp:LinkButton runat="server" OnClick="lnkBtnLogin_OnClick" ID="lnkBtnLogin" CssClass="btn btn-default">Кіру</asp:LinkButton>
                  <a class="reset_pass" href="ForgotPassword.aspx">Құпия сөзді жоғалттыңызба?</a>
              </div>
              <div class="clearfix"></div>
              <div class="separator">

                <p class="change_link">Сайтта бірінші ретпе?
                  <a href="newuser.aspx" class="to_register"> Аккаунт құру </a>
                </p>
                <div class="clearfix"></div>
                <br />
                <div>
                  <h1><i class="fa fa-pie-chart" style="font-size: 26px;"></i> Аналитикалық мониторинг жүйесі!</h1>

                  <p>©2016 Астана қаласы</p>
                </div>
              </div>
            </form>
          </section>
        </div>

      </div>
    </div>
  </body>
</html>

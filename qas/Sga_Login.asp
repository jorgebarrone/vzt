<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Stabilit | Log in</title>
  <link rel="shortcut icon" href="favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <script>
    function validate() {
    var x = document.forms["form1"]["UserID"].value;
    var y = document.forms["form1"]["Password"].value;
    if (x == null || x == "") {
        alert("Debe proporcionar el nombre de Usuario");
    return false;
    }
    if (y == null || y == "") {
        alert("Debe proporcionar la Contraseña");
        return false;
    }
    
    }
  </script>

</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><img alt="Stabilit" src="stabilit.png"></img></a>
    <br>
      <a href="#"><b>P</b>ortal de&nbsp;<b>RH</b></a>
  </div>

    <%
    dim Usr
    dim Pwd
    dim cn
    Usr = trim(Request.Form("UserID"))
    Pwd = trim(Request.Form("Password"))
'    cn = "Provider=SQLOLEDB;Server=LTVMS;Database=SGA;Uid=sa;Password=Admin01*;"
    cn = "Provider=SQLOLEDB;Server=SERVER-CA;Database=EMprd;Uid=sa;Password=Hermosillo12;"
    
    set dbconn = server.CreateObject("ADODB.Connection")
    dbconn.open cn
    
    sqlLog = "select * from Usuarios              " & _
             "where Usr_UserID   = '" & Usr & "'  " & _
             "and   Usr_Password = '" & Pwd & "'  "
'    response.write(sqlLog)
    set rsL = dbconn.execute(sqlLog)

    if not rsL.eof and not rsL.bof then

        Dim max,min,rdm
        max=1000000000
        min=1
        Randomize
        rdm = Int((max-min+1)*Rnd+min)
        response.write(rdm)

        sqlval = "select Ses_SesionID from Sesiones    " & _
                 "where Ses_SesionID = '" & rdm & "'   "
        set rs = dbconn.execute(sqlval)
        if rs.eof and rs.bof then
            sqlins = "insert into Sesiones                     " & _
                     "values ('"& rdm                     &"', " & _
                     "        '"& trim(rsL("Usr_UserID")) &"', " & _
                     "        '"& trim(rsL("Usr_Name"))   &"') "
            set rsI = dbconn.execute(sqlins)
        else
            rdm = Int((max-min+1)*Rnd+min)
            sqlins = "insert into Sesiones                     " & _
                     "values ('"& rdm                     &"', " & _
                     "        '"& trim(rsL("Usr_UserID")) &"', " & _
                     "        '"& trim(rsL("Usr_Name"))   &"') "
            set rsI = dbconn.execute(sqlins)
        end if
        set rsL = Nothing
        set rs  = Nothing
        set rsI = Nothing
        
        %>
        <form action="index.asp" name="form1" method="post">
            <input type="hidden" name="SessionID" value="<%= rdm %>" />
        </form>
        <script>
            document.form1.submit();
        </script>
        <%
    end if
    %>

  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Ingrese sus Datos para iniciar Sesión</p>

    <form action="Sga_Login.asp" name="form1" onsubmit="return validate()" method="post">
      <div class="form-group has-feedback">
        <input type="email" name="UserID" id="UserID" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="Password" id="Password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div><label style="color:red; font-weight: bold;">El Usuario o la Contraseña son Incorrectas</label></div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Recordarme
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Ingresar</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
    </div>
    <!-- /.social-auth-links -->

    <a href="#">Olvidé mi Contraseña</a><br>
    <a href="#" class="text-center">Registrarse</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>

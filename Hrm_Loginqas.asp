<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Forma de Ingreso / Login</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
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

</head>
<body class="hold-transition login-page" style="background-image: url(images/verzatec_bg2.png); ">
<div class="login-box"  style="background-color: rgba(242,242,242,0.5)">
  <div class="login-logo">
    <img alt="Stabilit" src="images/verza01.gif" style="height: 100px"></img>
    <br>
      <a href="#"><b>P</b>ortal de&nbsp;<b>RH</b></a>
    </br>
  </div>

    <%
    dim Lng
    dim Usr
    dim Pwd
    dim cn
    Usr = trim(Request.Form("UserID"))
    Pwd = trim(Request.Form("Password"))
'    cn = "Provider=SQLOLEDB;Server=LTVMS;Database=HRM;Uid=sa;Password=Admin01*;"
    cn = "Provider=SQLOLEDB;Server=172.28.100.11;Database=HRMqas;Uid=usrjob;Password=Vztjob2010;"
'    cn = "Provider=SQLOLEDB;Server=184.168.194.75;Database=Eryseg01;Uid=Eryseg_sa;Password=Admin01*;"
    
    set dbconn = server.CreateObject("ADODB.Connection")
    dbconn.open cn
    
    sqlLog = "select * from HRM10005              " & _
             "where Usr_UserID   = '" & Usr & "'  " & _
             "and   Usr_Password = '" & Pwd & "'  "

    sqlLog = "select a.Emp_EmpleadoID, a.Emp_NombreCompleto,  " & _
             "       a.Emp_CompaniaID, a.Emp_Foto,            " & _
             "       b.Cpy_IdiomaID,   c.Pue_Descripcion      " & _
             "from HRM10220 a, HRM10201 b, HRM10210 c         " & _
             "where a.Emp_CompaniaID = b.Cpy_CompaniaID       " & _
             "and   a.Emp_PuestoID   = c.Pue_PuestoID         " & _
             "and   a.Emp_NivelID    = c.Pue_NivelID          " & _
             "and   a.Emp_EmpleadoID = '" & Usr & "'          " & _
             "and   a.Emp_Password   = '" & Pwd & "'          "

    sqlLog = "select a.Emp_EmpleadoID, a.Emp_NombreCompleto,  " & _
             "       a.Emp_CompaniaID, a.Emp_Foto,            " & _
             "       b.Cpy_IdiomaID,   c.Pue_Descripcion      " & _
             "from HRM10220 a, HRM10201 b, HRM10210 c         " & _
             "where a.Emp_CompaniaID = b.Cpy_CompaniaID       " & _
             "and   a.Emp_CompaniaID = c.Pue_CompaniaID       " & _
             "and   a.Emp_PuestoID   = c.Pue_NivelPuestoID    " & _
             "and   a.Emp_NivelID    = c.Pue_NivelID          " & _
             "and   a.Emp_EmpleadoID = '" & Usr & "'          " & _
             "and   a.Emp_Password   = '" & Pwd & "'          "

'    response.write(sqlLog)
    set rsL = dbconn.execute(sqlLog)

    if not rsL.eof and not rsL.bof then

        Dim max,min,rdm
        max=1000000000
        min=1
        Randomize
        rdm = Int((max-min+1)*Rnd+min)
        'response.write(rdm)

        sqlval = "select Ses_SesionID from HRM10008    " & _
                 "where Ses_SesionID = '" & rdm & "'   "
        set rs = dbconn.execute(sqlval)
        if rs.eof and rs.bof then
'            sqlins = "insert into HRM10008                     " & _
'                     "values ('"& rdm                     &"', " & _
'                     "        '"& trim(rsL("Usr_UserID")) &"', " & _
'                     "        '"& trim(rsL("Usr_Nombre")) &"', " & _
'                     "        '',                              " & _
'                     "        '"& trim(Lng)               &"', " & _
'                     "        '"& trim(rsL("Usr_Imagen")) &"') "

            sqlins = "insert into HRM10008                             " & _
                     "values ('"& rdm                             &"', " & _
                     "        '"& trim(rsL("Emp_EmpleadoID"))     &"', " & _
                     "        '"& trim(rsL("Emp_NombreCompleto")) &"', " & _
                     "        '"& trim(rsL("Pue_Descripcion"))    &"', " & _
                     "        '"& trim(rsL("Emp_CompaniaID"))     &"', " & _
                     "        '"& trim(rsL("Cpy_IdiomaID"))       &"', " & _
                     "        '"& trim(rsL("Emp_Foto"))           &"') "
            set rsI = dbconn.execute(sqlins)
            'response.write(sqlins)
        else
            rdm = Int((max-min+1)*Rnd+min)
'            sqlins = "insert into HRM10008                     " & _
'                     "values ('"& rdm                     &"', " & _
'                     "        '"& trim(rsL("Usr_UserID")) &"', " & _
'                     "        '"& trim(rsL("Usr_Nombre")) &"', " & _
'                     "        '',                              " & _
'                     "        '"& trim(Lng)               &"', " & _
'                     "        '"& trim(rsL("Usr_Imagen")) &"') "

            sqlins = "insert into HRM10008                             " & _
                     "values ('"& rdm                             &"', " & _
                     "        '"& trim(rsL("Emp_EmpleadoID"))     &"', " & _
                     "        '"& trim(rsL("Emp_NombreCompleto")) &"', " & _
                     "        '"& trim(rsL("Pue_Descripcion"))    &"', " & _
                     "        '"& trim(rsL("Emp_CompaniaID"))     &"', " & _
                     "        '"& trim(rsL("Cpy_IdiomaID"))       &"', " & _
                     "        '"& trim(rsL("Emp_Foto"))           &"') "
            set rsI = dbconn.execute(sqlins)
        end if
        set rsL = Nothing
        set rs  = Nothing
        set rsI = Nothing
        
        %>
        <form action="index.asp" name="form1" method="post">
            <input type="hidden" name="Sid" value="<%= rdm %>" />
        </form>
        <script>
            document.form1.submit();
        </script>
        <%
    end if
    %>

  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">
        Ingrese sus Datos para iniciar Sesión
        </br>
        Sign in to start your session
    </p>

    <form action="Hrm_Login.asp" name="form1" method="post">
      <div class="form-group has-feedback">
        <input type="text" name="UserID" id="UserID" class="form-control" placeholder="No. Empleado / Employee ID" required value="<%= Usr %>">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="Password" id="Password" class="form-control" placeholder="Contraseña / Password" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      
      <div class="form-group" style="text-align: center">
          <label style="color: #f00">Usuario o Password Incorreccto</label>
          <label style="color: #f00">Wrong Employee ID or Password.</label>
      </div>

      <div class="row">
        <div class="col-xs-8">
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

    <a href="#">Olvidé mi Contraseña / I forgot my password</a><br>

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

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Aceptación Encuestas 360°</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">  
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!--#include file="procedures.asp"-->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <% call men() %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0230' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitPri = trim(rsTrn("Trd_Texto"))
              Case "TitSec"
                TitSec = trim(rsTrn("Trd_Texto"))
              Case "TitCrt"
                TitCrt = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "BxHd03"
                BxHd03 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb1"
                Fr0lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb2"
                Fr0lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd7"
                Tb1Hd7 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd8"
                Tb1Hd8 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn3"
                SmBtn3  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn4"
                SmBtn4  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn5"
                SmBtn5  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn6"
                SmBtn6  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn7"
                SmBtn7  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))
              Case "MsEr01"
                MsEr01  = trim(rsTrn("Trd_Texto"))
              Case "MsEr02"
                MsEr02  = trim(rsTrn("Trd_Texto"))
              Case "MsEr03"
                MsEr03  = trim(rsTrn("Trd_Texto"))
              Case "MsEr04"
                MsEr04  = trim(rsTrn("Trd_Texto"))
              Case "TskTx1"
                TskTx1  = trim(rsTrn("Trd_Texto"))
              Case "TskTx2"
                TskTx2  = trim(rsTrn("Trd_Texto"))
              Case "TskTx3"
                TskTx3  = trim(rsTrn("Trd_Texto"))
              Case "TskTx4"
                TskTx4  = trim(rsTrn("Trd_Texto"))
              Case "TskTx5"
                TskTx5  = trim(rsTrn("Trd_Texto"))
              Case "TskTx6"
                TskTx6  = trim(rsTrn("Trd_Texto"))

              Case "EmMs05"
                EmMs05  = trim(rsTrn("Trd_Texto"))
              Case "EmMs06"
                EmMs06  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    MenErr = ""
    EstOrg = 0
    Dim Dsc
    Dim Ejr
    Dim Sbt7

    Dsc = Request.Querystring("Dsc")
    Ejr = Request.Querystring("Ejr")
    Nem = Request.Querystring("Nem")
    Nmb = Request.Querystring("Nmb")
    Cid = Request.Querystring("Cid")


    Sbt7 = Request.Form("Sbt7")
    Subtit = Dsc

    Emx = 15

    '<!--  Buscamos el Email del Autorizador Inicio -->
    sqlEml = "select Emp_Email from HRM10220 where Emp_EmpleadoID = '"& Uid &"' "
    set rsEml = dbconn.execute(sqlEml)
    if not rsEml.bof and not rsEml.eof then
        Eml = trim(rsEml("Emp_Email"))
    else
        Eml = ""
    end if
    '<!--  Buscamos el Email del Autorizador Final  -->


    '<-- Para Modificarse -->

    if Sbt7 = "Sbt7" then
        Ind = Request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                Nemp = Request.Form("Evl"&i)
                NMemp = Request.Form("NEvl"&i)
                Acb  = 0
                if Request.Form("acp"&i) = "on" then
                    Acb = Acb + 1
                end if
                if Request.Form("elm"&i) = "on" then
                    Acb = Acb + 1
                end if

                if Acb < 2 then
                    if Request.Form("acp"&i) = "on" then
                        sqlupd = "update HRM10540                           " & _
                                 "set    M36_Estatus       = 3              " & _
                                 "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                                 "and    M36_CorporativoID = '5000'         " & _
                                 "and    M36_EmpleadoID    = '"& Nemp &"'   " & _
                                 "and    M36_EvaluadorID   = '"& Uid  &"'   " & _
                                 "and    M36_Estatus       = 1              "
                        set rsupd = dbconn.Execute (sqlupd)
                        'response.write(sqlupd)
                        Fhy = year(date) & "-" & month(date) & "-" & day(date)
                        TskScr = "Hrm_PadeCnsM360.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Nemp & "&Nmb=" & NMemp
                        TskDsc = Dsc & " - " & TskTx5
                        sqlins = "insert into HRM10400                    " & _
                                 "values('PADE',                          " & _
                                 "       '',                              " & _
                                 "       '"& Uid &"',                     " & _
                                 "       '',                              " & _
                                 "       1,                               " & _
                                 "       1,                               " & _
                                 "       '"& Nemp &"',                    " & _
                                 "       '"& Dsc &"',                     " & _
                                 "       '"& Fhy &"',                     " & _
                                 "       '',                              " & _
                                 "       'A',                             " & _
                                 "       '"& TskScr &"',                  " & _
                                 "       '"& TskDsc &"')                  "
                        set rsi = dbconn.execute(sqlins)

                        Jem = ""
                        sqlEml = "select Emp_Email from HRM10220 where Emp_EmpleadoID = '"& Nemp &"' "
                        set rsEml = dbconn.execute(sqlEml)
                        if not rsEml.bof and not rsEml.eof then
                            Jem = trim(rsEml("Emp_Email"))
                        end if

'<!-- Aqui evitamos el error de envio de Emails en ambiente Local de Pruebas -->
'                        Jem = ""
'<!-- -->
'	                    Jem = ""
                        if trim(Jem) <> "" then
                            msgtext = "<b>" & Unm & "  " & EmMs05 & "</b>" & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
                            Set myMail=CreateObject("CDO.Message")
                            myMail.Subject = TskDsc
                            myMail.From = Emc
                            myMail.To = Jem
                            myMail.Cc = Eml
                            myMail.Bcc = "jorge.barron@eryseg.com"
                '            myMail.AddAttachment "C:\inetpub\wwwroot\Hrm\reports\Attch01.txt"
                            myMail.HTMLBody = msgtext
                            myMail.Configuration.Fields.Item _
                            ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
                            myMail.Configuration.Fields.Item _
                            ("http://schemas.microsoft.com/cdo/configuration/smtpserver")=Ems
                            myMail.Configuration.Fields.Item _
                            ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=Emp
                            myMail.Configuration.Fields.Update
                            myMail.Send
                            set myMail=nothing
   	                    end if

                    end if

                    if Request.Form("elm"&i) = "on" then
                        sqlupd = "update HRM10502                         " & _
                                 "set Psm_Estatus         = 0             " & _
                                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                                 "and   Psm_CorporativoID = '5000'        " & _
                                 "and   Psm_EmpleadoID    = '"& Nemp &"'  " & _
                                 "and   Psm_SemaforoID    = 'MAT3600010'  "
                        set rsu = dbconn.execute(sqlupd)
                        sqlupd = "update HRM10540                           " & _
                                 "set    M36_Estatus       = 0              " & _
                                 "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                                 "and    M36_CorporativoID = '5000'         " & _
                                 "and    M36_EmpleadoID    = '"& Nemp &"'   " & _
                                 "and    M36_EvaluadorID   = '"& Uid  &"'   " & _
                                 "and    M36_Estatus       = 1              "
                        set rsupd = dbconn.Execute (sqlupd)
'                        response.write(sqlupd)
                        Fhy = year(date) & "-" & month(date) & "-" & day(date)
                        TskScr = "Hrm_PadeCnsM360.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Nemp & "&Nmb=" & NMemp
                        TskDsc = Dsc & " - " & TskTx6
                        sqlins = "insert into HRM10400                    " & _
                                 "values('PADE',                          " & _
                                 "       '',                              " & _
                                 "       '"& Uid &"',                     " & _
                                 "       '',                              " & _
                                 "       1,                               " & _
                                 "       1,                               " & _
                                 "       '"& Nemp &"',                    " & _
                                 "       '"& Dsc &"',                     " & _
                                 "       '"& Fhy &"',                     " & _
                                 "       '',                              " & _
                                 "       'A',                             " & _
                                 "       '"& TskScr &"',                  " & _
                                 "       '"& TskDsc &"')                  "
                        set rsi = dbconn.execute(sqlins)

                        Jem = ""
                        sqlEml = "select Emp_Email from HRM10220 where Emp_EmpleadoID = '"& Nemp &"' "
                        set rsEml = dbconn.execute(sqlEml)
                        if not rsEml.bof and not rsEml.eof then
                            Jem = trim(rsEml("Emp_Email"))
                        end if

'<!-- Aqui evitamos el error de envio de Emails en ambiente Local de Pruebas -->
'                        Jem = ""
'<!-- -->
	                    if trim(Jem) <> "" then
                            msgtext = "<b>" & Unm & "  " & EmMs06 & "</b>" & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
                            Set myMail=CreateObject("CDO.Message")
                            myMail.Subject = TskDsc
                            myMail.From = Emc
                            myMail.To = Jem
                            myMail.Cc = Eml
                '            myMail.AddAttachment "C:\inetpub\wwwroot\Hrm\reports\Attch01.txt"
                            myMail.HTMLBody = msgtext
                            myMail.Configuration.Fields.Item _
                            ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
                            myMail.Configuration.Fields.Item _
                            ("http://schemas.microsoft.com/cdo/configuration/smtpserver")=Ems
                            myMail.Configuration.Fields.Item _
                            ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=Emp
                            myMail.Configuration.Fields.Update
                            myMail.Send
                            set myMail=nothing
   	                    end if

                        'response.write(sqlupd)
                    end if
                end if
            next
        end if
    end if

    Dim Acp
    sqlAcp = "select isnull(count(M36_EvaluadorID),0) as Num  " & _
             "from HRM10540                                   " & _
             "where M36_Ejercicio     =  "& Ejr &"            " & _
             "and   M36_CorporativoID = '5000'                " & _
             "and   M36_EvaluadorID   = '"& Uid &"'           " & _
             "and   M36_Estatus       > 2                     "

    set rsAcp = dbconn.execute(sqlAcp)
    if not rsAcp.bof and not rsAcp.eof then
        Acp = Cint(rsAcp("Num"))
    else
        Acp = 0
    end if
    %>

    <% call hdr(TitCrt,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><%= BxHd03 %><label style="font-size: small">&nbsp;&nbsp;(<%= Acp & "/15" %>)</label></h3>
                <br>&nbsp;</br>
            </div>


            <form action="Hrm_PadeAutEnc.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid & "&Nem=" & Uid & "&Nmb=" & Unm %>" name="form1" method="post">
            <%
            sqlEvl = "select a.*,        b.Emp_NombreCompleto,           " & _
                     "      c.Otm_Plaza, d.Pue_Descripcion               " & _
                     "from   HRM10540 a, HRM10220 b,                     " & _
                     "       HRM10100 c, HRM10210 d                      " & _
                     "where a.M36_EmpleadoID      = b.Emp_EmpleadoID     " & _
                     "and   c.Otm_Empleado        = b.Emp_EmpleadoID     " & _
                     "and   c.Otm_id_nivel_puesto = d.Pue_NivelPuestoID  " & _
                     "and   c.Otm_Plaza           = b.Emp_PlazaID        " & _
                     "and   a.M36_Ejercicio       =  "& Ejr &"           " & _
                     "and   a.M36_EvaluadorID     = '"& Uid &"'          " & _
                     "and   a.M36_Estatus         = 1                    "
            'response.write(sqlEvl)
            set rsO = dbconn.execute(sqlEvl)
            if not rsO.bof and not rsO.eof then
                i = 0
                TotEvl = 0
                %>

                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th><%= Tb1Hd1 %></th>
                                <th><%= Tb1Hd2 %></th>
                                <th><%= Tb1Hd7 %></th>
                                <th><%= Tb1Hd8 %></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                            do while not rsO.eof
                                i = i + 1
                                TotEvl = TotEvl + 1
                                %>
                                <tr>
                                    <td>
                                        <input type="hidden" name="<%= "Evl"&i %>" id="<%= "Evl"&i %>" value="<%= trim(rsO("M36_EmpleadoID")) %>" />
                                        <input type="hidden" name="<%= "NEvl"&i %>" id="<%= "NEvl"&i %>" value="<%= trim(rsO("Emp_NombreCompleto")) %>" />
                                        <%= trim(rsO("Pue_Descripcion")) %>
                                    </td>
                                    <td>
                                        <%= trim(rsO("Emp_NombreCompleto")) %>
                                    </td>
                                    <td style="text-align: center">
                                        <input type="checkbox" name="<%= "acp"&i %>" id="<%= "acp"&i %>"  />
                                    </td>
                                    <td style="text-align: center">
                                        <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                    </td>
                                </tr>
                                <%
                                rsO.movenext
                            loop
                            rsO.close
                            set rsO = Nothing
                            %>
                            </tbody>
                        </table>
                        <div class="box-footer" style="text-align: center">
                            <input type="hidden" name="Ind" id="ind" value="<%= i %>" /></input>
                            <button type="submit" class="btn btn-primary" name="Sbt7" id="Sbt7" value="Sbt7" ><%= SmBtn7 %></button>
                        </div>

                <%
            end if
            %>
            </form>


        </div>


    
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <% call footer() %>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });

    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });

  });
</script>

</body>
</html>

<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Asignación de Autorizaciones (Requisicion de Personal) </title>
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

  <!--#include file="procedures.asp"-->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
  <%
  '<!-- Alta de Registros (inicio) -->
  Dim Bta
  Bta = trim(request.Form("BtnAdd"))

  if Bta = "A" then
      Fol = Request.Form("Fol")
      Wfi = Request.Form("Wfi")

      sqlWfl = "select * from HRM10151             " & _
               "where Dwf_ModuloID = 'RecSel'      " & _
               "and   Dwf_Nombre   = '"& Wfi &"'   " & _
               "order by Dwf_Nivel                 "
      set rsptd = dbconn.execute(sqlWfl)
      'response.write(sqlWfl)
      if not rsptd.eof and not rsptd.bof then
          Nal = ""
          Nar = ""
          Frd = 0
          Fhy = year(date) & "-" & month(date) & "-" & day(date)
          Do while not rsptd.eof
              Nal = rsptd("Dwf_Nivel")
              if Frd = 0 then
                  Nar = Nal
                  Frd = 1
              end if
              if Nal <> Nar then
                  sqlins = "insert into HRM10400                               " & _
                           "values ('"& trim(rsptd("Dwf_ModuloID"))      &"',  " & _
                           "        '"& Fol                              &"',  " & _
                           "        '"& trim(rsptd("Dwf_UserID"))        &"',  " & _
                           "        '"& trim(rsptd("Dwf_Nombre"))        &"',  " & _
                           "         "& trim(rsptd("Dwf_Partida"))       &",   " & _
                           "         "& trim(rsptd("Dwf_Nivel"))         &",   " & _
                           "        '"& trim(rsptd("Dwf_EmpleadoID"))    &"',  " & _
                           "        '"& trim(rsptd("Dwf_Descripcion"))   &"',  " & _
                           "        '',                                        " & _
                           "        '',                                        " & _
                           "        'H',                                       " & _
                           "        '"& trim(rsptd("Dwf_Observaciones")) &"')  "
                  'response.write(sqlins)
                  set rsi = dbconn.execute(sqlins)
              else
                  sqlins = "insert into HRM10400                               " & _
                           "values ('"& trim(rsptd("Dwf_ModuloID"))      &"',  " & _
                           "        '"& Fol                              &"',  " & _
                           "        '"& trim(rsptd("Dwf_UserID"))        &"',  " & _
                           "        '"& trim(rsptd("Dwf_Nombre"))        &"',  " & _
                           "         "& trim(rsptd("Dwf_Partida"))       &",   " & _
                           "         "& trim(rsptd("Dwf_Nivel"))         &",   " & _
                           "        '"& trim(rsptd("Dwf_EmpleadoID"))    &"',  " & _
                           "        '"& trim(rsptd("Dwf_Descripcion"))   &"',  " & _
                           "        '"& Fhy                              &"',  " & _
                           "        '',                                        " & _
                           "        'A',                                       " & _
                           "        '"& trim(rsptd("Dwf_Observaciones")) &"')  "
                  'response.write(sqlins)
                  set rsi = dbconn.execute(sqlins)
              end if
              rsptd.movenext
          Loop
          rsptd.close
          set rsptd = Nothing
          sqlUfl = "update HRM10251                 " & _
                   "set Rps_Estatus = 'G'           " & _
                   "where Rps_Folio = '"& Fol &"'   "
          set rsUfl = dbconn.execute(sqlUfl)
      end if
      response.redirect "Hrm_RSGesReq.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
  end if

  '<!-- Alta de Registros (fin) -->
  %>

</html>

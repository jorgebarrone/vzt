<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Administrador 09</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">

  <!-- daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">

  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!--#include file="procedures.asp"-->
  <!--#include file="Hrm_PadeAdmin_Tabs.asp"-->

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
    <% call hdr(TitPri,SubTit) %>

    <%
    dim Elm

   '<!-- Buscamos las "etiquetas" para la seleccion del Empleado -->
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0100' and Trd_IdiomaID = '"& Lng &"' and Trd_ElementoID IN ('Fr1Lb1', 'Fr1Ph1', 'FrLgn1', 'SmBtn3', 'BxHd07') "

    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "Fr1Lb1"
                Sl1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Sl1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "BxHd07"
                BxHd07 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn3"
                SmBtn3  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
        rsTrn.close
        set rsTrn = Nothing
    end if


   '<!-- Buscamos las "etiquetas" para el Reporte Ejecutivo -->
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0200' and Trd_IdiomaID = '"& Lng &"'  "

    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "Tab001"
                Tab001 = trim(rsTrn("Trd_Texto"))
              Case "Tab002"
                Tab002 = trim(rsTrn("Trd_Texto"))
              Case "Tab003"
                Tab003 = trim(rsTrn("Trd_Texto"))
              Case "Tab004"
                Tab004 = trim(rsTrn("Trd_Texto"))
              Case "Tab005"
                Tab005 = trim(rsTrn("Trd_Texto"))
              Case "Tab006"
                Tab006 = trim(rsTrn("Trd_Texto"))
              Case "Tab007"
                Tab007 = trim(rsTrn("Trd_Texto"))
              Case "Tab008"
                Tab008 = trim(rsTrn("Trd_Texto"))
              Case "Tab009"
                Tab009 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb3"
                Fr1Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb4"
                Fr1Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb5"
                Fr1Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb6"
                Fr1Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb7"
                Fr1Lb7 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb8"
                Fr1Lb8 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb9"
                Fr1Lb9 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb10"
                Fr1Lb10 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb11"
                Fr1Lb11 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb12"
                Fr1Lb12 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph12"
                Fr1Ph12 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb13"
                Fr1Lb13 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph13"
                Fr1Ph13 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb14"
                Fr1Lb14 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph14"
                Fr1Ph14 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb15"
                Fr1Lb15 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph15"
                Fr1Ph15 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb16"
                Fr1Lb16 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph16"
                Fr1Ph16 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb17"
                Fr1Lb17 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph17"
                Fr1Ph17 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb18"
                Fr1Lb18 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph18"
                Fr1Ph18 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb19"
                Fr1Lb19 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph19"
                Fr1Ph19 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb20"
                Fr1Lb20 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph20"
                Fr1Ph20 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb21"
                Fr1Lb21 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph21"
                Fr1Ph21 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb22"
                Fr1Lb22 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph22"
                Fr1Ph22 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb23"
                Fr1Lb23 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph23"
                Fr1Ph23 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb24"
                Fr1Lb24 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph24"
                Fr1Ph24 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb25"
                Fr1Lb25 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph25"
                Fr1Ph25 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb26"
                Fr1Lb26 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph26"
                Fr1Ph26 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb27"
                Fr1Lb27 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph27"
                Fr1Ph27 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb28"
                Fr1Lb28 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph28"
                Fr1Ph28 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb29"
                Fr1Lb29 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph29"
                Fr1Ph29 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb30"
                Fr1Lb30 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph30"
                Fr1Ph30 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb31"
                Fr1Lb31 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph31"
                Fr1Ph31 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb32"
                Fr1Lb32 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph32"
                Fr1Ph32 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb33"
                Fr1Lb33 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph33"
                Fr1Ph33 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb34"
                Fr1Lb34 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph34"
                Fr1Ph34 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S1o1"
                Fr1S1o1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S1o2"
                Fr1S1o2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S1o3"
                Fr1S1o3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S1o4"
                Fr1S1o4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S1o5"
                Fr1S1o5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S2o1"
                Fr1S2o1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S2o2"
                Fr1S2o2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S3o1"
                Fr1S3o1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1S3o2"
                Fr1S3o2 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb1"
                Fr2Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph1"
                Fr2Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb2"
                Fr2Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph2"
                Fr2Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb3"
                Fr2Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph3"
                Fr2Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb4"
                Fr2Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph4"
                Fr2Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Bh1"
                Fr2Bh1 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Bh2"
                Fr2Bh2 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Lb1"
                Fr3Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Ph1"
                Fr3Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Bh1"
                Fr4Bh1 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Bh2"
                Fr4Bh2 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Lb1"
                Fr4Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Ph1"
                Fr4Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Lb2"
                Fr4Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Ph2"
                Fr4Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Lb3"
                Fr4Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Ph3"
                Fr4Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Lb4"
                Fr4Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Ph4"
                Fr4Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Lb5"
                Fr4Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr4Ph5"
                Fr4Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Bh2"
                Fr5Bh2 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Lb1"
                Fr5Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Ph1"
                Fr5Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Lb2"
                Fr5Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Ph2"
                Fr5Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Lb3"
                Fr5Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Ph3"
                Fr5Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Lb4"
                Fr5Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Ph4"
                Fr5Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Lb5"
                Fr5Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Ph5"
                Fr5Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Lb6"
                Fr5Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Ph6"
                Fr5Ph6 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Lb7"
                Fr5Lb7 = trim(rsTrn("Trd_Texto"))
              Case "Fr5Ph7"
                Fr5Ph7 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Bh2"
                Fr6Bh2 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Lb1"
                Fr6Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Ph1"
                Fr6Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Lb2"
                Fr6Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Ph2"
                Fr6Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Lb3"
                Fr6Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Ph3"
                Fr6Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Lb4"
                Fr6Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Ph4"
                Fr6Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Lb5"
                Fr6Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Ph5"
                Fr6Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Lb6"
                Fr6Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Fr6Ph6"
                Fr6Ph6 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Bh2"
                Fr7Bh2 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Lb1"
                Fr7Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Ph1"
                Fr7Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Lb2"
                Fr7Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Ph2"
                Fr7Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Lb3"
                Fr7Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Ph3"
                Fr7Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Lb4"
                Fr7Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Ph4"
                Fr7Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Lb5"
                Fr7Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr7Ph5"
                Fr7Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr7S1o1"
                Fr7S1o1 = trim(rsTrn("Trd_Texto"))
              Case "Fr7S1o2"
                Fr7S1o2 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb1"
                Fr8Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph1"
                Fr8Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb2"
                Fr8Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph2"
                Fr8Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb3"
                Fr8Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph3"
                Fr8Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb4"
                Fr8Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph4"
                Fr8Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb5"
                Fr8Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph5"
                Fr8Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb6"
                Fr8Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph6"
                Fr8Ph6 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb7"
                Fr8Lb7 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph7"
                Fr8Ph7 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Lb8"
                Fr8Lb8 = trim(rsTrn("Trd_Texto"))
              Case "Fr8Ph8"
                Fr8Ph8 = trim(rsTrn("Trd_Texto"))
              Case "Fr9Lb1"
                Fr9Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr9Ph1"
                Fr9Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr9Lb2"
                Fr9Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr9Ph2"
                Fr9Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd4"
                Tb1Hd4 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd5"
                Tb1Hd5 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd1"
                Tb2Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd2"
                Tb2Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd3"
                Tb2Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd4"
                Tb2Hd4 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd5"
                Tb2Hd5 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St1"
                Tb2St1 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St2"
                Tb2St2 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St3"
                Tb2St3 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St4"
                Tb2St4 = trim(rsTrn("Trd_Texto"))

                Case "Nav001"
                  Nav001 = trim(rsTrn("Trd_Texto"))
                Case "Nav002"
                  Nav002 = trim(rsTrn("Trd_Texto"))
                Case "Nav003"
                  Nav003 = trim(rsTrn("Trd_Texto"))
                Case "Nav004"
                  Nav004 = trim(rsTrn("Trd_Texto"))
                Case "Nav005"
                  Nav005 = trim(rsTrn("Trd_Texto"))

                Case "Tab010"
                  Tab010 = trim(rsTrn("Trd_Texto"))
                Case "Tb10H1"
                  Tb10H1 = trim(rsTrn("Trd_Texto"))
                Case "Tb10H2"
                  Tb10H2 = trim(rsTrn("Trd_Texto"))

                Case "Tab011"
                  Tab011 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H1"
                  Tb11H1 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H2"
                  Tb11H2 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H3"
                  Tb11H3 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H4"
                  Tb11H4 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H5"
                  Tb11H5 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H6"
                  Tb11H6 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H7"
                  Tb11H7 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H8"
                  Tb11H8 = trim(rsTrn("Trd_Texto"))
                Case "Tb11H9"
                  Tb11H9 = trim(rsTrn("Trd_Texto"))

              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn4"
                SmBtn4  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
        rsTrn.close
        set rsTrn = Nothing
    end if

   '<!-- Buscamos si se trata de una consulta de un Empleado en especifico, de lo contrario mostramos la información del Empleado que está conectado -->
    Dim Eid
    Dim Enm
    Dim Sb3
    Eid = ""
    Enm = ""
    Sb3 = ""
    Sb3 = trim(Request.Form("Sb3"))
    Eid = trim(Request.QueryString("Eid"))
    if Eid = "" then
        Eid = trim(Request.Form("Eid"))
        if Eid = "" then
            Eid = Uid
        end if
    end if

    sqlCia = "select Emp_CompaniaID, Emp_NombreCompleto, Emp_Foto from HRM10220 where Emp_Empleadoid = '"& Eid &"' "
    set rsCia = dbconn.execute(sqlCia)
    if not rsCia.bof and not rsCia.eof then
        Cid = trim(rsCia("Emp_CompaniaID"))
        Enm = trim(rsCia("Emp_NombreCompleto"))
        Eim = trim(rsCia("Emp_Foto"))
    else
        Cid = ""
        Enm = ""
        Eim = ""
    end if

    '<!--  Buscamos la Imagen del Empleado Inicio -->
    sqlImg = "select a.Emp_NombreCompleto, a.Emp_Foto,      " & _
             "       a.Emp_CompaniaID,     a.Emp_Email,     " & _
             "       c.Pue_Descripcion                      " & _
             "from HRM10220 a, HRM10210 c                   " & _
             "where a.Emp_CompaniaID = c.Pue_CompaniaID     " & _
             "and   a.Emp_PuestoID   = c.Pue_NivelPuestoID  " & _
             "and   a.Emp_NivelID    = c.Pue_NivelID        " & _
             "and   a.Emp_EmpleadoID = '"& Eid &"'          " & _
             "and   a.Emp_CompaniaID = '"& Cid &"'          "
    set rsImg = dbconn.execute(sqlImg)
    if not rsImg.bof and not rsImg.eof then
        Cid = trim(rsImg("Emp_CompaniaID"))
        Enm = trim(rsImg("Emp_NombreCompleto"))
        Eim = trim(rsImg("Emp_Foto"))
        Eml = trim(rsImg("Emp_Email"))
        Epd = trim(rsImg("Pue_Descripcion"))
    else
        Cid = ""
        Enm = ""
        Eim = ""
        Eml = ""
        Epd = ""
    end if

   '<!-- Buscamos si se trata de una consulta de un Ejercicio en especifico, de lo contrario mostramos la información del Ejercicio que esté activo -->
    Dim Ejr
    Ejr = 0
    Ejr = trim(Request.QueryString("Ejr"))
    if Ejr = "" then
        Ejr = Request.Form("Ejr")
        if Ejr = "" then
            Ejr = 0
        end if
    end if

    '<-- Busqueda de Parámetros PADE (Inicio) -->
    if Ejr = 0 then
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Estatus = 'A'               "
    else
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Ejercicio = "& Ejr &"       "
    end if
    set rse = dbconn.execute(sqlEjr)
    if not rse.bof and not rse.eof then
        Ejr = rse("Pde_Ejercicio")
        Eja = CInt(rse("Pde_Ejercicio")) - 1
        Dsc = trim(rse("Pde_Descripcion"))
    else
        Ejr = 0
        Eja = 0
        Dsc = ""
    end if

    lp1 = "PROCESO PADE 2017"
    lp2 = "PROCESO PADE 2016"
    cp1 = "rgba(0, 135, 32, 1)"
    cp2 = "rgba(0, 135, 32, 1)"
    dp1 = 95
    dp2 = 94

    %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->

        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <% call MnuTabs() %>
                    </ul>
                    <div class="tab-content">
                        <div class="<%= Pan9St %>" id="main" >
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#Listado" data-toggle="tab"><%= Opt009 %></a></li>
                                <li><a href="Hrm_PadeAdmin09Pdf.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&EjerID=" & Ejr & "&Eid=" & Eid & "&Sid=" & Sid %>" target="_blank"><%= BxHd07 %></a></li>
                            </ul>

                            <div class="tab-content">

                                <!-- Listado de Movimientos -->
                                <div class="tab-pane active" id="Listado" >


                                    <div class="box box-success">
                                        <form action="Hrm_PadeAdmin09.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=9" & "&Sid=" & Sid %>" name="form1" method="post">
                                            <!-- form start -->
                                            <div class="box-body">
                                                <div class="row fontawesome-icon-list">
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label><%= Sl1Lb1 %></label>
                                                            <select class="form-control" size="1" id="Eid" name="Eid" required>
                                                                <option class="form-control" value=""><%= Sl1Ph1 %></option>
                                                                <%
                                                                sqlEmp = "select Emp_EmpleadoID, Emp_NombreCompleto  " & _
                                                                         "from HRM10220 order by Emp_NombreCompleto  "
                                                                set rsE = dbconn.execute(sqlEmp)
                                                                if not rsE.bof and not rsE.eof then
                                                                    do while not rsE.eof
                                                                        %>
                                                                        <option class="form-control" value="<%= rsE("Emp_EmpleadoID") %>"><%= trim(rsE("Emp_NombreCompleto")) %></option>
                                                                        <%
                                                                        rsE.movenext
                                                                    loop
                                                                    rsE.close
                                                                    set rsE = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00"><%= FrLgn1 %></label>
                                                            <br/>
                                                            <button type="submit" class="btn btn-primary" name="Sb3" id="Sb3" value="Sb3"><%= SmBtn3 %></button>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                            <!-- /.box-body -->
                                        </form>


                                        <%
                                        if Sb3 = "Sb3" then
                                            Nem = Eid
                                            %>
                                            <div class="box box-success">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">
                                                        <img alt="Verzatec" src="images/verza01.gif" height="80px">&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <img src="<%= Eim %>" style="height: 80px;" alt="<%= Enm %>">&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <%= Eid & " - " & Enm & " - " & Epd %>
                                                    </h3>
                                                </div>
                                                <!-- form start -->
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                        <!-- DATOS GENERALES -->
                                                        <%
                                                        sqlDem = "select a.*, b.Cpt_Descripcion as DscAid,  " & _
                                                                 "       c.Cpt_Descripcion as DscEid        " & _
                                                                 "from HRM10517 a, HRM10599 b, HRM10599 c   " & _
                                                                 "where a.Dem_AreaID        = b.Cpt_Id      " & _
                                                                 "and   b.Cpt_Idioma        = '"& Lng &"'   " & _
                                                                 "and   a.Dem_ExperienciaID = c.Cpt_Id      " & _
                                                                 "and   c.Cpt_Idioma        = '"& Lng &"'   " & _
                                                                 "and   a.Dem_CorporativoID = '5000'        " & _
                                                                 "and   a.Dem_CompaniaID    = '"& Cid &"'   " & _
                                                                 "and   a.Dem_EmpleadoID    = '"& Nem &"'   "
                                                        set rsD = dbconn.execute(sqlDem)
                                                        if not rsD.eof and not rsD.bof then
                                                            %>
                                                            <div class="box box-info box-solid collapsed-box">
                                                                <div class="box-header with-border">
                                                                    <h3 class="box-title"><%= Tab008 %></h3>
                                                                    <div class="box-tools pull-right">
                                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                                                    </div>
                                                                </div>
                                                                <!-- /.box-header -->
                                                                <div class="box-body">
                                                                    <div class="table-responsive" style="font-size: small">
                                                                        <table class="table no-margin">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th><%= Fr8Lb1 %></th>
                                                                                    <th><%= Fr8Lb2 %></th>
                                                                                    <th><%= Fr8Lb3 %></th>
                                                                                    <th><%= Fr8Lb4 %></th>
                                                                                    <th><%= Fr8Lb7 %></th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <%
                                                                            i = 0
                                                                            do while not rsD.eof
                                                                                i = i + 1
                                                                                if trim(rsD("Dem_FecIni")) > "" then
                                                                                    DemFic = CStr(trim(rsD("Dem_FecIni")))
                                                                                    DemFcs = Mid(DemFic,6,2) & "/" & Mid(DemFic,9,2) & "/" & Mid(DemFic,1,4) & " - " & Mid(DemFfn,6,2) & "/" & Mid(DemFfn,9,2) & "/" & Mid(DemFfn,1,4)
                                                                                else
                                                                                    DemFic = ""
                                                                                    DemFcs = " - "
                                                                                end if
                                                                                if trim(rsD("Dem_FecFin")) > "" then
                                                                                    DemFfn = CStr(trim(rsD("Dem_FecFin")))
                                                                                    DemFcs = DemFcs & Mid(DemFfn,6,2) & "/" & Mid(DemFfn,9,2) & "/" & Mid(DemFfn,1,4)
                                                                                else
                                                                                    DemFfn = ""
                                                                                    DemFcs = DemFcs & ""
                                                                                end if
                                                                                %>
                                                                                <tr>
                                                                                    <td><%= trim(rsD("Dem_Empresa")) %></td>
                                                                                    <td><%= trim(rsD("DscAid")) %></td>
                                                                                    <td><%= trim(rsD("DscEid")) %></td>
                                                                                    <td><%= trim(rsD("Dem_Puesto")) %></td>
                                                                                    <td><%= DemFcs %></td>
                                                                                </tr>
                                                                                <%
                                                                                rsD.movenext
                                                                            loop
                                                                            rsD.close
                                                                            set rsD = Nothing
                                                                            %>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                    <!-- /.table-responsive -->
                                                                </div>
                                                                <!-- /.box-body -->
                                                            </div>
                                                            <!-- /.box -->
                                                            <%
                                                        end if
                                                        %>
                                                        </div>

                                                        <div class="col-md-4">
                                                        <%
                                                        sqlDin = "select a.*, b.Cpt_Descripcion as DscAid,  " & _
                                                                 "       c.Cpt_Descripcion as DscEid        " & _
                                                                 "from HRM10518 a, HRM10599 b, HRM10599 c   " & _
                                                                 "where a.Din_AreaID        = b.Cpt_Id      " & _
                                                                 "and   b.Cpt_Idioma        = '"& Lng &"'   " & _
                                                                 "and   a.Din_ActividadID   = c.Cpt_Id      " & _
                                                                 "and   c.Cpt_Idioma        = '"& Lng &"'   " & _
                                                                 "and   a.Din_CorporativoID = '5000'        " & _
                                                                 "and   a.Din_CompaniaID    = '"& Cid &"'   " & _
                                                                 "and   a.Din_EmpleadoID    = '"& Nem &"'   "
                                                        set rsD = dbconn.execute(sqlDin)
                                                        if not rsD.eof and not rsD.bof then
                                                            %>
                                                            <!-- INTERESES -->
                                                            <div class="box box-primary box-solid collapsed-box">
                                                                <div class="box-header with-border">
                                                                    <h3 class="box-title"><%= Tab009 %></h3>
                                                                    <div class="box-tools pull-right">
                                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                                                    </div>
                                                                </div>
                                                                <!-- /.box-header -->
                                                                <div class="box-body">
                                                                    <div class="table-responsive" style="font-size: small">
                                                                        <table class="table no-margin">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th><%= Fr9Lb1 %></th>
                                                                                    <th><%= Fr9Lb2 %></th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <%
                                                                            i = 0
                                                                            do while not rsD.eof
                                                                                i = i + 1
                                                                                %>
                                                                                <tr>
                                                                                    <td>
                                                                                        <input type="hidden" name="<%= "DinAid"&i %>" id="<%= "DinAid"&i %>" value="<%= trim(rsD("Din_AreaID")) %>" />
                                                                                        <input type="hidden" name="<%= "DinEid"&i %>" id="<%= "DinEid"&i %>" value="<%= trim(rsD("Din_ActividadID")) %>" />
                                                                                        <%= trim(rsD("DscAid")) %>
                                                                                    </td>
                                                                                    <td><%= trim(rsD("DscEid")) %></td>
                                                                                </tr>
                                                                                <%
                                                                                rsD.movenext
                                                                            loop
                                                                            rsD.close
                                                                            set rsD = Nothing
                                                                            %>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <!-- /.box-body -->
                                                            </div>
                                                            <!-- /.box -->
                                                            <%
                                                        end if
                                                        %>
                                                        </div>
                                                    </div>

                                                    <%
                                                    sqlDsc = "select *from HRM10514                  " & _
                                                             "where Dsc_EmpleadoID =  '"& Nem &"'    "
                                                    set rsD = dbconn.execute(sqlDsc)
                                                    if not rsD.eof and not rsD.bof then
                                                        %>
                                                        <div class="box box-warning box-solid collapsed-box">
                                                            <div class="box-header">
                                                                <h3 class="box-title"><%= Tab005 %></h3>
                                                                <div class="box-tools pull-right">
                                                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                                                </div>
                                                            </div>
                                                            <div class="box-body">
                                                                <div class="table-responsive" style="font-size: small">
                                                                <table class="table table-bordered table-striped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><%= Fr5Lb1 %></th>
                                                                            <th><%= Fr5Lb2 %></th>
                                                                            <th><%= Fr5Lb3 %></th>
                                                                            <th><%= Fr5Lb4 %></th>
                                                                            <th><%= Fr5Lb5 %></th>
                                                                            <th><%= Fr5Lb6 %></th>
                                                                            <th><%= Fr5Lb7 %></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <%
                                                                        i = 0
                                                                        do while not rsD.eof
                                                                            i = i + 1
                                                                            if trim(rsD("Dsc_FechaIni")) > "" then
                                                                                DscFin = CStr(trim(rsD("Dsc_FechaIni")))
                                                                                DscFin = Mid(DscFin,6,2) & "/" & Mid(DscFin,9,2) & "/" & Mid(DscFin,1,4)
                                                                            else
                                                                                DscFin = ""
                                                                            end if
                                                                            if trim(rsD("Dsc_FechaFin")) > "" then
                                                                                DscFfn = CStr(trim(rsD("Dsc_FechaFin")))
                                                                                DscFfn = Mid(DscFfn,6,2) & "/" & Mid(DscFfn,9,2) & "/" & Mid(DscFfn,1,4)
                                                                            else
                                                                                DscFfn = ""
                                                                            end if
                                                                            %>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="hidden" name="<%= "Niv"&i %>" id="<%= "Niv"&i %>" value="<%= trim(rsD("Dsc_Nivel")) %>" />
                                                                                    <input type="hidden" name="<%= "Est"&i %>" id="<%= "Est"&i %>" value="<%= trim(rsD("Dsc_Estudios")) %>" />
                                                                                    <%= trim(rsD("Dsc_Nivel")) %>
                                                                                </td>
                                                                                <td><%= trim(rsD("Dsc_Estudios")) %></td>
                                                                                <td><%= trim(rsD("Dsc_Institucion")) %></td>
                                                                                <td><%= trim(rsD("Dsc_Avance")) %></td>
                                                                                <td><%= trim(rsD("Dsc_Estatus")) %></td>
                                                                                <td><%= DscFin %></td>
                                                                                <td><%= DscFfn %></td>
                                                                            </tr>
                                                                            <%
                                                                            rsD.movenext
                                                                        loop
                                                                        rsD.close
                                                                        set rsD = Nothing
                                                                        %>
                                                                    </tbody>
                                                                </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%
                                                    end if
                                                    %>


                                                    <%
                                                    sqlDcr = "select *from HRM10516                  " & _
                                                             "where Dcr_EmpleadoID =  '"& Nem &"'    "
                                                    set rsD = dbconn.execute(sqlDcr)
                                                    if not rsD.eof and not rsD.bof then
                                                        %>
                                                        <div class="box box-danger box-solid collapsed-box">
                                                            <div class="box-header">
                                                                <h3 class="box-title"><%= Tab007 %></h3>
                                                                <div class="box-tools pull-right">
                                                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                                                </div>
                                                            </div>
                                                            <div class="box-body">
                                                                <div class="table-responsive" style="font-size: small">
                                                                <table class="table table-bordered table-striped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><%= Fr7Lb1 %></th>
                                                                            <th><%= Fr7Lb2 %></th>
                                                                            <th><%= Fr7Lb3 %></th>
                                                                            <th><%= Fr7Lb4 %></th>
                                                                            <th><%= Fr7Lb5 %></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <%
                                                                        i = 0
                                                                        do while not rsD.eof
                                                                            i = i + 1
                                                                            if trim(rsD("Dcr_IntExt")) = "I" then
                                                                                DcrTip = Fr7S1o1
                                                                            else
                                                                                DcrTip = Fr7S1o2
                                                                            end if
                                                                            FecCrs = CStr(trim(rsD("Dcr_Fecha")))
                                                                            FecCrs = Mid(FecCrs,6,2) & "/" & Mid(FecCrs,9,2) & "/" & Mid(FecCrs,1,4)
                                                                            %>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="hidden" name="<%= "DidCur"&i %>" id="<%= "DidCur"&i %>" value="<%= trim(rsD("Dcr_Curso")) %>" />
                                                                                    <%= trim(rsD("Dcr_Curso")) %>
                                                                                </td>
                                                                                <td><%= trim(rsD("Dcr_Institucion")) %></td>
                                                                                <td><%= trim(rsD("Dcr_Horas")) %></td>
                                                                                <td><%= FecCrs %></td>
                                                                                <td><%= DcrTip %></td>
                                                                            </tr>
                                                                            <%
                                                                            rsD.movenext
                                                                        loop
                                                                        rsD.close
                                                                        set rsD = Nothing
                                                                        %>
                                                                    </tbody>
                                                                </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%
                                                    end if
                                                    %>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="box box-primary box-solid collapsed-box">
                                                                <div class="box-header with-border">
                                                                    <h3 class="box-title"><%= Tab010 %></h3>
                                                                    <div class="box-tools pull-right">
                                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                                                    </div>
                                                                </div>
                                                                <div class="box-body">
                                                                    <div class="table-responsive" style="font-size: small">
                                                                        <table class="table no-margin">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th><%= Tb10H1 %></th>
                                                                                    <th><%= Tb10H2 %></th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>

                                                                            </tbody>
                                                                            <%
                                                                            sqlEvl = "select e.Evh_EmpleadoID, d.Pde_Descripcion,   " & _
                                                                                     "       e.Evh_ResCalc                          " & _
                                                                                     "from   HRM10525 e, HRMA0500 d                 " & _
                                                                                     "where  e.Evh_Ejercicio  = d.Pde_Ejercicio     " & _
                                                                                     "and    d.Pde_IdiomaID   = '"& Lng &"'         " & _
                                                                                     "and    e.Evh_Ejercicio  =  "& Eja &"          " & _
                                                                                     "and    e.Evh_CompaniaID = '"& Cid &"'         " & _
                                                                                     "and    e.Evh_EmpleadoID = '"& Nem &"'         " & _
                                                                                     "order by e.Evh_Ejercicio desc                 "
                                                                            set rsEvl = dbconn.execute(sqlEvl)
                                                                            if not rsEvl.bof and not rsEvl.eof then
                                                                                do while not rsEvl.eof
                                                                                    %>
                                                                                    <tr>
                                                                                        <td><%= trim(rsEvl("Pde_Descripcion")) %></td>
                                                                                        <td><%= formatnumber(rsEvl("Evh_ResCalc"),4) %></td>
                                                                                    </tr>
                                                                                    <%
                                                                                    rsEvl.movenext
                                                                                loop
                                                                                rsEvl.close
                                                                                set rsEvl = Nothing
                                                                            end if
                                                                            %>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <!-- /.box-body -->
                                                            </div>
                                                            <!-- /.box -->
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="box box-info box-solid collapsed-box">
                                                                <div class="box-header">
                                                                    <h3 class="box-title"><%= Tab011 %></h3>
                                                                    <div class="box-tools pull-right">
                                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                                                    </div>
                                                                </div>
                                                                <div class="box-body" style="font-size: small">
                                                                <%
                                                                sqlAcc = "select a.Ara_Texto,           b.Rta_Texto as TipAcc,  " & _
                                                                         "       c.Rta_Texto as TipPri, d.Rta_Texto as TipAre   " & _
                                                                         "from HRM10551 a, HRM10550 b, HRM10550 c, HRM10550 d   " & _
                                                                         "where a.Ara_TipoAccionID  = b.Rta_ClaveID             " & _
                                                                         "and   b.Rta_TipoID        = 1                         " & _
                                                                         "and   b.Rta_IdiomaID      = '"& Lng &"'               " & _
                                                                         "and   a.Ara_PrioridadID   = c.Rta_ClaveID             " & _
                                                                         "and   c.Rta_TipoID        = 2                         " & _
                                                                         "and   c.Rta_IdiomaID      = '"& Lng &"'               " & _
                                                                         "and   a.Ara_TipoAreaID    = d.Rta_ClaveID             " & _
                                                                         "and   d.Rta_TipoID        = 3                         " & _
                                                                         "and   d.Rta_IdiomaID      = '"& Lng &"'               " & _
                                                                         "and   a.Ara_Ejercicio     =  "& Ejr &"                " & _
                                                                         "and   a.Ara_CorporativoID = '5000'                    " & _
                                                                         "and   a.Ara_CompaniaID    = '"& Cid &"'               " & _
                                                                         "and   a.Ara_EmpleadoID    = '"& Nem &"'               "
                                                                set rsO = dbconn.execute(sqlAcc)
                                                                'response.write(sqlAcc)
                                                                if not rsO.bof and not rsO.eof then
                                                                    i = 0
                                                                    TotEvl = 0
                                                                    %>
                                                                    <table class="table table-bordered table-striped">
                                                                        <thead>
                                                                        <tr>
                                                                            <th><%= Tb11H1 %></th>
                                                                            <th><%= Tb11H2 %></th>
                                                                            <th><%= Tb11H3 %></th>
                                                                            <th><%= Tb11H5 %></th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                    <%
                                                                    do while not rsO.eof
                                                                        i = i + 1
                                                                        %>
                                                                        <tr>
                                                                            <td><%= trim(rsO("TipAcc")) %></td>
                                                                            <td><%= trim(rsO("TipPri")) %></td>
                                                                            <td><%= trim(rsO("TipAre")) %></td>
                                                                            <td><%= trim(rsO("Ara_Texto")) %></td>
                                                                        </tr>
                                                                        <%
                                                                        rsO.movenext
                                                                    loop
                                                                    rsO.close
                                                                    set rsO = Nothing
                                                                    %>
                                                                        </tbody>
                                                                    </table>
                                                                    <%
                                                                end if
                                                                %>
                                                                </div>
                                                                <!-- /.box -->
                                                            </div>
                                                        </div>
                                                        <!-- /.box-body -->
                                                    </div>
                                                    <!-- /.row -->
                                                </div>
                                            </div>
                                            <%
                                        end if
                                        %>
                                    </div>

                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>

<!-- ChartNew.js charts -->
<script src='plugins/chartsnew/ChartNew.js'></script>
<script src='plugins/chartsnew/Add-ins/shapesInChart.js'></script>

<script>
            var barChartDataPG = {
		    labels : ["<%= lp1 %>","<%= lp2 %>"],
		    datasets : [
			    {
				    fillColor : ["<%= cp1 %>","<%= cp2 %>"],
				    strokeColor : "rgba(151,187,205,0.8)",
				    highlightFill : "rgba(151,187,205,0.75)",
				    highlightStroke : "rgba(151,187,205,1)",
				    data : [<%= dp1 %>,<%= dp2 %>]
			    }
		    ]

            };



            window.onload = function() {
            var ctx1 = document.getElementById("canvasPG").getContext("2d");
            window.myLine = new Chart(ctx1).Bar(barChartDataPG, {
			    responsive : true,
	            inGraphDataShow : true,
    	        legend : true,
	            legendFontFamily : "'Arial'",
	            legendFontSize : 12,
	            legendFontStyle : "normal",
    	        legendFontColor : "#666",
	            legendBlockSize : 15,
	            legendBorders : true,
	            legendBordersWidth : 1,
    	        legendBordersColors : "#666",
	            annotateDisplay : true,
	            logarithmic: true

            });


            }
	    </script>

<script>
    function ClkTab(){

            var barChartDataPG1 = {
		    labels : ['PADE 2016','PADE 2017'],
		    datasets : [
			    {
				    fillColor : ['rgba(0, 135, 32, 1)','rgba(0, 135, 32, 1)'],
				    strokeColor : "rgba(151,187,205,0.8)",
				    highlightFill : "rgba(151,187,205,0.75)",
				    highlightStroke : "rgba(151,187,205,1)",
				    data : [94,95]
			    }
		    ]

            };

            var ctx2 = document.getElementById("canvasPG").getContext("2d");
            window.myLine2 = new Chart(ctx2).Bar(barChartDataPG1, {
			    responsive : true,
	            inGraphDataShow : true,
    	        legend : true,
	            legendFontFamily : "'Arial'",
	            legendFontSize : 12,
	            legendFontStyle : "normal",
    	        legendFontColor : "#666",
	            legendBlockSize : 15,
	            legendBorders : true,
	            legendBordersWidth : 1,
    	        legendBordersColors : "#666",
	            annotateDisplay : true,
	            logarithmic: true
                });
    }
</script>

</body>
</html>

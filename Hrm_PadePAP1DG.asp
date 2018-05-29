<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Datos Generales</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0200' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitPri = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
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
    end if

    MenErr = ""
    EstOrg = 0

    Dim Prm
    Dim Ejr
    Dim Eid
    Eid = trim(Request.QueryString("Eid"))
    Prm = trim(Request.QueryString("Prm"))
    Ejr = Request.QueryString("Ejr")
    if Prm = "" then
        Prm = trim(Request.Form("Prm"))
        Ejr = trim(Request.Form("Ejr"))
    end if


'---------------------------------------------
'   <-- Actualización de Registros (Inicio) -->
'----------------------------------------------
    sqlfec = "select Pde_P1FecFin from HRM10501 where Pde_Ejercicio = '"& Ejr &"' "
    set rsF = dbconn.execute(sqlfec)
    if not rsF.bof and not rsF.eof then
        P1FecFin = CDate(rsF("Pde_P1FecFin"))
        FecHoy   = Date
        if DateDiff("d", FechHoy, P1FecFin) > 1 Then
            SemEst = 2
        else
            SemEst = 1
        end If
    else
        SemEst = 1
    end if

    sqlcia = "select Emp_CompaniaID, Emp_NombreCompleto from HRM10220 where Emp_CorporativoID = '5000' and Emp_EmpleadoID = '"& Eid &"'  "
    set rsC = dbconn.execute(sqlcia)
    if not rsC.bof and not rsC.eof then
        Cid = trim(rsC("Emp_CompaniaID"))
        Enm = trim(rsC("Emp_NombreCompleto"))
    else
        Cid = ""
        Enm = ""
    end if

'<--  Forma 01 - Datos Generales    -->
    Dim Sbt1 
    Dim Sbt2
    Dim Sbt3
    Dim Sbt4
    Dim Sbt4a
    Dim Dbt4a
    Dim Sbt5 
    Dim Sbt5a
    Dim Dbt5a
    Dim Sbt6
    Dim Sbt6a
    Dim Dbt6a
    Dim Sbt7
    Dim Sbt7a
    Dim Dbt7a
    Dim Sbt8
    Dim Sbt8a
    Dim Dbt8a
    Dim Sbt9
    Dim Sbt9a
    Dim Dbt9a
    Dim DemCpy
    Dim DemAid
    Dim DemEid
    Dim DinAid
    Dim DinEid
    Sbt1 = trim(Request.Form("Sbt1"))
    Sbt2 = trim(Request.Form("Sbt2"))
    Sbt3 = trim(Request.Form("Sbt3"))
    Sbt4 = trim(Request.Form("Sbt4"))
    Sbt4a = trim(Request.Form("Sbt4a"))
    Dbt4a = trim(Request.Form("Dbt4a"))
    Sbt5 = trim(Request.Form("Sbt5"))
    Sbt5a = trim(Request.Form("Sbt5a"))
    Dbt5a = trim(Request.Form("Dbt5a"))
    Sbt6 = trim(Request.Form("Sbt6"))
    Sbt6a = trim(Request.Form("Sbt6a"))
    Dbt6a = trim(Request.Form("Dbt6a"))
    Sbt7 = trim(Request.Form("Sbt7"))
    Sbt7a = trim(Request.Form("Sbt7a"))
    Dbt7a = trim(Request.Form("Dbt7a"))
    Sbt8 = trim(Request.Form("Sbt8"))
    Sbt8a = trim(Request.Form("Sbt8a"))
    Dbt8a = trim(Request.Form("Dbt8a"))
    Sbt9 = trim(Request.Form("Sbt9"))
    Sbt9a = trim(Request.Form("Sbt9a"))
    Dbt9a = trim(Request.Form("Dbt9a"))
    DemCpy = trim(Request.Form("DemCpy"))
    DemAid = trim(Request.Form("DemAid"))
    if DemAid > "" then DemAid = CInt(DemAid) end if
    DemEid = trim(Request.Form("DemEid"))
    if DemEid > "" then DemEid = CInt(DemEid) end if
    DinAid = trim(Request.Form("DinAid"))
    if DinAid > "" then DinAid = CInt(DinAid) end if
    DemEid = trim(Request.Form("DemEid"))
    if DinEid > "" then DinEid = CInt(DinEid) end if

'<- FORMA 01 - DATOS GENERALES   (INICIO) ->
    if Sbt1 = "Sbt1" then
        FecNac = CStr(trim(Request.Form("FecNac")))
        FecNac = Mid(trim(Request.Form("FecNac")),7,4)  & "-" & Mid(trim(Request.Form("FecNac")),1,2)  & "-" & Mid(trim(Request.Form("FecNac")),4,2)
        sqlval = "select Dgr_EmpleadoID from HRM10510    " & _
                 "where Dgr_CorporativoID = '5000'       " & _
                 "and   Dgr_CompaniaID    = '"& Cid &"'  " & _
                 "and   Dgr_EmpleadoID    = '"& Eid &"'  "
        set rsv = dbconn.execute(sqlval)
        if not rsv.bof and not rsv.eof then
            sqlupd = "update HRM10510                                                " & _
                     "set Dgr_FecNacimiento = '"& FecNac &"',                        " & _
                     "    Dgr_Originario    = '"& trim(Request.Form("Origin")) &"',  " & _
                     "    Dgr_FormaMig      = '"& trim(Request.Form("FrmMig")) &"',  " & _
                     "    Dgr_EstadoCivil   = '"& trim(Request.Form("EstCiv")) &"',  " & _
                     "    Dgr_Genero        = '"& trim(Request.Form("Genero")) &"',  " & _
                     "    Dgr_Titulo        = '"& trim(Request.Form("Titulo")) &"',  " & _
                     "    Dgr_Vivienda      = '"& trim(Request.Form("TipViv")) &"',  " & _
                     "    Dgr_Automovil     = '"& trim(Request.Form("AutMov")) &"',  " & _
                     "    Dgr_SGMM          = '"& trim(Request.Form("SegGMM")) &"',  " & _
                     "    Dgr_CalleNum      = '"& trim(Request.Form("CallNm")) &"',  " & _
                     "    Dgr_Colonia       = '"& trim(Request.Form("Coloni")) &"',  " & _
                     "    Dgr_CodPos        = '"& trim(Request.Form("CodPos")) &"',  " & _
                     "    Dgr_Municipio     = '"& trim(Request.Form("Municp")) &"',  " & _
                     "    Dgr_Estado        = '"& trim(Request.Form("Estado")) &"',  " & _
                     "    Dgr_Pais          = '"& trim(Request.Form("Pais"))   &"',  " & _
                     "    Dgr_TelCasa       = '"& trim(Request.Form("TelCas")) &"',  " & _
                     "    Dgr_TelOficina    = '"& trim(Request.Form("TelOfn")) &"',  " & _
                     "    Dgr_Extension     = '"& trim(Request.Form("Extens")) &"',  " & _
                     "    Dgr_TelMovil      = '"& trim(Request.Form("TelMov")) &"',  " & _
                     "    Dgr_Email01       = '"& trim(Request.Form("Eml001")) &"',  " & _
                     "    Dgr_Email02       = '"& trim(Request.Form("Eml002")) &"'   " & _
                     "where Dgr_CorporativoID = '5000'                               " & _
                     "and   Dgr_CompaniaID    = '"& Cid &"'                          " & _
                     "and   Dgr_EmpleadoID    = '"& Eid &"'                          "
            set rsu = dbconn.execute(sqlupd)
            'response.write(sqlupd)
        else
            sqlins = "insert into HRM10510                       " & _
                     "   (Dgr_CorporativoID,                     " & _
                     "    Dgr_CompaniaID,                        " & _
                     "    Dgr_EmpleadoID,                        " & _
                     "    Dgr_FecNacimiento,                     " & _
                     "    Dgr_Originario,                        " & _
                     "    Dgr_FormaMig,                          " & _
                     "    Dgr_EstadoCivil,                       " & _
                     "    Dgr_Genero,                            " & _
                     "    Dgr_Titulo,                            " & _
                     "    Dgr_Vivienda,                          " & _
                     "    Dgr_Automovil,                         " & _
                     "    Dgr_SGMM,                              " & _
                     "    Dgr_CalleNum,                          " & _
                     "    Dgr_Colonia,                           " & _
                     "    Dgr_CodPos,                            " & _
                     "    Dgr_Municipio,                         " & _
                     "    Dgr_Estado,                            " & _
                     "    Dgr_Pais,                              " & _
                     "    Dgr_TelCasa,                           " & _
                     "    Dgr_TelOficina,                        " & _
                     "    Dgr_Extension,                         " & _
                     "    Dgr_TelMovil,                          " & _
                     "    Dgr_Email01,                           " & _
                     "    Dgr_Email02)                           " & _
                     "values                                     " & _
                     "   ('5000',                                " & _
                     "    '"& Cid &"',                           " & _
                     "    '"& Eid &"',                           " & _
                     "    '"& FecNac &"',                        " & _
                     "    '"& trim(Request.Form("Origin")) &"',  " & _
                     "    '"& trim(Request.Form("FrmMig")) &"',  " & _
                     "    '"& trim(Request.Form("EstCiv")) &"',  " & _
                     "    '"& trim(Request.Form("Genero")) &"',  " & _
                     "    '"& trim(Request.Form("Titulo")) &"',  " & _
                     "    '"& trim(Request.Form("TipViv")) &"',  " & _
                     "    '"& trim(Request.Form("AutMov")) &"',  " & _
                     "    '"& trim(Request.Form("SegGMM")) &"',  " & _
                     "    '"& trim(Request.Form("CallNm")) &"',  " & _
                     "    '"& trim(Request.Form("Coloni")) &"',  " & _
                     "    '"& trim(Request.Form("CodPos")) &"',  " & _
                     "    '"& trim(Request.Form("Municp")) &"',  " & _
                     "    '"& trim(Request.Form("Estado")) &"',  " & _
                     "    '"& trim(Request.Form("Pais"))   &"',  " & _
                     "    '"& trim(Request.Form("TelCas")) &"',  " & _
                     "    '"& trim(Request.Form("TelOfn")) &"',  " & _
                     "    '"& trim(Request.Form("Extens")) &"',  " & _
                     "    '"& trim(Request.Form("TelMov")) &"',  " & _
                     "    '"& trim(Request.Form("Eml001")) &"',  " & _
                     "    '"& trim(Request.Form("Eml002")) &"')  "
            set rsi = dbconn.execute(sqlins)
        end if
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0010'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 01 - DATOS GENERALES   (FIN)    ->

'<- FORMA 02 - DATOS EMERGENCIA  (INICIO) ->
    if Sbt2 = "Sbt2" then
        sqlval = "select Dmg_EmpleadoID from HRM10511    " & _
                 "where Dmg_CorporativoID = '5000'       " & _
                 "and   Dmg_CompaniaID    = '"& Cid &"'  " & _
                 "and   Dmg_EmpleadoID    = '"& Eid &"'  "
        set rsv = dbconn.execute(sqlval)

        if not rsv.bof and not rsv.eof then
            sqlupd = "update HRM10511                                              " & _
                     "set Dmg_TipoSangre  = '"& trim(Request.Form("TipSng")) &"',  " & _
                     "    Dmg_Alergias    = '"& trim(Request.Form("Alergs")) &"',  " & _
                     "    Dmg_NombreAvisa = '"& trim(Request.Form("NomAvi")) &"',  " & _
                     "    Dmg_TelAvisa    = '"& trim(Request.Form("TelAvi")) &"'   " & _
                     "where Dmg_CorporativoID = '5000'                             " & _
                     "and   Dmg_CompaniaID    = '"& Cid &"'                        " & _
                     "and   Dmg_EmpleadoID    = '"& Eid &"'                        "
            set rsu = dbconn.execute(sqlupd)
            'response.write(sqlupd)
        else
            sqlins = "insert into HRM10511                       " & _
                     "   (Dmg_CorporativoID,                     " & _
                     "    Dmg_CompaniaID,                        " & _
                     "    Dmg_EmpleadoID,                        " & _
                     "    Dmg_TipoSangre,                        " & _
                     "    Dmg_Alergias,                          " & _
                     "    Dmg_NombreAvisa,                       " & _
                     "    Dmg_TelAvisa)                          " & _
                     "values                                     " & _
                     "   ('5000',                                " & _
                     "    '"& Cid &"',                           " & _
                     "    '"& Eid &"',                           " & _
                     "    '"& trim(Request.Form("TipSng")) &"',  " & _
                     "    '"& trim(Request.Form("Alergs")) &"',  " & _
                     "    '"& trim(Request.Form("NomAvi")) &"',  " & _
                     "    '"& trim(Request.Form("TelAvi")) &"')  "
            set rsi = dbconn.execute(sqlins)
        end if
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0020'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 02 - DATOS EMERGENCIA  (FIN)    ->

'<- FORMA 03 - DATOS FUNCIONES   (INICIO) ->
    if Sbt3 = "Sbt3" then
        sqlval = "select Dfn_EmpleadoID from HRM10512    " & _
                 "where Dfn_CorporativoID = '5000'       " & _
                 "and   Dfn_CompaniaID    = '"& Cid &"'  " & _
                 "and   Dfn_EmpleadoID    = '"& Eid &"'  "
        set rsv = dbconn.execute(sqlval)

        if not rsv.bof and not rsv.eof then
            DfnTxt = Replace(trim(Request.Form("Funcns")),chr(39),"")
            DfnTxt = Replace(DfnTxt,chr(34),"")
            sqlupd = "update HRM10512                             " & _
                     "set Dfn_Funciones       = '"& DfnTxt &"'    " & _
                     "where Dfn_CorporativoID = '5000'            " & _
                     "and   Dfn_CompaniaID    = '"& Cid &"'       " & _
                     "and   Dfn_EmpleadoID    = '"& Eid &"'       "
            set rsu = dbconn.execute(sqlupd)
            'response.write(sqlupd)
        else
            DfnTxt = Replace(trim(Request.Form("Funcns")),chr(39),"")
            DfnTxt = Replace(DfnTxt,chr(34),"")
            sqlins = "insert into HRM10512      " & _
                     "   (Dfn_CorporativoID,    " & _
                     "    Dfn_CompaniaID,       " & _
                     "    Dfn_EmpleadoID,       " & _
                     "    Dfn_Funciones)        " & _
                     "values                    " & _
                     "   ('5000',               " & _
                     "    '"& Cid &"',          " & _
                     "    '"& Eid &"',          " & _
                     "    '"& DfnTxt &"')       "
            set rsi = dbconn.execute(sqlins)
        end if
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0030'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 03 - DATOS FUNCIONES   (FIN)    ->

'<- FORMA 04 - DATOS FAMILIARES  (INICIO) ->
    if Sbt4 = "Sbt4" then
        FecNac = CStr(trim(Request.Form("DfmFnm")))
        FecNac = Mid(FecNac,7,4) & "-" & Mid(FecNac,1,2) & "-" & Mid(FecNac,4,2)
        sqlins = "insert into HRM10513                       " & _
                 "   (Dfm_CorporativoID,                     " & _
                 "    Dfm_CompaniaID,                        " & _
                 "    Dfm_EmpleadoID,                        " & _
                 "    Dfm_ParentescoID,                      " & _
                 "    Dfm_Nombre,                            " & _
                 "    Dfm_FechaNac,                          " & _
                 "    Dfm_Ocupacion,                         " & _
                 "    Dfm_Email)                             " & _
                 "values                                     " & _
                 "   ('5000',                                " & _
                 "    '"& Cid &"',                           " & _
                 "    '"& Eid &"',                           " & _
                 "    '"& trim(Request.Form("DfmPrn")) &"',  " & _
                 "    '"& trim(Request.Form("DfmNmb")) &"',  " & _
                 "    '"& FecNac                       &"',  " & _
                 "    '"& trim(Request.Form("DfmOcp")) &"',  " & _
                 "    '"& trim(Request.Form("DfmEml")) &"')  "
        set rsi = dbconn.execute(sqlins)

'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0040'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Dbt4a = "Dbt4a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                Parent = trim(Request.Form("Pnt"&i))
                NombFm = trim(Request.Form("Nmb"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10513        " & _
                             "where Dfm_CorporativoID = '5000'          " & _
                             "and   Dfm_CompaniaID    = '"& Cid &"'     " & _
                             "and   Dfm_EmpleadoID    = '"& Eid &"'     " & _
                             "and   Dfm_ParentescoID  = '"& Parent &"'  " & _
                             "and   Dfm_Nombre        = '"& NombFm &"'  "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if

'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0040'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Sbt4a = "Sbt4a" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0040'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 04 - DATOS FAMILIARES  (FIN)    ->

'<- FORMA 05 - DATOS ESCOLARIDAD (INICIO) ->
    if Sbt5 = "Sbt5" then
        FecIni = CStr(trim(Request.Form("DscFin")))
        FecIni = Mid(FecIni,7,4) & "-" & Mid(FecIni,1,2) & "-" & Mid(FecIni,4,2)
        FecFin = CStr(trim(Request.Form("DscFfn")))
        FecFin = Mid(FecFin,7,4) & "-" & Mid(FecFin,1,2) & "-" & Mid(FecFin,4,2)
        sqlins = "insert into HRM10514                       " & _
                 "   (Dsc_CorporativoID,                     " & _
                 "    Dsc_CompaniaID,                        " & _
                 "    Dsc_EmpleadoID,                        " & _
                 "    Dsc_Nivel,                             " & _
                 "    Dsc_Estudios,                          " & _
                 "    Dsc_Institucion,                       " & _
                 "    Dsc_Avance,                            " & _
                 "    Dsc_Estatus,                           " & _
                 "    Dsc_FechaIni,                          " & _
                 "    Dsc_FechaFin)                          " & _
                 "values                                     " & _
                 "   ('5000',                                " & _
                 "    '"& Cid &"',                           " & _
                 "    '"& Eid &"',                           " & _
                 "    '"& trim(Request.Form("DscNvl")) &"',  " & _
                 "    '"& trim(Request.Form("DscCrr")) &"',  " & _
                 "    '"& trim(Request.Form("DscIns")) &"',  " & _
                 "     "&      Request.Form("DscAvn")  &",   " & _
                 "    '"& trim(Request.Form("DscEst")) &"',  " & _
                 "    '"& FecIni                       &"',  " & _
                 "    '"& FecFin                       &"')  "
        set rsi = dbconn.execute(sqlins)

'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0050'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Dbt5a = "Dbt5a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                Nivel = trim(Request.Form("Niv"&i))
                Estds = trim(Request.Form("Est"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10514        " & _
                             "where Dsc_CorporativoID = '5000'         " & _
                             "and   Dsc_CompaniaID    = '"& Cid &"'    " & _
                             "and   Dsc_EmpleadoID    = '"& Eid &"'    " & _
                             "and   Dsc_Nivel         = '"& Nivel &"'  " & _
                             "and   Dsc_Estudios      = '"& Estds &"'  "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if

'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0050'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Sbt5a = "Sbt5a" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0050'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 05 - DATOS ESCOLARIDAD (FIN)    ->

'<- FORMA 06 - DATOS IDIOMAS     (INICIO) ->
    if Sbt6 = "Sbt6" then
        sqlins = "insert into HRM10515                       " & _
                 "   (Did_CorporativoID,                     " & _
                 "    Did_CompaniaID,                        " & _
                 "    Did_EmpleadoID,                        " & _
                 "    Did_Idioma,                            " & _
                 "    Did_LugarAprend,                       " & _
                 "    Did_Lee,                               " & _
                 "    Did_Habla,                             " & _
                 "    Did_Escribe,                           " & _
                 "    Did_General)                           " & _
                 "values                                     " & _
                 "   ('5000',                                " & _
                 "    '"& Cid &"',                           " & _
                 "    '"& Eid &"',                           " & _
                 "    '"& trim(Request.Form("DidIdm")) &"',  " & _
                 "    '"& trim(Request.Form("DidLap")) &"',  " & _
                 "     "&      Request.Form("DidLee")  &",   " & _
                 "     "&      Request.Form("DidHab")  &",   " & _
                 "     "&      Request.Form("DidEsc")  &",   " & _
                 "    '"&      Request.Form("DidGnr")  &"')  "
        set rsi = dbconn.execute(sqlins)

'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0060'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Dbt6a = "Dbt6a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                DidIdm = trim(Request.Form("DidIdm"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10515        " & _
                             "where Did_CorporativoID = '5000'         " & _
                             "and   Did_CompaniaID    = '"& Cid &"'    " & _
                             "and   Did_EmpleadoID    = '"& Eid &"'    " & _
                             "and   Did_Idioma        = '"& DidIdm &"' "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if

'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0060'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Sbt6a = "Sbt6a" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0060'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 06 - DATOS IDIOMAS     (FIN)    ->

'<- FORMA 07 - DATOS CURSOS      (INICIO) ->
    if Sbt7 = "Sbt7" then
        FecCur = CStr(trim(Request.Form("DcrFec")))
        FecCur = Mid(FecCur,7,4) & "-" & Mid(FecCur,1,2) & "-" & Mid(FecCur,4,2)
        sqlins = "insert into HRM10516                       " & _
                 "   (Dcr_CorporativoID,                     " & _
                 "    Dcr_CompaniaID,                        " & _
                 "    Dcr_EmpleadoID,                        " & _
                 "    Dcr_Curso,                             " & _
                 "    Dcr_Institucion,                       " & _
                 "    Dcr_Horas,                             " & _
                 "    Dcr_Fecha,                             " & _
                 "    Dcr_IntExt)                            " & _
                 "values                                     " & _
                 "   ('5000',                                " & _
                 "    '"& Cid &"',                           " & _
                 "    '"& Eid &"',                           " & _
                 "    '"& trim(Request.Form("DcrCur")) &"',  " & _
                 "    '"& trim(Request.Form("DcrIns")) &"',  " & _
                 "     "&      Request.Form("DcrDur")  &",   " & _
                 "    '"&      FecCur                  &"',  " & _
                 "    '"&      Request.Form("DcrTip")  &"')  "
        set rsi = dbconn.execute(sqlins)
        'response.write(sqlins)
'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0070'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Dbt7a = "Dbt7a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                DidCur = trim(Request.Form("DidCur"&i))
                DidIns = trim(Request.Form("DidIns"&i))
                DidHrs = trim(Request.Form("DidHrs"&i))
                DidFec = trim(Request.Form("DidFec"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10516                          " & _
                             "where Dcr_CorporativoID = '5000'         " & _
                             "and   Dcr_CompaniaID    = '"& Cid &"'    " & _
                             "and   Dcr_EmpleadoID    = '"& Eid &"'    " & _
                             "and   Dcr_Curso         = '"& DidCur &"' " & _
                             "and   Dcr_Institucion   = '"& DidIns &"' " & _
                             "and   Dcr_Horas         =  "& DidHrs &"  " & _
                             "and   Dcr_Fecha         = '"& DidFec &"' "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if

'        sqlupd = "update HRM10502                         " & _
'                 "set Psm_Estatus         = "& SemEst &"  " & _
'                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
'                 "and   Psm_CorporativoID = '5000'        " & _
'                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
'                 "and   Psm_SemaforoID    = 'DATGEN0070'  "
'        set rsu = dbconn.execute(sqlupd)
    end if

    if Sbt7a = "Sbt7a" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0070'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 07 - DATOS CURSOS      (FIN)    ->

'<- FORMA 08 - DATOS EMPLEOS     (INICIO) ->
    if Sbt8 = "Sbt8" then
        FecIni = Mid(trim(request.form("DemFec")),7,4)  & "-" & Mid(trim(request.form("DemFec")),1,2)  & "-" & Mid(trim(request.form("DemFec")),4,2)
        FecFin = Mid(trim(request.form("DemFec")),20,4) & "-" & Mid(trim(request.form("DemFec")),14,2) & "-" & Mid(trim(request.form("DemFec")),17,2)

        sqlins = "insert into HRM10517                       " & _
                 "   (Dem_CorporativoID,                     " & _
                 "    Dem_CompaniaID,                        " & _
                 "    Dem_EmpleadoID,                        " & _
                 "    Dem_Empresa,                           " & _
                 "    Dem_AreaID,                            " & _
                 "    Dem_ExperienciaID,                     " & _
                 "    Dem_Puesto,                            " & _
                 "    Dem_Personal,                          " & _
                 "    Dem_NivelID,                           " & _
                 "    Dem_FecIni,                            " & _
                 "    Dem_FecFin)                            " & _
                 "values                                     " & _
                 "   ('5000',                                " & _
                 "    '"& Cid &"',                           " & _
                 "    '"& Eid &"',                           " & _
                 "    '"& trim(Request.Form("DemCpy")) &"',  " & _
                 "     "&      Request.Form("DemAid")  &",   " & _
                 "     "&      Request.Form("DemEid")  &",   " & _
                 "    '"& trim(request.Form("DemPos")) &"',  " & _
                 "     "&      request.Form("DemPrs")  &",   " & _
                 "     "&      request.Form("DemNor")  &",   " & _
                 "    '"& FecIni &"',                        " & _
                 "    '"& FecFin &"')                        "
        set rsi = dbconn.execute(sqlins)
    end if

    if Dbt8a = "Dbt8a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                DemCpy = trim(Request.Form("DemCpy"&i))
                DemPos = trim(Request.Form("DemPos"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10517                          " & _
                             "where Dem_CorporativoID = '5000'         " & _
                             "and   Dem_CompaniaID    = '"& Cid &"'    " & _
                             "and   Dem_EmpleadoID    = '"& Eid &"'    " & _
                             "and   Dem_Empresa       = '"& DemCpy &"' " & _
                             "and   Dem_Puesto        = '"& DemPos &"' "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if
    end if

    if Sbt8a = "Sbt8a" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0080'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 08 - DATOS EMPLEOS     (FIN)    ->

'<- FORMA 09 - DATOS INTERESES   (INICIO) ->
    if Sbt9 = "Sbt9" then
        sqlins = "insert into HRM10518                    " & _
                 "   (Din_CorporativoID,                  " & _
                 "    Din_CompaniaID,                     " & _
                 "    Din_EmpleadoID,                     " & _
                 "    Din_AreaID,                         " & _
                 "    Din_ActividadID)                    " & _
                 "values                                  " & _
                 "   ('5000',                             " & _
                 "    '"& Cid &"',                        " & _
                 "    '"& Eid &"',                        " & _
                 "     "& Request.Form("DinAid")  &",     " & _
                 "     "& Request.Form("DinEid")  &")     "
        set rsi = dbconn.execute(sqlins)
        'response.write(sqlins)
    end if

    if Dbt9a = "Dbt9a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                DinAid = trim(Request.Form("DinAid"&i))
                DinEid = trim(Request.Form("DinEid"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10518                          " & _
                             "where Din_CorporativoID = '5000'         " & _
                             "and   Din_CompaniaID    = '"& Cid &"'    " & _
                             "and   Din_EmpleadoID    = '"& Eid &"'    " & _
                             "and   Din_AreaID        =  "& DinAid &"  " & _
                             "and   Din_ActividadID   =  "& DinEid &"  "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if
    end if

    if Sbt9a = "Sbt9a" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = "& SemEst &"  " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                 "and   Psm_SemaforoID    = 'DATGEN0090'  "
        set rsu = dbconn.execute(sqlupd)
    end if
'<- FORMA 09 - DATOS INTERESES   (FIN)    ->

'----------------------------------------------
'   <-- Actualización de Registros (Fin)    -->
'----------------------------------------------


    Tab1Vs = 0
    Tab2Vs = 0
    Tab3Vs = 0
    Tab4Vs = 0
    Tab5Vs = 0
    Tab6Vs = 0
    Tab7Vs = 0
    Tab8Vs = 0
    Tab9Vs = 0
    Tab1Sm = 0
    Tab2Sm = 0
    Tab3Sm = 0
    Tab4Sm = 0
    Tab5Sm = 0
    Tab6Sm = 0
    Tab7Sm = 0
    Tab8Sm = 0
    Tab9Sm = 0
    
    sqltac = "select a.Psm_Estatus, b.Psf_ParametroID       " & _
             "from HRM10502 a, HRM105A0 b                   " & _
             "where  a.Psm_SemaforoID = b.Psf_ParametroID   " & _
             "and    a.Psm_Ejercicio  =  "& Ejr &"          " & _
             "and    a.Psm_EmpleadoID = '"& Eid &"'         " & _
             "and    b.Psf_NumPaso    = 3                   " & _
             "and    b.Psf_Seccion    = 'DATGEN'            "
    set rsT = dbconn.execute(sqltac)
    if not rsT.bof and not rsT.eof then
        Do while not rsT.eof
            select case trim(rsT("Psf_ParametroID"))
                case "DATGEN0010" 
                    Tab1Vs = 1
                    Tab1Sm = rsT("Psm_Estatus")
                case "DATGEN0020"
                    Tab2Vs = 1
                    Tab2Sm = rsT("Psm_Estatus")
                case "DATGEN0030"
                    Tab3Vs = 1
                    Tab3Sm = rsT("Psm_Estatus")
                case "DATGEN0040"
                    Tab4Vs = 1
                    Tab4Sm = rsT("Psm_Estatus")
                case "DATGEN0050"
                    Tab5Vs = 1
                    Tab5Sm = rsT("Psm_Estatus")
                case "DATGEN0060"
                    Tab6Vs = 1
                    Tab6Sm = rsT("Psm_Estatus")
                case "DATGEN0070"
                    Tab7Vs = 1
                    Tab7Sm = rsT("Psm_Estatus")
                case "DATGEN0080"
                    Tab8Vs = 1
                    Tab8Sm = rsT("Psm_Estatus")
                case "DATGEN0090"
                    Tab9Vs = 1
                    Tab9Sm = rsT("Psm_Estatus")
            end select
            rsT.movenext
        Loop
        rsT.close
        set rsT = Nothing
    end if

    Tab1St = ""
    Tab2St = ""
    Tab3St = ""
    Tab4St = ""
    Tab5St = ""
    Tab6St = ""
    Tab7St = ""
    Tab8St = ""
    Tab9St = ""
    Pan1St = "tab-pane"
    Pan2St = "tab-pane"
    Pan3St = "tab-pane"
    Pan4St = "tab-pane"
    Pan5St = "tab-pane"
    Pan6St = "tab-pane"
    Pan7St = "tab-pane"
    Pan8St = "tab-pane"
    Pan9St = "tab-pane"

    Select Case Prm
        Case "1"
            Tab1St = "class='active'"
            Pan1St = "tab-pane active"
        Case "2"
            Tab2St = "class='active'"
            Pan2St = "tab-pane active"
        Case "3"
            Tab3St = "class='active'"
            Pan3St = "tab-pane active"
        Case "4"
            Tab4St = "class='active'"
            Pan4St = "tab-pane active"
        Case "5"
            Tab5St = "class='active'"
            Pan5St = "tab-pane active"
        Case "6"
            Tab6St = "class='active'"
            Pan6St = "tab-pane active"
        Case "7"
            Tab7St = "class='active'"
            Pan7St = "tab-pane active"
        Case "8"
            Tab8St = "class='active'"
            Pan8St = "tab-pane active"
        Case else
            Tab9St = "class='active'"
            Pan9St = "tab-pane active"
    End Select

    
'    sqlDgr = "select * from HRM10510                   " & _
'             "where Dgr_EmpleadoID    = '"& Eid &"'    "

    sqlDgr = "select a.*, b.Pue_Descripcion                " & _
             "from HRM10510 a, HRM10210 b                  " & _
             "where a.Dgr_CompaniaID = b.Pue_CompaniaID    " & _
             "and   a.Dgr_PuestoID   = b.Pue_NivelPuestoID " & _
             "and   a.Dgr_EmpleadoID = '"& Eid &"'         "

    set rs = dbconn.Execute(sqlDgr)
    if not rs.eof and not rs.bof then
        Rfc    = trim(rs("Dgr_Rfc"))
        Curp   = trim(rs("Dgr_Curp"))
        NImss  = trim(rs("Dgr_Imss"))
        FecNac = CStr(trim(rs("Dgr_FecNacimiento")))
        FecNac = Mid(FecNac,6,2) & "/" & Mid(FecNac,9,2) & "/" & Mid(FecNac,1,4)
        Origin = trim(rs("Dgr_Originario"))
        FrmMig = trim(rs("Dgr_FormaMig"))
        EstCiv = trim(rs("Dgr_EstadoCivil"))
        Genero = trim(rs("Dgr_Genero"))
        Titulo = trim(rs("Dgr_Titulo"))
        TipViv = trim(rs("Dgr_Vivienda"))
        AutMov = trim(rs("Dgr_Automovil"))
        SegGMM = trim(rs("Dgr_SGMM"))
        CallNm = trim(rs("Dgr_CalleNum"))
        Coloni = trim(rs("Dgr_Colonia"))
        Municp = trim(rs("Dgr_Municipio"))
        Estado = trim(rs("Dgr_Estado"))
        Pais   = trim(rs("Dgr_Pais"))
        CodPos = trim(rs("Dgr_CodPos"))
        TelCas = trim(rs("Dgr_TelCasa"))
        FecIng = trim(rs("Dgr_FecIngreso"))
        PuesID = trim(rs("Dgr_PuestoID"))
        PuesDs = trim(rs("Pue_Descripcion"))
        FecPue = trim(rs("Dgr_FecPuesto"))
        TelOfn = trim(rs("Dgr_TelOficina"))
        Extens = trim(rs("Dgr_Extension"))
'        Skytel = trim(rs("Dgr_Skytel"))
'        ClvSky = trim(rs("Dgr_ClaveSkytel"))
        TelMov = trim(rs("Dgr_TelMovil"))
        EmlTrb = trim(rs("Dgr_Email"))
        FecAct = trim(rs("Dgr_FecActualizacion"))
        FecReg = trim(rs("Dgr_FecRegistro"))
        Nacnld = trim(rs("Dgr_Nacionalidad"))
        Eml001 = trim(rs("Dgr_Email01"))
        Eml002 = trim(rs("Dgr_Email02"))
    else
        Rfc    = ""
        Curp   = ""
        NImss  = ""
        FecNAc = ""
        Origin = ""
        FrmMig = ""
        EstCiv = ""
        Genero = ""
        Titulo = ""
        TipViv = ""
        AutMov = ""
        SegGMM = ""
        CallNm = ""
        Coloni = ""
        Municp = ""
        Estado = ""
        Pais   = ""
        CodPos = ""
        TelCas = ""
        FecIng = ""
        PuesID = ""
        PuesDs = ""
        FecPue = ""
        TelOfn = ""
        Extens = ""
'        Skytel = ""
'        ClvSky = ""
        TelMov = ""
        EmlTrb = ""
        FecAct = ""
        FecReg = ""
        Nacnld = ""
        Eml001 = ""
        Eml002 = ""
    end if

    sqlDmg = "select * from HRM10511                   " & _
             "where Dmg_EmpleadoID    = '"& Eid &"'    "
    set rs = dbconn.Execute(sqlDmg)
    if not rs.eof and not rs.bof then
        TipSng = trim(rs("Dmg_TipoSangre"))
        Alergs = trim(rs("Dmg_Alergias"))
        NomAvi = trim(rs("Dmg_NombreAvisa"))
        TelAvi = trim(rs("Dmg_TelAvisa"))
    else
        TipSng = ""
        Alergs = ""
        NomAvi = ""
        TelAvi = ""
    end if

    sqlDfn = "select * from HRM10512                   " & _
             "where Dfn_EmpleadoID    = '"& Eid &"'    "
    set rs = dbconn.Execute(sqlDfn)
    if not rs.eof and not rs.bof then
        Funcns = trim(rs("Dfn_Funciones"))
    else
        Funcns = ""
    end if

    %>

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->

        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <%
                        if Tab1Vs = 1 then
                            if Tab1Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab1St %>><a href="#grales" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab001 %></a></li>
                            <%
                        end if
                        if Tab2Vs = 1 then
                            if Tab2Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab2St %>><a href="#emergn" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab002 %></a></li>
                            <%
                        end if
                        if Tab3Vs = 1 then
                            if Tab3Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab3St %>><a href="#funcns" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab003 %></a></li>
                            <%
                        end if
                        if Tab4Vs = 1 then
                            if Tab4Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab4St %>><a href="#famlrs" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab004 %></a></li>
                            <%
                        end if
                        if Tab5Vs = 1 then
                            if Tab5Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab5St %>><a href="#escolr" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab005 %></a></li>
                            <%
                        end if
                        if Tab6Vs = 1 then
                            if Tab6Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab6St %>><a href="#idioma" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab006 %></a></li>
                            <%
                        end if
                        if Tab7Vs = 1 then
                            if Tab7Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab7St %>><a href="#cursos" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab007 %></a></li>
                            <%
                        end if
                        if Tab8Vs = 1 then
                            if Tab8Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab8St %>><a href="#empleo" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab008 %></a></li>
                            <%
                        end if
                        if Tab9Vs = 1 then
                            if Tab9Sm = 0 then
                                SemTab = "red"
                            else
                                SemTab = "green"
                            end if
                            %>
                            <li <%= Tab9St %>><a href="#inters" data-toggle="tab"><i class="fa fa-circle text-<%= SemTab %>" style="font-size:xx-small"></i>&nbsp;&nbsp;<%= Tab009 %></a></li>
                            <%
                        end if
                        %>
                    </ul>
                    <div class="tab-content">
                        <%
                        if Tab1Vs = 1 then
                        %>
                        <div class="<%= Pan1St %>" id="grales" >
                            <form action="Hrm_PadePAP1DG.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form1" method="post">
                                <div class="box box-primary">
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb1 %></strong>
                                                <br><%= FecAct %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb2 %></strong>
                                                <br><%= Eid %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb3 %></strong>
                                                <br><%= Enm %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb4 %></strong>
                                                <br><%= NImss %>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb5 %></strong>
                                                <br><%= FecIng %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb6 %></strong>
                                                <br><%= PuesDs %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb7 %></strong>
                                                <br><%= FecPue %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb8 %></strong>
                                                <br><%= Nacnld %>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb9 %></strong>
                                                <br><%= EmlTrb %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb10 %></strong>
                                                <br><%= Rfc %>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <strong><%= Fr1Lb11 %></strong>
                                                <br><%= Curp %>
                                            </div>
                                        </div>

                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb12 %></label>
                                                    <input type="text" class="form-control pull-right" name="FecNac" id="datepicker" value="<%= FecNac %>" placeholder="<%= Fr1Ph12 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb13 %></label>
                                                    <input type="text" class="form-control" name="Origin" id="Origin" value="<%= Origin %>" placeholder="<%= Fr1Ph13 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb14 %></label>
                                                    <input type="text" class="form-control" name="FrmMig" id="FrmMig" value="<%= FrmMig %>" placeholder="<%= Fr1Ph14 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb15 %></label>
                                                    <select class="form-control" size="1" id="EstCiv" name="EstCiv" required>
                                                        <option class="form-control" value=""><%= Fr1Ph15 %></option>
                                                        <%
                                                        if EstCiv = "S" then
                                                            %>
                                                            <option class="form-control" value="S" selected><%= Fr1S1o1 %></option>
                                                            <option class="form-control" value="C"><%= Fr1S1o2 %></option>
                                                            <option class="form-control" value="D"><%= Fr1S1o3 %></option>
                                                            <option class="form-control" value="U"><%= Fr1S1o4 %></option>
                                                            <option class="form-control" value="V"><%= Fr1S1o5 %></option>
                                                            <%
                                                        else
                                                            if EstCiv = "C" then
                                                                %>
                                                                <option class="form-control" value="S"><%= Fr1S1o1 %></option>
                                                                <option class="form-control" value="C" selected><%= Fr1S1o2 %></option>
                                                                <option class="form-control" value="D"><%= Fr1S1o3 %></option>
                                                                <option class="form-control" value="U"><%= Fr1S1o4 %></option>
                                                                <option class="form-control" value="V"><%= Fr1S1o5 %></option>
                                                                <%
                                                            else
                                                                if EstCiv = "D" then
                                                                    %>
                                                                    <option class="form-control" value="S"><%= Fr1S1o1 %></option>
                                                                    <option class="form-control" value="C"><%= Fr1S1o2 %></option>
                                                                    <option class="form-control" value="D" selected><%= Fr1S1o3 %></option>
                                                                    <option class="form-control" value="U"><%= Fr1S1o4 %></option>
                                                                    <option class="form-control" value="V"><%= Fr1S1o5 %></option>
                                                                    <%
                                                                else
                                                                    if EstCiv = "U" then
                                                                        %>
                                                                        <option class="form-control" value="S"><%= Fr1S1o1 %></option>
                                                                        <option class="form-control" value="C"><%= Fr1S1o2 %></option>
                                                                        <option class="form-control" value="D"><%= Fr1S1o3 %></option>
                                                                        <option class="form-control" value="U" selected><%= Fr1S1o4 %></option>
                                                                        <option class="form-control" value="V"><%= Fr1S1o5 %></option>
                                                                        <%
                                                                    else
                                                                        if EstCiv = "V" then
                                                                            %>
                                                                            <option class="form-control" value="S"><%= Fr1S1o1 %></option>
                                                                            <option class="form-control" value="C"><%= Fr1S1o2 %></option>
                                                                            <option class="form-control" value="D"><%= Fr1S1o3 %></option>
                                                                            <option class="form-control" value="U"><%= Fr1S1o4 %></option>
                                                                            <option class="form-control" value="V" selected><%= Fr1S1o5 %></option>
                                                                            <%
                                                                        else
                                                                            %>
                                                                            <option class="form-control" value="S"><%= Fr1S1o1 %></option>
                                                                            <option class="form-control" value="C"><%= Fr1S1o2 %></option>
                                                                            <option class="form-control" value="D"><%= Fr1S1o3 %></option>
                                                                            <option class="form-control" value="U"><%= Fr1S1o4 %></option>
                                                                            <option class="form-control" value="V"><%= Fr1S1o5 %></option>
                                                                            <%
                                                                        end if
                                                                    end if
                                                                end if
                                                            end if
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb16 %></label>
                                                    <select class="form-control" size="1" id="Genero" name="Genero" required>
                                                        <option class="form-control" value=""><%= Fr1Ph16 %></option>
                                                        <%
                                                        if Genero = "M" then
                                                            %>
                                                            <option class="form-control" value="M" selected><%= Fr1S2o1 %></option>
                                                            <option class="form-control" value="F"><%= Fr1S2o2 %></option>
                                                            <%
                                                        else
                                                            if Genero = "F" then
                                                                %>
                                                                <option class="form-control" value="M"><%= Fr1S2o1 %></option>
                                                                <option class="form-control" value="F" selected><%= Fr1S2o2 %></option>
                                                                <%
                                                            else
                                                                %>
                                                                <option class="form-control" value="M"><%= Fr1S2o1 %></option>
                                                                <option class="form-control" value="F"><%= Fr1S2o2 %></option>
                                                                <%
                                                            end if
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb17 %></label>
                                                    <input type="text" class="form-control" name="Titulo" id="Titulo" value="<%= Titulo %>" placeholder="<%= Fr1Ph17 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb18 %></label>
                                                    <select class="form-control" size="1" id="TipViv" name="TipViv" required>
                                                        <option class="form-control" value=""><%= Fr1Ph18 %></option>
                                                        <%
                                                        if TipViv = "S" then
                                                            %>
                                                            <option class="form-control" value="S" selected><%= Fr1S3o1 %></option>
                                                            <option class="form-control" value="N"><%= Fr1S3o2 %></option>
                                                            <%
                                                        else
                                                            if TipViv = "N" then
                                                                %>
                                                                <option class="form-control" value="S"><%= Fr1S3o1 %></option>
                                                                <option class="form-control" value="N" selected><%= Fr1S3o2 %></option>
                                                                <%
                                                            else
                                                                %>
                                                                <option class="form-control" value="S"><%= Fr1S3o1 %></option>
                                                                <option class="form-control" value="N"><%= Fr1S3o2 %></option>
                                                                <%
                                                            end if
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb19 %></label>
                                                    <select class="form-control" size="1" id="AutMov" name="AutMov" required>
                                                        <option class="form-control" value=""><%= Fr1Ph19 %></option>
                                                        <%
                                                        if AutMov = "S" then
                                                            %>
                                                            <option class="form-control" value="S" selected><%= Fr1S3o1 %></option>
                                                            <option class="form-control" value="N"><%= Fr1S3o2 %></option>
                                                            <%
                                                        else
                                                            if AutMov = "N" then
                                                                %>
                                                                <option class="form-control" value="S"><%= Fr1S3o1 %></option>
                                                                <option class="form-control" value="N" selected><%= Fr1S3o2 %></option>
                                                                <%
                                                            else
                                                                %>
                                                                <option class="form-control" value="S"><%= Fr1S3o1 %></option>
                                                                <option class="form-control" value="N"><%= Fr1S3o2 %></option>
                                                                <%
                                                            end if
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb20 %></label>
                                                    <select class="form-control" size="1" id="SegGMM" name="SegGMM" required>
                                                        <option class="form-control" value=""><%= Fr1Ph20 %></option>
                                                        <%
                                                        if SegGMM = "S" then
                                                            %>
                                                            <option class="form-control" value="S" selected><%= Fr1S3o1 %></option>
                                                            <option class="form-control" value="N"><%= Fr1S3o2 %></option>
                                                            <%
                                                        else
                                                            if SegGMM = "N" then
                                                                %>
                                                                <option class="form-control" value="S"><%= Fr1S3o1 %></option>
                                                                <option class="form-control" value="N" selected><%= Fr1S3o2 %></option>
                                                                <%
                                                            else
                                                                %>
                                                                <option class="form-control" value="S"><%= Fr1S3o1 %></option>
                                                                <option class="form-control" value="N"><%= Fr1S3o2 %></option>
                                                                <%
                                                            end if
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb21 %></label>
                                                    <input type="text" class="form-control" name="CallNm" id="CallNm" value="<%= CallNm %>" placeholder="<%= Fr1Ph21 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb22 %></label>
                                                    <input type="text" class="form-control" name="Coloni" id="Coloni" value="<%= Coloni %>" placeholder="<%= Fr1Ph22 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb23 %></label>
                                                    <input type="text" class="form-control" name="CodPos" id="CodPos" value="<%= CodPos %>" placeholder="<%= Fr1Ph23 %>" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb24 %></label>
                                                    <input type="text" class="form-control" name="Municp" id="Municp" value="<%= Municp %>" placeholder="<%= Fr1Ph24 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb25 %></label>
                                                    <input type="text" class="form-control" name="Estado" id="Estado" value="<%= Estado %>" placeholder="<%= Fr1Ph25 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb26 %></label>
                                                    <input type="text" class="form-control" name="Pais" id="Pais" value="<%= Pais %>" placeholder="<%= Fr1Ph26 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb27 %></label>
                                                    <input type="text" class="form-control" name="TelCas" id="TelCas" value="<%= TelCas %>" placeholder="<%= Fr1Ph27 %>" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb28 %></label>
                                                    <input type="text" class="form-control" name="TelOfn" id="TelOfn" value="<%= TelOfn %>" placeholder="<%= Fr1Ph28 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb29 %></label>
                                                    <input type="text" class="form-control" name="Extens" id="Extens" value="<%= Extens %>" placeholder="<%= Fr1Ph29 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb32 %></label>
                                                    <input type="text" class="form-control" name="TelMov" id="TelMov" value="<%= TelMov %>" placeholder="<%= Fr1Ph32 %>" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb33 %></label>
                                                    <input type="text" class="form-control" name="Eml001" id="Eml001" value="<%= Eml001 %>" placeholder="<%= Fr1Ph33 %>" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr1Lb34 %></label>
                                                    <input type="text" class="form-control" name="Eml002" id="Eml002" value="<%= Eml002 %>" placeholder="<%= Fr1Ph34 %>" />
                                                </div>
                                            </div>
                                        </div>
                                        <label style="color: #f00"><%= FrLgn1 %></label>
                                        <div class="box-footer" style="text-align: center">
                                            <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1"><%= SmBtn1 %></button>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                        <%
                        end if

                        if Tab2Vs = 1 then
                        %>
                        <div class="<%= Pan2St %>" id="emergn" >
                            <form action="Hrm_PadePAP1DG.asp?Prm=2&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form2" method="post">
                                <div class="box box-danger">
                                    <div class="box-header">
                                      <h3 class="box-title"><%= Fr2Bh1 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label><%= Fr2Lb1 %></label>
                                            <input type="text" class="form-control" name="TipSng" id="TipSng" value="<%= TipSng %>" placeholder="<%= Fr2Ph1 %>" maxlength="20" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <label><%= Fr2Lb2 %></label>
                                            <textarea class="form-control" rows="3" name="Alergs" id="Alergs" placeholder="<%= Fr2Ph2 %>"><%= Alergs %></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="box box-danger">
                                    <div class="box-header">
                                      <h3 class="box-title"><%= Fr2Bh2 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label><%= Fr2Lb3 %></label>
                                            <input type="text" class="form-control" name="NomAvi" id="NomAvi" value="<%= NomAvi %>" placeholder="<%= Fr2Ph3 %>" maxlength="100" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <label><%= Fr2Lb4 %></label>
                                            <input type="text" class="form-control" name="TelAvi" id="TelAvi" value="<%= TelAvi %>" placeholder="<%= Fr2Ph4 %>" maxlength="30" />
                                        </div>
                                    </div>
                                </div>
                                
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                <div class="box-footer" style="text-align: center">
                                    <button type="submit" class="btn btn-primary" name="Sbt2" id="Sbt2" value="Sbt2"><%= SmBtn1 %></button>
                                </div>
                            </form>
                        </div>
                        <%
                        end if

                        if Tab3Vs = 1 then
                        %>
                        <div class="<%= Pan3St %>" id="funcns" >
                            <form action="Hrm_PadePAP1DG.asp?Prm=3&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form3" method="post">
                                <div class="box box-success">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr3Lb1 %></label>
                                            <textarea class="form-control" name="Funcns" id="Funcns" rows="18" placeholder="<%= Fr3Ph1 %>" required><%= Funcns %></textarea>
                                        </div>
                                    </div>
                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                    <div class="box-footer" style="text-align: center">
                                        <button type="submit" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3"><%= SmBtn1 %></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%
                        end if

                        if Tab4Vs = 1 then
                        %>
                        <div class="<%= Pan4St %>" id="famlrs" >
                            <div class="box box-warning">
                                <div class="box-header">
                                    <h3 class="box-title"><%= Fr4Bh1 %></h3>
                                </div>
                                <div class="box-body">
                                    <form action="Hrm_PadePAP1DG.asp?Prm=4&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form4" method="post">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr4Lb1 %></label>
                                                    <input type="text" class="form-control" name="DfmNmb" id="DfmNmb" placeholder="<%= Fr4Ph1 %>" maxlength="100" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr4Lb2 %></label>
                                                    <input type="text" class="form-control pull-right" name="DfmFnm" id="datepicker1" placeholder="<%= Fr4Ph2 %>" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr4Lb3 %></label>
                                                    <select class="form-control" size="1" id="DfmPrn" name="DfmPrn" required>
                                                        <option class="form-control" value=""><%= Fr4Ph3 %></option>
                                                        <%
                                                        sqlPrn = "select * from HRMA0001 where Pfm_IdiomaID = '"& Lng &"' order by Pfm_ClaveID "
                                                        set rsPrn = dbconn.execute(sqlPrn)
                                                        if not rsPrn.eof and not rsPrn.bof then
                                                            do while not rsPrn.eof
                                                                %>
                                                                <option class="form-control" value="<%= trim(rsPrn("Pfm_ClaveID")) %>"><%= trim(rsPrn("Pfm_Descripcion")) %></option>
                                                                <%
                                                                rsPrn.movenext
                                                            loop
                                                            rsPrn.close
                                                            set rsPrn = Nothing
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr4Lb4 %></label>
                                                    <input type="text" class="form-control" name="DfmOcp" id="DfmOcp" placeholder="<%= Fr4Ph4 %>" maxlength="100" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label><%= Fr4Lb5 %></label>
                                                    <input type="text" class="form-control" name="DfmEml" id="DfmEml" placeholder="<%= Fr4Ph5 %>" maxlength="100" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                    <br/>
                                                    <button type="submit" class="btn btn-primary" name="Sbt4" id="Sbt4" value="Sbt4"><%= SmBtn4 %></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <%
                            sqlDfm = "select a.*, b.Pfm_Descripcion             " & _
                                     "from HRM10513 a, HRMA0001 b               " & _
                                     "where a.Dfm_ParentescoID = b.Pfm_ClaveID  " & _
                                     "and   a.Dfm_EmpleadoID = '"& Eid &"'      " & _
                                     "and   b.Pfm_IdiomaID   = '"& Lng &"'      "
                            set rsDfm = dbconn.execute(sqlDfm)
                            if not rsDfm.eof and not rsDfm.bof then
                                %>
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><%= Fr4Bh2 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadePAP1DG.asp?Prm=4&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form4a" method="post">
                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th><%= Fr4Lb1 %></th>
                                                        <th><%= Fr4Lb2 %></th>
                                                        <th><%= Fr4Lb3 %></th>
                                                        <th><%= Fr4Lb4 %></th>
                                                        <th><%= Fr4Lb5 %></th>
                                                        <th style="text-align: center; color: red; font-weight: bold">X</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    i = 0
                                                    do while not rsDfm.eof
                                                        i = i + 1
                                                        Fna = CStr(trim(rsDfm("Dfm_FechaNac")))
                                                        Fna = Mid(Fna,6,2) & "/" & Mid(Fna,9,2) & "/" & Mid(Fna,1,4)
                                                        %>
                                                        <tr>
                                                            <td>
                                                                <input type="hidden" name="<%= "Pnt"&i %>" id="<%= "Pnt"&i %>" value="<%= trim(rsDfm("Dfm_ParentescoID")) %>" />
                                                                <input type="hidden" name="<%= "Nmb"&i %>" id="<%= "Nmb"&i %>" value="<%= trim(rsDfm("Dfm_Nombre")) %>" />
                                                                <%= trim(rsDfm("Dfm_Nombre")) %>
                                                            </td>
                                                            <td><%= Fna %></td>
                                                            <td><%= trim(rsDfm("Pfm_Descripcion")) %></td>
                                                            <td><%= trim(rsDfm("Dfm_Ocupacion")) %></td>
                                                            <td><%= trim(rsDfm("Dfm_Email")) %></td>
                                                            <td style="text-align: center">
                                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                            </td>
                                                        </tr>
                                                        <%
                                                        rsDfm.movenext
                                                    loop
                                                    rsDfm.close
                                                    set rsDfm = Nothing
                                                    %>
                                                </tbody>
                                            </table>
                                            <div class="box-footer" style="text-align: center">
                                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                <button type="submit" class="btn btn-primary" name="Sbt4a" id="Sbt4a" value="Sbt4a"><%= SmBtn1 %></button>&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt4a" id="Dbt4a" value="Dbt4a"><%= SmBtn2 %></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <%
                            end if
                            %>
                        </div>
                        <%
                        end if

                        if Tab5Vs = 1 then
                        %>
                        <div class="<%= Pan5St %>" id="escolr" >
                            <div class="box box-warning" style="border-top-color: #3EACA8">
                                <div class="box-body">
                                    <form action="Hrm_PadePAP1DG.asp?Prm=5&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form5" method="post">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr5Lb1 %></label>
                                                    <input type="text" class="form-control" name="DscNvl" id="DscNvl" placeholder="<%= Fr5Ph1 %>" maxlength="50" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr5Lb2 %></label>
                                                    <input type="text" class="form-control" name="DscCrr" id="DscCrr" placeholder="<%= Fr5Ph2 %>" maxlength="100" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr5Lb3 %></label>
                                                    <input type="text" class="form-control" name="DscIns" id="DscIns" placeholder="<%= Fr5Ph3 %>" maxlength="100" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr5Lb4 %></label>
                                                    <input type="number" min="1" max="100" class="form-control" name="DscAvn" id="DscAvn" placeholder="<%= Fr5Ph4 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr5Lb5 %></label>
                                                    <input type="text" class="form-control" name="DscEst" id="DscEst" placeholder="<%= Fr5Ph5 %>" maxlength="100" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr5Lb6 %></label>
                                                    <input type="text" class="form-control pull-right" name="DscFin" id="datepicker2" placeholder="<%= Fr5Ph6 %>" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr5Lb7 %></label>
                                                    <input type="text" class="form-control pull-right" name="DscFfn" id="datepicker3" placeholder="<%= Fr5Ph7 %>" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                    <br/>
                                                    <button type="submit" class="btn btn-primary" name="Sbt5" id="Sbt5" value="Sbt5"><%= SmBtn4 %></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <%
                            sqlDsc = "select *from HRM10514                  " & _
                                     "where Dsc_EmpleadoID =  '"& Eid &"'    "
                            set rsD = dbconn.execute(sqlDsc)
                            if not rsD.eof and not rsD.bof then
                                %>
                                <div class="box box-info" style="border-top-color: #A2D4AB">
                                    <div class="box-header">
                                        <h3 class="box-title"><%= Fr5Bh2 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadePAP1DG.asp?Prm=5&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form5a" method="post">
                                            <table id="example2" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th><%= Fr5Lb1 %></th>
                                                        <th><%= Fr5Lb2 %></th>
                                                        <th><%= Fr5Lb3 %></th>
                                                        <th><%= Fr5Lb4 %></th>
                                                        <th><%= Fr5Lb5 %></th>
                                                        <th><%= Fr5Lb6 %></th>
                                                        <th><%= Fr5Lb7 %></th>
                                                        <th style="text-align: center; color: red; font-weight: bold">X</th>
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
                                                            <td style="text-align: center">
                                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                            </td>
                                                        </tr>
                                                        <%
                                                        rsD.movenext
                                                    loop
                                                    rsD.close
                                                    set rsD = Nothing
                                                    %>
                                                </tbody>
                                            </table>
                                            <div class="box-footer" style="text-align: center">
                                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                <button type="submit" class="btn btn-primary" name="Sbt5a" id="Sbt5a" value="Sbt5a"><%= SmBtn1 %></button>&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt5a" id="Dbt5a" value="Dbt5a"><%= SmBtn2 %></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <%
                            end if
                            %>
                        </div>
                        <%
                        end if

                        if Tab6Vs = 1 then
                        %>
                        <div class="<%= Pan6St %>" id="idioma" >
                            <div class="box box-warning" style="border-top-color: #83AE9B">
                                <div class="box-body">
                                    <form action="Hrm_PadePAP1DG.asp?Prm=6&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form6" method="post">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr6Lb1 %></label>
                                                    <input type="text" class="form-control" name="DidIdm" id="DidIdm" placeholder="<%= Fr6Ph1 %>" maxlength="50" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr6Lb2 %></label>
                                                    <input type="text" class="form-control" name="DidLap" id="DidLap" placeholder="<%= Fr6Ph2 %>" maxlength="100" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr6Lb3 %></label>
                                                    <input type="number" min="1" max="100" class="form-control" name="DidLee" id="DidLee" placeholder="<%= Fr6Ph3 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr6Lb4 %></label>
                                                    <input type="number" min="1" max="100" class="form-control" name="DidHab" id="DidHab" placeholder="<%= Fr6Ph4 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr6Lb5 %></label>
                                                    <input type="number" min="1" max="100" class="form-control" name="DidEsc" id="DidEsc" placeholder="<%= Fr6Ph5 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr6Lb6 %></label>
                                                    <input type="number" min="1" max="100" class="form-control" name="DidGnr" id="DidGnr" placeholder="<%= Fr6Ph6 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                    <br/>
                                                    <button type="submit" class="btn btn-primary" name="Sbt6" id="Sbt6" value="Sbt6"><%= SmBtn4 %></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <%
                            sqlDid = "select *from HRM10515                  " & _
                                     "where Did_EmpleadoID =  '"& Eid &"'    "
                            set rsD = dbconn.execute(sqlDid)
                            if not rsD.eof and not rsD.bof then
                                %>
                                <div class="box box-info" style="border-top-color: #C8C8A9">
                                    <div class="box-header">
                                        <h3 class="box-title"><%= Fr6Bh2 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadePAP1DG.asp?Prm=6&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form6a" method="post">
                                            <table id="example3" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th><%= Fr6Lb1 %></th>
                                                        <th><%= Fr6Lb2 %></th>
                                                        <th><%= Fr6Lb3 %></th>
                                                        <th><%= Fr6Lb4 %></th>
                                                        <th><%= Fr6Lb5 %></th>
                                                        <th><%= Fr6Lb6 %></th>
                                                        <th style="text-align: center; color: red; font-weight: bold">X</th>
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
                                                                <input type="hidden" name="<%= "DidIdm"&i %>" id="<%= "DidIdm"&i %>" value="<%= trim(rsD("Did_Idioma")) %>" />
                                                                <%= trim(rsD("Did_Idioma")) %>
                                                            </td>
                                                            <td><%= trim(rsD("Did_LugarAprend")) %></td>
                                                            <td><%= trim(rsD("Did_Lee")) %></td>
                                                            <td><%= trim(rsD("Did_Habla")) %></td>
                                                            <td><%= trim(rsD("Did_Escribe")) %></td>
                                                            <td><%= trim(rsD("Did_General")) %></td>
                                                            <td style="text-align: center">
                                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                            </td>
                                                        </tr>
                                                        <%
                                                        rsD.movenext
                                                    loop
                                                    rsD.close
                                                    set rsD = Nothing
                                                    %>
                                                </tbody>
                                            </table>
                                            <div class="box-footer" style="text-align: center">
                                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                <button type="submit" class="btn btn-primary" name="Sbt6a" id="Sbt6a" value="Sbt6a"><%= SmBtn1 %></button>&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt6a" id="Dbt6a" value="Dbt6a"><%= SmBtn2 %></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <%
                            end if
                            %>
                        </div>
                        <%
                        end if

                        if Tab7Vs = 1 then
                        %>
                        <div class="<%= Pan7St %>" id="cursos" >
                            <div class="box box-warning" style="border-top-color: #2A363B">
                                <div class="box-body">
                                    <form action="Hrm_PadePAP1DG.asp?Prm=7&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form7" method="post">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr7Lb1 %></label>
                                                    <input type="text" class="form-control" name="DcrCur" id="DcrCur" placeholder="<%= Fr7Ph1 %>" maxlength="100" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr7Lb2 %></label>
                                                    <input type="text" class="form-control" name="DcrIns" id="DcrIns" placeholder="<%= Fr7Ph2 %>" maxlength="100" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr7Lb4 %></label>
                                                    <input type="text" class="form-control pull-right" name="DcrFec" id="datepicker4" placeholder="<%= Fr7Ph4 %>" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr7Lb3 %></label>
                                                    <input type="number" class="form-control" name="DcrDur" id="DcrDur" placeholder="<%= Fr7Ph3 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr7Lb5 %></label>
                                                    <select class="form-control" size="1" id="DcrTip" name="DcrTip" required>
                                                        <option class="form-control" value=""><%= Fr7Ph5 %></option>
                                                        <option class="form-control" value="I"><%= Fr7S1o1 %></option>
                                                        <option class="form-control" value="E"><%= Fr7S1o2 %></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                    <br/>
                                                    <button type="submit" class="btn btn-primary" name="Sbt7" id="Sbt7" value="Sbt7"><%= SmBtn4 %></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <%
                            sqlDcr = "select *from HRM10516                  " & _
                                     "where Dcr_EmpleadoID =  '"& Eid &"'    "
                            set rsD = dbconn.execute(sqlDcr)
                            if not rsD.eof and not rsD.bof then
                                %>
                                <div class="box box-info" style="border-top-color: #99B898">
                                    <div class="box-header">
                                        <h3 class="box-title"><%= Fr7Bh2 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadePAP1DG.asp?Prm=7&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form7a" method="post">
                                            <table id="example4" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th><%= Fr7Lb1 %></th>
                                                        <th><%= Fr7Lb2 %></th>
                                                        <th><%= Fr7Lb3 %></th>
                                                        <th><%= Fr7Lb4 %></th>
                                                        <th><%= Fr7Lb5 %></th>
                                                        <th style="text-align: center; color: red; font-weight: bold">X</th>
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
                                                                <input type="hidden" name="<%= "DidIns"&i %>" id="<%= "DidIns"&i %>" value="<%= trim(rsD("Dcr_Institucion")) %>" />
                                                                <input type="hidden" name="<%= "DidHrs"&i %>" id="<%= "DidHrs"&i %>" value="<%= trim(rsD("Dcr_Horas")) %>" />
                                                                <input type="hidden" name="<%= "DidFec"&i %>" id="<%= "DidFec"&i %>" value="<%= trim(rsD("Dcr_Fecha")) %>" />
                                                                <%= trim(rsD("Dcr_Curso")) %>
                                                            </td>
                                                            <td><%= trim(rsD("Dcr_Institucion")) %></td>
                                                            <td><%= trim(rsD("Dcr_Horas")) %></td>
                                                            <td><%= FecCrs %></td>
                                                            <td><%= DcrTip %></td>
                                                            <td style="text-align: center">
                                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                            </td>
                                                        </tr>
                                                        <%
                                                        rsD.movenext
                                                    loop
                                                    rsD.close
                                                    set rsD = Nothing
                                                    %>
                                                </tbody>
                                            </table>
                                            <div class="box-footer" style="text-align: center">
                                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                <button type="submit" class="btn btn-primary" name="Sbt7a" id="Sbt7a" value="Sbt7a"><%= SmBtn1 %></button>&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt7a" id="Dbt7a" value="Dbt7a"><%= SmBtn2 %></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <%
                            end if
                            %>
                        </div>
                        <%
                        end if

                        if Tab8Vs = 1 then
                        %>
                        <div class="<%= Pan8St %>" id="empleo" >
                            <div class="box box-warning" style="border-top-color: #2A363B">
                                <div class="box-body">
                                    <form action="Hrm_PadePAP1DG.asp?Prm=8&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form8" method="post">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr8Lb1 %></label>
                                                    <input type="text" class="form-control" name="DemCpy" id="DemCpy" value="<%= DemCpy %>" placeholder="<%= Fr8Ph1 %>" maxlength="90" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr8Lb2 %></label>
                                                    <select class="form-control" size="1" id="DemAid" name="DemAid" onchange="submit();" required>
                                                        <option class="form-control" value=""><%= Fr8Ph2 %></option>
                                                        <%
                                                        sqlAid = "select Cpt_Id, Cpt_Descripcion  " & _
                                                                 "from HRM10599                   " & _
                                                                 "where Cpt_Parent = 1000         " & _
                                                                 "and   Cpt_Idioma = '"& Lng &"'  " & _
                                                                 "order by Cpt_Descripcion        "
                                                        set rsAid = dbconn.execute(sqlAid)
                                                        if not rsAid.bof and not rsAid.eof then
                                                            do while not rsAid.eof
                                                                if rsAid("Cpt_Id") = DemAid then
                                                                    %>
                                                                    <option class="form-control" value="<%= rsAid("Cpt_Id") %>" selected><%= trim(rsAid("Cpt_Descripcion")) %></option>
                                                                    <%
                                                                else
                                                                    %>
                                                                    <option class="form-control" value="<%= rsAid("Cpt_Id") %>"><%= trim(rsAid("Cpt_Descripcion")) %></option>
                                                                    <%
                                                                end if
                                                                rsAid.movenext
                                                            loop
                                                            rsAid.close
                                                            set rsAid = nothing
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr8Lb3 %></label>
                                                    <select class="form-control" size="1" id="DemEid" name="DemEid" required>
                                                        <option class="form-control" value=""><%= Fr8Ph3 %></option>
                                                        <%
                                                        if DemAid > "" then
                                                            sqlEid = "select Cpt_Id, Cpt_Descripcion    " & _
                                                                     "from HRM10599                     " & _
                                                                     "where Cpt_Parent =  "& DemAid &"  " & _
                                                                     "and   Cpt_Idioma = '"& Lng &"'    " & _
                                                                     "order by Cpt_Descripcion          "
                                                            set rsEid = dbconn.execute(sqlEid)
                                                            if not rsEid.bof and not rsEid.eof then
                                                                do while not rsEid.eof
                                                                    if rsEid("Cpt_Id") = DemEid then
                                                                        %>
                                                                        <option class="form-control" value="<%= rsEid("Cpt_Id") %>" selected><%= trim(rsEid("Cpt_Descripcion")) %></option>
                                                                        <%
                                                                    else
                                                                        %>
                                                                        <option class="form-control" value="<%= rsEid("Cpt_Id") %>"><%= trim(rsEid("Cpt_Descripcion")) %></option>
                                                                        <%
                                                                    end if
                                                                    rsEid.movenext
                                                                loop
                                                                rsEid.close
                                                                set rsEid = nothing
                                                            end if
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr8Lb4 %></label>
                                                    <input type="text" class="form-control" name="DemPos" id="DemPos" placeholder="<%= Fr8Ph4 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr8Lb5 %></label>
                                                    <input type="number" min="0" max="300" class="form-control" name="DemPrs" id="DemPrs" placeholder="<%= Fr8Ph5 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr8Lb6 %></label>
                                                    <select class="form-control" size="1" id="DemNor" name="DemNor" required>
                                                        <option class="form-control" value=""><%= Fr8Ph6 %></option>
                                                        <%
                                                        sqlNor = "select Cpt_Id, Cpt_Descripcion    " & _
                                                                 "from HRM10599                     " & _
                                                                 "where Cpt_Parent = 2000           " & _
                                                                 "and   Cpt_Idioma = '"& Lng &"'    " & _
                                                                 "order by Cpt_Descripcion          "
                                                        set rsNor = dbconn.execute(sqlNor)
                                                        if not rsNor.bof and not rsNor.eof then
                                                            do while not rsNor.eof
                                                                %>
                                                                <option class="form-control" value="<%= rsNor("Cpt_Id") %>"><%= trim(rsNor("Cpt_Descripcion")) %></option>
                                                                <%
                                                                rsNor.movenext
                                                            loop
                                                            rsNor.close
                                                            set rsNor = nothing
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr8Lb7 %></label>
                                                    <input type="text" class="form-control" name="DemFec" id="DemFec" placeholder="<%= Fr8Ph7 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                    <br/>
                                                    <button type="submit" class="btn btn-primary" name="Sbt8" id="Sbt8" value="Sbt8"><%= SmBtn4 %></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
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
                                     "and   a.Dem_EmpleadoID    = '"& Eid &"'   "
                            set rsD = dbconn.execute(sqlDem)
                            if not rsD.eof and not rsD.bof then
                                %>
                                <div class="box box-info" style="border-top-color: #99B898">
                                    <div class="box-header">
                                        <h3 class="box-title"><%= Fr7Bh2 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadePAP1DG.asp?Prm=8&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form8a" method="post">
                                            <table id="example5" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th><%= Fr8Lb1 %></th>
                                                        <th><%= Fr8Lb2 %></th>
                                                        <th><%= Fr8Lb3 %></th>
                                                        <th><%= Fr8Lb4 %></th>
                                                        <th><%= Fr8Lb7 %></th>
                                                        <th style="text-align: center; color: red; font-weight: bold">X</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    i = 0
                                                    do while not rsD.eof
                                                        i = i + 1
                                                        if trim(rsD("Dem_FecIni")) > "" then
                                                            DemFic = CStr(trim(rsD("Dem_FecIni")))
                                                        else
                                                            DemFic = ""
                                                        end if
                                                        if trim(rsD("Dem_FecFin")) > "" then
                                                            DemFfn = CStr(trim(rsD("Dem_FecFin")))
                                                        else
                                                            DemFfn = ""
                                                        end if
                                                        if DemFic > "" then
                                                            DemFcs = Mid(DemFic,6,2) & "/" & Mid(DemFic,9,2) & "/" & Mid(DemFic,1,4) & " - "
                                                        else
                                                            DemFcs = " - "
                                                        end if
                                                        if DemFfn > "" then
                                                            DemFcs = DemFcs & Mid(DemFfn,6,2) & "/" & Mid(DemFfn,9,2) & "/" & Mid(DemFfn,1,4)
                                                        else
                                                            DemFcs = DemFcs & ""
                                                        end if
'                                                        DemFcs = Mid(DemFic,6,2) & "/" & Mid(DemFic,9,2) & "/" & Mid(DemFic,1,4) & " - " & Mid(DemFfn,6,2) & "/" & Mid(DemFfn,9,2) & "/" & Mid(DemFfn,1,4)
                                                        %>
                                                        <tr>
                                                            <td>
                                                                <input type="hidden" name="<%= "DemCpy"&i %>" id="<%= "DemCpy"&i %>" value="<%= trim(rsD("Dem_Empresa")) %>" />
                                                                <input type="hidden" name="<%= "DemPos"&i %>" id="<%= "DemPos"&i %>" value="<%= trim(rsD("Dem_Puesto")) %>" />
                                                                <%= trim(rsD("Dem_Empresa")) %>
                                                            </td>
                                                            <td><%= trim(rsD("DscAid")) %></td>
                                                            <td><%= trim(rsD("DscEid")) %></td>
                                                            <td><%= trim(rsD("Dem_Puesto")) %></td>
                                                            <td><%= DemFcs %></td>
                                                            <td style="text-align: center">
                                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                            </td>
                                                        </tr>
                                                        <%
                                                        rsD.movenext
                                                    loop
                                                    rsD.close
                                                    set rsD = Nothing
                                                    %>
                                                </tbody>
                                            </table>
                                            <div class="box-footer" style="text-align: center">
                                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                <button type="submit" class="btn btn-primary" name="Sbt8a" id="Sbt8a" value="Sbt8a"><%= SmBtn1 %></button>&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt8a" id="Dbt8a" value="Dbt8a"><%= SmBtn2 %></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <%
                            end if
                            %>
                        </div>
                        <%
                        end if

                        if Tab9Vs = 1 then
                        %>
                        <div class="<%= Pan9St %>" id="inters" >
                            <div class="box box-warning" style="border-top-color: #2A363B">
                                <div class="box-body">
                                    <form action="Hrm_PadePAP1DG.asp?Prm=9&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form9" method="post">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr9Lb1 %></label>
                                                    <select class="form-control" size="1" id="DinAid" name="DinAid" onchange="submit();" required>
                                                        <option class="form-control" value=""><%= Fr9Ph1 %></option>
                                                        <%
                                                        sqlAid = "select Cpt_Id, Cpt_Descripcion  " & _
                                                                 "from HRM10599                   " & _
                                                                 "where Cpt_Parent = 1000         " & _
                                                                 "and   Cpt_Idioma = '"& Lng &"'  " & _
                                                                 "order by Cpt_Descripcion        "
                                                        set rsAid = dbconn.execute(sqlAid)
                                                        if not rsAid.bof and not rsAid.eof then
                                                            do while not rsAid.eof
                                                                if rsAid("Cpt_Id") = DinAid then
                                                                    %>
                                                                    <option class="form-control" value="<%= rsAid("Cpt_Id") %>" selected><%= trim(rsAid("Cpt_Descripcion")) %></option>
                                                                    <%
                                                                else
                                                                    %>
                                                                    <option class="form-control" value="<%= rsAid("Cpt_Id") %>"><%= trim(rsAid("Cpt_Descripcion")) %></option>
                                                                    <%
                                                                end if
                                                                rsAid.movenext
                                                            loop
                                                            rsAid.close
                                                            set rsAid = nothing
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr9Lb2 %></label>
                                                    <select class="form-control" size="1" id="DinEid" name="DinEid" required>
                                                        <option class="form-control" value=""><%= Fr9Ph2 %></option>
                                                        <%
                                                        if DinAid > "" then
                                                            sqlEid = "select Cpt_Id, Cpt_Descripcion    " & _
                                                                     "from HRM10599                     " & _
                                                                     "where Cpt_Parent =  "& DinAid &"  " & _
                                                                     "and   Cpt_Idioma = '"& Lng &"'    " & _
                                                                     "order by Cpt_Descripcion          "
                                                            set rsEid = dbconn.execute(sqlEid)
                                                            if not rsEid.bof and not rsEid.eof then
                                                                do while not rsEid.eof
                                                                    %>
                                                                    <option class="form-control" value="<%= rsEid("Cpt_Id") %>"><%= trim(rsEid("Cpt_Descripcion")) %></option>
                                                                    <%
                                                                    rsEid.movenext
                                                                loop
                                                                rsEid.close
                                                                set rsEid = nothing
                                                            end if
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                    <br/>
                                                    <button type="submit" class="btn btn-primary" name="Sbt9" id="Sbt9" value="Sbt9"><%= SmBtn4 %></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
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
                                     "and   a.Din_EmpleadoID    = '"& Eid &"'   "
                            set rsD = dbconn.execute(sqlDin)
                            if not rsD.eof and not rsD.bof then
                                %>
                                <div class="box box-info" style="border-top-color: #99B898">
                                    <div class="box-header">
                                        <h3 class="box-title"><%= Fr7Bh2 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadePAP1DG.asp?Prm=9&Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & "&Ejr=" & Ejr & "&Sid=" & Sid %>" name="form9a" method="post">
                                            <table id="example5" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th><%= Fr9Lb1 %></th>
                                                        <th><%= Fr9Lb2 %></th>
                                                        <th style="text-align: center; color: red; font-weight: bold">X</th>
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
                                                            <td style="text-align: center">
                                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                            </td>
                                                        </tr>
                                                        <%
                                                        rsD.movenext
                                                    loop
                                                    rsD.close
                                                    set rsD = Nothing
                                                    %>
                                                </tbody>
                                            </table>
                                            <div class="box-footer" style="text-align: center">
                                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                <button type="submit" class="btn btn-primary" name="Sbt9a" id="Sbt9a" value="Sbt9a"><%= SmBtn1 %></button>&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt9a" id="Dbt9a" value="Dbt9a"><%= SmBtn2 %></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <%
                            end if
                            %>
                        </div>
                        <%
                        end if
                        %>

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

<!-- Page script -->
<script>
  $(function () {

    $("#example1").DataTable();
    $("#example2").DataTable();
    $("#example3").DataTable();
    $("#example4").DataTable();
    $('#example5').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });


    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#DemFec').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });
    $('#datepicker1').datepicker({
      autoclose: true
    });
    $('#datepicker2').datepicker({
      autoclose: true
    });
    $('#datepicker3').datepicker({
      autoclose: true
    });
    $('#datepicker4').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>


</body>
</html>

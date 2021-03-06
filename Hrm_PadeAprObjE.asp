<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Alta de Objetivos Ejecutivos PADE</title>
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
  <!--#include file="Hrm_Procedures01.asp"-->

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
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0300' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitPri = trim(rsTrn("Trd_Texto"))
              Case "TitTer"
                TitTer = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
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
              Case "Tb1Hd6"
                Tb1Hd6 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd7"
                Tb1Hd7 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl1"
                Fr1Sl1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl2"
                Fr1Sl2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl3"
                Fr1Sl3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl4"
                Fr1Sl4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl5"
                Fr1Sl5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl6"
                Fr1Sl6 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb1"
                Fr0lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb2"
                Fr0lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb3"
                Fr0lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb4"
                Fr0lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb3"
                Fr1Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph3"
                Fr1Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb4"
                Fr1Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph4"
                Fr1Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb5"
                Fr1Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph5"
                Fr1Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb6"
                Fr1Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph6"
                Fr1Ph6 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb7"
                Fr1Lb7 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph7"
                Fr1Ph7 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb8"
                Fr1Lb8 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph8"
                Fr1Ph8 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb9"
                Fr1Lb9 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph9"
                Fr1Ph9 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb10"
                Fr1Lb10 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph10"
                Fr1Ph10 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb11"
                Fr1Lb11 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph11"
                Fr1Ph11 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb12"
                Fr1Lb12 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph12"
                Fr1Ph12 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn3"
                SmBtn3  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn4"
                SmBtn4  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsEr01"
                MsEr01  = trim(rsTrn("Trd_Texto"))
              Case "MsEr02"
                MsEr02  = trim(rsTrn("Trd_Texto"))
              Case "MsEr03"
                MsEr03  = trim(rsTrn("Trd_Texto"))
              Case "TskTx1"
                TskTx1  = trim(rsTrn("Trd_Texto"))
              Case "TskTx2"
                TskTx2  = trim(rsTrn("Trd_Texto"))
              Case "TskTx3"
                TskTx3  = trim(rsTrn("Trd_Texto"))
              Case "EmMs01"
                EmMs01  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb0Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    '<!-- Alta de Registros (inicio) -->

    Dim Eid
    Dim Ejr
    Dim Dsc
    Dim Sbt1
    Dim Sbt2
    Dim Sbt3
    Dim Sbt4
    Eid = ""
    Ejr = ""
    Dsc = ""
    Eid = Request.Querystring("Eid")
    Ejr = Request.Querystring("Ejr")
    Dsc = Request.Querystring("Dsc")
    Sbt1 = Request.Form("Sbt1")
    Sbt2 = Request.Form("Sbt2")
    Sbt3 = Request.Form("Sbt3")
    Sbt4 = Request.Form("Sbt4")

    sqlCia = "select Emp_CompaniaID, Emp_PlazaSuperior, Emp_Email from HRM10220 where Emp_Empleadoid = '"& Eid &"' "
    set rsCia = dbconn.execute(sqlCia)
    if not rsCia.bof and not rsCia.eof then
        Cid = trim(rsCia("Emp_CompaniaID"))
        Pzs = rsCia("Emp_PlazaSuperior")
        Uem = trim(rsCia("Emp_Email"))
        sqlPzs = "select Otm_Plaza_Superior, Otm_EmpresaFuente, Otm_Empleado from HRM10100 where Otm_EmpresaFuente = "& rsCia("Emp_CompaniaID") &" and Otm_Plaza = "& rsCia("Emp_PlazaSuperior") &"  "
        set rsPzs = dbconn.execute(sqlPzs)
        if not rsPzs.bof and not rsPzs.eof then
            if rsPzs("Otm_Empleado") > 0 then
                sqlJin = "select Emp_EmpleadoID, Emp_Email from HRM10220 where Emp_PlazaID = '"& Pzs &"' "
            else
                sqlJin = "select Emp_EmpleadoID, Emp_Email from HRM10220 where Emp_PlazaID = '"& rsPzs("Otm_Plaza_Superior") &"' "
            end if
            set rsJin = dbconn.execute(sqlJin)
            if not rsJin.bof and not rsJin.eof then
                Jin = trim(rsJin("Emp_EmpleadoID"))
                Jem = trim(rsJin("Emp_Email"))
            else
                Jin = ""
                Jem = ""
            end if
        else
            Jin = ""
            Jem = ""
        end if
    else
        Cid = ""
        Jin = ""
    end if

    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Inicio -->
    dim EnvEml
    call PrmEml()
    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Fin -->

    sqlTvl = "select Evh_TipoEval,                   " & _
             "       Evh_GrupoEjecutivo              " & _
             "from HRM10525                          " & _
             "where Evh_CorporativoID = '5000'       " & _
             "and   Evh_EmpleadoID    = '"& Eid &"'  " & _
             "and   Evh_Ejercicio     =  "& Ejr &"   "
    set rsT = dbconn.execute(sqlTvl)
    if not rsT.bof and not rsT.eof then
        Tvl = rsT("Evh_TipoEval")
        Gre = trim(rsT("Evh_GrupoEjecutivo"))
    else
        Tvl = 0
        Gre = ""
    end if
   
    if Tvl = 1 then
        response.redirect "Hrm_PadeAprObj.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & Ejr & "&Eid=" & Eid
    end if

    sqlMyM = "select Nmx_Minimo, Nmx_Maximo    " & _
             "from HRM105A2                    " & _
             "where Nmx_Ejercicio = "& Ejr &"  " & _
             "and   Nmx_Tipo      = 2          "
    set rsMM = dbconn.execute(sqlMyM)
    if not rsMM.bof and not rsMM.eof then
        Omn = rsMM("Nmx_Minimo")
        Omx = rsMM("Nmx_Maximo")
    else
        Omn = 0
        Omx = 0
    end if

    sqlGre = "select * from HRM10520                  " & _
             "where Gre_CorporativoID = '5000'        " & _
             "and   Gre_Nombre        = '"& Gre &"'   "
    set rsGre = dbconn.execute(sqlGre)
    if not rsGre.bof and not rsGre.eof then
        UPnd = Cdbl(rsGre("Gre_UAFIRPond"))
        UNan = Cdbl(rsGre("Gre_UAFIRNivAnt"))
        UMin = Cdbl(rsGre("Gre_UAFIRMinimo"))
        UObj = Cdbl(rsGre("Gre_UAFIRObjetivo"))
    else
        UPnd = 0
        UNan = 0
        UMin = 0
        UObj = 0
    end if

    if Sbt1 = "Sbt1" then   
        sqlTpn = "select isnull(sum(Pod_Ponderacion),0) as TotPnd  " & _
                 "from HRM10531                                    " & _
                 "where Pod_CorporativoID = '5000'                 " & _
                 "and   Pod_CompaniaID = '"& Cid &"'               " & _
                 "and   Pod_Ejercicio  =  "& Ejr &"                " & _
                 "and   Pod_EmpleadoID = '"& Eid &"'               " & _
                 "and   Pod_Tipo       = 1                         "
        set rsP = dbconn.execute(sqlTpn)
        if trim(Request.Form("SubObj")) > "" then
            TotPnd = CInt(rsP("TotPnd"))
        else
            TotPnd = CInt(rsP("TotPnd")) + CInt(Request.Form("ObjPnd"))
        end if

        sqlTob = "select isnull(count(Pod_Partida),0) as TotObj    " & _
                 "from HRM10531                                    " & _
                 "where Pod_CorporativoID = '5000'                 " & _
                 "and   Pod_Tipo          = 1                      " & _
                 "and   Pod_CompaniaID = '"& Cid &"'               " & _
                 "and   Pod_Ejercicio  =  "& Ejr &"                " & _
                 "and   Pod_EmpleadoID = '"& Eid &"'               " & _
                 "and   Pod_Partida    > 0                         "
        set rsT = dbconn.execute(sqlTob)
        TotObj = CInt(rsT("TotObj")) + 1
        if TotPnd > 100 then
            %>
            <script type="text/javascript">
                alert("<%= MsEr01 %>");
            </script>
            <%
        else
            if TotObj > Omx then
                %>
                <script type="text/javascript">
                    alert("<%= MsEr02 %>");
                </script>
                <%
            else
                sqlPtd = "select isnull(max(Pod_Partida),0) as NumPtd      " & _
                         "from HRM10531                                    " & _
                         "where Pod_CorporativoID = '5000'                 " & _
                         "and   Pod_CompaniaID = '"& Cid &"'               " & _
                         "and   Pod_Ejercicio  =  "& Ejr &"                " & _
                         "and   Pod_EmpleadoID = '"& Eid &"'               " & _
                         "and   Pod_Tipo       = 1                         "
                sqlPtd = "select isnull(max(Pod_Partida),0) as NumPtd      " & _
                         "from HRM10531                                    " & _
                         "where Pod_CorporativoID = '5000'                 " & _
                         "and   Pod_CompaniaID = '"& Cid &"'               " & _
                         "and   Pod_Ejercicio  =  "& Ejr &"                " & _
                         "and   Pod_EmpleadoID = '"& Eid &"'               "
                set rsPtd = dbconn.execute(sqlPtd)
                Ptd = CInt(rsPtd("NumPtd")) + 1
                FecCmp = Mid(trim(Request.Form("FecCmp")),7,4)  & "-" & Mid(trim(Request.Form("FecCmp")),1,2)  & "-" & Mid(trim(Request.Form("FecCmp")),4,2)
                if trim(Request.Form("SubObj")) > "" then
                    Sob = trim(Request.Form("SubObj"))
                    Tob = 2
                else 
                    Sob = 0
                    Tob = 1
                end if
                sqlUbU = "select Pod_Partida from HRM10531               " & _
                         "where Pod_CorporativoID = '5000'               " & _
                         "and   Pod_CompaniaID  = '"& Cid &"'            " & _
                         "and   Pod_Ejercicio   =  "& Ejr &"             " & _
                         "and   Pod_EmpleadoID  = '"& Eid &"'            " & _
                         "and   Pod_Descripcion = 'UAFIR'                " & _
                         "and   Pod_Tipo        = 1                      "
                set rsUbu = dbconn.execute(sqlUbu)
                if rsUbu.bof and rsUbu.eof then
                    FecUaf = Ejr & "-12-31"
                    sqlIns = "insert into HRM10531                           " & _
                             "values('5000',                                 " & _
                             "       '"& Cid &"',                            " & _
                             "       '"& Eid &"',                            " & _
                             "        "& Ejr &",                             " & _
                             "        "& Tob &",                             " & _
                             "        0,                                     " & _
                             "        "& Sob &",                             " & _
                             "       '',                                     " & _
                             "       'UAFIR',                                " & _
                             "        "& UPnd &",                            " & _
                             "       '"& UNan &"',                           " & _
                             "        "& UObj &",                            " & _
                             "       'Porcentaje',                           " & _
                             "       'I',                                    " & _
                             "       'A',                                    " & _
                             "       '"& FecUaf &"',                         " & _
                             "       '',0,0,                                 " & _
                             "       '',                                     " & _
                             "       '')                                     "
                    set rsI = dbconn.execute(sqlIns)
                end if

                ObjDsc = Replace(trim(Request.Form("ObjDsc")),chr(39),"")
                ObjDsc = Replace(ObjDsc,chr(34),"")
                CmtObj = Replace(trim(Request.Form("CmtObj")),chr(39),"")
                CmtObj = Replace(CmtObj,chr(34),"")

                sqlIns = "insert into HRM10531                           " & _
                         "values('5000',                                 " & _
                         "       '"& Cid &"',                            " & _
                         "       '"& Eid &"',                            " & _
                         "        "& Ejr &",                             " & _
                         "        "& Tob &",                             " & _
                         "        "& Ptd &",                             " & _
                         "        "& Sob &",                             " & _
                         "       '"& trim(Request.Form("EstNeg")) &"',   " & _
                         "       '"& ObjDsc                       &"',   " & _
                         "        "& trim(Request.Form("ObjPnd")) &",    " & _
                         "       '"& trim(Request.Form("ResAnt")) &"',   " & _
                         "        "& trim(Request.Form("ObjMta")) &",    " & _
                         "       '"& trim(Request.Form("UniMed")) &"',   " & _
                         "       '"& trim(Request.Form("TipInd")) &"',   " & _
                         "       '"& trim(Request.Form("FreRev")) &"',   " & _
                         "       '"& FecCmp &"',                         " & _
                         "       '',0,0,                                 " & _
                         "       '"& CmtObj                       &"',   " & _
                         "       '')                                     "
                set rsI = dbconn.execute(sqlIns)
    '            response.write(sqlins)
            end if
        end if
    end if

    if Sbt2 = "Sbt2" then
        Ind = Request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                Ptd = trim(Request.Form("Ptd"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10531                        " & _
                             "where Pod_CorporativoID = '5000'       " & _
                             "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                             "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                             "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                             "and   Pod_Partida       =  "& Ptd &"   "
                    set rsd = dbconn.execute(sqldel)
                    sqldel = "delete HRM10531                        " & _
                             "where Pod_CorporativoID = '5000'       " & _
                             "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                             "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                             "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                             "and   Pod_Parent        =  "& Ptd &"   "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if
    end if

    if Sbt4 = "Sbt4" then
        sqlTob = "select isnull(count(Pod_Partida),0) as TotObj    " & _
                 "from HRM10531                                    " & _
                 "where Pod_CorporativoID = '5000'                 " & _
                 "and   Pod_Tipo          = 1                      " & _
                 "and   Pod_CompaniaID = '"& Cid &"'               " & _
                 "and   Pod_Ejercicio  =  "& Ejr &"                " & _
                 "and   Pod_EmpleadoID = '"& Eid &"'               " & _
                 "and   Pod_Partida    > 0                         "
        set rsT = dbconn.execute(sqlTob)
        TotObj = CInt(rsT("TotObj"))
        if TotObj < Omn then
            %>
            <script type="text/javascript">
                alert("<%= MsEr03 %>");
            </script>
            <%
        else
            sqlupd = "update HRM10525                        " & _
                     "set Evh_Estatus = 1                    " & _
                     "where Evh_CorporativoID = '5000'       " & _
                     "and   Evh_CompaniaID    = '"& Cid &"'  " & _
                     "and   Evh_EmpleadoID    = '"& Eid &"'  " & _
                     "and   Evh_Ejercicio     =  "& Ejr &"   "
            set rsu = dbconn.execute(sqlupd)
            sqlupd = "update HRM10502                         " & _
                     "set Psm_Estatus         = 1             " & _
                     "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                     "and   Psm_CorporativoID = '5000'        " & _
                     "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                     "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                     "and   Psm_SemaforoID    = 'APROBJ0010'  "
            set rsu = dbconn.execute(sqlupd)
            Fhy = year(date) & "-" & month(date) & "-" & day(date)
            TskScr = "Hrm_PadeAutObjE.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Nem=" & Eid & "&Nmb=" & Unm & "&Dsc=" & Dsc & "&Cid=" & Cid
            TskDsc = Dsc & " - " & TskTx1
            sqlins = "insert into HRM10400                    " & _
                     "values('PADE',                          " & _
                     "       '',                              " & _
                     "       '"& Eid &"',                     " & _
                     "       '',                              " & _
                     "       1,                               " & _
                     "       1,                               " & _
                     "       '"& Jin &"',                     " & _
                     "       '"& Dsc &"',                     " & _
                     "       '"& Fhy &"',                     " & _
                     "       '',                              " & _
                     "       'A',                             " & _
                     "       '"& TskScr &"',                  " & _
                     "       '"& TskDsc &"')                  "
            set rsi = dbconn.execute(sqlins)
            'response.write(sqlins)

            '<!-- Validamos si el Envio de Emails está activado -->
            if EnvEml = 1 then
                '<!-- Validamos si el Jefe del Solicitante tiene Email -->
			    if trim(Jem) <> "" then
                    Dim myMail
                    Set myMail=CreateObject("CDO.Message")
                    myMail.Subject = TskDsc
                    msgtext = Unm & "  " & EmMs01 & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
    	            myMail.From = Emc
	                myMail.To = Jem
                    myMail.Cc = Uem
                    myMail.Bcc = "jorge.barron@eryseg.com"
    '                myMail.AddAttachment "C:\inetpub\wwwroot\Hrm\reports\Attch01.txt"
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
            if trim(Trn) = "Hrm_PadeAdmin01.asp" then
                %><script>window.close();</script><%
            else
                response.redirect Trn & "?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
            end if
        end if
    end if

    '<!-- Alta de Registros (fin) -->
    SubTit = Dsc
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitTer,SubTit) %>

    <!-- Main content -->
    <section class="content">
      <div class="box box-success">
          <div class="box-header">
              <div class="row fontawesome-icon-list">
                  <div class="col-md-3 col-sm-4">
                      <div class="form-group">
                          <label><%= Fr0lb1 & " : " %></label>
                          <br><%= Gre %></br>
                      </div>
                  </div>
                  <div class="col-md-3 col-sm-4">
                      <div class="form-group">
                          <label><%= Fr0lb2 & " : " %></label>
                          <br><%= formatnumber(UPnd,2) %></br>
                      </div>
                  </div>
                  <div class="col-md-3 col-sm-4">
                       <div class="form-group">
                          <label><%= Fr0lb3 & " : " %></label>
                          <br><%= formatnumber(UNan,2) %></br>
                      </div>
                  </div>
                  <div class="col-md-3 col-sm-4">
                      <div class="form-group">
                          <label><%= Fr0lb4 & " : " %></label>
                          <br><%= formatnumber(UMin,2) & " - " & formatnumber(UObj,2) %></br>
                      </div>
                  </div>
              </div>
          </div>

        <div class="box box-primary">
            <form action="Hrm_PadeAprObjE.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1" method="post">
                <div class="box-header with-border">
                    <h3 class="box-title"><%= BxHd01 %><label style="font-size: small">&nbsp;&nbsp;(Min : <%= Omn %>, Max: <%= Omx %>)</label></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                <select class="form-control" size="1" id="EstNeg" name="EstNeg" required>
                                    <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                    <%
                                    EsnKey = "EST" & Ejr
                                    sqlEsn = "select a.Pst_Partida, b.Trd_Texto            " & _
                                             "from HRM10530 a, HRM10002 b                  " & _
                                             "where b.Trd_TransaccionID = '"& EsnKey &"'   " & _
                                             "and   a.Pst_Partida       = b.Trd_ElementoID " & _
                                             "and   a.Pst_Ejercicio     =  "& Ejr &"       " & _
                                             "and   b.Trd_IdiomaID      = '"& Lng &"'      " & _
                                             "order by a.Pst_Partida                       "
                                    set rsE = dbconn.execute(sqlEsn)
                                    if not rsE.bof and not rsE.eof then
                                        do while not rsE.eof
                                            %>
                                            <option class="form-control" value="<%= rsE("Pst_Partida") %>"><%= trim(rsE("Trd_Texto")) %></option>
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
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                <input type="text" class="form-control" id="ObjDsc" name="ObjDsc" placeholder="<%= Fr1Ph2 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb3 %></label>
                                <input type="number" min="1" max="100" class="form-control" id="ObjPnd" name="ObjPnd" placeholder="<%= Fr1Ph3 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb4 %></label>
                                <input type="number" step=".001" class="form-control" id="ObjMta" name="ObjMta" placeholder="<%= Fr1Ph4 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb5 %></label>
                                <input type="text" class="form-control" id="UniMed" name="UniMed" placeholder="<%= Fr1Ph5 %>" maxlength="20" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb6 %></label>
                                <input type="number" step=".001" class="form-control" id="ResAnt" name="ResAnt" placeholder="<%= Fr1Ph6 %>"  required />
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb7 %></label>
                                <select class="form-control" size="1" id="FreRev" name="FreRev" required>
                                    <option class="form-control" value=""><%= Fr1Ph7 %></option>
                                    <option class="form-control" value="B"><%= Fr1Sl1 %></option>
                                    <option class="form-control" value="C"><%= Fr1Sl2 %></option>
                                    <option class="form-control" value="S"><%= Fr1Sl3 %></option>
                                    <option class="form-control" value="A"><%= Fr1Sl4 %></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb8 %></label>
                                <input type="text" class="form-control" id="datepicker" name="FecCmp" placeholder="<%= Fr1Ph8 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb9 %></label>
                                <select class="form-control" size="1" id="TipInd" name="TipInd" required>
                                    <option class="form-control" value=""><%= Fr1Ph9 %></option>
                                    <option class="form-control" value="I"><%= Fr1Sl5 %></option>
                                    <option class="form-control" value="D"><%= Fr1Sl6 %></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb10 %></label>
                                <select class="form-control" size="1" id="SubObj" name="SubObj">
                                    <option class="form-control" value=""><%= Fr1Ph10 %></option>
                                    <%

                                    sqlObj = "select Pod_Partida, Pod_Descripcion    " & _
                                             "from HRM10531                          " & _
                                             "where Pod_CorporativoID = '5000'       " & _
                                             "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                                             "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                                             "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                                             "and   Pod_Tipo          = 1            " & _
                                             "order by Pod_Partida                   "
                                    set rsO = dbconn.execute(sqlObj)
                                    if not rsO.bof and not rsO.eof then
                                        do while not rsO.eof
                                            %>
                                            <option class="form-control" value="<%= rsO("Pod_Partida") %>"><%= trim(rsO("Pod_Descripcion")) %></option>
                                            <%
                                            rsO.movenext
                                        loop
                                        rsO.close
                                        set rsO = Nothing
                                    end if
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb11 %></label>
                                <textarea class="form-control" name="CmtObj" id="CmtObj" placeholder="<%= Fr1Ph11 %>" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb12 %></label>
                                <textarea class="form-control" rows="2" disabled="disabled"></textarea>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                <br/>
                                <input type="hidden" name="UPnd" id="UPnd" value="<%= UPnd %>" />
                                <input type="hidden" name="UNan" id="UNan" value="<%= UNan %>" />
                                <input type="hidden" name="UMin" id="UPnd" value="<%= UMin %>" />
                                <input type="hidden" name="UObj" id="UPnd" value="<%= UObj %>" />
                                <button type="submit" class="btn btn-primary" onclick="return validate()" name="Sbt1" id="Sbt1" value="Sbt1"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </form>

            <%
            sqlObj = "select * from HRM10531                 " & _
                     "where Pod_CorporativoID = '5000'       " & _
                     "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                     "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                     "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                     "and   Pod_Tipo          = 1            " & _
                     "order by Pod_Partida                   "
            set rsO = dbconn.execute(sqlObj)
            if not rsO.bof and not rsO.eof then
                i = 0
                TotPnd = 0
                SobPnd = 0
                %>
                <div class="box box-primary">
                    <form action="Hrm_PadeAprObjE.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1a" method="post">
                        <div class="box-header">
                            <h3 class="box-title">Registrados</h3>
                        </div>
                        <div class="box-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th><%= Tb1Hd1 %></th>
                                    <th><%= Tb1Hd2 %></th>
                                    <th><%= Tb1Hd7 %></th>
                                    <th><%= Tb1Hd3 %></th>
                                    <th><%= Tb1Hd4 %></th>
                                    <th><%= Tb1Hd6 %></th>
                                    <th><%= Tb1Hd5 %></th>
                                    <th style="text-align: center; color: red; font-weight: bold">X</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                do while not rsO.eof
                                    i = i + 1
                                    TotPnd = TotPnd + CInt(rsO("Pod_Ponderacion"))
                                    if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                        if Lng = "EN" then
                                            ODsc = "EBIT"
                                            OUmd = "Percentage"
                                        else
                                            ODsc = "UAFIR"
                                            OUmd = "Porcentaje"
                                        end if
                                    else
                                        ODsc = trim(rsO("Pod_Descripcion"))
                                        OUmd = trim(rsO("Pod_UniMed"))
                                    end if
                                    %>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="<%= "Ptd"&i %>" id="<%= "Ptd"&i %>" value="<%= rsO("Pod_Partida") %>" />
                                            <%
                                            if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                                %>
                                                <%= rsO("Pod_Ponderacion") %>
                                                <%
                                            else
                                                %>
                                                <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                    <%= rsO("Pod_Ponderacion") %>
                                                </a>
                                                <%
                                            end if
                                            %>
                                        </td>
                                        <td>
                                            <%
                                            if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                                %>
                                                <%= ODsc %>
                                                <%
                                            else
                                                %>
                                                <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                    <%= ODsc %>
                                                </a>
                                                <%
                                            end if
                                            %>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <%
                                            if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                                %>
                                                <% if trim(rsO("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %>
                                                <%
                                            else
                                                %>
                                                <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                    <% if trim(rsO("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %>
                                                </a>
                                                <%
                                            end if
                                            %>
                                        </td>
                                        <td>
                                            <%
                                            if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                                %>
                                                <%= rsO("Pod_Meta") %>
                                                <%
                                            else
                                                %>
                                                <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                    <%= rsO("Pod_Meta") %>
                                                </a>
                                                <%
                                            end if
                                            %>
                                        </td>
                                        <td>
                                            <%
                                            if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                                %>
                                                <%= OUmd %>
                                                <%
                                            else
                                                %>
                                                <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                    <%= OUmd %>
                                                </a>
                                                <%
                                            end if
                                            %>
                                        </td>
                                        <td>
                                            <%
                                            if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                                %>
                                                <%= rsO("Pod_FechaFinCalc") %>
                                                <%
                                            else
                                                %>
                                                <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                    <%= rsO("Pod_FechaFinCalc") %>
                                                </a>
                                                <%
                                            end if
                                            %>
                                        </td>
                                        <td style="text-align: center">
                                            <%
                                            if trim(rsO("Pod_Descripcion")) = "UAFIR" then
                                                %>
                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>" disabled="disabled"  />
                                                <%
                                            else
                                                %>
                                                <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                <%
                                            end if
                                            %>
                                        </td>
                                    </tr>
                                    <%
                                    sqlSob = "select * from HRM10531                 " & _
                                             "where Pod_CorporativoID = '5000'       " & _
                                             "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                                             "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                                             "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                                             "and   Pod_Tipo          = 2            " & _
                                             "and   Pod_Parent        = "& trim(rsO("Pod_Partida")) &"  " & _
                                             "order by Pod_Partida                   "
                                    set rsS = dbconn.execute(sqlSob)
                                    if not rsS.bof and not rsS.eof then
                                        do while not rsS.eof
                                            i = i + 1
                                            SobPnd = SobPnd + CInt(rsS("Pod_Ponderacion"))
                                            %>
                                            <tr>
                                                <td style="text-align: right">
                                                    <input type="hidden" name="<%= "Ptd"&i %>" id="<%= "Ptd"&i %>" value="<%= rsS("Pod_Partida") %>" />
                                                    <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                        <%= rsS("Pod_Ponderacion") %>
                                                    </a>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                        <%= trim(rsS("Pod_Descripcion")) %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                        <% if trim(rsS("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                        <%= rsS("Pod_Meta") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                        <%= rsS("Pod_UniMed") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                        <%= rsS("Pod_FechaFinCalc") %>
                                                    </a>
                                                </td>
                                                <td style="text-align: center">
                                                    <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                </td>
                                            </tr>
                                            <%      
                                            rsS.movenext
                                        loop
                                        rsS.close
                                        set rsS = Nothing
                                        if SobPnd = 100 then
                                            SobPnd = 0
                                        end if
                                    end if
                                    rsO.movenext
                                loop
                                rsO.close
                                set rsO = Nothing
                                %>
                                </tbody>
                            </table>
                            <div class="box-footer" style="text-align: center">
                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                <button type="submit" class="btn btn-primary" name="Sbt2" id="Sbt2" value="Sbt2" style="background-color: red" ><%= SmBtn2 %></button>&nbsp;&nbsp;&nbsp;
                                <%
                                if TotPnd = 100 then
                                    if SobPnd = 0 then
                                        %>
                                        <a href="Hrm_PadeAprObjIE.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc %>" target="_blank" ><button type="button" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3"><%= SmBtn3 %></button>&nbsp;&nbsp;&nbsp;</a>
                                        <button type="submit" class="btn btn-primary" name="Sbt4" id="Sbt4" value="Sbt4" style="background-color: green" ><%= SmBtn4 %></button>
                                        <%
                                    else
                                        %>
                                        <a href="Hrm_PadeAprObjIE.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc %>" target="_blank" ><button type="button" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3" disabled><%= SmBtn3 %></button>&nbsp;&nbsp;&nbsp;</a>
                                        <button type="submit" class="btn btn-primary" name="Sbt4" id="Sbt4" value="Sbt4" style="background-color: green" disabled><%= SmBtn4 %></button>
                                        <%
                                    end if
                                else
                                    %>
                                    <a href="Hrm_PadeAprObjIE.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc %>" target="_blank" ><button type="button" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3" disabled><%= SmBtn3 %></button>&nbsp;&nbsp;&nbsp;</a>
                                    <button type="submit" class="btn btn-primary" name="Sbt4" id="Sbt4" value="Sbt4" style="background-color: green" disabled><%= SmBtn4 %></button>
                                    <%
                                end if
                                %>
                            </div>
                        </div>
                    </form>
                </div>
                <%
            end if
            %>

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

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    $('#reservation01').daterangepicker();
    $('#reservation02').daterangepicker();
    $('#reservation03').daterangepicker();
    $('#reservation04').daterangepicker();
    $('#reservation05').daterangepicker();
    $('#reservation06').daterangepicker();
    $('#reservation07').daterangepicker();
    $('#reservation08').daterangepicker();
    $('#reservation09').daterangepicker();
    $('#reservation10').daterangepicker();
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

    <script>
        function validate() {
            var a = document.forms["form1"]["ObjPnd"].value;
            var b = document.forms["form1"]["ObjMta"].value;
            var c = document.forms["form1"]["ResAnt"].value;

                if (isNaN(a)) {
                    alert("La Ponderacion debe ser un valor Numerico / Objective Weight must be Numeric");
                    return false;
                }
                if (isNaN(b)) {
                    alert("La Meta debe ser un valor Numerico / Goal must be Numeric");
                    return false;
                }
                if (isNaN(c)) {
                    alert("Resultado Año Anterior debe ser un valor Numerico / Previous Year Result must be Numeric");
                    return false;
                }

            }
        </script>

</body>
</html>
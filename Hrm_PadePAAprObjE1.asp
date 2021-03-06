<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Modificación de Objetivos Ejecutivos PADE</title>
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
    Dim Ptd
    Ejr = ""
    Dsc = ""
    Eid = Request.Querystring("Eid")
    Ejr = Request.Querystring("Ejr")
    Dsc = Request.Querystring("Dsc")
    Ptd = Request.Querystring("Ptd")
    Sbt1 = Request.Form("Sbt1")
    Sbt2 = Request.Form("Sbt2")
    Sbt3 = Request.Form("Sbt3")
    Sbt4 = Request.Form("Sbt4")

    sqlCia = "select Emp_CompaniaID, Emp_PlazaSuperior, Emp_NombreCompleto, Emp_Foto from HRM10220 where Emp_Empleadoid = '"& Eid &"' "
    set rsCia = dbconn.execute(sqlCia)
    if not rsCia.bof and not rsCia.eof then
        Cid = trim(rsCia("Emp_CompaniaID"))
        Pzs = rsCia("Emp_PlazaSuperior")
        Enm = rsCia("Emp_NombreCompleto")
        Eim = rsCia("Emp_Foto")
        sqlJin = "select Emp_EmpleadoID from HRM10220 where Emp_PlazaID = '"& Pzs &"' "
        set rsJin = dbconn.execute(sqlJin)
        if not rsJin.bof and not rsJin.eof then
            Jin = trim(rsJin("Emp_EmpleadoID"))
        else
            Jin = ""
        end if
    else
        Cid = ""
        Jin = ""
    end if

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
        response.redirect "Hrm_PadePAAprObj.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr
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
        if not rsP.bof and not rsP.eof then
            TotPnd = CInt(rsP("TotPnd"))
        else
            TotPnd = 0
        end if

        if trim(Request.Form("SubObj")) > "" then
            Sob = trim(Request.Form("SubObj"))
            Tob = 2
        else
            Sob = 0
            Tob = 1
        end if

        sqlPbj = "select isnull(Pod_Ponderacion,0) as TotPbj,      " & _
                 "       Pod_Tipo,   Pod_Parent                    " & _
                 "from HRM10531                                    " & _
                 "where Pod_CorporativoID = '5000'                 " & _
                 "and   Pod_CompaniaID = '"& Cid &"'               " & _
                 "and   Pod_Ejercicio  =  "& Ejr &"                " & _
                 "and   Pod_EmpleadoID = '"& Eid &"'               " & _
                 "and   Pod_Partida    =  "& Ptd &"                "
        set rsPbj = dbconn.execute(sqlPbj)
        if not rsPbj.bof and not rsPbj.eof then
            PndAnt = rsPbj("TotPbj")
            TipAnt = rsPbj("Pod_Tipo")
            PrnAnt = rsPbj("Pod_Parent")

            if TipAnt = 1 then
                if Tob = 1 then
                    if TotPnd > 0 then
                        TotPnd = (TotPnd - PndAnt) + CInt(Request.Form("ObjPnd"))
                    else
                        TotPnd = CInt(Request.Form("ObjPnd"))
                    end if
                else
                    if TotPnd > 0 then
                        TotPnd = TotPnd - PndAnt
                    end if
                end if
'            else
 '               
  '              if Tob = 2 then
   '                 if TotPnd > 0 then
    '                    TotPnd = TotPnd - PndAnt + CInt(Request.Form("ObjPnd"))
     '               else
      '                  TotPnd = CInt(Request.Form("ObjPnd"))
       '             end if
        '        else
         '           if TotPnd > 0 then
          '              TotPnd = TotPnd - PndAnt
           '         end if
            '    end if
             end if
        end if

        if TotPnd > 100 then
            %>
            <script type="text/javascript">
                alert("<%= MsEr01 %>");
            </script>
            <%
        else
            FecCmp = Mid(trim(Request.Form("FecCmp")),7,4)  & "-" & Mid(trim(Request.Form("FecCmp")),1,2)  & "-" & Mid(trim(Request.Form("FecCmp")),4,2)
            sqlUpd = "update HRM10531                                                " & _
                     "set Pod_EstrategiaID = '"& trim(Request.Form("EstNeg")) &"',   " & _
                     "    Pod_Descripcion  = '"& trim(Request.Form("ObjDsc")) &"',   " & _
                     "    Pod_Ponderacion  =  "& trim(Request.Form("ObjPnd")) &",    " & _
                     "    Pod_ResultAnt    = '"& trim(Request.Form("ResAnt")) &"',   " & _
                     "    Pod_Meta         =  "& trim(Request.Form("ObjMta")) &",    " & _
                     "    Pod_UniMed       = '"& trim(Request.Form("UniMed")) &"',   " & _
                     "    Pod_Direccion    = '"& trim(Request.Form("TipInd")) &"',   " & _
                     "    Pod_Seguimiento  = '"& trim(Request.Form("FreRev")) &"',   " & _
                     "    Pod_FechaFinCalc = '"& FecCmp &"',                         " & _
                     "    Pod_ComentarioE  = '"& trim(Request.Form("CmtObj")) &"'    " & _
                     "where Pod_CorporativoID = '5000'                               " & _
                     "and   Pod_CompaniaID    = '"& Cid &"'                          " & _
                     "and   Pod_Ejercicio     =  "& Ejr &"                           " & _
                     "and   Pod_EmpleadoID    = '"& Eid &"'                          " & _
                     "and   Pod_Partida       =  "& Ptd &"                           "
            set rsUpd = dbconn.execute(sqlUpd)
            response.redirect "Hrm_PadePAAprObjE.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc
'            response.write(sqlins)
        end if
    end if

    sqlObj = "select * from HRM10531                 " & _
             "where Pod_CorporativoID = '5000'       " & _
             "and   Pod_CompaniaID    = '"& Cid &"'  " & _
             "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
             "and   Pod_Ejercicio     =  "& Ejr &"   " & _
             "and   Pod_Partida       =  "& Ptd &"   "
    set rsObj = dbconn.execute(sqlObj)
    if not rsObj.bof and not rsObj.eof then
        ObjEid = rsObj("Pod_EstrategiaID")
        ObjDsc = trim(rsObj("Pod_Descripcion"))
        ObjPnd = rsObj("Pod_Ponderacion")
        ObjMta = rsObj("Pod_Meta")
        ObjUmd = trim(rsObj("Pod_UniMed"))
        ObjRsa = rsObj("Pod_ResultAnt")
        ObjSgm = trim(rsObj("Pod_Seguimiento"))
        ObjFcm = CStr(trim(rsObj("Pod_FechaFinCalc")))
        ObjFcm = Mid(ObjFcm,6,2) & "/" & Mid(ObjFcm,9,2) & "/" & Mid(ObjFcm,1,4)
        ObjDrc = trim(rsObj("Pod_Direccion"))
        ObjSob = rsObj("Pod_Parent")
        ObjCmt = trim(rsObj("Pod_ComentarioE"))
    else
        ObjEid = ""
        ObjDsc = ""
        ObjPnd = ""
        ObjMta = ""
        ObjUmd = ""
        ObjRsa = ""
        ObjSgm = ""
        ObjFcm = ""
        ObjFcm = ""
        ObjDrc = ""
        ObjSob = ""
        ObjCmt = ""
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
            <form action="Hrm_PadePAAprObjE1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid & "&Ptd=" & Ptd %>" name="form1" method="post">
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
                                             "and   a.Pst_Ejercicio     =  "& Ejr &"       " & _
                                             "and   a.Pst_Partida       = b.Trd_ElementoID " & _
                                             "and   b.Trd_IdiomaID      = '"& Lng &"'      " & _
                                             "order by a.Pst_Partida                       "
                                    set rsE = dbconn.execute(sqlEsn)
                                    if not rsE.bof and not rsE.eof then
                                        do while not rsE.eof
                                            if rsE("Pst_Partida") = ObjEid then
                                                %>
                                                <option class="form-control" value="<%= rsE("Pst_Partida") %>" selected><%= trim(rsE("Trd_Texto")) %></option>
                                                <%
                                            else
                                                %>
                                                <option class="form-control" value="<%= rsE("Pst_Partida") %>"><%= trim(rsE("Trd_Texto")) %></option>
                                                <%
                                            end if
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
                                <input type="text" class="form-control" id="ObjDsc" name="ObjDsc" value="<%= ObjDsc %>" placeholder="<%= Fr1Ph2 %>" maxlength="100" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb3 %></label>
                                <input type="number" min="1" max="100" class="form-control" id="ObjPnd" name="ObjPnd" value="<%= ObjPnd %>" placeholder="<%= Fr1Ph3 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb4 %></label>
                                <input type="number" step=".01" class="form-control" id="ObjMta" name="ObjMta" value="<%= ObjMta %>" placeholder="<%= Fr1Ph4 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb5 %></label>
                                <input type="text" class="form-control" id="UniMed" name="UniMed" value="<%= ObjUmd %>" placeholder="<%= Fr1Ph5 %>" maxlength="20" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb6 %></label>
                                <input type="number" step=".01" class="form-control" id="ResAnt" name="ResAnt" value="<%= ObjRsa %>" placeholder="<%= Fr1Ph6 %>"  required />
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb7 %></label>
                                <select class="form-control" size="1" id="FreRev" name="FreRev" required>
                                    <option class="form-control" value=""><%= Fr1Ph7 %></option>
                                    <%
                                    if ObjSgm = "B" then
                                        %>
                                        <option class="form-control" value="B" selected><%= Fr1Sl1 %></option>
                                        <option class="form-control" value="C"><%= Fr1Sl2 %></option>
                                        <option class="form-control" value="S"><%= Fr1Sl3 %></option>
                                        <option class="form-control" value="A"><%= Fr1Sl4 %></option>
                                        <%
                                    else
                                        if ObjSgm = "C" then
                                            %>
                                            <option class="form-control" value="B"><%= Fr1Sl1 %></option>
                                            <option class="form-control" value="C" selected><%= Fr1Sl2 %></option>
                                            <option class="form-control" value="S"><%= Fr1Sl3 %></option>
                                            <option class="form-control" value="A"><%= Fr1Sl4 %></option>
                                            <%
                                        else
                                            if ObjSgm = "S" then
                                                %>
                                                <option class="form-control" value="B"><%= Fr1Sl1 %></option>
                                                <option class="form-control" value="C"><%= Fr1Sl2 %></option>
                                                <option class="form-control" value="S" selected><%= Fr1Sl3 %></option>
                                                <option class="form-control" value="A"><%= Fr1Sl4 %></option>
                                                <%
                                            else
                                                if ObjSgm = "A" then
                                                    %>
                                                    <option class="form-control" value="B"><%= Fr1Sl1 %></option>
                                                    <option class="form-control" value="C"><%= Fr1Sl2 %></option>
                                                    <option class="form-control" value="S"><%= Fr1Sl3 %></option>
                                                    <option class="form-control" value="A" selected><%= Fr1Sl4 %></option>
                                                    <%
                                                else
                                                    %>
                                                    <option class="form-control" value="B"><%= Fr1Sl1 %></option>
                                                    <option class="form-control" value="C"><%= Fr1Sl2 %></option>
                                                    <option class="form-control" value="S"><%= Fr1Sl3 %></option>
                                                    <option class="form-control" value="A"><%= Fr1Sl4 %></option>
                                                    <%
                                                end if
                                            end if
                                        end if
                                    end if
                                    %>>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb8 %></label>
                                <input type="text" class="form-control" id="datepicker" name="FecCmp" value="<%= ObjFcm %>" placeholder="<%= Fr1Ph8 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb9 %></label>
                                <select class="form-control" size="1" id="TipInd" name="TipInd" required>
                                    <option class="form-control" value=""><%= Fr1Ph9 %></option>
                                    <%

                                    if ObjDrc = "I" then
                                        %>
                                        <option class="form-control" value="I" selected><%= Fr1Sl5 %></option>
                                        <option class="form-control" value="D"><%= Fr1Sl6 %></option>
                                        <%
                                    else
                                        %>
                                        <option class="form-control" value="I"><%= Fr1Sl5 %></option>
                                        <option class="form-control" value="D" selected><%= Fr1Sl6 %></option>
                                        <%
                                    end if
                                    %>
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
                                             "and   Pod_Partida       > 0            " & _
                                             "order by Pod_Partida                   "
                                    set rsO = dbconn.execute(sqlObj)
                                    if not rsO.bof and not rsO.eof then
                                        do while not rsO.eof
                                            if rsO("Pod_Partida") = ObjSob then
                                                %>
                                                <option class="form-control" value="<%= rsO("Pod_Partida") %>" selected><%= trim(rsO("Pod_Descripcion")) %></option>
                                                <%
                                            else
                                                %>
                                                <option class="form-control" value="<%= rsO("Pod_Partida") %>"><%= trim(rsO("Pod_Descripcion")) %></option>
                                                <%
                                            end if
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
                                <textarea class="form-control" name="CmtObj" id="CmtObj" placeholder="<%= Fr1Ph11 %>" rows="2"><%= ObjCmt %></textarea>
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
                                <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </form>
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

</body>
</html>
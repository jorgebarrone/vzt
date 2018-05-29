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
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <% call men() %>

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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'RecSel0101c' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Fr1Lb20"
                Fr1Lb20 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb21"
                Fr1Lb21 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb22"
                Fr1Lb22 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb23"
                Fr1Lb23 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb24"
                Fr1Lb24 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb25"
                Fr1Lb25 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph25"
                Fr1Ph25 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb18"
                Fr1Lb18 = trim(rsTrn("Trd_Texto"))
              Case "GenOp1"
                GenOp1 = trim(rsTrn("Trd_Texto"))
              Case "GenOp2"
                GenOp2 = trim(rsTrn("Trd_Texto"))
              Case "GenOp3"
                GenOp3 = trim(rsTrn("Trd_Texto"))
              Case "EstOp1"
                EstOp1 = trim(rsTrn("Trd_Texto"))
              Case "EstOp2"
                EstOp2 = trim(rsTrn("Trd_Texto"))
              Case "EstOp3"
                EstOp3 = trim(rsTrn("Trd_Texto"))
              Case "EstOp4"
                EstOp4 = trim(rsTrn("Trd_Texto"))
              Case "EstOp5"
                EstOp5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Bh1"
                Fr1Bh1 = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    else
        TitPri = ""
        SubTit = ""
        Fr1Lb1 = ""
        Fr1Lb2 = ""
        Fr1Lb3 = ""
        Fr1Lb4 = ""
        Fr1Lb5 = ""
        Fr1Lb6 = ""
        Fr1Lb7 = ""
        Fr1Lb8 = ""
        Fr1Lb9 = ""
        Fr1Lb10 = ""
        Fr1Lb11 = ""
        Fr1Lb12 = ""
        Fr1Lb20 = ""
        Fr1Lb21 = ""
        Fr1Lb22 = ""
        Fr1Lb23 = ""
        Fr1Lb24 = ""
        Fr1Lb18 = ""
        GenOp1 = ""
        GenOp2 = ""
        GenOp3 = ""
        EstOp1 = ""
        EstOp2 = ""
        EstOp3 = ""
        EstOp4 = ""
        EstOp5 = ""
        Fr1Bh1 = ""
        
        Tb1Hd0 = ""
    end if

    Dim Fol
    Fol = trim(Request.QueryString("Fol"))

    sqlinf = "select a.*,               b.Cpy_RazonSocial,     " & _
             "       c.Emp_NombreCompleto as Solicitante,      " &_
             "       d.Pue_Descripcion,                        " & _
             "       e.Emp_NombreCompleto as Reclutador        " & _
             "from HRM10251 a, HRM10201 b, HRM10220 c,         " & _
             "     HRM10210 d, HRM10220 e                      " & _
             "where a.Rps_CompaniaID    = b.Cpy_CompaniaID     " & _
             "and   a.Rps_SolicitanteID = c.Emp_EmpleadoID     " & _
             "and   a.Rps_CompaniaID    = d.Pue_CompaniaID     " & _
             "and   a.Rps_NivelPuestoID = d.Pue_NivelPuestoID  " & _
             "and   a.Rps_ReclutadorID  = e.Emp_EmpleadoID     " & _
             "and   a.Rps_Folio         = '"& Fol &"'          "

    set rs = dbconn.execute(sqlinf)
'    response.write(sqlinf)
    if not rs.eof and not rs.bof then
        Pci = trim(rs("Rps_CompaniaID"))
        Pui = trim(rs("Rps_PuestoID"))
        Rsc = trim(rs("Cpy_RazonSocial"))
        Fsl = trim(rs("Rps_FecSolicitud"))
        Plz = trim(rs("Rps_PlazaID"))
        Pue = trim(rs("Pue_Descripcion"))
        Pnp = trim(rs("Rps_NivelPuestoID"))
        Sol = trim(rs("Solicitante"))
        Rcl = trim(rs("Reclutador"))
        Gen = trim(rs("Rps_Genero"))
        Emi = rs("Rps_EdadMin")
        Ema = rs("Rps_EdadMax")
        Est = trim(rs("Rps_Estatus"))
        Obs = trim(rs("Rps_Observaciones"))
    else
        Pci = ""
        Pui = ""
        Rsc = ""
        Fsl = ""
        Plz = ""
        Pue = ""
        Pnp = ""
        Sol = ""
        Rcl = ""
        Gen = ""
        Emi = ""
        Ema = ""
        Est = ""
        Obs = ""
    end if

    if Gen = "F" then
        Gen = GenOp1
    else
        if Gen = "M" then
            Gen = GenOp2
        else
            Gen = GenOp3
        end if
    end if

    if Est = "N" then
        Est = EstOp1
    else
        if Est = "A" then
            Est = EstOp2
        else
            if Est = "T" then
                Est = EstOp3
            else
                if Est = "X" then
                    Est = EstOp4
                else
                    Est = EstOp5
                end if
            end if
        end if
    end if

    %>

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <form action="Hrm_RSGesReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
            <div class="box box-success">
                <!-- form start -->
                <div class="box-body">

                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb1 %></label>
                                </br><%= Fol %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb2 %></label>
                                </br><%= Fsl %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb3 %></label>
                                </br><%= Sol %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb4 %></label>
                                </br><%= Rcl %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb5 %></label>
                                </br><%= Rsc %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb6 %></label>
                                </br><%= Plz %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb7 %></label>
                                </br><%= Pue %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb8 %></label>
                                </br><%= Est %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb9 %></label>
                                </br><%= Emi %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb10 %></label>
                                </br><%= Ema %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb11 %></label>
                                </br><%= Gen %>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><%= Fr1Lb12 %></label>
                        </br><%= Obs %>
                    </div>
                </div>
            </div>

            <div class="box box-primary">
                <div class="box-header">
                  <i class="fa fa-edit"></i>
                  <h3 class="box-title"><%= Fr1Bh1 %></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <%
                    sqlDps = "Select * from HRM10211              " & _
                             "where Dps_CompaniaID = '"& Pci &"'  " & _
                             "and   Dps_PuestoID   = '"& Pui &"'  "
                    set rsDps = dbconn.execute(sqlDps)
                    'response.write(sqlDps)
                    if not rsDps.eof and not rsDps.bof then
                        DP_Msn = trim(rsDps("Dps_Mision"))
                        DP_Frm = trim(rsDps("Dps_Formacion"))
                        DP_Edu = trim(rsDps("Dps_Educacion"))
                        DP_Exp = trim(rsDps("Dps_Experiencia"))
                        DP_Hab = trim(rsDps("Dps_Habilidades"))
                    else
                        
                    end if
                    rsDps.close
                    set rsDps = Nothing
                    %>
                    <div class="row invoice-info">
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb20 %></label></br><%= DP_Frm %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb21 %></label></br><%= DP_Edu %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb22 %></label></br><%= DP_Exp %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb23 %></label></br><%= DP_Hab %>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><%= Fr1Lb24 %></label></br><%= DP_Msn %>
                    </div>


                    <div class="form-group">
                        <label><%= Fr1Lb25 %></label>
                        <select class="form-control" size="1" id="Wfi" name="Wfi" required>
                            <option class="form-control" value=""><%= Fr1Ph25 %></option>
                            <%
                            sqlW = "select Hwf_Nombre from HRM10150 where Hwf_ModuloID = 'RecSel' order by Hwf_Nombre   "
                            set rsW = dbconn.execute(sqlW)
                            'response.write(sqlW)
                            if not rsW.eof and not rsW.bof then
                                do while not rsW.eof
                                    %>
                                    <option class="form-control" value="<%= trim(rsW("Hwf_Nombre")) %>" ><%= trim(rsW("Hwf_Nombre")) %></option>
                                    <%
                                    rsW.moveNext
                                loop
                            end if
                            rsW.close
                            set rsW = Nothing
                            %>
                        </select>
                    </div>

                    <div class="box-footer" style="text-align: center">
                        <input type="hidden" name="Fol" id="Fol" value="<%= Fol %>" />
                        <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= SmBtn1 %></button>
                    </div>

                </div>
                <!-- /.box-body -->

            </div>
        </form>

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

</body>
</html>

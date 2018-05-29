<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Alta de Objetivos Empleados PADE</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'DisOrg0100' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
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
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    else
        TitPri = ""
        SubTit = ""
        Tab001 = ""
        Tab002 = ""
        Tb1Hd1 = ""
        Tb1Hd2 = ""
        Tb1Hd3 = ""
        Tb1Hd4 = ""
        Tb1Hd5 = ""
        Fr1Lb1 = ""
        Fr1Ph1 = ""
        Fr1Lb2 = ""
        Fr1Ph2 = ""
        Fr1Lb3 = ""
        Fr1Ph3 = ""
        Fr1Lb4 = ""
        Fr1Ph4 = ""
        Fr1Lb5 = ""
        Fr1Ph5 = ""
        Fr1Lb6 = ""
        Fr1Ph6 = ""
        Fr1Lb7 = ""
        Fr1Ph7 = ""
        Fr1Lb8 = ""
        Fr1Ph8 = ""
        Fr1Lb9 = ""
        Fr1Ph9 = ""
        Fr1Lb10 = ""
        Fr1Ph10 = ""
        Fr1Lb11 = ""
        Fr1Ph11 = ""
        SmBtn1 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if

    '<!-- Alta de Registros (inicio) -->
    Sbt = trim(request.form("Sbt"))

    '<!-- Alta de Registros (fin) -->
    TitPri = "PADE - Alta de Objetivos Empleados"
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <div class="box box-success">
            <form action="#" name="form1" method="post">
                <div class="box-header with-border">
                    <h3 class="box-title">Agregar Objetivo - <label style="font-size: small">&nbsp;Máximo : 8, Mínimo: 3</label></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Estrategia de Negocio</label>
                                <select class="form-control" size="1" id="A" name="A" required>
                                    <option class="form-control" value="">Asegurar el cumplimiento de nuestras responsabilidades sociales con cada uno de los grupos de interés</option>
                                    <option class="form-control" value="">Crecer en los mercados actuales</option>
                                    <option class="form-control" value="">Desarrollar al recurso humano de forma que garantice la continuidad, crecimiento y rentabilidad del negocio en el largo plazo</option>
                                    <option class="form-control" value="">Desarrollar productos, programas, servicios y marcas para diferenciarnos de los competidores</option>
                                    <option class="form-control" value="">Lograr un nivel de servicio a clientes del 100% de forma consistente</option>
                                    <option class="form-control" value="">Obtener una rentabilidad sobre activos > 25%</option>
                                    <option class="form-control" value="">Reducir el costo a nivel benchmark</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Descripcion</label>
                                <input type="text" class="form-control" id="B" name="B" placeholder="Ingrese la Descripción del Objetivo" maxlength="9" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Ponderacion / Valor %</label>
                                <input type="text" class="form-control" id="C" name="C" placeholder="Ingrese el Porcentaje del Objetivo" maxlength="9" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Meta</label>
                                <input type="text" class="form-control" id="E" name="E" placeholder="Ingrese el la Meta Propuesta" maxlength="9" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Unidad de Medida</label>
                                <input type="text" class="form-control" id="F" name="F" placeholder="Ej. Miles, Millones, Porcentaje" maxlength="9" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Resultado Año Anterior</label>
                                <input type="text" class="form-control" id="G" name="G" placeholder="Especifique el nivel del año anterior" maxlength="9" required />
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Seguimiento</label>
                                <select class="form-control" size="1" id="Z" name="Z" required>
                                    <option class="form-group" value="">Mensual</option>
                                    <option class="form-group" value="">Bimestral</option>
                                    <option class="form-group" value="">Cuatrimestral</option>
                                    <option class="form-group" value="">Semestral</option>
                                    <option class="form-group" value="">Anual</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Fecha Compromiso</label>
                                <input type="text" class="form-control" id="G" name="G" placeholder="Especifique el nivel del año anterior" maxlength="9" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Tipo de Indicador</label>
                                <select class="form-control" size="1" id="Z" name="Z" required>
                                    <option class="form-group" value="">Arriba / Incrementar</option>
                                    <option class="form-group" value="">Abajo / Disminuir</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Es Sub-Objetivo</label>
                                <select class="form-control" size="1" id="E" name="E" required>
                                    <option class="form-control" value="">Seleccione el Objetivo al que pertenece</option>
                                    <option class="form-control" value="">Reducción del tiempo extra en planta Tlalnepantla.</option>
                                    <option class="form-control" value="">Certificación del proyecto PASST en el primer nivel.</option>
                                    <option class="form-control" value="">Implementación del Nuevo Portal RH. (Proyecto)</option>
                                    <option class="form-control" value="">Seguimiento y corrección de los hallazgos de la auditoría laboral.</option>
                                    <option class="form-control" value="">Certificaciones del personal sindicalizado.</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Comentarios</label>
                                <textarea class="form-control" placeholder="Escriba aquí sus Comentarios" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                <br/>
                                <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </form>





            <form action="#" name="form2" method="post">
                <div class="box box-primary">
                    <div class="box-header">
                      <h3 class="box-title">Registrados</h3>
                    </div>
                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Porcentaje</th>
                                                    <th>Objetivo</th>
                                                    <th>Comentario</th>
                                                    <th>Comentario Jefe</th>
                                                    <th>Desempeño</th>
                                                    <th>Subobjetivos</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                    <tr>
                                                        <td><a href="#">15</a></td>
                                                        <td><a href="#">Reducción del tiempo extra en planta Tlalnepantla.</a></td>
                                                        <td><a href="#"></a></td>
                                                        <td><a href="#"></a></td>
                                                        <td><a href="#">0.00</a></td>
                                                        <td><a href="#">0</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                           <a href="#">
                                                                25
                                                           </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                Certificación del proyecto PASST en el primer nivel.
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0.00
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                           <a href="#">
                                                                25
                                                           </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                Implementación del Nuevo Portal RH. (Proyecto)
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0.00
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                           <a href="#">
                                                                15
                                                           </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                Seguimiento y corrección de los hallazgos de la auditoría laboral.
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0.00
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                           <a href="#">
                                                                20
                                                           </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                Certificaciones del personal sindicalizado.
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0.00
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                0
                                                            </a>
                                                        </td>
                                                    </tr>
                                            </tbody>
                                        </table>
                                <div class="box-footer" style="text-align: center">
                                    <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="Sbt">Imprimir</button>&nbsp;&nbsp;&nbsp;
                                    <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="Sbt">Solicitar Autorizacion</button>
                                </div>
                    </div>
                </div>
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

<!-- page script -->
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
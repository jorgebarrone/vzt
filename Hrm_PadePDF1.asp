<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Prueba de generación de PDFs</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">  
    
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- jsPDF-Master -->
  <script src="plugins/jsPDF-master/dist/jspdf.debug.js"></script>
  <script src="plugins/jsPDF-master/dist/jspdf.min.js"></script>

  <!--#include file="procedures.asp"-->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->




<%
Dim Txt
Txt = Request.Form("txar02")
    
%>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <% call men() %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr("Titulo","Subtitulo") %>
        <%
        dim sqli
        sqli1 = "insert into HRM10589 values('"& Uid &"',' "
        sqli2 = "')"
        %>
    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL INICIO -->
        <%
        response.write("Txt : ")
        response.write(Txt)
        response.write("</br>")
        response.write("Uid : ")
        response.write(Uid)
        response.write("</br>")
        if Txt > "" then
            sqlins = "insert into HRM10589  " & _
                     "values('54548',       " & _
                     "       '"& Txt &"')   "
            set rsi = dbconn.execute(sqlins)
        end if
        %>
        <button type="button" onclick="downloadPDF();">Genera PDF</button>
        <input type="text" id="txar02" name="txar02" value="<%= Txt %>" />

        <a id='dwnldLnk' download='Reporte_Psicometria.pdf' style="display:none;" />     
        <a href="#" onclick="downloadPDF();" title='o ficheirinho de tostas.pdf'>clica aqui oh sashavore</a>

        <!-- CONTENIDO PRINCIPAL FINAL  -->

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
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<script>
    window.downloadPDF = function downloadPDF() {
        var str = document.getElementById("txar02").value;
        var pdf = atob(str);
        var dlnk = document.getElementById('dwnldLnk');
        dlnk.href = pdf;
        dlnk.click();
    }
</script>

</body>
</html>

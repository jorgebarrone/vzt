<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>HRM Verzatec | Web Service Example 1</title>
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

  <!--#include file="procedures.asp"-->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<script >
    function soapRequest() {
        var str = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pyx="http://www.pyxoom.com/">' +
                 '<soapenv:Header/>' +
                 '   <soapenv:Body>' +
                 '      <pyx:GenerateGuid>' +
                 '         <!--Optional:-->' +
                 '         <pyx:userAccount>admin</pyx:userAccount>' +
                 '         <!--Optional:-->' +
                 '         <pyx:userPassword>admin</pyx:userPassword>' +
                 '      </pyx:GenerateGuid>' +
                 '   </soapenv:Body>' +
                 '</soapenv:Envelope>';

        function createCORSRequest(method, url) {
            var xhr = new XMLHttpRequest();
            if ("withCredentials" in xhr) {
                xhr.open(method, url, false);
            }
            else
                if (typeof XDomainRequest != "undefined") {
                    alert
                    xhr = new XDomainRequest();
                    xhr.open(method, url);
                }
                else {
                    console.log("CORS not supported");
                    alert("CORS not supported");
                    xhr = null;
                }
            return xhr;
        }
        var xhr = createCORSRequest("POST", "http://200.76.17.25/Pyxoom/WebServices/ProcessWS.asmx");
        if (!xhr) {
            console.log("XHR issue");
            return;
        }


        xhr.onload = function () {
            var results = xhr.responseText;
            
            var xmlDoc = $.parseXML(results),
            $xml = $(xmlDoc),
            $value= $xml.find("Description");
            //do what you want with the value
              alert($value.text());

            //alert(results);
        }

        xhr.setRequestHeader('Content-Type', 'text/xml');
        xhr.send(str);

    }
</script>


<script >
    function soapRequest1() {
        var a = document.getElementById('IdnPrs').value;
        if (a == null || a == "") {
            alert("Debe proporcionar El Identificador Personal");
            return false;
        }
        var str = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pyx="http://www.pyxoom.com/">' +
                 '<soapenv:Header/>' +
                 '   <soapenv:Body>' +
                 '      <pyx:GenerateGuid>' +
                 '         <!--Optional:-->' +
                 '         <pyx:userAccount>admin</pyx:userAccount>' +
                 '         <!--Optional:-->' +
                 '         <pyx:userPassword>admin</pyx:userPassword>' +
                 '      </pyx:GenerateGuid>' +
                 '   </soapenv:Body>' +
                 '</soapenv:Envelope>';

        function createCORSRequest(method, url) {
            var xhr = new XMLHttpRequest();
            if ("withCredentials" in xhr) {
                xhr.open(method, url, false);
            }
            else
                if (typeof XDomainRequest != "undefined") {
                    alert
                    xhr = new XDomainRequest();
                    xhr.open(method, url);
                }
                else {
                    console.log("CORS not supported");
                    alert("CORS not supported");
                    xhr = null;
                }
            return xhr;
        }
        var xhr = createCORSRequest("POST", "http://200.76.17.25/Pyxoom/WebServices/ProcessWS.asmx");
        if (!xhr) {
            console.log("XHR issue");
            return;
        }


        xhr.onload = function () {
            var results = xhr.responseText;

            var xmlDoc = $.parseXML(results),
            $xml = $(xmlDoc),
            $value = $xml.find("Description");
            //do what you want with the value
            //alert($value.text());
            CandidateResults($value.text(), a);

            //alert(results);
        }

        xhr.setRequestHeader('Content-Type', 'text/xml');
        xhr.send(str);

    }
</script>

<script >
    function CandidateResults(p1, p2) {
        var str = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pyx="http://www.pyxoom.com/">' +
                  '   <soapenv:Header>' +
                  '      <pyx:AuthHeader>' +
                  '         <!--Optional:-->' +
                  '         <pyx:Key>' + p1 + '</pyx:Key>' +
                  '      </pyx:AuthHeader>' +
                  '   </soapenv:Header>' +
                  '   <soapenv:Body>' +
                  '      <pyx:CandidateResults>' +
                  '         <!--Optional:-->' +
                  '         <pyx:identifier>' + p2 + '</pyx:identifier>' +
                  '      </pyx:CandidateResults>' +
                  '   </soapenv:Body>' +
                  '</soapenv:Envelope>';

        function createCORSRequest(method, url) {
            var xhr = new XMLHttpRequest();
            if ("withCredentials" in xhr) {
                xhr.open(method, url, false);
            }
            else
                if (typeof XDomainRequest != "undefined") {
                    alert
                    xhr = new XDomainRequest();
                    xhr.open(method, url);
                }
                else {
                    console.log("CORS not supported");
                    alert("CORS not supported");
                    xhr = null;
                }
            return xhr;
        }
        var xhr = createCORSRequest("POST", "http://200.76.17.25/Pyxoom/WebServices/ProcessWS.asmx");
        if (!xhr) {
            console.log("XHR issue");
            return;
        }


        xhr.onload = function () {
            var results = xhr.responseText;

            var xmlDoc = $.parseXML(results),
            $xml = $(xmlDoc),
            $value = $xml.find("PersonProcessId");

            var piResult = $value.text();
            if (!piResult) {
                alert('La Persona que seleccionó no ha realizado Exámenes Psicométricos en Pyxoom');
                return;
            }
            //do what you want with the value
            ReportPsychometry(p1, $value.text());
            //alert(results);
        }

        xhr.setRequestHeader('Content-Type', 'text/xml');
        xhr.send(str);

    }
</script>


<script >
    function ReportPsychometry(p1, p2) {
        var str = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pyx="http://www.pyxoom.com/">' +
                  '   <soapenv:Header>' +
                  '      <pyx:AuthHeader>' +
                  '         <pyx:Key>' + p1 + '</pyx:Key>' +
                  '      </pyx:AuthHeader>' +
                  '   </soapenv:Header>' +
                  '   <soapenv:Body>' +
                  '      <pyx:ReportPsychometry>' +
                  '         <pyx:personProcessId>' + p2 + '</pyx:personProcessId>' +
                  '      </pyx:ReportPsychometry>' +
                  '   </soapenv:Body>' +
                  '</soapenv:Envelope>';

        function createCORSRequest(method, url) {
            var xhr = new XMLHttpRequest();
            if ("withCredentials" in xhr) {
                xhr.open(method, url, false);
            }
            else
                if (typeof XDomainRequest != "undefined") {
                    alert
                    xhr = new XDomainRequest();
                    xhr.open(method, url);
                }
                else {
                    console.log("CORS not supported");
                    alert("CORS not supported");
                    xhr = null;
                }
            return xhr;
        }
        var xhr = createCORSRequest("POST", "http://200.76.17.25/Pyxoom/WebServices/ProcessWS.asmx");
        if (!xhr) {
            console.log("XHR issue");
            return;
        }


        xhr.onload = function () {
            var results = xhr.responseText;

            var xmlDoc = $.parseXML(results),
            $xml = $(xmlDoc),
            $value = $xml.find("Report");

            var piResult = $value.text();
            if (!piResult) {
                alert('No se pudo generar el reporte');
                return;
            }
            //do what you want with the value
            //alert($value.text());
            downloadPDF($value.text());
            //alert(results);
        }

        xhr.setRequestHeader('Content-Type', 'text/xml');
        xhr.send(str);

    }
</script>

<script>
window.downloadPDF = function downloadPDF(p1) {
    //alert(p1)
    var str = p1;
    var pdf = 'data:application/octet-stream;base64,' + str.toString();
    var dlnk = document.getElementById('dwnldLnk');
    dlnk.href = pdf;

    dlnk.click();
}


</script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <% call men() %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr("Conexión HRM - Pyxoom","Reporte Integral de Psicometría") %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL Inicio -->
            <table style="padding: 4; border: 1; border-collapse: collapse; border-color: #dcdcdc">
                <tr>
                    <td style="background: #dcdcdc"></td>
                    <td style="background: #dcdcdc"></td>
                </tr>
                <tr>
                    <td style="color: #000000; font-weight: normal;">Id del Empleado en Pyxoom:</td>
                    <td><input type="text" size="50" name="IdnPrs" id="IdnPrs" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: right"><input type="button" value="Enviar" class="button" onclick="soapRequest1();"></td>
                </tr>
            </table>
            </br>
            </br>
            <div>
    
                <a id='dwnldLnk' download='Reporte_Psicometria.pdf' style="display:none;" /> 
    
            </div>
        <!-- CONTENIDO PRINCIPAL Final  -->
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
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>

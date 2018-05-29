<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Retroalimentación PADE</title>
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

<!-- SCRIPTS PARA LA GENERACION DEL REPORTE DE PSICOMETRIA (WEBSERVICE PYXOOM) INICIO -->
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
        var xhr = createCORSRequest("POST", "http://172.28.100.53/Pyxoom/WebServices/ProcessWS.asmx");
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
    function soapRequest1(p1) {
        var a = p1;
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
        var xhr = createCORSRequest("POST", "http://172.28.100.53/Pyxoom/WebServices/ProcessWS.asmx");
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
        var xhr = createCORSRequest("POST", "http://172.28.100.53/Pyxoom/WebServices/ProcessWS.asmx");
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
        var xhr = createCORSRequest("POST", "http://172.28.100.53/Pyxoom/WebServices/ProcessWS.asmx");
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
<!-- SCRIPTS PARA LA GENERACION DEL REPORTE DE PSICOMETRIA (WEBSERVICE PYXOOM) FINAL -->

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">


<%
    lp1 = "PROCESO PADE 2017"
    lp2 = "PROCESO PADE 2016"
    cp1 = "rgba(0, 135, 32, 1)"
    cp2 = "rgba(0, 135, 32, 1)"
    dp1 = 95
    dp2 = 94
%>

  <% call men() %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0200' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitSec"
                TitSec = trim(rsTrn("Trd_Texto"))
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

    '<!-- Alta de Registros (inicio) -->

    Dim Ejr
    Dim Dsc
    Dim Sbt4
    Dim Sbt4a
    Dim Sbt4b
    Dim Eid
    Dim Nem
    Dim Nmb
    Dim Cid
    Dim Prm
    Ejr = ""
    Dsc = ""
    Ejr = CInt(Request.QueryString("Ejr"))
    Eid = trim(Request.QueryString("Eid"))
    Nem = trim(Request.QueryString("Nem"))
    Nmb = trim(Request.QueryString("Nmb"))
    Cid = trim(Request.QueryString("Cid"))
    Eja = Ejr - 1
    Dsc = Request.Querystring("Dsc")
    Sbt4 = Request.Form("Sbt4")
    Sbt4a = Request.Form("Sbt4a")
    Sbt4b = Request.Form("Sbt4b")
    Prm   = Request.QueryString("Prm")
    if trim(Prm) = "" then
        Prm = 1
    end if

    '<!--  Buscamos la Imagen del Empleado Inicio -->
    sqlImg = "select a.Emp_Foto,       a.Emp_Email,         " & _
             "       c.Pue_Descripcion                      " & _
             "from HRM10220 a, HRM10210 c                   " & _
             "where a.Emp_CompaniaID = c.Pue_CompaniaID     " & _
             "and   a.Emp_PuestoID   = c.Pue_NivelPuestoID  " & _
             "and   a.Emp_NivelID    = c.Pue_NivelID        " & _
             "and   a.Emp_EmpleadoID = '"& Nem &"'          " & _
             "and   a.Emp_CompaniaID = '"& Cid &"'          "
    set rsImg = dbconn.execute(sqlImg)
    if not rsImg.bof and not rsImg.eof then
        Eim = trim(rsImg("Emp_Foto"))
        Eml = trim(rsImg("Emp_Email"))
        Epd = trim(rsImg("Pue_Descripcion"))
    else
        Eim = ""
        Eml = ""
        Epd = ""
    end if

    '<!-- Alta de Registros (fin) -->
    if Sbt4 = "Sbt4" then
        if Request.Form("TipAid") = 24 then
            if trim(Request.Form("TxtOtr")) = "" then
                %>
                <script>
                    alert('Favor de ingresar la Area a Agregar / Please input the text for the new Area');
                </script>
                <%
            else
                sqlAdd = "select isnull(max(Rta_ClaveID),0) as NumCns      " & _
                         "from HRM10550                                    " & _
                         "where Rta_TipoID = 3                             "
                set rsAdd = dbconn.execute(sqlAdd)
                if not rsAdd.bof and not rsAdd.eof then
                    NumCns = CInt(rsAdd("NumCns")) + 1
                else
                    NumCns = 1
                end if
                sqlIAi = "insert into HRM10550                           " & _
                         "values('5000',                                 " & _
                         "       3,                                      " & _
                         "       "& NumCns &",                           " & _
                         "       '"& Lng &"',                            " & _
                         "       '"& trim(Request.Form("TxtOtr")) & "')  "
                set rsIAi = dbconn.execute(sqlIAi)

                sqlArt = "insert into HRM10551                    " & _
                         "values( "& Ejr &",                      " & _
                         "       '5000',                          " & _
                         "       '"& Cid &"',                     " & _
                         "       '"& Nem &"',                     " & _
                         "        "& Request.Form("TipAcc") &",   " & _
                         "        "& Request.Form("TipPri") &",   " & _
                         "        "& NumCns                 &",   " & _
                         "       '"& Request.Form("TxtAcc") &"',  " & _
                         "       'N')                             "
                set rsi = dbconn.execute(sqlArt)
            end if
        else
            sqlArt = "insert into HRM10551                    " & _
                     "values( "& Ejr &",                      " & _
                     "       '5000',                          " & _
                     "       '"& Cid &"',                     " & _
                     "       '"& Nem &"',                     " & _
                     "        "& Request.Form("TipAcc") &",   " & _
                     "        "& Request.Form("TipPri") &",   " & _
                     "        "& Request.Form("TipAid") &",   " & _
                     "       '"& Request.Form("TxtAcc") &"',  " & _
                     "       'N')                             "
            set rsi = dbconn.execute(sqlArt)
        end if
    end if

    if Sbt4a = "Sbt4a" then
        Ind = Request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                TxtAcc = Request.Form("Tac"&i)
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete from HRM10551                      " & _
                             "where  Ara_Ejercicio     = '"& Ejr  &"'   " & _
                             "and    Ara_CorporativoID = '5000'         " & _
                             "and    Ara_CompaniaID    = '"& Cid  &"'   " & _
                             "and    Ara_EmpleadoID    = '"& Nem  &"'   " & _
                             "and    Ara_Texto         = '"& TxtAcc &"' "
                    set rsD = dbconn.Execute (sqldel)
                    'response.write(sqldel)
                end if
            next
        end if
    end if

    if Sbt4b = "Sbt4b" then
        PwdJin = trim(Request.Form("PwdJin"))
        PwdClb = trim(Request.Form("PwdClb"))
        if PwdJin = "" or PwdClb = "" then
            %>
            <script>
                alert('Favor de ingresar las Firmas / Please input the passwords');
            </script>
            <%
        else
            cnk = "Provider=SQLOLEDB;Server=172.28.100.11;Database=kiosco;Uid=usrjob;Password=Vztjob2010;"    
            set dbconnk = server.CreateObject("ADODB.Connection")
            dbconnk.open cnk
            sqlPJi = "select ID_Usuario from IN_Usuarios where Empleado = '"& Eid &"' and Contrasena = '"& PwdJin &"' "
            sqlPCl = "select ID_Usuario from IN_Usuarios where Empleado = '"& Nem &"' and Contrasena = '"& PwdClb &"' "
            set rsPJi = dbconnk.execute(sqlPJi)
            if not rsPJi.bof and not rsPJi.eof then
                set rsPCl = dbconnk.execute(sqlPCl)
                if not rsPCl.bof and not rsPCl.eof then
                    sqlURA = "update HRM10502                         " & _
                             "set Psm_Estatus         = 3             " & _
                             "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                             "and   Psm_CorporativoID = '5000'        " & _
                             "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                             "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                             "and   Psm_SemaforoID    = 'RETALM0010'  "
                    set rsURA = dbconn.execute(sqlURA)
                    response.redirect "Hrm_EmpPade.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid 
                else
                    %>
                    <script>
                        alert('No coinciden las Firmas / Wrong Passwords');
                    </script>
                    <%
                end if
            else
                %>
                <script>
                    alert('No coinciden las Firmas / Wrong Passwords');
                </script>
                <%
            end if
        end if
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                TxtAcc = Request.Form("Tac"&i)
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete from HRM10551                      " & _
                             "where  Ara_Ejercicio     = '"& Ejr  &"'   " & _
                             "and    Ara_CorporativoID = '5000'         " & _
                             "and    Ara_CompaniaID    = '"& Cid  &"'   " & _
                             "and    Ara_EmpleadoID    = '"& Nem  &"'   " & _
                             "and    Ara_Texto         = '"& TxtAcc &"' "
                    set rsD = dbconn.Execute (sqldel)
                    'response.write(sqldel)
                end if
            next
        end if
    end if


    Tab1St = ""
    Tab2St = ""
    Tab3St = ""
    Tab4St = ""
    Pan1St = "tab-pane"
    Pan2St = "tab-pane"
    Pan3St = "tab-pane"
    Pan4St = "tab-pane"

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
        Case else
            Tab4St = "class='active'"
            Pan4St = "tab-pane active"
    End Select

    '<!-- Alta de Registros (fin) -->
    SubTit = Dsc
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitSec,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li <%= Tab1St %>><a href="#generales" data-toggle="tab">Datos Generales</a></li>
                        <li <%= Tab2St %>><a href="#" onclick="soapRequest1(<%= Nem %>);">Descargar Psicometría</a></li>
                        <li <%= Tab3St %>><a href="#desempeno" data-toggle="tab" onclick="ClkTab();">Desempeño</a></li>
                        <li <%= Tab4St %>><a href="#acciones" data-toggle="tab">Acciones de Retroalimentacion</a></li>
                    </ul>
                    <div class="tab-content">
                        
                        <!-- Datos Generales -->
                        <div class="<%= Pan1St %>" id="generales" >
                            <div class="box box-success">
                                <div class="box-header with-border">
                                    <h3 class="box-title">
                                        <img alt="Verzatec" src="images/verza01.gif" height="80px">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img src="<%= Eim %>" style="height: 80px;" alt="<%= Nmb %>">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%= Nem & " - " & Nmb & " - " & Epd %>
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
                                            <div class="box box-info box-solid">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><%= Tab008 %></h3>
                                                    <div class="box-tools pull-right">
                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
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
                                            <div class="box box-primary box-solid">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><%= Tab009 %></h3>
                                                    <div class="box-tools pull-right">
                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
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
                                    <div class="box box-warning box-solid">
                                        <div class="box-header">
                                            <h3 class="box-title"><%= Tab005 %></h3>
                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
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
                                    <div class="box box-danger box-solid">
                                        <div class="box-header">
                                            <h3 class="box-title"><%= Tab007 %></h3>
                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
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
                                </div>
                                <!-- /.box-body -->
                            </div>
                            
                            <div>
                                <a id='dwnldLnk' download='Reporte_Psicometria.pdf' style="display:none;"></a>
                            </div>
                        </div>


                        <div class="<%= Pan3St %>" id="desempeno">
                            <div class="box box-success">
                                <div class="box-header with-border">
                                    <h3 class="box-title">
                                        <img alt="Verzatec" src="images/verza01.gif" height="80px">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img src="<%= Eim %>" style="height: 80px;" alt="<%= Nmb %>">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%= Nem & " - " & Nmb & " - " & Epd %>
                                    </h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <!-- AREA CHART -->
                                            <div class="box box-primary box-solid">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Resultados Objetivos / Habilidades</h3>
                                                    <div class="box-tools pull-right">
                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                    </div>
                                                </div>
                                                <div class="box-body">
                                                    <div class="table-responsive" style="font-size: small">
                                                        <table class="table no-margin">
                                                            <thead>
                                                                <tr>
                                                                    <th>PROCESO</th>
                                                                    <th>RESULTADO</th>
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
                                            <!-- DONUT CHART -->
                                            <div class="box box-info box-solid">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Resultados Objetivos / Habilidades</h3>
                                                    <div class="box-tools pull-right">
                                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                    </div>
                                                </div>
                                                <div class="box-body chart-responsive">
                                                    <canvas id="canvasPG" height="300px"></canvas>
                                                </div><!-- /.box-body -->
                                                <!-- /.box-body -->
                                            </div>
                                            <!-- /.box -->
                                        </div>
                                        


                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="<%= Pan4St %>" id="acciones" >
                            <div class="box box-success">
                                <div class="box-header with-border">
                                    <h3 class="box-title">
                                        <img alt="Verzatec" src="images/verza01.gif" height="80px">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img src="<%= Eim %>" style="height: 80px;" alt="<%= Nmb %>">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%= Nem & " - " & Nmb & " - " & Epd %>
                                    </h3>
                                </div>
                                <div class="box-body">
                                    <div class="box box-info box-solid">
                                        <div class="box-header">
                                            <h3 class="box-title">Acciones de Retroalimentacion</h3>
                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                        <div class="box-body" style="font-size: small">
                                            <form action="Hrm_PadeRetAlm.asp?Prm=4&Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid="& Cid & "&Sid=" & Sid %>" name="form4" method="post">
                                                <div class="row fontawesome-icon-list">
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label>Tipo Accion</label>
                                                            <select class="form-control" size="1" id="TipAcc" name="TipAcc" required>
                                                                <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                                <%
                                                                sqlTac = "select * from HRM10550 where Rta_CorporativoID = '5000' and Rta_TipoID = 1 and Rta_IdiomaID = '"& Lng &"' order by Rta_Texto   "
                                                                set rsTac = dbconn.execute(sqlTac)
                                                                if not rsTac.bof and not rsTac.eof then
                                                                    do while not rsTac.eof
                                                                        %>
                                                                        <option class="form-control" value="<%= rsTac("Rta_ClaveID") %>"><%= trim(rsTac("Rta_Texto")) %></option>
                                                                        <%
                                                                        rsTac.movenext
                                                                    loop
                                                                    rsTac.close
                                                                    set rsTac = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label>Prioridad</label>
                                                            <select class="form-control" size="1" id="TipPri" name="TipPri" required>
                                                                <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                                <%
                                                                sqlTac = "select * from HRM10550 where Rta_CorporativoID = '5000' and Rta_TipoID = 2 and Rta_IdiomaID = '"& Lng &"' order by Rta_Texto   "
                                                                set rsTac = dbconn.execute(sqlTac)
                                                                if not rsTac.bof and not rsTac.eof then
                                                                    do while not rsTac.eof
                                                                        %>
                                                                        <option class="form-control" value="<%= rsTac("Rta_ClaveID") %>"><%= trim(rsTac("Rta_Texto")) %></option>
                                                                        <%
                                                                        rsTac.movenext
                                                                    loop
                                                                    rsTac.close
                                                                    set rsTac = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label>Area</label>
                                                            <select class="form-control" size="1" id="TipAid" name="TipAid" required>
                                                                <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                                <%
                                                                sqlTac = "select * from HRM10550 where Rta_CorporativoID = '5000' and Rta_TipoID = 3 and Rta_IdiomaID = '"& Lng &"' order by Rta_Texto   "
                                                                set rsTac = dbconn.execute(sqlTac)
                                                                if not rsTac.bof and not rsTac.eof then
                                                                    do while not rsTac.eof
                                                                        %>
                                                                        <option class="form-control" value="<%= rsTac("Rta_ClaveID") %>"><%= trim(rsTac("Rta_Texto")) %></option>
                                                                        <%
                                                                        rsTac.movenext
                                                                    loop
                                                                    rsTac.close
                                                                    set rsTac = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Otra Area</label>
                                                            <input type="text" class="form-control" name="TxtOtr" id="TxtOtr" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label>Accion</label>
                                                            <input type="text" class="form-control" name="TxtAcc" id="TxtAcc" required />
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
                                                <div class="box box-primary">
                                                    <form action="Hrm_PadeRetAlm.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid="& Cid & "&Sid=" & Sid & "&Prm=4" %>" name="form4a" method="post">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Registrados</h3>
                                                        </div>
                                                        <div class="box-body">
                                                            <table class="table table-bordered table-striped">
                                                                <thead>
                                                                <tr>
                                                                    <th>Tipo Accion</th>
                                                                    <th>Prioridad</th>
                                                                    <th>Area</th>
                                                                    <th>Accion</th>
                                                                    <th style="text-align: center; color: red; font-weight: bold">X</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                do while not rsO.eof
                                                                    i = i + 1
                                                                    %>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="hidden" name="<%= "Tac"&i %>" id="<%= "Tac"&i %>" value="<%= trim(rsO("Ara_Texto")) %>" />
                                                                            <%= trim(rsO("TipAcc")) %>
                                                                        </td>
                                                                        <td><%= trim(rsO("TipPri")) %></td>
                                                                        <td><%= trim(rsO("TipAre")) %></td>
                                                                        <td><%= trim(rsO("Ara_Texto")) %></td>
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
                                                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                                <button type="submit" class="btn btn-primary" name="Sbt4a" id="Sbt4a" value="Sbt4a" style="background-color: red" ><%= SmBtn2 %></button>&nbsp;&nbsp;&nbsp;
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>



                                                <div class="box box-success">
                                                    <form action="Hrm_PadeRetAlm.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid="& Cid & "&Sid=" & Sid & "&Prm=4" %>" name="form4b" method="post">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Firmas de Aceptación</h3>
                                                        </div>
                                                        <div class="box-body">
                                                            <div class="row fontawesome-icon-list">
                                                                <div class="col-md-3 col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Jefe Inmediato</label>
                                                                        <input type="password" class="form-control" name="PwdJin" id="PwdJin" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Colaborador</label>
                                                                        <input type="password" class="form-control" name="PwdClb" id="PwdClb" />
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="col-md-3 col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>&nbsp;</label>
                                                                        <br/>
                                                                        <button type="submit" class="btn btn-primary" name="Sbt4b" id="Sbt4b" value="Sbt4b" style="background-color: green" >Guardar</button>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </form>
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
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

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
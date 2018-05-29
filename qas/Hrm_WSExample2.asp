<html>
<head>
    <title>SOAP JavaScript Client Test</title>
    <script type="text/javascript">
        function soap() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open('POST', 'http://200.76.17.25/Pyxoom/WebServices/ProcessWS.asmx', true);

            // build SOAP request
            var sr =
                '<?xml version="1.0" encoding="utf-8"?>' +
                '<soapenv:Envelope ' + 
                    'xmlns:pyx="http://www.pyxoom.com/">' +
                    'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
                    'xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
                    'xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">' +
                    '<soapenv:Body>' +
                    '      <pyx:GenerateGuid>' +
                    '         <!--Optional:-->' +
                    '         <pyx:userAccount>admin</pyx:userAccount>' +
                    '         <!--Optional:-->' +
                    '         <pyx:userPassword>admin</pyx:userPassword>' +
                    '      </pyx:GenerateGuid>' +

                    '</soapenv:Body>' +
                '</soapenv:Envelope>';

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        alert('done. use firebug/console to see network response');
                    }
                }
            }
            // Send the POST request
            xmlhttp.setRequestHeader('Content-Type', 'text/xml');
            xmlhttp.send(sr);
            // send request
            // ...
        }
    </script>
</head>
<body>
    <form name="Demo" action="" method="post">
        <div>
            <input type="button" value="Soap" onclick="soap();" />
        </div>
    </form>
</body>
</html> <!-- typo -->
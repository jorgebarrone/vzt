<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Organigrama</title>
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
  <!-- GetOrgchart -->
  <link href="plugins/getorgchart/getorgchart.css" rel="stylesheet" />

  <!--#include file="procedures.asp"-->

    <style type="text/css">
        #people {
            width: 100%;
            height: 100%;
        }

        .get-text {
            fill: #000 !important;
            font-size: 15px !important;
        }

        .myCustomTheme-box {
            fill: #FFFFFF;
            stroke: #DDDAB9;
        }

        .reporters {
            fill: #0072C6;
        }
        .reporters-text {
            fill: #ffffff;
        }
    </style>

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
    <% call hdr("Organigrama","") %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL AQUI -->
            <%
            descv = "Vacante"
            fotov = "images/emp/silueta.jpg"
            contd = 0

            sqlpri = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                     "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                     "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                     "       c.Pue_Descripcion                                          " & _
                     "from HRM10100 a left outer join HRM10220 b                        " & _
                     "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                     "                      left outer join HRM10210 c                  " & _
                     "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                     "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                     "where a.Otm_Plaza_Superior = 7167                                 " & _
                     "and   a.Otm_Publica        = 1                                    " & _
                     "and   a.Otm_Estatus        = 1                                    "

'            response.write(sqlpri)
            set rs = dbconn.execute(sqlpri)
            if not rs.eof and not rs.bof then
                %>
                <div id="people"></div>
                <div style="float: right; width: 10%; height:100%; display: none;" >
                <table id="orgChartData" style="background-color: #DDDAB9; ">
                    <tr>
                        <th>id</th>
                        <th>parent id</th>
                        <th>name</th>
                        <th>title</th>
                        <th>image</th>
                    </tr>
                <%
                do while not rs.eof
                    if trim(rs("NombreCompleto")) > "" then
                        %>
                        <tr>
                            <td><%= trim(rs("Otm_Plaza")) %></td><td><%= trim(rs("Otm_Plaza_Superior")) %></td><td><%= trim(rs("NombreCompleto")) %></td><td><%= trim(rs("Pue_Descripcion")) %></td><td><%= trim(rs("UrlFoto")) %></td>
                        </tr>
                        <%
                        sqlsec = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                 "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                 "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                 "       c.Pue_Descripcion                                          " & _
                                 "from HRM10100 a left outer join HRM10220 b                        " & _
                                 "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                 "                      left outer join HRM10210 c                  " & _
                                 "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                 "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                 "where a.Otm_Plaza_Superior = '"& trim(rs("Otm_Plaza")) &"'        " & _
                                 "and   a.Otm_Publica        = 1                                    " & _
                                 "and   a.Otm_Estatus        = 1                                    "

                        set rs1 = dbconn.execute(sqlsec)
                        if not rs1.eof and not rs1.bof then
                            do while not rs1.eof
                                if trim(rs1("NombreCompleto")) <> "Vacante" then
                                    %>
                                    <tr>
                                        <td><%= trim(rs1("Otm_Plaza")) %></td><td><%= trim(rs1("Otm_Plaza_Superior")) %></td><td><%= trim(rs1("NombreCompleto")) %></td><td><%= trim(rs1("Pue_Descripcion")) %></td><td><%= trim(rs1("UrlFoto")) %></td>
                                    </tr>
                                    <%
                                    sqltri = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                             "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                             "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                             "       c.Pue_Descripcion                                          " & _
                                             "from HRM10100 a left outer join HRM10220 b                        " & _
                                             "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                             "                      left outer join HRM10210 c                  " & _
                                             "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                             "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                             "where a.Otm_Plaza_Superior = '"& trim(rs1("Otm_Plaza")) &"'       " & _
                                             "and   a.Otm_Publica        = 1                                    " & _
                                             "and   a.Otm_Estatus        = 1                                    "

                                    set rs2 = dbconn.execute(sqltri)
                                    if not rs2.eof and not rs2.bof then
                                        do while not rs2.eof
                                            if trim(rs2("NombreCompleto")) <> "Vacante" then
                                                %>
                                                <tr>
                                                    <td><%= trim(rs2("Otm_Plaza")) %></td><td><%= trim(rs2("Otm_Plaza_Superior")) %></td><td><%= trim(rs2("NombreCompleto")) %></td><td><%= trim(rs2("Pue_Descripcion")) %></td><td><%= trim(rs2("UrlFoto")) %></td>
                                                </tr>
                                                <%
                                                sqlcua = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                                         "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                                         "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                                         "       c.Pue_Descripcion                                          " & _
                                                         "from HRM10100 a left outer join HRM10220 b                        " & _
                                                         "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                                         "                      left outer join HRM10210 c                  " & _
                                                         "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                                         "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                                         "where a.Otm_Plaza_Superior = '"& trim(rs2("Otm_Plaza")) &"'       " & _
                                                         "and   a.Otm_Publica        = 1                                    " & _
                                                         "and   a.Otm_Estatus        = 1                                    "

                                                set rs3 = dbconn.execute(sqlcua)
                                                if not rs3.eof and not rs3.bof then
                                                    do while not rs3.eof
                                                        if trim(rs3("NombreCompleto")) <> "Vacante" then
                                                            %>
                                                            <tr>
                                                                <td><%= trim(rs3("Otm_Plaza")) %></td><td><%= trim(rs3("Otm_Plaza_Superior")) %></td><td><%= trim(rs3("NombreCompleto")) %></td><td><%= trim(rs3("Pue_Descripcion")) %></td><td><%= trim(rs3("UrlFoto")) %></td>
                                                            </tr>
                                                            <%
                                                            sqlqui = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                                                     "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                                                     "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                                                     "       c.Pue_Descripcion                                          " & _
                                                                     "from HRM10100 a left outer join HRM10220 b                        " & _
                                                                     "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                                                     "                      left outer join HRM10210 c                  " & _
                                                                     "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                                                     "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                                                     "where a.Otm_Plaza_Superior = '"& trim(rs3("Otm_Plaza")) &"'       " & _
                                                                     "and   a.Otm_Publica        = 1                                    " & _
                                                                     "and   a.Otm_Estatus        = 1                                    "
                                                            set rs4 = dbconn.execute(sqlqui)
                                                            if not rs4.eof and not rs4.bof then
                                                                do while not rs4.eof
                                                                    if trim(rs4("NombreCompleto")) <> "Vacante" then
                                                                        %>
                                                                        <tr>
                                                                            <td><%= trim(rs4("Otm_Plaza")) %></td><td><%= trim(rs4("Otm_Plaza_Superior")) %></td><td><%= trim(rs4("NombreCompleto")) %></td><td><%= trim(rs4("Pue_Descripcion")) %></td><td><%= trim(rs4("UrlFoto")) %></td>
                                                                        </tr>
                                                                        <%
                                                                        sqlsex = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                                                                 "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                                                                 "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                                                                 "       c.Pue_Descripcion                                          " & _
                                                                                 "from HRM10100 a left outer join HRM10220 b                        " & _
                                                                                 "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                                                                 "                      left outer join HRM10210 c                  " & _
                                                                                 "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                                                                 "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                                                                 "where a.Otm_Plaza_Superior = '"& trim(rs4("Otm_Plaza")) &"'       " & _
                                                                                 "and   a.Otm_Publica        = 1                                    " & _
                                                                                 "and   a.Otm_Estatus        = 1                                    "
                                                                        set rs5 = dbconn.execute(sqlsex)
                                                                        if not rs5.eof and not rs5.bof then
                                                                            do while not rs5.eof
                                                                                if trim(rs5("NombreCompleto")) <> "Vacante" then
                                                                                    %>
                                                                                    <tr>
                                                                                        <td><%= trim(rs5("Otm_Plaza")) %></td><td><%= trim(rs5("Otm_Plaza_Superior")) %></td><td><%= trim(rs5("NombreCompleto")) %></td><td><%= trim(rs5("Pue_Descripcion")) %></td><td><%= trim(rs5("UrlFoto")) %></td>
                                                                                    </tr>
                                                                                    <%
                                                                                else
                                                                                    %>
                                                                                    <tr>
                                                                                        <td><%= trim(rs5("Otm_Plaza")) %></td><td><%= trim(rs5("Otm_Plaza_Superior")) %></td><td><%= trim(rs5("NombreCompleto")) %></td><td><%= trim(rs5("Pue_Descripcion")) %></td><td><%= trim(rs5("UrlFoto")) %></td>
                                                                                    </tr>
                                                                                    <%
                                                                                end if
                                                                                rs5.movenext
                                                                                contd = contd + 1
                                                                            loop
                                                                            rs5.close
                                                                        end if

                                                                    else
                                                                        %>
                                                                        <tr>
                                                                            <td><%= trim(rs4("Otm_Plaza")) %></td><td><%= trim(rs4("Otm_Plaza_Superior")) %></td><td><%= trim(rs4("NombreCompleto")) %></td><td><%= trim(rs4("Pue_Descripcion")) %></td><td><%= trim(rs4("UrlFoto")) %></td>
                                                                        </tr>
                                                                        <%
                                                                    end if
                                                                    rs4.movenext
                                                                    contd = contd + 1
                                                                loop
                                                                rs4.close
                                                            end if

                                                        else
                                                            %>
                                                            <tr>
                                                                <td><%= trim(rs3("Otm_Plaza")) %></td><td><%= trim(rs3("Otm_Plaza_Superior")) %></td><td><%= trim(rs3("NombreCompleto")) %></td><td><%= trim(rs3("Pue_Descripcion")) %></td><td><%= trim(rs3("UrlFoto")) %></td>
                                                            </tr>
                                                            <%
                                                        end if
                                                        rs3.movenext
                                                        contd = contd + 1
                                                    loop
                                                    rs3.close
                                                end if
                                            else
                                                %>
                                                <tr>
                                                    <td><%= trim(rs2("Otm_Plaza")) %></td><td><%= trim(rs2("Otm_Plaza_Superior")) %></td><td><%= trim(rs2("NombreCompleto")) %></td><td><%= trim(rs2("Pue_Descripcion")) %></td><td><%= trim(rs2("UrlFoto")) %></td>
                                                </tr>
                                                <%
                                            end if
                                            contd = contd + 1
                                            rs2.movenext
                                        loop
                                        rs2.close
                                    end if
                                else
                                    %>
                                    <tr>
                                        <td><%= trim(rs1("Otm_Plaza")) %></td><td><%= trim(rs1("Otm_Plaza_Superior")) %></td><td><%= trim(rs1("NombreCompleto")) %></td><td><%= trim(rs1("Pue_Descripcion")) %></td><td><%= trim(rs1("UrlFoto")) %></td>
                                    </tr>
                                    <%
                                end if
                                contd = contd + 1
                                rs1.movenext
                            loop
                            rs1.close
                        else
                            %>
                            <tr>
                                <td><%= trim(rs("Otm_Plaza")) %></td><td><%= trim(rs("Otm_Plaza_Superior")) %></td><td><%= trim(rs("NombreCompleto")) %></td><td><%= trim(rs("Pue_Descripcion")) %></td><td><%= trim(rs("UrlFoto")) %></td>
                            </tr>
                            <%
                        end if
                    else
                        %>
                        <tr>
                            <td><%= trim(rs("Otm_Plaza")) %></td><td><%= trim(rs("Otm_Plaza_Superior")) %></td><td><%= trim(rs("NombreCompleto")) %></td><td><%= trim(rs("Pue_Descripcion")) %></td><td><%= trim(rs("UrlFoto")) %></td>
                        </tr>
                        <%
                    end if
                    contd = contd + 1
                    rs.movenext
                loop
                rs.close
                set rs = Nothing
                %>
                </table>
                </div>
                <%
            end if
'            response.write ("Contador : ")
'            response.write(contd)
            %>


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
<!-- GetOrgchart -->
<script src="plugins/getorgchart/getorgchart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<script type="text/javascript">
        getOrgChart.themes.myCustomTheme =
        {
            size: [250, 400],
            toolbarHeight: 46,
            textPoints: [
                { x: 130, y: 50, width: 250 },
                { x: 130, y: 90, width: 250 }
            ],
            textPointsNoImage: [
                { x: 130, y: 50, width: 250 },
                { x: 130, y: 90, width: 250 }
            ],
            expandCollapseBtnRadius: 20,
            defs: '<filter id="f1" x="0" y="0" width="200%" height="200%"><feOffset result="offOut" in="SourceAlpha" dx="5" dy="5" /><feGaussianBlur result="blurOut" in="offOut" stdDeviation="5" /><feBlend in="SourceGraphic" in2="blurOut" mode="normal" /></filter>',
            box: '<rect x="0" y="0" height="400" width="250" rx="10" ry="10" class="myCustomTheme-box" filter="url(#f1)"  />',
            text: '<text text-anchor="middle" width="[width]" class="get-text get-text-[index]" x="[x]" y="[y]">[text]</text>',
            image: '<clipPath id="getMonicaClip"><circle cx="135" cy="255" r="85" /></clipPath><image preserveAspectRatio="xMidYMid slice" clip-path="url(#getMonicaClip)" xlink:href="[href]" x="50" y="150" height="190" width="170"/>',
            image: '<image preserveAspectRatio="xMidYMid slice" xlink:href="[href]" x="25" y="150" height="190" width="200"/>',
            //ddddd: '<text x="0" y="0">1</text>'
        };

</script>

<script type="text/javascript">
        var peopleElement = document.getElementById("people");
        var orgChart = new getOrgChart(peopleElement, {
            expandToLevel: 1,
            theme: "tal",
            theme: "myCustomTheme",
            linkType: "B",
            enableEdit: false,
            enableDetailsView: false,
            primaryFields: ["name", "title"],
            photoFields: ["image"],
            enableGridView: true,
            scale: 0.5,
            dataSource: document.getElementById("orgChartData")
        });
</script>

</body>
</html>

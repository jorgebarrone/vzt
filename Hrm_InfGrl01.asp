<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Información General</title>
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
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <% call men() %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'InfGrl0100' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Tab003"
                Tab003 = trim(rsTrn("Trd_Texto"))
              Case "Tab004"
                Tab004 = trim(rsTrn("Trd_Texto"))
              Case "Tab005"
                Tab005 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if
    %>
    <!-- Content Header (Page header) -->

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL INICIO -->
        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#info01" data-toggle="tab"><%= Tab001 %></a>
                        </li>
                        <li>
                            <a href="#info02" data-toggle="tab"><%= Tab002 %></a>
                        </li>
                        <li>
                            <a href="#info03" data-toggle="tab"><%= Tab003 %></a>
                        </li>
                        <li>
                            <a href="#info05" data-toggle="tab"><%= Tab005 %></a>
                        </li>
                    </ul>
                    <div class="tab-content">

                        <!-- Informacion 01 -->
                        <div class="tab-pane active" id="info01" >


                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                Garantizar la Continuidad, el Crecimiento y la Rentabilidad del Negocio en el Largo Plazo 
                                            </h3>
                                            <div class="box-body">
                                                <img alt="Objetivos" src="images/Objetivos.png" style="float: left; padding: 20px" width="200">
                                                <br>
                                                <ol>
                                                    <li>Crecer en los mercados actuales</li>
                                                    <li>Diferenciarnos de los competidores</li>
                                                    <li>Brindar un nivel de servicio del 100%</li>
                                                    <li>Reducir el costo a nivel benchmark</li>
                                                    <li>Lograr una rentabilidad sobre Activos >25%</li>
                                                    <li>Desarrollar al Recurso Humano</li>
                                                    <li>Cumplir con nuestra responsabilidad social</li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>

                        </div>

                        <!-- Informacion 02 -->
                        <div class="tab-pane" id="info02">
                            <div class="row">
                                <div class="col-md-6">
                                    <img alt="Valores" src="images/Valores.png">
                                </div>
                                <div class="col-md-6">
                                    <div class="box">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                            </h3>
                                            <div class="box-body">
                                                <div class="box-group" id="accordion">
                                                    <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                                    <div class="panel">
                                                        <div class="box-header with-border">
                                                            <h4 class="box-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                                     1. Integridad
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseOne" class="panel-collapse collapse">
                                                            <div class="box-body">
                                                                 Consideramos el trato honesto, responsable, autentico y apegado a la verdad, 
                                                                 como la unica forma sostenible de hacer negocios.  
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel">
                                                        <div class="box-header with-border">
                                                            <h4 class="box-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                                    2. Orientacion al Cliente
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseTwo" class="panel-collapse collapse">
                                                            <div class="box-body">
                                                                Anticipamos las necesidades de nuestros clientes, internos y externos, 
                                                                buscando continuamente exceder sus expectativas. 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel">
                                                        <div class="box-header with-border">
                                                            <h4 class="box-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                                    3. Liderazgo
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseThree" class="panel-collapse collapse">
                                                            <div class="box-body">
                                                                Buscamos se los mejores en lo que hacemos planteandonos metas y objetivos retadores. 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel">
                                                        <div class="box-header with-border">
                                                            <h4 class="box-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                                                    4. Colaboracion
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseFour" class="panel-collapse collapse">
                                                            <div class="box-body">
                                                                Trabajamos en equipo enfocados a la productividad y competitividad. 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel">
                                                        <div class="box-header with-border">
                                                            <h4 class="box-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                                                    5. Mejora Continua e Innovacion 
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseFive" class="panel-collapse collapse">
                                                            <div class="box-body">
                                                                Cuestionamos permanentemente el estado actual de nuestros procesos buscando la excelencia.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel">
                                                        <div class="box-header with-border">
                                                            <h4 class="box-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                                                    6. Calidad de Vida 
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseSix" class="panel-collapse collapse">
                                                            <div class="box-body">
                                                                Promovemos un ambiente de trabajo basado en el respeto mutuo, donde se reconozcan los logros 
                                                                y se generen oportunidades de aprendizaje y desarrollo. 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel">
                                                        <div class="box-header with-border">
                                                            <h4 class="box-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
                                                                    7. Austeridad
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseSeven" class="panel-collapse collapse">
                                                            <div class="box-body">
                                                                Optimizamos el uso de los recursos reduciendolos a lo necesario. 
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Informacion 03 -->
                        <div class="tab-pane" id="info03" >
                            <div class="box box-primary">
                                <object data="CodigoEticaFinal.pdf" type="application/pdf" style="position: relative; display: block; width: 100%; height: 600px; padding: 0; overflow: hidden">
                                    alt : <a href="CodigoEticaFinal.pdf"></a>
                                </object>
                            </div>
                        </div>

                        <!-- Informacion 04 -->
                        <div class="tab-pane" id="info05">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab_1" data-toggle="tab">Logos Autorizados</a></li>
                                <li><a href="#tab_2" data-toggle="tab">Fondos para Presentaciones</a></li>
                                <li><a href="#tab_3" data-toggle="tab">Manuales de Identidad</a></li>
                            </ul>
                            
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1">
                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <div class="box-body">
                                                <img alt="Valores" src="images/ComunicacionImagen.png" width="331" style="float: left; padding: 10px">
                                                Una identidad corporativa fuerte no sólo depende de sus funciones, sino de su imagen. Para hacer esto posible 
                                                anexamos aquí, además de sus significados, los archivos en alta y baja resolución, según se requiera, de las 
                                                diferentes aplicaciones autorizadas, así como los colores permitidos.
                                                <br>&nbsp;</br>
                                                <p>
                                                ES INDISPENSABLE QUE AL MANDAR A HACER UN DISEÑO A COLOR CON ALGUN PROVEEDOR SE VERIFIQUE 
                                                QUE LOS COLORES SEAN LOS AQUI MENCIONADOS, DEPENDIENDO SI ES PARA USO ELECTRONICO O PARA IMPRESION.
                                                </p>
                                                En los casos que por cuestiones de colores se pierda el diseño, puede utilizarse las versiones en 
                                                blanco o en negro, segun convenga, evitando asi poner delineados inadecuados al logo.
                                                como los colores permitidos. 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                CONCEPTUALIZACIÓN: ¿Que significa?
                                            </h3>
                                            <div class="box-body">
                                                <img alt="Valores" src="images/log-verzatec01.gif" style="float: left; padding: 10px">
                                                Verzatec es un juego de las palabras "Tecnología" y "Versátil", dando así un significado que abarca la gama de 
                                                productos y empresas que tenemos y al mismo tiempo comunica la importancia de nuestra tecnología para hacerlos 
                                                de calidad.
                                                <br>&nbsp;</br>
                                                La imagen denota dinamismo y flexibilidad, mientras que la novedosa tipografía demuestra modernización, una 
                                                connotación tecnológica muy fuerte.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                Colores Autorizados
                                            </h3>
                                            <div class="box-body">
                                                <div>
                                                    <strong style="color: #A53148">Pantone 200 CVU</strong>
                                                    C:10 M:100 Y:65 K:20 (uso impreso)
                                                    R:165 G:49 B:72 (uso electr&oacute;nico)</FONT>
                                                </div>
                                                <div>
                                                    <strong style="color: #808080">70% Pantone Black CVU</strong>
                                                    C:43 M:35 Y:36 K:6 (uso impreso)
                                                    R:134 G:132 B:131 (uso elect&oacute;nico)
                                                </div>
                                                <br>&nbsp;</br>
                                                <div class="box-body table-responsive no-padding">
                                                    <table style="text-align: center; width: 100%">
                                                        <thead>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <th style="text-align: center; width: 25%">Negro</th>
                                                                <th style="text-align: center; width: 25%">Escala de grises</th>
                                                                <th style="text-align: center; width: 25%">Calado en blanco sobre fondo negro</th>
                                                                <th style="text-align: center; width: 25%">Color original</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><img alt="negro"     src="images/logos/negro01.gif"  width="101" height="52"></td>
                                                                <td><img alt="gris"      src="images/logos/gris01.gif"   width="101" height="52"></td>
                                                                <td><img alt="blanco"    src="images/logos/blanco01.gif" width="101" height="52"></td>
                                                                <td><img alt="original"  src="images/logos/verza01.gif"  width="101" height="52"></td>
                                                            </tr>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><a href="images/logos/negro01.gif"  download="logo_negro01.gif"> 101 x 52 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/gris01.gif"   download="logo_gris01.gif">  101 x 52 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/blanco01.gif" download="logo_blanco01.gif">101 x 52 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/verza01.gif"  download="logo_verza01.gif"> 101 x 52 px <br>Descargar</br></a></td>
                                                            </tr>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><a href="images/logos/negro02.gif"  download="logo_negro02.gif"> 500 x 246 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/gris02.gif"   download="logo_gris02.gif">  500 x 246 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/blanco02.gif" download="logo_blanco02.gif">500 x 246 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/verza02.gif"  download="logo_verza02.gif"> 500 x 246 px <br>Descargar</br></a></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                LOGOTIPO / SIGNATURA INSTITUCIONAL
                                            </h3>
                                            <div class="box-body">
                                                <img alt="Valores" src="images/logos/stabilit.gif" style="float: left; padding: 10px" width="105" height="52">
                                                Esta es la imagen que identifica gráficamente a la compañía Stabilit. El logotipo, un pictograma 
                                                que representa los perfiles de cuatro láminas tránslucidas sobrepuestas, configura en su conjunto 
                                                una sigla "s" y aparece acompañado de la signatura, es decir, el nombre de la empresa cuya tipografía 
                                                tiene su origen en el tipo "Eras" pero con cierta modificación en sus proporciones, así como también 
                                                en la forma de la letra "a", personalizandolo aún más.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                Colores institucionales
                                            </h3>
                                            <div class="box-body">
                                                <strong style="color: #00908D">
                                                    Verde Pantone 327&nbsp;
                                                </strong>
                                                para el logotipo y <strong>Negro</strong> para la signatura, deberán respetarse en todas las reproducciones, 
                                                entendiéndose que pudiera darse el caso de algunas muy leves variaciones en la tonalidad, dependiendo del 
                                                sistema de impresión y de la naturaleza del material sobre el que se imprima.
                                                <br>&nbsp;</br>
                                                <div class="box-body table-responsive no-padding">
                                                    <table style="text-align: center; width: 100%">
                                                        <thead>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <th style="text-align: center; width: 25%">Negro</th>
                                                                <th style="text-align: center; width: 25%">Colores Institucionales</th>
                                                                <th style="text-align: center; width: 25%">Calado en blanco sobre fondo negro</th>
                                                                <th style="text-align: center; width: 25%">Color Institucional</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><img alt="negro"       src="images/logos/stabilit-negro01.gif"  width="101" height="52"></td>
                                                                <td><img alt="institucion" src="images/logos/stabilit-amarillo.gif" width="101" height="52"></td>
                                                                <td><img alt="blanco"      src="images/logos/stabilit-blanco01.gif" width="101" height="52"></td>
                                                                <td><img alt="original"    src="images/logos/stabilit-01.gif"       width="101" height="52"></td>
                                                            </tr>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><a href="images/logos/stabilit-negro01.gif"    download="stabilit-negro01.gif"> 101 x 52 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/stabilit-instit01.gif"   download="stabilit-instit01.gif">101 x 52 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/stabilit-blanco01.gif"   download="stabilit-blanco01.gif">101 x 52 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/stabilit-01.gif"         download="stabilit-01.gif">      101 x 52 px <br>Descargar</br></a></td>
                                                            </tr>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><a href="images/logos/negrstabilit-negro02o02.gif"  download="stabilit-negro02.gif"> 500 x 246 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/stabilit-instit02.gif"        download="stabilit-instit02.gif">500 x 246 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/stabilit-blanco02.gif"        download="stabilit-blanco02.gif">500 x 246 px <br>Descargar</br></a></td>
                                                                <td><a href="images/logos/stabilit-02.gif"              download="stabilit-02.gif">      500 x 246 px <br>Descargar</br></a></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                LOGOTIPO / SIGNATURA INSTITUCIONAL
                                            </h3>
                                            <div class="box-body">
                                                <img alt="Valores" src="images/logos/IMSA PLASTICS-RGB 150.png" style="float: left; padding: 10px" width="105" height="52">
                                                El nuevo logotipo de IMSA Plastics genera una identidad visual que recupera los equities de Verzatec, comunicando 
                                                los atributos de los productos, a partir de una óptica innovadora, ágil, contemporánea y sustentable en la categoría 
                                                de la construcción. Creando así, una imagen que refleja una empresa de clase mundial.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                Colores Autorizados
                                            </h3>
                                            <div class="box-body">
                                                <strong style="color: #A53148">PMS 368&nbsp;</strong>
                                                RGB 105,190,40 &nbsp;&nbsp; HTML 69BE28&nbsp;&nbsp;CMYK 63,0,97,0
                                                <br>&nbsp;</br>
                                                <strong style="color: #A53148">PMS Process Blue&nbsp;</strong>
                                                RGB 0,136,206 &nbsp;&nbsp; HTML 0088CE&nbsp;&nbsp;CMYK 100,13,1,3
                                                <br>&nbsp;</br>
                                                <div class="box-body table-responsive no-padding">
                                                    <table style="text-align: center; width: 100%">
                                                        <thead>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <th style="text-align: center; width: 50%">Negro</th>
                                                                <th style="text-align: center; width: 50%">Color Institucional</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><img alt="negro"         src="images/logos/IMSA PLASTICS negro-01.png"  width="101" height="52"></td>
                                                                <td><img alt="institucional" src="images/logos/IMSA PLASTICS-CMYK 300.jpg"  width="101" height="52"></td>
                                                            </tr>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><a href="images/logos/IMSA PLASTICS negro-01.png"   download="IMSA PLASTICS negro-01.png">Descargar</a></td>
                                                                <td><a href="images/logos/IMSA PLASTICS-CMYK 300.jpg"   download="IMSA PLASTICS-CMYK 300.jpg">Descargar</a></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane" id="tab_2">
                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                &nbsp;
                                            </h3>
                                            <div class="box-body">
                                                <div class="box-body table-responsive no-padding">
                                                    <table style="text-align: center; width: 100%">
                                                        <thead>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <th style="text-align: center; width: 50%">Template Verzatec-Staff</th>
                                                                <th style="text-align: center; width: 50%">Template Verzatec-Stabilit</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><img alt="Template Verzatec-Staff"    src="images/templates/verzatec-template-staff.gif"    width="161" height="121"></td>
                                                                <td><img alt="Template Verzatec-Stabilit" src="images/templates/verzatec-template-stabilit.gif" width="161" height="121"></td>
                                                            </tr>
                                                            <tr style="text-align: center; vertical-align: bottom">
                                                                <td><a href="images/templates/verzatec-template-staff.pptx"    download="verzatec-template-staff.pptx">Descargar</a></td>
                                                                <td><a href="images/templates/verzatec-template-stabilit.pptx" download="verzatec-template-stabilit.pptx">Descargar</a></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane" id="tab_3">

                                    <div class="box box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">
                                                &nbsp;
                                            </h3>
                                            <div class="box-body">
                                                <div class="box-body">
                                                    <a href="images/templates/manual-ic-verzatec.pdf" download="manual-ic-verzatec.pdf" >
                                                        <img alt="Verzatec" src="images/logos/verza01.gif" style="float: left; padding: 10px" width="105" height="52">
                                                    </a>
                                                </div>
                                                <div class="box-body">
                                                    <a href="images/templates/manual-ic-stabilit.pdf" download="manual-ic-stabilit.pdf" >
                                                        <img alt="Stabilit" src="images/logos/stabilit.gif" style="float: left; padding: 10px" width="101" height="52">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.tab-pane -->
                            </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!-- CONTENIDO PRINCIPAL FIN    -->

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

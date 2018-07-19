<%
dim cn
dim Sid
dim Uid
dim Unm
dim Lng
dim Mdl
dim Trn
dim Pth
dim lnki
dim lnke

'cn = "Provider=SQLOLEDB;Server=LTVMS;Database=HRM;Uid=sa;Password=Admin01*;"
'cn = "Provider=SQLOLEDB;Server=172.28.100.11;Database=HRMqas;Uid=usrjob;Password=Vztjob2010;"
'cn = "Provider=SQLOLEDB;Server=172.28.100.11;Database=HRM;Uid=usrjob;Password=Vztjob2010;"
'vt = "Provider=SQLOLEDB;Server=172.28.100.11;Database=ORGANIZACION_VZT;Uid=usrjob;Password=Vztjob2010;"
cn = "Provider=SQLOLEDB;Server=184.168.194.75;Database=Eryseg01;Uid=Eryseg_sa;Password=Admin01*;"
lnki = "http://172.28.100.5/Hrm/index.htm"
lnke = "http://online.verzatec.com/Hrm/index.htm"

Sid = trim(Request.QueryString("Sid"))
Mdl = trim(Request.QueryString("Mdl"))
Trn = trim(Request.QueryString("Trn"))
Emc = "recursos.humanos@verzatec.com"
Ems = "VZT2K807.gpovzt.com"
Emp = 25


if Sid = "" then
    Sid = trim(Request.Form("Sid"))
end if

set dbconn = server.CreateObject("ADODB.Connection")
dbconn.open cn

sqlSes = "select * from HRM10008 where Ses_SesionID = '" & Sid & "' "
set rsS = dbconn.execute(sqlSes)
if not rsS.eof and not rsS.bof then
    Uid = trim(rsS("Ses_UserID"))
    Unm = trim(rsS("Ses_UserName"))
    Upd = trim(rsS("Ses_Puesto"))
    Uim = trim(rsS("Ses_Imagen"))
    Lng = trim(rsS("Ses_IdiomaID"))
else
    Uid = "No Registrado"
    Unm = "No Registrado"
    Upd = ""
    Uim = ""
    Lng = "ES"
end if

sqlMsp = "select * from HRM10002 where Trd_TransaccionID = 'MenSup' and Trd_IdiomaID = '" & Lng & "' "
set rsMS = dbconn.execute(sqlMsp)
if not rsMS.bof and not rsMS.eof then
    dim Elm1
    do while not rsMS.eof
        Elm1 = trim(rsMS("Trd_ElementoID"))
        Select Case Elm1
            Case "NavRMenu0010"
                NavRMenu0010 = trim(rsMS("Trd_Texto"))
            Case "NavRMenu0020"
                NavRMenu0020 = trim(rsMS("Trd_Texto"))
            Case "NavRMenu0030"
                NavRMenu0030 = trim(rsMS("Trd_Texto"))
            Case "NavRMenu0040"
                NavRMenu0040 = trim(rsMS("Trd_Texto"))
            Case "NavRMenu0041"
                NavRMenu0041 = trim(rsMS("Trd_Texto"))
            Case "NavRMenu0042"
                NavRMenu0042 = trim(rsMS("Trd_Texto"))
            Case "NavRMenu0050"
                NavRMenu0050 = trim(rsMS("Trd_Texto"))
            Case "NavRMenu0060"
                NavRMenu0060 = trim(rsMS("Trd_Texto"))
            Case else
                NavRMenu0000 = trim(rsMS("Trd_Texto"))
        End Select
        rsMS.movenext
    loop
    rsMS.close
    set rsMS = Nothing
else
    NavRMenu0010 = ""
    NavRMenu0020 = ""
    NavRMenu0030 = ""
    NavRMenu0040 = ""
    NavRMenu0050 = ""
    NavRMenu0060 = ""
    NavRMenu0000 = ""
end if

Sub men()
  On Error Resume Next
  %>

  <header class="main-header">

    <!-- Logo -->
    <a href="index.asp?Sid=<%= Sid %>" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>H</b>RM</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><img alt="Verzatec" src="images/logo_ico.png" height="30px">&nbsp;<b>Verzatec</b>&nbsp;HRM</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">

          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success"></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header"></li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                  </li>
                  <!-- end message -->
                </ul>
              </li>
              <li class="footer"><a href="#"></a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o" style="font-size: larger"></i>
              <span class="label label-warning"></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header"></li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#"></a></li>
            </ul>
          </li>

          <!-- Tasks: style can be found in dropdown.less -->


          <%
          sqlTsk = "select isnull(count(Tsk_FolioID),0) as Tsk from HRM10400 where Tsk_EmpleadoID = '"& Uid &"' and Tsk_Estatus = 'A'  "
          set rsT = dbconn.execute(sqlTsk)
'          response.write(sqlTsk)
          if not rsT.eof and not rsT.bof then
              Tsk = rsT("Tsk")
          else
              Tsk = 0
          end if
          rsT.Close
          %>
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o" style="font-size: larger"></i>
              <%
              if Tsk > 0 then
                  %><span class="label label-danger"><%= Tsk %></span><%
              end if
              %>

            </a>
            <ul class="dropdown-menu">
              <%
              if Tsk > 0 then
                  %><li class="header"><%= NavRMenu0040 & " " & Tsk & " " & NavRMenu0041 %></li><%
                  sqlTsk = "select Tsk_FolioID, Tsk_Partida, Tsk_UserID, Tsk_Descripcion, Tsk_Observaciones, Tsk_Script from HRM10400 where Tsk_EmpleadoID = '"& Uid &"' and Tsk_Estatus = 'A'  "
                  set rsD = dbconn.execute(sqlTsk)
                  'response.write(sqlTsk)
                  if not rsD.eof and not rsD.bof then
                      %>
                      <li>
                        <!-- inner menu: contains the actual data -->
                        <ul class="menu">
                          <%
                          Do while not rsD.eof
                          TskScr = trim(rsD("Tsk_Script")) & "&Sid=" & Sid
                          %>
                          <li><!-- Task item -->
                            <a href="Hrm_TskRdct.asp?Uem=<%= trim(rsD("Tsk_UserID")) & "&Obs=" & trim(rsD("Tsk_Observaciones")) & "&Sid=" & Sid  %>">
                              <h3 style="font-size: small">
                                <%= trim(rsD("Tsk_Observaciones")) %>
                              </h3>
                              <div class="progress xs">
                                <div class="progress-bar progress-bar-aqua" style="width: 100%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                  <span class="sr-only">100% Complete</span>
                                </div>
                              </div>
                            </a>
                          </li>
                          <%
                            rsD.movenext
                          Loop
                          %>
                          <!-- end task item -->
                        </ul>
                      </li>
                      <li class="footer">
                        <a href="Hrm_Tareas.asp?Sid=<%= Sid %>"><%= NavRMenu0042 %></a>
                      </li>
                    <%
                    rsD.close
                  end if
              end if
              %>
            </ul>
          </li>

          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<%= Uim %>" class="user-image" alt="User Image">
              <span class="hidden-xs"><%= Unm %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<%= Uim %>" class="img-circle" alt="User Image">

                <p>
                  <%= Unm %>
                  <small><%= Upd %></small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat"><%= NavRMenu0010 %></a>
                </div>
                <div class="pull-right">
                  <a href="Hrm_Logout.asp?Sid=<%= Sid %>" class="btn btn-default btn-flat"><%= NavRMenu0020 %></a>
                </div>
              </li>
            </ul>
          </li>

          <!-- Languages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-language" style="font-size: larger"></i>
            </a>
            <ul class="dropdown-menu">
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                <%
                sqllng = "select * from HRM10001"
                set rslng = dbconn.execute(sqllng)
                if not rslng.eof and not rslng.bof then
                    do while not rslng.eof
'                      lngId = trim(rslng("Idm_IdiomaID"))
 '                     lngDs = trim(rslng("Idm_Descripcion"))
  '                    lngIm = trim(rslng("Idm_Imagen"))
                      %>
                      <li>
                        <a href="indexlng.asp?Sid=<%= Sid & "&Lng=" & trim(rslng("Idm_IdiomaID")) %>">
                          <div class="pull-left">
                            <img src="<%= trim(rslng("Idm_Imagen")) %>" class="img-circle" alt="<%= trim(rslng("Idm_Descripcion")) %>">
                          </div>
                          <h4>
                            <%= trim(rslng("Idm_Descripcion")) %>
                          </h4>
                        </a>
                      </li>
                      <%
                      rslng.movenext
                    loop
                    rslng.close
                    set rslng = Nothing
                end if
                %>
                </ul>
              </li>
            </ul>
          </li>

          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears" style="font-size: larger"></i></a>
          </li>
        </ul>
      </div>

    </nav>
  </header>

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<%= Uim %>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p style="font-size: smaller"><%= Unm %></p>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
          <% call lmenu() %>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
<%
End Sub

Sub hdr(Prm1, Prm2)
    dim Tit
    dim Stt
    Tit = trim(Prm1)
    Stt = trim(Prm2)
    %>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <%= Tit %> &nbsp;
        <small><%= Stt %></small> &nbsp;
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.asp?Sid=<%= Sid %>"><i class="fa fa-home"></i><%= NavRMenu0030 %></a></li>
        <%
        if trim(Mdl) > "" then
            %>
            <li><%= Mdl %></li>
            <%
        end if
        if trim(Pth) > "" then
            %>
            <li class="active"><%= Pth %></li>
            <%
        end if
        %>
      </ol>
    </section>
    <%
End Sub


Sub lmenu()
On Error Resume Next

  sqlMod = "select a.Prm_ModuloID, b.Mdl_Secuencia,   " & _
           "       b.Mdl_Logo                         " & _
           "from HRM10006 a, HRM10003 b               " & _
           "where a.Prm_ModuloID = b.Mdl_ModuloID     " & _
           "and   a.Prm_UserID   = '" & Uid & "'      " & _
           "group by a.Prm_ModuloID, b.Mdl_Secuencia, " & _
           "         b.Mdl_Logo                       " & _
           "order by b.Mdl_Secuencia                  "

  set rs = dbconn.Execute(sqlMod)
  if not rs.bof and not rs.eof then
      do while not rs.eof
          sqlG = "select Trd_Texto from HRM10002                          " & _
                 "where Trd_ElementoID = '"& trim(rs("Prm_ModuloID")) &"' " & _
                 "and   Trd_IdiomaID   = '"& Lng &"'                      "
          set rsG = dbconn.execute(sqlG)
          if not rsG.eof and not rsG.bof then
              do while not rsG.eof
                  MdlT = trim(rsG("Trd_Texto"))
                  rsG.movenext
              loop
              rsG.close
              set rsG = Nothing
          else
              MdlT = ""
          end if
          if MdlT = Mdl then
              %>
              <li class="treeview active">
              <%
          else
              %>
              <li class="treeview">
              <%
          end if
          %>
          <a href="index.asp?Sid=<%= Sid & "&Mdl=" & Mdl & "&Trn=" & Trn %>">
            <i class="<%= trim(rs("Mdl_Logo")) %>"></i> <span><%= MdlT %></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <%
          sqlTrn = "select a.Prm_TransaccionID, b.Trn_Secuencia,              " & _
                   "       b.Trn_Script,        c.Trd_Texto                   " & _
                   "from HRM10006 a, HRM10004 b, HRM10002 c                   " & _
                   "where a.Prm_TransaccionID = b.Trn_TransaccionID           " & _
                   "and   b.Trn_TransaccionID = c.Trd_ElementoID              " & _
                   "and   c.Trd_IdiomaID = '"& Lng &"'                        " & _
                   "and   a.Prm_ModuloID = '"& trim(rs("Prm_ModuloID")) & "'  " & _
                   "and   a.Prm_UserID   = '"& Uid &"'                        " & _
                   "order by b.Trn_Secuencia                                  "
          set rst = dbconn.Execute(sqlTrn)
          'response.write(sqlTrn)
          'response.write("</br>")
          if not rst.bof and not rst.eof then
              %>
              <ul class="treeview-menu">
              <%
              do while not rst.eof
                  if trim(rst("Trn_Script")) = Trn then
                      %>
                      <li class="active"><a href="<%= trim(rst("Trn_Script")) & "?Mdl=" & MdlT & "&Trn=" & trim(rst("Trn_Script")) & "&Sid=" & Sid %>"><i class="fa fa-circle"></i><%= rst("Trd_Texto") %><%Pth = trim(rst("Trd_Texto"))%></a></li>
                      <%
                  else
                      %>
                      <li><a href="<%= trim(rst("Trn_Script")) & "?Mdl=" & MdlT & "&Trn=" & trim(rst("Trn_Script")) & "&Sid=" & Sid %>"><i class="fa fa-circle-o"></i><%= rst("Trd_Texto") %></a></li>
                      <%
                  end if
                  rst.moveNext
              loop
              %>
              </ul>
              <%
          end if
          %>
          </li>
          <%
          rs.moveNext
      loop
  end if
End Sub

Sub footer()
On Error Resume Next
  %>
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>HRM Verzatec</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2016-2017 Eryseg</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">

    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">

      </div>
      <!-- /.tab-pane -->

    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  <%
End Sub
%>

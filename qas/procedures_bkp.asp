<%
dim cn
dim UserID
dim UserName
dim Cia
dim Icc
dim Mdl
dim Trn
dim Rut

cn = "Provider=SQLOLEDB;Server=LTVMS;Database=EMprd;Uid=sa;Password=Admin01*;"
'cn = "Provider=SQLOLEDB;Server=SERVER-CA;Database=EMprd;Uid=sa;Password=Hermosillo12;"
cm = "DSN=CMS-FNGHMO;uid=CMSVIEW;pwd=CMSVIEW1"
cu = "DSN=CUS-HMO;uid=CMSVIEW;pwd=CMSVIEW1"

UserID   = trim(Request.Form("UserID"))
UserName = trim(Request.Form("UserName"))
Cia      = trim(Request.Form("Cia"))
Icc      = trim(Request.Form("Icc"))
Mdl      = trim(Request.QueryString("Mdl"))
Trn      = trim(Request.QueryString("Trn"))
Rut      = "http://10.56.55.22/EM"

if UserID = "" then
    UserID   = trim(Request.QueryString("UserID"))
    UserName = trim(Request.QueryString("UserName"))
    Cia      = trim(Request.QueryString("Cia"))
    Icc      = trim(Request.QueryString("Icc"))
end if

set dbconn = server.CreateObject("ADODB.Connection")
dbconn.open cn

sqlcia = "select cpy_rsocial, cpy_mensajes from tccomp0100 where cpy_idcompania = '" & Cia & "' "
set rsCia = dbconn.execute(sqlcia)
if not rsCia.eof and not rsCia.bof then
    CiaD = trim(rsCia("cpy_rsocial"))
    mens = trim(rsCia("cpy_mensajes"))
else
    CiaD = ""
    mens = ""
end if

sqlcen = "select cen_descrip from tccenc0100 where cen_idcompania = '" & Cia & "' and cen_idcencos = '" & Icc & "'  "
set rsIcc = dbconn.execute(sqlcen)
if not rsIcc.eof and not rsCia.bof then
    IccD = trim(rsIcc("cen_descrip"))
else
    IccD = ""
end if


Sub hdr(Prm1, Prm2, Prm3)
On Error Resume Next
dim Tit
dim Stt
dim Prh
Tit = trim(Prm1)
Stt = trim(Prm2)
Pth = trim(Prm3)
%>
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.asp?UserID=<%= UserID & "&UserName=" & UserName & "&Cia=" & Cia & "&Icc=" & Icc %>" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                <img alt="Fng" src="img/fngbg.png" height="60px"/>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>
                                    <%= UserName %>
                                    <i class="caret"></i>
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <!-- Menu Body -->
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="Em_Profile.asp?UserID=<%= UserID & "&UserName=" & UserName & "&Cia=" & Cia & "&Icc=" & Icc %>" class="btn btn-default btn-flat">Administrar Perfil</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="Em_EndSession.asp" class="btn btn-default btn-flat">Cerrar Sesion</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left info">
                            <p>Expenses - Hermosillo</p>
                        </div>
                    </div>
                    <!-- search form -->
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <% call lmenu() %>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <%= Tit %> &nbsp;<small><%= Stt %></small> &nbsp;<small><%= CiaD & "  /  " & IccD %></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                          <a href="index.asp?UserID=<%= UserID & "&UserName=" & UserName & "&Cia=" & Cia & "&Icc=" & Icc %>">
                            <i class="fa fa-home"></i> Inicio
                          </a>
                        </li>
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

sqlMod = "select a.per_idmodulo, b.mod_descrip,          " & _
         "       b.mod_orden,    b.mod_imagen            " & _
         "from tperms0100 a, tcmods0100 b                " & _
         "where a.per_idmodulo = b.mod_idmodulo          " & _
         "and a.per_idemp = '" & UserID & "'             " & _
         "group by a.per_idmodulo, b.mod_descrip,        " & _
         "         b.mod_orden,    b.mod_imagen          " & _
         "order by b.mod_orden                           "

  set rs = dbconn.Execute(sqlMod)
  if not rs.bof and not rs.eof then
      do while not rs.eof
          %>
          <ul class="sidebar-menu">
          <% if trim(rs("mod_descrip")) = Mdl then %>
              <li class="treeview active">
          <% else %>
              <li class="treeview">
          <% end if %>
                  <a href="index.asp?UserID=<%= UserID & "&UserName=" & UserName & "&Cia=" & Cia & "&Icc=" & Icc %>" >
                      <i class="<%= trim(rs("mod_imagen")) %>"></i>
                          <span><%= rs("mod_descrip") %></span>
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <%
                  sqlTrn = "select a.per_idpantalla, b.pnt_idpantalla,            " & _
                           "       b.pnt_orden,      b.pnt_script,                " & _
                           "       b.pnt_nombrecorto                              " & _
                           "from tperms0100 a, tcpant0100 b                       " & _
                           "where a.per_idpantalla = b.pnt_idpantalla             " & _
                           "and   a.per_idmodulo = '" & rs("per_idmodulo") & "'   " & _
                           "and   a.per_idemp    = '" & UserID             & "'   " & _
                           "order by b.pnt_orden                                  "
                  set rst = dbconn.Execute(sqlTrn)
                  'response.write(sqlTrn)
                  'response.write("</br>")
                  if not rst.bof and not rst.eof then
                      %>
                      <ul class="treeview-menu">
                      <%
                      do while not rst.eof
                        if trim(rst("pnt_script")) = Trn then %>
                            <li class="active">
                                <a href="<%= trim(rst("pnt_script")) & "?Mdl=" & trim(rs("mod_descrip")) & "&Trn=" & trim(rst("pnt_script")) & "&UserID=" & UserID & "&UserName=" & UserName & "&Cia=" & Cia & "&Icc=" & Icc %>">
                                    <i class="fa fa-angle-double-down"></i>
                                    <%= rst("pnt_nombrecorto") %>
                                </a>
                            </li>
                            <%
                        else
                            %>
                            <li>
                                <a href="<%= trim(rst("pnt_script")) & "?Mdl=" & trim(rs("mod_descrip")) & "&Trn=" & trim(rst("pnt_script")) & "&UserID=" & UserID & "&UserName=" & UserName & "&Cia=" & Cia & "&Icc=" & Icc %>">
                                    <i class="fa fa-angle-double-right"></i>
                                    <%= rst("pnt_nombrecorto") %>
                                </a>
                            </li>
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
          %>
          </ul>
      <%
  end if
End Sub
%>
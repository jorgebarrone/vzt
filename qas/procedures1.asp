<%
dim cn
dim Sid
dim Uid
dim Unm
dim Lng
dim Mdl
dim Trn
dim Pth

cn = "Provider=SQLOLEDB;Server=LTVMS;Database=HRM;Uid=sa;Password=Admin01*;"
'cn = "Provider=SQLOLEDB;Server=172.28.100.11;Database=HRMqas;Uid=usrjob;Password=Vztjob2010;"
'cn = "Provider=SQLOLEDB;Server=172.28.100.11;Database=HRM;Uid=usrjob;Password=Vztjob2010;"
vt = "Provider=SQLOLEDB;Server=172.28.100.11;Database=ORGANIZACION_VZT;Uid=usrjob;Password=Vztjob2010;"
'cn = "Provider=SQLOLEDB;Server=184.168.194.75;Database=Eryseg01;Uid=Eryseg_sa;Password=Admin01*;"

Sid = trim(Request.QueryString("Sid"))
Mdl = trim(Request.QueryString("Mdl"))
Trn = trim(Request.QueryString("Trn"))
Cem = "recursos.humanos@verzatec.com"

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
    </section>
    <%
End Sub



%>
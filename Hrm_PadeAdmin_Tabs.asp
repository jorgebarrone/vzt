<%
Dim Prm
Prm = trim(Request.QueryString("Prm"))
if Prm = "" then
    Prm = 1
end if

Dim Tab1St
Dim Tab2St
Dim Tab3St
Dim Tab4St
Dim Tab5St
Dim Tab6St
Dim Tab7St
Dim Tab8St
Dim Tab9St
Dim Tab10St
Dim Tab11St
Dim Tab12St
Dim Pan1St
Dim Pan2St
Dim Pan3St
Dim Pan4St
Dim Pan5St
Dim Pan6St
Dim Pan7St
Dim Pan8St
Dim Pan9St
Dim Pan10St
Dim Pan11St
Dim Pan12St

Tab1St = ""
Tab2St = ""
Tab3St = ""
Tab4St = ""
Tab5St = ""
Tab6St = ""
Tab7St = ""
Tab8St = ""
Tab9St = ""
Tab10St = ""
Tab11St = ""
Tab12St = ""
Pan1St = "tab-pane"
Pan2St = "tab-pane"
Pan3St = "tab-pane"
Pan4St = "tab-pane"
Pan5St = "tab-pane"
Pan6St = "tab-pane"
Pan7St = "tab-pane"
Pan8St = "tab-pane"
Pan9St = "tab-pane"
Pan10St = "tab-pane"
Pan11St = "tab-pane"
Pan12St = "tab-pane"

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
    Case "4"
        Tab4St = "class='active'"
        Pan4St = "tab-pane active"
    Case "5"
        Tab5St = "class='active'"
        Pan5St = "tab-pane active"
    Case "6"
        Tab6St = "class='active'"
        Pan6St = "tab-pane active"
    Case "7"
        Tab7St = "class='active'"
        Pan7St = "tab-pane active"
    Case "8"
        Tab8St = "class='active'"
        Pan8St = "tab-pane active"
    Case "9"
        Tab9St = "class='active'"
        Pan9St = "tab-pane active"
    Case "10"
        Tab10St = "class='active'"
        Pan10St = "tab-pane active"
    Case "11"
        Tab11St = "class='active'"
        Pan11St = "tab-pane active"
    Case else
        Tab12St = "class='active'"
        Pan12St = "tab-pane active"
End Select

sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0700' and Trd_IdiomaID = '"& Lng &"'  "
set rsTrn = dbconn.execute(sqlTrn)
'response.write(sqlTrn)
if not rsTrn.eof and not rsTrn.bof then
    dim ElmP
    do while not rsTrn.eof
        ElmP = trim(rsTrn("Trd_ElementoID"))
        Select Case ElmP
          Case "TitPri"
            TitPri = trim(rsTrn("Trd_Texto"))
          Case "SubTit"
            SubTit = trim(rsTrn("Trd_Texto"))
          Case "Tab001"
            Opt001 = trim(rsTrn("Trd_Texto"))
          Case "Tab002"
            Opt002 = trim(rsTrn("Trd_Texto"))
          Case "Tab003"
            Opt003 = trim(rsTrn("Trd_Texto"))
          Case "Tab004"
            Opt004 = trim(rsTrn("Trd_Texto"))
          Case "Tab005"
            Opt005 = trim(rsTrn("Trd_Texto"))
          Case "Tab006"
            Opt006 = trim(rsTrn("Trd_Texto"))
          Case "Tab007"
            Opt007 = trim(rsTrn("Trd_Texto"))
          Case "Tab008"
            Opt008 = trim(rsTrn("Trd_Texto"))
          Case "Tab009"
            Opt009 = trim(rsTrn("Trd_Texto"))
          Case "Tab010"
            Opt010 = trim(rsTrn("Trd_Texto"))
          Case "Tab011"
            Opt011 = trim(rsTrn("Trd_Texto"))
          Case "Tab012"
            Opt012 = trim(rsTrn("Trd_Texto"))
          Case else
            Tb1Hd0 = trim(rsTrn("Trd_Texto"))
        End Select
        rsTrn.movenext
    loop
end if

Sub MnuTabs()
  On Error Resume Next
  %>
  <li <%= Tab1St %>><a href="Hrm_PadeAdmin01.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=1" & "&Sid=" & Sid %>"><%= Opt001 %></a></li>
<!--  <li <%= Tab2St %>><a href="Hrm_PadeAdmin02.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=2" & "&Sid=" & Sid %>"><%= Opt002 %></a></li> -->
  <li <%= Tab3St %>><a href="Hrm_PadeAdmin03.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=3" & "&Sid=" & Sid %>"><%= Opt003 %></a></li>
  <li <%= Tab4St %>><a href="Hrm_PadeAdmin04.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=4" & "&Sid=" & Sid %>"><%= Opt004 %></a></li>
  <li <%= Tab5St %>><a href="Hrm_PadeAdmin05.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=5" & "&Sid=" & Sid %>"><%= Opt005 %></a></li>
<!--    <li <%= Tab6St %>><a href="Hrm_PadeAdmin06.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=6" & "&Sid=" & Sid %>"><%= Opt006 %></a></li> -->
<!--    <li <%= Tab7St %>><a href="Hrm_PadeAdmin07.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=7" & "&Sid=" & Sid %>"><%= Opt007 %></a></li> -->
  <li <%= Tab8St %>><a href="Hrm_PadeAdmin08.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=8" & "&Sid=" & Sid %>"><%= Opt008 %></a></li>
  <li <%= Tab9St %>><a href="Hrm_PadeAdmin09.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=9" & "&Sid=" & Sid %>"><%= Opt009 %></a></li>
  <li <%= Tab10St %>><a href="Hrm_PadeAdmin10.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=10" & "&Sid=" & Sid %>"><%= Opt010 %></a></li>
  <li <%= Tab11St %>><a href="Hrm_PadeAdmin11.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=11" & "&Sid=" & Sid %>"><%= Opt011 %></a></li>
  <li <%= Tab12St %>><a href="Hrm_PadeAdmin12.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=12" & "&Sid=" & Sid %>"><%= Opt012 %></a></li>
  <%
End Sub
%>

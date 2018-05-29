<%@ Language=VBScript %>
<%	response.buffer = false
	response.expires = 0
    response.ContentType = "application/vnd.ms-excel"
    Response.AddHeader "Content-Disposition", "filename=""Reporte_Estatus_Pade.xls"
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Estatus XLS</title>
  <!--#include file="procedures1.asp"-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0600' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1 = trim(rsTrn("Trd_Texto"))
              Case "TbHd01"
                TbHd01 = trim(rsTrn("Trd_Texto"))
              Case "TbHd02"
                TbHd02 = trim(rsTrn("Trd_Texto"))
              Case "TbHd03"
                TbHd03 = trim(rsTrn("Trd_Texto"))
              Case "TbHd04"
                TbHd04 = trim(rsTrn("Trd_Texto"))
              Case "TbHd05"
                TbHd05  = trim(rsTrn("Trd_Texto"))
              Case "TbHd06"
                TbHd06  = trim(rsTrn("Trd_Texto"))
              Case "TbHd07"
                TbHd07  = trim(rsTrn("Trd_Texto"))
              Case "TbHd08"
                TbHd08  = trim(rsTrn("Trd_Texto"))
              Case "TbHd09"
                TbHd09 = trim(rsTrn("Trd_Texto"))
              Case "TbHd10"
                TbHd10 = trim(rsTrn("Trd_Texto"))
              Case "TbHd11"
                TbHd11 = trim(rsTrn("Trd_Texto"))
              Case "TbHd12"
                TbHd12 = trim(rsTrn("Trd_Texto"))
              Case "TbHd13"
                TbHd13  = trim(rsTrn("Trd_Texto"))
              Case "TbHd14"
                TbHd14  = trim(rsTrn("Trd_Texto"))
              Case "TbHd15"
                TbHd15  = trim(rsTrn("Trd_Texto"))
              Case "TbHd16"
                TbHd16  = trim(rsTrn("Trd_Texto"))
              Case "TbHd17"
                TbHd17  = trim(rsTrn("Trd_Texto"))
              Case "BxHd01"
                BxHd01  = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    Dim Ejr
    Dim Ent
    Ejr = trim(Request.QueryString("EjerID"))
    Ent = trim(Request.QueryString("EntyID"))
    if Ejr = "" then
        Ejr = 0
    end if
    if Ent = "" then
        Ent = 0
    end if

    '<-- Busqueda de Parámetros PADE (Inicio) -->
    if Ejr > 0 then
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Estatus = 'A'               "
        set rse = dbconn.execute(sqlEjr)
        if not rse.bof and not rse.eof then
            Dsc    = trim(rse("Pde_Descripcion"))
        else
            Dsc    = ""
        end if
    end if
    %>

    <% call hdr(TitPri,Dsc) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL INICIO -->



                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <%
                                        if Ejr > 0 then
                                            if Ent > 0 then
                                                sqlTP1 = "select count(s.Psm_Estatus) as TotTP1      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'MAT3600010' or  " & _
                                                         "       s.Psm_SemaforoID = 'APROBJ0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    e.Emp_EntidadID = '"& Ent &"'       "
                                                
                                                sqlVP1 = "select count(s.Psm_Estatus) as TotVP1      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'MAT3600010' or  " & _
                                                         "       s.Psm_SemaforoID = 'APROBJ0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    e.Emp_EntidadID = '"& Ent &"'       " & _
                                                         "and    s.Psm_Estatus > 1                   "

                                                sqlTP2 = "select count(s.Psm_Estatus) as TotTP2      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'OBJHAB0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'RETALM0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    e.Emp_EntidadID = '"& Ent &"'       "

                                                sqlVP2 = "select count(s.Psm_Estatus) as TotVP2      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'OBJHAB0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'RETALM0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    e.Emp_EntidadID = '"& Ent &"'       " & _
                                                         "and    s.Psm_Estatus > 1                   "

                                                sqlTP3 = "select count(s.Psm_Estatus) as TotTP3      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'DATGEN0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0020' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0030' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0040' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0050' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0060' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0070' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0080' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0090')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    e.Emp_EntidadID = '"& Ent &"'       "

                                                sqlVP3 = "select count(s.Psm_Estatus) as TotVP3      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'DATGEN0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0020' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0030' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0040' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0050' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0060' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0070' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0080' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0090')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    e.Emp_EntidadID = '"& Ent &"'       " & _
                                                         "and    s.Psm_Estatus > 1                   "

                                                sqllis = "select e.Emp_CompaniaID,     e.Emp_EmpleadoID,   " & _
                                                         "       e.Emp_NombreCompleto, v.DescCentroCosto,  " & _
                                                         "       v.DescEntidad,                            " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'MAT3600010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'MAT3600010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P1M360,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'APROBJ0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'APROBJ0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P1APOB,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'OBJHAB0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'OBJHAB0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P2OBJH,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'RETALM0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'RETALM0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P2RTAL,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT1,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0020' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0020' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT2,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0030' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0030' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT3,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0040' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0040' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT4,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0050' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0050' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT5,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0060' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0060' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT6,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0070' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0070' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT7,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0080' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0080' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT8,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0090' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0090' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT9   " & _
                                                         "from   HRM10220 e, ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec v  " & _
                                                         "where  e.Emp_CompaniaID = v.EmpresaFuente                      " & _
                                                         "and    e.Emp_EmpleadoID = v.Empleado                           " & _
                                                         "and    e.Emp_NominaID < 10                                     " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')                      " & _
                                                         "and    e.Emp_EntidadID = '"& Ent &"'                           " & _
                                                         "order by e.Emp_CompaniaID,  v.DescEntidad,                     " & _
                                                         "         v.DescCentroCosto, e.Emp_NombreCompleto               "
                                            else
                                                sqlTP1 = "select count(s.Psm_Estatus) as TotTP1      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'MAT3600010' or  " & _
                                                         "       s.Psm_SemaforoID = 'APROBJ0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  "
                                                
                                                sqlVP1 = "select count(s.Psm_Estatus) as TotVP1      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'MAT3600010' or  " & _
                                                         "       s.Psm_SemaforoID = 'APROBJ0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    s.Psm_Estatus > 1                   "
                                                
                                                sqlTP2 = "select count(s.Psm_Estatus) as TotTP2      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'OBJHAB0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'RETALM0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  "
                                                
                                                sqlVP2 = "select count(s.Psm_Estatus) as TotVP2      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'OBJHAB0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'RETALM0010')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    s.Psm_Estatus > 1                   "
                                                
                                                sqlTP3 = "select count(s.Psm_Estatus) as TotTP3      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'DATGEN0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0020' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0030' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0040' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0050' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0060' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0070' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0080' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0090')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  "

                                                sqlVP3 = "select count(s.Psm_Estatus) as TotVP3      " & _
                                                         "from HRM10502 s, HRM10220 e                " & _
                                                         "where s.Psm_CompaniaID = e.Emp_CompaniaID  " & _
                                                         "and   s.Psm_EmpleadoID = e.Emp_EmpleadoID  " & _
                                                         "and   s.Psm_Ejercicio  = "& Ejr &"         " & _
                                                         "and   (s.Psm_SemaforoID = 'DATGEN0010' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0020' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0030' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0040' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0050' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0060' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0070' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0080' or  " & _
                                                         "       s.Psm_SemaforoID = 'DATGEN0090')    " & _
                                                         "and    e.Emp_NominaID < 10                 " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')  " & _
                                                         "and    s.Psm_Estatus > 1                   "

                                                sqllis = "select e.Emp_CompaniaID,     e.Emp_EmpleadoID,   " & _
                                                         "       e.Emp_NombreCompleto, v.DescCentroCosto,  " & _
                                                         "       v.DescEntidad,                            " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'MAT3600010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'MAT3600010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P1M360,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'APROBJ0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'APROBJ0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P1APOB,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'OBJHAB0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'OBJHAB0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P2OBJH,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'RETALM0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'RETALM0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P2RTAL,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT1,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0020' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0020' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT2,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0030' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0030' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT3,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0040' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0040' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT4,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0050' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0050' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT5,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0060' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0060' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT6,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0070' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0070' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT7,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0080' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0080' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT8,  " & _
                                                         "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0090' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0090' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT9   " & _
                                                         "from   HRM10220 e, ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec v  " & _
                                                         "where  e.Emp_CompaniaID = v.EmpresaFuente                      " & _
                                                         "and    e.Emp_EmpleadoID = v.Empleado                           " & _
                                                         "and    e.Emp_NominaID < 10                                     " & _
                                                         "and    e.Emp_CompaniaID IN('2','10','11')                      " & _
                                                         "order by e.Emp_CompaniaID,  v.DescEntidad,                     " & _
                                                         "         v.DescCentroCosto, e.Emp_NombreCompleto               "
                                            end if
                                            set rsTP1 = dbconn.execute(sqlTP1)
                                            if not rsTP1.bof and not rsTP1.eof then
                                                TP1 = CInt(rsTP1("TotTP1"))
                                            else
                                                TP1 = 0
                                            end if
                                            set rsTP2 = dbconn.execute(sqlTP2)
                                            if not rsTP2.bof and not rsTP2.eof then
                                                TP2 = CInt(rsTP2("TotTP2"))
                                            else
                                                TP2 = 0
                                            end if
                                            set rsTP3 = dbconn.execute(sqlTP3)
                                            if not rsTP3.bof and not rsTP3.eof then
                                                TP3 = CInt(rsTP3("TotTP3"))
                                            else
                                                TP3 = 0
                                            end if
                                            set rsVP1 = dbconn.execute(sqlVP1)
                                            if not rsVP1.bof and not rsVP1.eof then
                                                VP1 = CInt(rsVP1("TotVP1"))
                                            else
                                                VP1 = 0
                                            end if
                                            set rsVP2 = dbconn.execute(sqlVP2)
                                            if not rsVP2.bof and not rsVP2.eof then
                                                VP2 = CInt(rsVP2("TotVP2"))
                                            else
                                                VP2 = 0
                                            end if
                                            set rsVP3 = dbconn.execute(sqlVP3)
                                            if not rsVP3.bof and not rsVP3.eof then
                                                VP3 = CInt(rsVP3("TotVP3"))
                                            else
                                                VP3 = 0
                                            end if
                                            if TP1 > 0 then
                                                PA1 = (VP1 / TP1) * 100
                                            else
                                                PA1 = 0
                                            end if
                                            if TP2 > 0 then
                                                PA2 = (VP2 / TP2) * 100
                                            else
                                                PA2 = 0
                                            end if
                                            if TP3 > 0 then
                                                PA3 = (VP3 / TP3) * 100
                                            else
                                                PA3 = 0
                                            end if

'                                            response.write(sqllis)
                                            set rsl = dbconn.execute(sqllis)
                                            if not rsl.bof and not rsl.eof then
                                                %>
                                                <table>
                                                    <tr>
                                                        <td>PASO 1</td>
                                                        <td><b><%= formatnumber(PA1,2) %>&nbsp;%</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td>PASO 2</td>
                                                        <td><b><%= formatnumber(PA2,2) %>&nbsp;%</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td>PASO 3</td>
                                                        <td><b><%= formatnumber(PA3,2) %>&nbsp;%</b></td>
                                                    </tr>
                                                </table>
                                                </br>
                                                <table border="1">
                                                    <thead>
                                                    <tr>
                                                        <th colspan="5">&nbsp;</th>
                                                        <th colspan="2">Paso 1</th>
                                                        <th colspan="2">Paso 2</th>
                                                        <th colspan="9">Paso 3</th>
                                                    </tr>
                                                    <tr>
                                                        <th><%= TbHd01 %></th>
                                                        <th><%= TbHd02 %></th>
                                                        <th><%= TbHd03 %></th>
                                                        <th><%= Fr1Lb2 %></th>
                                                        <th><%= TbHd17 %></th>
                                                        <th><%= TbHd04 %></th>
                                                        <th><%= TbHd05 %></th>
                                                        <th><%= TbHd06 %></th>
                                                        <th><%= TbHd07 %></th>
                                                        <th><%= TbHd08 %></th>
                                                        <th><%= TbHd09 %></th>
                                                        <th><%= TbHd10 %></th>
                                                        <th><%= TbHd11 %></th>
                                                        <th><%= TbHd12 %></th>
                                                        <th><%= TbHd13 %></th>
                                                        <th><%= TbHd14 %></th>
                                                        <th><%= TbHd15 %></th>
                                                        <th><%= TbHd16 %></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
                                                do while not rsl.eof
                                                    %>
                                                    <tr>
                                                        <td><%= trim(rsl("Emp_CompaniaID"))     %></td>
                                                        <td><%= trim(rsl("Emp_EmpleadoID"))     %></td>
                                                        <td><%= trim(rsl("Emp_NombreCompleto")) %></td>
                                                        <td><%= trim(rsl("DescEntidad"))        %></td>
                                                        <td><%= trim(rsl("DescCentroCosto"))    %></td>
                                                        <%if rsl("P1M360") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P1M360") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P1M360") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P1APOB") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P1APOB") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P1APOB") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P2OBJH") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P2OBJH") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P2OBJH") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P2RTAL") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P2RTAL") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P2RTAL") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT1") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT1") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT1") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT2") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT2") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT2") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT3") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT3") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT3") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT4") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT4") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT4") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT5") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT5") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT5") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT6") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT6") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT6") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT7") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT7") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT7") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT8") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT8") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT8") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>
                                                        <%if rsl("P3DAT9") < 0 then %><td style="background-color: gray">&nbsp;</td><%else if rsl("P3DAT9") = 0 then %><td style="background-color: red">&nbsp;</td><%else if rsl("P3DAT9") = 1 then %><td style="background-color: yellow">&nbsp;</td><%else%><td style="background-color: green">&nbsp;</td><%end if end if end if %>




                                                    </tr>
                                                    <%
                                                    rsl.movenext
                                                loop
                                                %>
                                                    </tbody>
                                                </table>
                                                <%
                                            end if
                                        end if
                                        %>
                                    </div>
                                </div>



        <!-- CONTENIDO PRINCIPAL FIN -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


</div>


</body>
</html>

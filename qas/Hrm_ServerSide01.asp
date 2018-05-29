<%
cn = "Provider=SQLOLEDB;Server=LTVMS;Database=HRM;Uid=sa;Password=Admin01*;"

set dbconn = server.CreateObject("ADODB.Connection")
dbconn.open cn
    
                                        '<!-- Comienza prueba de Paginación DataTables -->
                                        sEcho = Cint(Request("sEcho"))
                                        iDisplayLength = Cint(Request("iDisplayLength"))
                                        iDisplayStart = Cint(Request("iDisplayStart"))
                                        iDisplayLength = Cint(Request("length"))
                                        iDisplayStart = Cint(Request("start"))
                                        
'                                        iDisplayLength = 50
 '                                       iDisplayStart = 51
                                        
                                        sSearch = Request("sSearch")
                                        'sSearch = Request("search")

                                        'SEARCH - here we make the Where clause that will be used in the SQL query. You only put here the fields you want to search
                                        strWhere = " where (Pue_PuestoID LIKE '%" & sSearch & "%' OR "
                                        strWhere = strWhere &  " Pue_Descripcion    LIKE '%" & sSearch & "%')"

                                        'ORDERING
                                        'passes through all cols and first check if the column is sortable, if yes then construct
                                        'the variable "order" that list in order the sequence of ordering
                                        order = ""
                                        strOrderBy = ""
                                        for k=0 to 1
                                            if Request("bSortable_" & k)="true" then
                                                order = order & Request("iSortCol_" & k) & " " & Request("sSortDir_" & k)
                                            end if
                                        next
                                        'here we replace the number corresponding the column position by the corresponding name of the column in the database
                                        'response.write("Order P0 : ")
                                        'response.write(order)
                                        'response.write("</br>")
                                        order = Replace(order,"0",", Pue_PuestoID")
                                        order = Replace(order,"1",", Pue_Descripcion")
                                        'response.write("Order P1 : ")
                                        'response.write(order)
                                        'response.write("</br>")
                                        'here we eliminate the first comma of the variable "order"
                                        if trim(order) > "" then
                                            order = Right(order, Len(order)-1)
                                            strOrderBy = "ORDER BY " & order
                                        end if
                                        
                                        'here we create the variable "strOrderBy" that will be used in the SQL query
                                        'strOrderBy = "ORDER BY " & order

                                        'here we create the SQL query using the variables "strWhere" and "strOrderBy"
                                        sqlLis = "select Pue_PuestoID,   Pue_Descripcion,    " & _
                                                 "       Pue_CompaniaID                      " & _
                                                 "from HRM10210                              " & _
                                                 "where Pue_CompaniaID = '"& Cpy &"'         "
                                        sqlLis = "select Pue_PuestoID,   Pue_Descripcion,    " & _
                                                 "       Pue_CompaniaID                      " & _
                                                 "from HRM10210                              "
                                        sqlLis = sqlLis & strWhere & strOrderBy
                                        'response.write(sqlLis)
                                        Set rs = dbconn.execute(sqlLis)
 
                                        'here is counted how many records we have in the query using the search criterion and call this as "iTotalDisplayRecords"
                                        iTotalDisplayRecords = 0
                                        if rs.eof = false then
                                            do while not rs.eof
                                                iTotalDisplayRecords = iTotalDisplayRecords + 1
                                                rs.movenext
                                            loop
                                            rs.movefirst
                                        end if

                                        'here we just count how many records we have in the table, WITHOUT any search criterion and call this as "iTotalRecords"
                                        sql2 = "select count(Pue_PuestoID) FROM HRM10210 where Pue_CompaniaID = '"& Cpy &"'  "
                                        sql2 = "select count(Pue_PuestoID) FROM HRM10210 "
                                        set rs2 = dbconn.execute(sql2)
                                        iTotalRecords = rs2(0)
                                        'here we begin to mount the ajax reponse
                                        %>
                                        {"sEcho": <%=sEcho%>, "iTotalRecords": <%=iTotalRecords%>, "iTotalDisplayRecords": <%=iTotalDisplayRecords%>, "aaData": [
                                        <% i= 0
                                        'PAGINATION
                                        'First we move the recordset for the first record of the page that is being displayed in the table using the parameters(iDisplayStart)
                                        'then we create a loop wich the limits are the parameters (iDisplayLength) or the end of the query
                                        aaData = ""
                                            'response.write("iDisplayStart : ")
                                            'response.write(iDisplayStart)
                                            'response.write("</br>")
                                            'response.write("iDisplayLength : ")
                                            'response.write(iDisplayLength)
                                            'response.write("</br>")
                                        if rs.eof = false then
                                            
                                            'if iDisplayStart > 0 then
                                                rs.move(iDisplayStart)
                                            'end if
                                            'rs.movefirst
                                            if iDisplayLength = 0  or iDisplayLength = "" then
                                                iDisplayLength = 10
                                            end if
                                            do while i < iDisplayLength and not rs.eof
                                                bbData = "['<a href=" & chr(36) & "#" & chr(36) & ">" & trim(rs("Pue_PuestoID")) & "</a>','" & trim(rs("Pue_Descripcion")) & "'],"
                                            
                                                'we create the variable "aaData" that has the data that will be displayed. This variable is in a format known by the DataTable
                                                'aaData = aaData + "['" & rs("Pue_PuestoID") & "','" & rs("Pue_Descripcion") & "'],"
                                                aaData = aaData + bbData
                                                'here we replace the single quotes by double quotes (chr(34))
                                                aaData = Replace(aaData,"'",chr(34))
                                                aaData = Replace(aaData,"$","'")
                                                rs.movenext
                                                
                                                i=i+1
                                            
                                            loop
                                            'aaData = aaData + "['" & iDisplayStart & "','" & iDisplayLength & "'],"
                                            'here we eliminate the last comma in the aaData
                                            if aaData > "" then
                                                aaData = Left(aaData,Len(aaData)-1)
                                            end if
                                         else
                                            'if the query result has no records the aaData will be empty and the Table will give an answer that no record was find
                                            aaData = ""
                                        end if
 
                                        'here we finishes to mount the response
                                        response.write aaData & "] }"

                                            'response.write("aaData : ")
                                            'response.write(aaData)
                                            'response.write("</br>")
%>
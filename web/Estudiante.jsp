
<%@page import="java.sql.*"%>
<%@page import="BaseDeDatos.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection cnx = null;
Statement sta = null;
ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center"> LISTADO DE ESTUDIANTES</h1>
        <table border="1" width="1000" align="center">
            <tr bgcolor="skyblue" >
                <th colspan="8"> Agregar un nuevo REGISTRO ------------></th>
                
                <th> <a href="nuevo_estudiante.jsp"><img src="agregar.png" width="30" height="30"> </th> </a>
            </tr>
            <tr bgcolor="skyblue">
                <td>Codigo de Estudiante</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>Fecha de Nacimiento</td>
                <td>Sexo</td>
                <td>Telefono</td>
                <td>Email</td>
                <td>Codigo del bachilerato</td>
                 <td> Eliminar</td>
            </tr>
            
            <% 
           
            try{
                
                cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante","root","");
           sta=cnx.createStatement();
                      rs=sta.executeQuery("select * from estudiante");
            
                
                 while (rs.next()) {                              
                              %>
                              <tr>
                                  <td><%=rs.getInt(1) %></td> <!<!-- la version anterior no funcionaba porque en lugar de td puse th -->
                                   <td><%=rs.getString(2) %></td>
                                   <td><%=rs.getString(3) %></td>
                                   <td><%=rs.getString(4) %></td>
                                   <td><%=rs.getString(5) %></td>
                                   <td><%=rs.getString(6) %></td>
                                   <td><%=rs.getString(7) %></td>
                                   <td><%=rs.getInt(8) %></td>
                                   <th>
                                       
                                       <a href="eliminar_estudiante.jsp?cod= <%=rs.getInt(1) %>">
                                          <img src="basura.png" width="30" height="30"> </a>
                                         
                                   </th>
                              </tr>
                              <%
                          }
                           sta.close();
                          rs.close();
                          cnx.close();
            
            }catch(Exception e){
    }

            
            %>
                

        </table>
        
    </body>
</html>

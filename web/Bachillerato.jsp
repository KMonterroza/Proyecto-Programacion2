<%-- 
    Document   : Bachillerato
    Created on : 28 jun. 2022, 12:56:54
    Author     : ISAAC
--%>
<%@page import="java.sql.*"%>
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
        <title>LISTADO DE BACHILLERATOS</title>
    </head>
    <body>
        <h1 class="titulo" align="center">LISTADO DE BACHILERATOS</h1>
        <a href="index.html" name="btnInicioB">Volver a inicio</a>
        <h3 align="center"> Añadir Bachillerato <a href="nuevobachi.jsp"><img src="icons/añadir.png" width="30" align="center"/></a></h3>
        <table border="1" width="600" align="center">
            <tr bfcolor="skyblue">
                <td>id bachillerato</td>
                <td>nombre</td>
                <td>descripcion</td>
                <<td>Eliminar</td>
            </tr>
            <%
              try {
                      cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante","root","");
                      sta=cnx.createStatement();
                      rs=sta.executeQuery("select * from bachillerato");
                      while (rs.next()) {                              
                              %>
                              <tr>
                                  <td><%=rs.getString(1) %></td> <!<!-- la version anterior no funcionaba porque en lugar de td puse th -->
                                   <td><%=rs.getString(2) %></td>
                                   <td><%=rs.getString(3) %></td>
                                   <td align="center">
                                       <a href="eliminarBachi.jsp?id=<%=rs.getString(1)%>">
                                       <img src="icons/eliminar.png" width="30" align="center"/>
                                       </a>
                                   </td>
                              </tr>
                              <%
                          }
                          sta.close();
                          rs.close();
                          cnx.close();
                  } catch (Exception e) {
                  }
            
            %>
        </table>
    </body>
</html>

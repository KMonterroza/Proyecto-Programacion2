<%-- 
    Document   : Bachillerato
    Created on : 28 jun. 2022, 12:56:54
    Author     : ISAAC
--%>
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
        <title>BACHILLERATOS</title>
    </head>
    <body>
        <h1 class="titulo" align="center">LISTADO DE BACHILERATOS</h1>
        <table border="1" width="600" align="center">
            <tr bfcolor="skyblue">
                <td>id bachillerato</td>
                <td>nombre</td>
                <td>descrpcion</td>
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

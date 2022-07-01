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
<link rel="stylesheet" href="ESTILOS2.css" type="text/css"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTADO DE BACHILLERATOS</title>
    </head>
    <body>
        <h1 class="titulo" align="center">LISTADO DE BACHILERATOS</h1>
        <button>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            
            <a class="btn" href="index.html" name="btnInicioB">Volver a inicio</a>
        </button>
        
        
        <table >
            <thead>
                 <tr>
                <th colspan="8" bgcolor="#515151"> Añadir bachillerato</th>
                
                <th bgcolor="#515151">  <a href="nuevobachi.jsp"><img src="icons/añadir.png" width="30" align="center"/></a><thead>
            </tr>
            </thead>
            <thead >
                <th>ID BACHILLERATO</th>
                <th>NOMBRE</th>
                <th>DESCRIPCIÓN</th>
                <th>ELIMINAR</th>
        </thead>
            <%
              try {
                      cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante","root","");
                      sta=cnx.createStatement();
                      rs=sta.executeQuery("select * from bachillerato");
                      while (rs.next()) {                              
                              %>
                              <tr class="encabezado">
                                  <td><%=rs.getString(1) %></td> <!<!-- la version anterior no funcionaba porque en lugar de td puse th -->
                                   <td><%=rs.getString(2) %></td>
                                   <td><%=rs.getString(3) %></td>
                                   <td align="center">
                                       <a href="eliminarBachi.jsp?id=<%=rs.getString(1)%>">
                                       <img src="basura.png" width="30" height="30">
                                       
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

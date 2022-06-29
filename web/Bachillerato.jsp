<%-- 
    Document   : Bachillerato
    Created on : 28 jun. 2022, 12:56:54
    Author     : ISAAC
--%>
<%@page import="java.sql.*"%>
<%@page import="BaseDeDatos.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BACHILLERATOS</title>
    </head>
    <body>
        <table border="1" width="600">
            <tr bfcolor="skyblue">
                <td>id bachillerato</td>
                <td>nombre</td>
                <td>descrpcion</td>
            </tr>
            <%
              Connection cnx = null;
              Statement sta = null;
              ResultSet rs = null;
              try {
                      Class.forName("com.mysql.jdbc.Driver");
                      cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante","root","");
                      sta=cnx.createStatement();
                      rs=sta.executeQuery("select * from bachillerato");
                      while (rs.next()) {                              
                              %>
                              <tr>
                                  <th><%rs.getString(1);%></th>
                                  <th><%rs.getString(2);%></th>
                                  <th><%rs.getString(3);%></th>
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

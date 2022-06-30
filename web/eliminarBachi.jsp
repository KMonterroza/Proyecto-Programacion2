<%-- 
    Document   : eliminarBachi
    Created on : 29 jun. 2022, 20:46:10
    Author     : ISAAC
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    </body>
</html>
<%
    String id = request.getParameter("id");
        Connection cnx = null;
        ResultSet rs = null;
        Statement sta = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante", "root", "");
            sta = cnx.createStatement();
            sta.executeUpdate("delete from bachillerato where id_bachillerato='"+id+"'");
            response.sendRedirect("Bachillerato.jsp");
        } catch (Exception e) {
            out.println(e + "");
        }
%>
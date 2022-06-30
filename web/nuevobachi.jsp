<%-- 
    Document   : nuevobachi
    Created on : 29 jun. 2022, 15:46:33
    Author     : ISAAC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AÑADIR BACHILLERATO</title>
    </head>
    <body>
        <h1 align="center">Registro de Bachillerato</h1>
        <a href="Bachillerato.jsp">Cancelar</a> <!<!-- vuelve al listado -->
        <form action="">
            <table border="1" width="400" align="center">  
                <tr>
                    <td>Ingrese el Nombre</td>
                    <td><input type="text" name="txtNombre" placeholder="Ingrese el nombre"></td>
                </tr>
                <tr>
                    <td>Ingrese una breve descripcion</td>
                    <td><input type="text" name="txtDescripcion" placeholder="Ingrese la descripcion"></td>
                </tr>  
                <tr>
                    <th colspan="2"><input type="submit" name="btnAñadirB" value="Añadir Bachillerato"></th>
                </tr> 
            </table>   
        </form>
    </body>
</html>
<%
    String nombre = request.getParameter("txtNombre");
    String descripcion = request.getParameter("txtDescripcion");
    if (nombre!= null && descripcion!= null) {
        Connection cnx = null;
        ResultSet rs = null;
        Statement sta = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante", "root", "");
            sta = cnx.createStatement();
            sta.executeUpdate("insert into bachillerato(nombre,descripcion) values('" + nombre + "','" + descripcion + "')");
            response.sendRedirect("Bachillerato.jsp");
        } catch (Exception e) {
            out.println(e + "");
        }

    }
%>
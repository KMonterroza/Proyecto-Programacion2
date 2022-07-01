<%-- 
    Document   : nuevobachi
    Created on : 29 jun. 2022, 15:46:33
    Author     : ISAAC
--%>

<%@page import="java.sql.*"%>
<link rel="stylesheet" href="NuevoEstu_estilos.css" type="text/css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AÑADIR BACHILLERATO</title>
    </head>
    <body>
        <h2 class=" lines-effects">Registro de Bachillerato</h2>
        
        <form action="">
            <table class="resgistro" border="1" width="400" align="center">  
                <tr>
                    <td>Ingrese el Nombre</td>
                    <td><input  class="controles" type="text" name="txtNombre" placeholder="Ingrese el nombre"></td>
                </tr>
                <tr>
                    <td>Ingrese una breve descripcion</td>
                    <td><input  class="controles" type="text" name="txtDescripcion" placeholder="Ingrese la descripcion"></td>
                </tr>  
                <tr>
                    <th colspan="2"><input class="botons" type="submit" name="btnAñadirB" value="Añadir Bachillerato"></th>
                </tr> 
            </table>   
        </form>
         <a href="Bachillerato.jsp" class="volverEs">Volver atras</a>

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
<%-- 
    Document   : nuevo_estudiante
    Created on : 29 jun. 2022, 21:42:41
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="java.sql.*"%>
<%@page import="BaseDeDatos.conexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2 alig="center"> Registrar un nuevo estudiante </h2>
        <form action="" alig="center">
            <table border="1" width="450" align="center">
                
                <tr bgcolor="skyblue">
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre"></td>
                </tr>
                <tr bgcolor="skyblue">
                    <td>Apellido:</td>
                    <td><input type="text" name="txtApelli"></td>
                </tr>
                <tr bgcolor="skyblue">
                    <td>Fecha de nacimiento:</td>
                    <td><input type="text" name="txtNaci"></td>
                </tr bgcolor="skyblue">
                <tr  bgcolor="skyblue">
                    <td>Sexo:</td>
                    <td><input type="text" name="txtSexo"></td>
                </tr>
                <tr bgcolor="skyblue">
                    <td>Telefono:</td>
                    <td><input type="text" name="txtTele"></td>
                <tr bgcolor="skyblue">
                    <td>Email:</td>
                    <td><input type="text" name="txtEmail"></td>
                </tr>
                <tr bgcolor="skyblue">
                     <td>Codigo bachillerato:</td>
                    <td><input type="text" name="txtFkbachi"></td>
                </tr>
                   
                    <td colspan="3">
                        <input  type="submit" name="btnAgregar" value="Agregar usuario "></td>
                
                
               
            </table>
        </form>
        
    </body>
</html>

<%
          
           String nom = request.getParameter("txtNombre");
           String apelli = request.getParameter("txtApelli");
            String fecha= request.getParameter("txtNaci");
             String sexo = request.getParameter("txtSexo");
             String telefono = request.getParameter("txtTele");
             String email = request.getParameter("txtEmail");
              String codigo_bachiller = request.getParameter("txtFkbachi");
             
            if(request.getParameter("btnAgregar")!=null){
               
                Connection cnx=null;
                ResultSet rs=null;
                Statement sta =null;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                   cnx =DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante","root","");
                sta = cnx.createStatement();
                sta.executeUpdate("INSERT into estudiante (nombre,apellido,fecha_nacimiento,Sexo,telefono,email,fk_bachillerato)values ('"+nom+"','"+apelli+"','"+fecha+"','"+sexo+"','"+telefono+"','"+email+"','"+codigo_bachiller+"')");
              request.getRequestDispatcher("Estudiante.jsp").forward(request, response);
              
                }catch(Exception e){
                    out.print(e);
                    
                }
            }
         
           %>
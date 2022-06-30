<%-- 
    Document   : eliminar_estudiante
    Created on : 30 jun. 2022, 0:11:23
    Author     : Sammy Guergachi <sguergachi at gmail.com>
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
        
        
        <%
          
           String cod = request.getParameter("cod");
          
             
         
               
                Connection cnx=null;
                ResultSet rs=null;
                Statement sta =null;
                try{
                    
                    Class.forName("com.mysql.jdbc.Driver");
                   cnx =DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante","root","");
                sta = cnx.createStatement();
                sta.executeUpdate("delete from estudiante where id_estudiante='"+cod+"'");
              request.getRequestDispatcher("Estudiante.jsp").forward(request, response);
              
                }catch(Exception e){
                    out.print(e);
                    
                }
            
         
           %>
        
        
        
        
    </body>
</html>

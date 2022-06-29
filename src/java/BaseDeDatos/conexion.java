/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BaseDeDatos;
import java.sql.*;
import javax.swing.JOptionPane;
public class conexion {
   Connection conectar = null;
   Statement sta=null;
     public Connection conexion(){

         try{
             Class.forName("com.mysql.jdbc.Driver");
             conectar = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionestudiante","root","");
             sta=conectar.createStatement();
             System.out.println("Conexion aceptada..");
         }catch (Exception e){
             System.out.println("Mensaje de error"+e);
             JOptionPane.showMessageDialog(null,"Conexion Fallida.."+ e);
         }
        return conectar;
     }
   public static void main(String[] args){
      conexion c = new conexion();
      c.conexion();
   }
}

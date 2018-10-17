/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import common_things.DB_Connection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


public class addte {
    
     public void set_date(String dateselected,String ID){
       //connect to database first
       DB_Connection connect = new DB_Connection();
        Connection con = connect.startConnect();
       // DB_Connection connect = new DB_Connection();
        
        // create a connection variable
        //Connection con = connect.startConnect();  
        try{
         String sql = "INSERT INTO booked(dateselected, practical_id) "
                        + "VALUES("+"'"+dateselected+"'"
                        + ",'"+ID+"') ";      
         Statement stmt = con.prepareStatement(sql);
         if(stmt.execute(sql))
              System.out.print("Registered date is "+ dateselected);
            
        }catch(SQLException se){
            
        }finally{
            try{
                if(con != null)
                    con.close();
            }catch(SQLException se){
              
            }
        }
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package common_things;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_Connection {
    
    
    public static void main(String[] args){
        DB_Connection database_object = new DB_Connection();
        //System.out.println(database_object.startConnect());
        

    }
    public Connection startConnect(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String DB_URL = "jdbc:mysql://localhost/software";
            String USER = "root";
            String PASS = "";
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Something went wrong");
        }
        return conn;
        
    }
    
}

package modal;

import bean.Login_bean;
//import com.mysql.jdbc.PreparedStatement;
import common_things.DB_Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//class for checking user name
public class Login_modal {
    public String booking=" ";  // execute if the slots is already booked
     public String full=" ";  // slots booked full
    public int size = 0;
   public ResultSet results = null;
    public ResultSet resultsname = null;
    public ResultSet resultslot = null;
    public ResultSet modulesresults=null; // displaying the registerered modules 
    public String name =null;
     public String[] modulesid =new String[100];
      public String[] practicals =new String[100];
     public String[] modulesname =new String[100];
     public String[] moduleslecture =new String[100];
     public String[] slots=new String[100];
     public String status=null;
    public   int i = 0;
    public   int SIZE = 0;
    public   int j = 0;
     public   int k = 0;//k for slots 
     public int no_student = 0;
     public String update="";
     public String sql1="";
    
     public String updatebooked="";  // sql query
     
     
   
    public void studentbooking(String modulesname){
        
        DB_Connection connect = new DB_Connection();
        Connection con = connect.startConnect();
        
        try{
             String sql = "SELECT * FROM practicals WHERE  module_id="+"'"+modulesname+"'";
              String booking= "SELECT * FROM slots WHERE  1"; // collecting database modules EDITED ON THE 04/10/2018
                 Statement preps = con.prepareStatement(sql);
                 Statement preps2 = con.prepareStatement(booking); //added 
                   results = preps.executeQuery(sql);
                   resultslot=preps2.executeQuery(booking);
                   
                   while(results.next()){
                       practicals[j]=results.getString(1);
                       j++;
                       
                       
                   }
              while(resultslot.next())
                  slots[k++]=resultslot.getString(1);
       
        }
        catch(Exception e){
               
        }finally{
            try{
            if(con != null){
                con.close();
            }
            }catch(Exception e){
                
            }
        }
        
}
    
    public boolean check_user_name(Login_bean Login_object){
        boolean flag=false;
        DB_Connection connect = new DB_Connection();
        Connection con = connect.startConnect();
        
        
        try{
         String sql = "SELECT * FROM person WHERE id="+"'"+Login_object.get_uname()+"'"+
                 "and password="+"'"+Login_object.getPwd()+"'";
         
          String sql2 = "SELECT name FROM person WHERE id="+"'"+Login_object.get_uname()+"'"+
                 "and password="+"'"+Login_object.getPwd()+"'"; // get a name of the user 
         
        
          String sqlmodule="";//modules selection
         Statement preps = con.prepareStatement(sql);
         Statement preps1 = con.prepareStatement(sql2);
         
         results = preps.executeQuery(sql);
          resultsname = preps1.executeQuery(sql2);
          
          
          if(results.next()){  //login
             flag=true;
             if(resultsname.next()){
                 name = results.getString(2);
                 status = results.getString(4);
             }
           if("student".equals(status)){
               
               sqlmodule= "SELECT * FROM modules WHERE 1"; // collecting database modules EDITED ON THE 04/10/2018
               
           }else{   
                 sqlmodule= "SELECT * FROM modules WHERE lecture_id="+"'"+Login_object.get_uname()+"'"; // collecting database modules EDITED ON THE 04/10/2018
                      } 
        Statement preps2 = con.prepareStatement(sqlmodule); //added 
         
             modulesresults= preps2.executeQuery(sqlmodule);// added
             
          
              while(modulesresults.next()){
                 
                   modulesid[i] = modulesresults.getString(1);
                   modulesname[i] = modulesresults.getString(2);
                   
                    i=i+1;
         }
                 
           
         }
         
        } catch(Exception e){
        
        }finally{
            try{
            if(con != null){
                con.close();
            }
            }catch(Exception e){
                
            }
        }
        
        
        return flag;
    } 
  
    
    
    public void selecteddate(String dateselected){
       
        DB_Connection connect = new DB_Connection();
        Connection con = connect.startConnect();
       
        try{
            
            // connects to the database  
         String sql = "SELECT number_of_student FROM slots WHERE data_available="+"'"+dateselected+"'";
        String dateselect = "SELECT * FROM booked WHERE dateselected="+"'"+dateselected+"'";   //extracting the date from booked table
          
         Statement preps = con.prepareStatement(sql);
         Statement preps2 = con.prepareStatement(dateselect);
         
         results = preps.executeQuery(sql);
         resultslot = preps2.executeQuery(dateselect);
         if(results.next()){
            no_student=results.getInt(1);
         }


        if(no_student<10){
         no_student = no_student+ 1;
          update = "UPDATE slots set number_of_student="+no_student +" WHERE data_available="+"'"+dateselected+"'";
         
             preps2 = con.prepareStatement(update);
         preps2.executeUpdate(update);
        }
        else
            full="Slots are full";
          
        
        
       
         
          
        }catch(SQLException e){
        
        }finally{
            try{
            if(con != null){
                con.close();
            }
            }catch(SQLException e){
                
            }
        }   
    }
    
    
}






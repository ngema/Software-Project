/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;



/**
 *
 * @author Administrator
 */
public class Login_bean {
    private String uname;
    private String pwd;
    
    
    public void set_uname(String uname){
        this.uname = uname;
    }
    
    public String get_uname(){
        return uname;
    }
    public void set_pwd(String pwd){
       
        this.pwd = pwd;
    }
    
    public String getPwd(){
        return pwd;
    }
    
    
}

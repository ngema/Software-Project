<%-- 
    Document   : module
    Created on : Oct 4, 2018, 12:52:52 AM
    Author     : Student
--%>
<%@page import="modal.Login_modal" %>
<%@page import="bean.addte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        
        <!-- Latest compiled and minified CSS -->
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           
        <%  Login_modal book=new Login_modal();
             addte newaddte = new addte();
            /*out.println(request.getParameter("srch"));*/
            String modulename=request.getParameter("srch") ;
            book.studentbooking(modulename);
            int j=0;
            int k=0;
            while(book.j>j){
                out.println(book.practicals[j++]); %>
    <br>
    <form method="POST" action="#" >
                <%
            }

     while(book.k>k){
        %>
        
         <input type="radio" name="slots" value="<%out.println(book.slots[k]);%>" > <%out.println(book.slots[k]);%><br>
       
          
<%
    k++;
         }
       
        %>
        
         <input type="submit" name="send" id="submit" tabindex="1" class="btn btn-primary" value="Send" class="d-inline p-2 bg-primary text-white">
         
         
         <%
              if(request.getParameter("send")!=null){
                String dateselected=request.getParameter("slots");
                out.println("date selected is "+ dateselected);
                
                book.selecteddate(dateselected);
                out.println(book.no_student);
                out.println(book.sql1);
                out.print(book.update);
                newaddte.set_date(dateselected, "ENEL3AE");
                out.print(book.booking); //already booked
                out.print(book.full);
                
                
              }


             %>
             
             
             <!--<input type="submit"  name="upload" class="btn btn success"> -->
             
</form>  
        
             <button class="btn btn success" class="d-inline p-2 bg-dark text-white"> <a href="../Upload.jsp">Upload</a>  </button>
        
        
        
        
        
    </head>
    <body>
    </body>
</html>

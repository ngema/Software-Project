
<%@page import="bean.addte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modal.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- bootstrap -->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
            <link rel="stylesheet" href="style.css" type="text/css">
            
            <style>
                #tablemodules{
                width: 70%;
                background-color: black;
                }
            </style>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/
        html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/
        respond.min.js"></script>
        <![endif]-->
        <title>JSP Page</title>
    </head>
    <body>
        <!-- java class fetching -->
        <jsp:useBean id="Login_bean_object" class="bean.Login_bean" ></jsp:useBean>
        <jsp:setProperty property="*" name="Login_bean_object"></jsp:setProperty>
        <%
           
            Login_bean_object.set_uname(request.getParameter("uname"));
            Login_bean_object.set_pwd(request.getParameter("pwd"));
            
            
           
            Login_modal Login_object= new Login_modal();
            boolean flag=Login_object.check_user_name(Login_bean_object);
            
            
            if(flag==true){
                
        
                %>
                
                <h1 class="text">Welcome <% //out.print(Login_bean_object.get_uname())
                    out.print(Login_object.name);
                 %> </h1> 
                 <h1><%out.println(Login_object.status);%></h1>
                
                
             
      
          <div >
              <table class="table table-striped table-borderless table-hover">
                  <thead >
              <tr>
              <th>id</th>
               <th>name</th>
               </tr>
          </thead>
          <tbody >
    
               <%
                   session.setAttribute("login", Login_object);     // attribute taking data to module.jsp
                  
                  %>
      <%
        
        for (int i=0;i<Login_object.i;i++){
      %>
    
          <tr>
              
             
          
              <td><a href="../module.html"><%  out.print(Login_object.modulesid[i]); %> </a></td>  <!-- table id printing-->
         
             
          
              <td><a href="../module.html" ><% out.print(Login_object.modulesname[i]);%> </a></td> <!-- table modules names printing-->
              
             
            
              
          </tr>
          <%
              }%>
             

          </tbody>
          
          
         </table>
              <% if("student".equals(Login_object.status)){ %>
              <form  action="module.jsp" method="POST">
                  
                  <%}
            else{ 
                  %>
                  
                  <form  action="../Upload.jsp" method="POST">
                       <%
              }%>
             
                      
                  <label>Search:<label>
                 
                 <input type="text" name="srch" id="srch" list="datalist1">
                  <datalist id="datalist1">
              <%
        
        for (int i=0;i<Login_object.i;i++){
      %>
              <!--<form action="../modules.jsp" method="Post">-->
                
                
               <option value="<%  out.print(Login_object.modulesid[i]); %>">
         <%
              }%>
               
                </datalist>
            </form>  
              
   </div> 
                 
                 
                 
                 
                 
                 
                 
                 
                 
           
                 
        
        <%
                
            }else
            {
                out.println(flag +"unsuccessful");
            }

        %>
    </body>
      <script src="http://code.JQuery.com/jquery.js"></script>
      <script src= "vendor/jquery/jquery.js"></script>
      <script src="vendor/bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
    
    
</html>


<div class="modal fade" id="dataModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Module infomation</h4>
			</div>
		</div>
		<div class="modal-body" id="detail">

		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
		</div>
	</div>
</div>




<script>
	$(document).ready(function() {
		$('.view_data').click(function() {
			var detail = $(this).attr("id");
			$.ajax({
				url:"module.jsp",
				method:"post",
				data:{detail:detail},
				success:function(data){
					$('#detail').html(data);
					$('.dataModal').modal("show");
				}
			});
			$('#dataModal').modal("show");


		});
	});
</script>

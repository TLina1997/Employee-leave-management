 <%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("welcome.jsp"); //session login user not back to index.jsp page or not type direct in url
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Login & Register</title>
        
<style type="text/css">

body{

	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #34495;
	
}

.box{

	width: 300px;
	padding: 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	background: #191919;
	text-align: center;

}

.box h1{

	color: white;
	text-transform: uppercase;
	font-weight: 500;
}

.box input[type = "text"],.box input[type = "password"]{
	
	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #3498db;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s; 
	
}

.box input[type = "text"]:focus,.box input[type = "password"]:focus{

	width: 280px;
	border-color: #2ecc71;
	 
}

.box input[type = "submit"]{

	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #2ecc71;
	padding: 14px 40px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s; 
	cursor: pointer;
}

.box input[type = "submit"]:hover{

	background: #2ecc71;
}


        <script language="javascript"> 
        function validate()
        {
          var username = document.LoginForm.txt_username; //get form name "LoginForm" and textbox name "txt_username" store in variable username
          var password = document.LoginForm.txt_password; //get form name "LoginForm" and textbox name "txt_password" store in variable password
    
          if (username.value == null || username.value == "") //check username textbox not blank
          {
            window.alert("please enter username ?"); //alert message
            username.style.background = '#f08080'; //set textbox color
            username.focus();
            return false;
          }
          if (password.value == null || password.value == "") //check password textbox not blank
          {
            window.alert("please enter password ?"); //alert message
            password.style.background = '#f08080'; //set textbox color
            password.focus();
            return false;
          }
        }  
       </script>
       
</style>
    </head>
    <body>
        
        <div align="center">
            
            <h2>Login</h2>
          
            <form class="box" method="post" action="LoginController" name="LoginForm" onsubmit="return validate();">
                
                <input type="text" placeholder="Username" name="txt_username">
                <input type="password" placeholder="Password" name="txt_password">
                
                <input type="submit" name="btn_login" value="Login">
                
                <h3>Your don't have an account? <a href="register.jsp">Register</a></h3>
                
            </form>
        
            <h3 style="color:green">
                <%
                    if(request.getAttribute("RegiseterSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("RegiseterSuccessMsg")); //get register success message from RegisterController
                    }
                %>
            </h3>
            
            <h3 style="color:red">
                <%
                    if(request.getAttribute("WrongLoginMsg")!=null)
                    {
                        out.println(request.getAttribute("WrongLoginMsg")); //get login error message from LoginController
                    }
                %>
            </h3>
            
        </center>
    </div>
    </body>
</html>

<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login & Register</title>

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
           var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
           var last_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
           var user_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
           var password_valid=/^[A-Z a-z 0-9]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9 and 6 to 12 range
            
           var fname = document.getElementById("fname"); //textbox id fname
           var lname = document.getElementById("lname"); //textbox id lname
           var uname = document.getElementById("uname"); //textbox id email
           var password = document.getElementById("password"); //textbox id password
    
           if(!first_name.test(fname.value) || fname.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
           {
              alert("Enter Firstname Alphabet Only....!"); //alert message
              fname.focus();
              fname.style.background = '#f08080'; 
              return false;                    
           }
           if(!last_name.test(lname.value) || lname.value=='') 
           {
              alert("Enter Lastname Alphabet Only....!"); 
              lname.focus();
              lname.style.background = '#f08080'; 
              return false;                    
           }
           if(!user_name.test(uname.value) || uname.value=='') 
           {
              alert("Enter Username Alphabet Only....!"); 
              uname.focus();
              uname.style.background = '#f08080'; 
              return false;                    
           }
           if(!password_valid.test(password.value) || password.value=='') 
           {
              alert("Password Must Be 6 to 12 character"); 
              password.focus();
              password.style.background = '#f08080'; 
              return false;                    
           }
        }  
      </script>
      
</style>
    </head>
    <body>
        
        <div align="center">
            
            <h2>Register</h2>
            
            <form class="box" method="post" action="RegisterController" onsubmit="return validate();">
                
                <input type="text" placeholder="Firstname" name="txt_firstname" id="fname"></br></br>
                <input type="text" placeholder="Lastname" name="txt_lastname" id="lname"></br></br>
                <input type="text" placeholder="Username" name="txt_username" id="uname"></br></br>
                <input type="password" placeholder="Password" name="txt_password" id="password"></br></br>
                
                <input type="submit" name="btn_register" value="Register">
                
                <h3>You have an account? <a href="index.jsp">Login</a></h3>
                
            </form>
            
            <h3 style="color:red">
                <%
                    if(request.getAttribute("RegisterErrorMsg")!=null)
                    {
                        out.println(request.getAttribute("RegisterErrorMsg")); //get register fail error message from "RegisterController"
                    }
                %>
            </h3>
            
        </center>
    
    </body>
    
</html>
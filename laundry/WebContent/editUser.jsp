<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update of the Employee Details</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <script type="text/javascript"> 
        
        function validate()
        {
            var empType_pattern= /^[a-z A-Z]+$/; //name pattern allowed alphabet a-z or A-Z 
            var id_pattern= /^[1-9]|100]+$/;
            var name_pattern= /^[a-z A-Z]+$/;
            var address_pattern= /^[a-z A-Z]+$/;
            var oDate_pattern= /^[1-9]|100]+$/;//owner pattern allowed numbers 1 to 100
   
            var empType = document.getElementById("empType"); //get textbox orderNo "employeeType" and store in "empType" variable
            var id = document.getElementById("id"); 
            var name = document.getElementById("name");
            var address = document.getElementById("address");
            var oDate = document.getElementById("oDate");
              
            if(!empType_pattern.test(empType.value) || empType.value=='') //check if condition using test() method (Value is blank or not)
            {
              alert("Enter cloths Type Alphabet Only....!"); //alert message
              clothesType.focus();
              clothesType.style.background = '#f08080'; 
              return false;                    
            }
            if(!id_pattern.test(id.value) || id.value=='') 
            {
              alert("Enter weight Type Numbers Only....!"); 
              weight.focus();
              weight.style.background = '#f08080'; 
              return false;                    
            }
            
            if(!name_pattern.test(name.value) || name.value=='') 
            {
              alert("Enter name Type Alphabet Only....!"); 
              name.focus();
              name.style.background = '#f08080'; 
              return false;                    
            }
            
            if(!address_pattern.test(address.value) || address.value=='') 
            {
              alert("Enter address Type Alphabet Only....!"); 
              address.focus();
              address.style.background = '#f08080'; 
              return false;                    
            }
            
            if(!oDate_pattern.test(oDate.value) || oDate.value=='') 
            {
              alert("Enter Date Type Numbers Only....!"); 
              oDate.focus();
              oDate.style.background = '#f08080'; 
              return false;                    
            }
        }
       </script> 

    </head>
 <body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Laundrymart</a> 
            </div>

        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
                    <li>
                        <a  href="addUser.jsp"><i class="fa fa-dashboard fa-3x"></i> Add Employee</a>
                    </li>

                    <li>
                        <a  href="userIndex.jsp"><i class="fa fa-qrcode fa-3x"></i>Employee Details </a>
                    </li>	

                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Update of the Employee Details</h2>   
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Employee details
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
        <div class="main">
            <center>
             <h1>Update Employee Record</h1>
            </center>
  
        <form method="post" action="editUserController" onsubmit="return validate();">
                
            <table  align="center" cellpadding="5" cellspacing="5" border="1">         
            <%
            if(request.getParameter("edit_orderNo")!=null) //get edit_id from index.jsp page with href link and check not null after continue
            {
                int orderNo=Integer.parseInt(request.getParameter("edit_orderNo")); //get edit_id store in "id" variable
                
                String url="jdbc:mysql://localhost:3306/laundrymart"; //database connection url string
                String username="root"; //database connection username
                String password=""; //database password
                
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url,username,password); //create connection
                    
                    PreparedStatement pstmt=null; //create statement
                    
                    pstmt=con.prepareStatement("select * from laundry where orderNo=?"); //sql select all query 
                    pstmt.setInt(1,orderNo);
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in Resultset object rs.
                    
                    while(rs.next())
                    {
            %>    
                <tr>
                    <td>Employee Type</td>
                    <td><input type="text" name="type" id="empType" value ="<%=rs.getString("type")%>"></td>
                </tr>
    
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="optionsRadios" id="id" value ="<%=rs.getString("id")%>"></td>
                </tr> 
                
                     <td>Name</td>
                    <td><input type="text" name="name" id="name" value ="<%=rs.getString("name")%>"></td>
                </tr> 
                
                     <td>Address</td>
                    <td><input type="text" name="add" id="address" value ="<%=rs.getString("address")%>"></td>
                </tr> 
                
                    <td>Date</td>
                    <td><input type="text" name="day" id="oDate" value ="<%=rs.getString("day")%>"></td>
                </tr> 
                
                 
                
                   <tr>
                    <td><input type="submit" name="btn_editOrder" value="Update"></td> 
                </tr>
                
                    <input type="hidden" name="hidden_orderNo" value="<%=rs.getInt("orderNo")%>">
            <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            %>
            </table>
             
            <center>
                <h3 style="color:red;">
                    <%
                        if(request.getAttribute("UpdateErrorMsg")!=null)
                        {
                            out.print(request.getAttribute("UpdateErrorMsg")); //get update record fail error message from editUserController.java
                        }
                    %>
                </h3>
                
                <h1><a href="userIndex.jsp">Back</a></h1>
            </center>
    
        </form>
  
 </div>

              
    </div>
             
            </div>
         
        </div>
    
    
    
    <script src="assets/js/jquery-1.10.2.js"></script>
     
    <script src="assets/js/bootstrap.min.js"></script>
   
    <script src="assets/js/jquery.metisMenu.js"></script>
      
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>

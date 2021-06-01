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
    <title>View of the order</title>

<style type="text/css">

.box input[type = "submit"]{

	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #2ecc71;
	padding: 10px 10px;
	outline: none;
	color: green;
	border-radius: 24px;
	transition: 0.25s; 
	cursor: pointer;
}

.box input[type = "submit"]:hover{

	background: #2ecc71;
}

.box input[type = "button"]{

	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #2ecc71;
	padding: 10px 10px;
	outline: none;
	color: red;
	border-radius: 24px;
	transition: 0.25s; 
	cursor: pointer;
}

.box input[type = "button"]:hover{

	background: #cf0000;
}

</style>

	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
                        <a  href="addUser.jsp"><i class="fa fa-dashboard fa-3x"></i>Add Employee</a>
                    </li>


                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>View of the Employee</h2>   
                       
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
                <h1><a href="addUser.jsp">Employee Record</a></h1> 
            </center>
  
            <table class="box" align="center" cellpadding="5" cellspacing="5" border="1">    
                
                <tr>
                    <th>ID</th>
                    <th>Employee Type</th>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Date</th>                  
                    <th>Change</th>
                    <th>Remove</th>
                </tr>
                <%
                    String url="jdbc:mysql://localhost:3306/laundrymart"; //database connection url string
                    String username="root"; //database connection username
                    String password=""; //database password
                  
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url,username,password); //create connection
                  
                    PreparedStatement pstmt=null; //create statement
                  
                    pstmt=con.prepareStatement("select * from laundry"); //sql select query
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object rs.
                    
                    while(rs.next())
                    {
                %>
                <tr>
                    <td><%=rs.getInt("orderNo")%></td>
                    <td><%=rs.getString("type")%></td>
                    <td><%=rs.getString("id")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("day")%></td>
                    
                    <td><a href="editUser.jsp?edit_orderNo=<%=rs.getInt("orderNo")%>" onclick="return confirm('Are you sure you want to Update this Employee?');"><input type = "submit" value = "Update"></a></td>
                    <td><a href="userDelete.jsp?delete_orderNo=<%=rs.getInt("orderNo")%>" onclick="return confirm('Are you sure you want to delete this Employee?');"><input type = "button" value = "Delete"></a></td>
                    
               </tr>
                <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                %>
            </table>
  
            <center>
                <h3 style="color:green;">
                <%
                    if(request.getAttribute("InsertSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("InsertSuccessMsg")); //get record insert success message from addOrderController.java
                    }
                %>
                
                <%
                    if(request.getAttribute("UpdateSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("UpdateSuccessMsg")); //get record update success message from editOrderController.java
                    }
                %>
                </h3>
            </center>
            
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
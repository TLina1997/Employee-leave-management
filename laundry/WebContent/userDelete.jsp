<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%
    if(request.getParameter("delete_orderNo")!=null) //get delete_id from index.jsp page with href link and check not null after continue
    {
        int orderNo=Integer.parseInt(request.getParameter("delete_orderNo")); //get delete_id store in "orderNo" variable
        
        String url="jdbc:mysql://localhost:3306/laundrymart"; //database connection url string
        String username="root"; //database connection username
        String password=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,username,password); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("delete from laundry where orderNo=?"); //sql delete query
            pstmt.setInt(1,orderNo);
            pstmt.executeUpdate(); //execute query

            RequestDispatcher rd=request.getRequestDispatcher("userIndex.jsp"); //after delete success forward orderIndex.jsp page
            rd.forward(request, response); 
            
            pstmt.close(); //close statement
            
            con.close(); //close connection   
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
%>
package com.mvc.dao;

import com.mvc.bean.userBean;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class userDao {
	
    public String checkInsert(userBean userBean)
    {
        String empType=userBean.getEmpType(); //get name through orderBean object and store in temporary variable "name"
        String id=userBean.getId();
        String name=userBean.getName();
        String address=userBean.getAddress();
        String oDate=userBean.getoDate();
        
        String url="jdbc:mysql://localhost:3306/laundrymart"; //database connection url string
        String username="root"; //database connection username
        String password=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,username,password); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            //pstmt=con.prepareStatement("INSERT INTO laundry(clothes,weight,name,address,day) values(?,?,?,?,?)"); //sql insert query
            pstmt=con.prepareStatement("INSERT INTO `laundry`(`type`, `id`, `name`, `address`, `day`) values(?,?,?,?,?)");
            pstmt.setString(1,empType);
            pstmt.setString(2,id);
            pstmt.setString(3,name);
            pstmt.setString(4,address);
            pstmt.setString(5,oDate);
            pstmt.executeUpdate(); //execute query
            
            pstmt.close(); //close statement
            
            con.close(); //close connection
            
            return "INSERT SUCCESS"; //if valid return "INSERT SUCCESS" string
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return "FAIL INSERT"; //if invalid return "FAIL INSERT" string
    }

}

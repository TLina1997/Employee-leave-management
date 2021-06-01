package com.mvc.dao;

import com.mvc.bean.editUserBean;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class editUserDao {
	
    public String checkUpdate(editUserBean editUserBean)
    {
        String empType_up=editUserBean.getEmpType_up();//get all value through editOrderBean object and store in temporary variable
        String id_up=editUserBean.getId_up();
        String name_up=editUserBean.getName_up();
        String address_up=editUserBean.getAddress_up();
        String oDate_up=editUserBean.getoDate_up();
        int hidden_orderNo=editUserBean.getHidden_orderNo();
        
        String url="jdbc:mysql://localhost:3306/laundrymart"; //database connection url string
        String username="root"; //database connection username
        String password=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,username,password); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("UPDATE laundry set type=?,id=?,name=?,address=?,day=? where orderNo=?"); //sql update query
            pstmt.setString(1,empType_up);
            pstmt.setString(2,id_up);
            pstmt.setString(3,name_up);
            pstmt.setString(4,address_up);
            pstmt.setString(5,oDate_up);
            pstmt.setInt(6,hidden_orderNo);
            pstmt.executeUpdate(); //execute query
            
            pstmt.close(); //close statement
            
            con.close(); //close connection
            
            return "UPDATE SUCCESS"; //if valid return "UPDATE SUCCESS" string
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return "FAIL UPDATE"; //if invalid return "FAIL UPDATE" string
    }

}

package com.mvc.controller;
import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

import com.mvc.bean.userBean;
import com.mvc.dao.userDao;


@WebServlet("/userController")
public class userController extends HttpServlet{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        if(request.getParameter("btn_order")!=null) //check button click event not null from add.jsp page after continue
        {
			String empType = request.getParameter("type");
			String id = request.getParameter("optionsRadios");
			String name = request.getParameter("name");
			String address = request.getParameter("add");
			String oDate = request.getParameter("day");
            
            userBean userBean=new userBean(); //this class contain setting up all receive values from add.jsp page to setter and getter method for application require effectively
            
            userBean.setEmpType(empType); //set name through addBean object
            userBean.setId(id);
            userBean.setName(name);
            userBean.setAddress(address);
            userBean.setoDate(oDate);//set owner through addBean object
            
            userDao userDao=new userDao(); //this class contain main logic to perform function calling and database operation
            
            String insertValidate=userDao.checkInsert(userBean); //send addBean object values into checkInsert() function in AddDao class
            
            if(insertValidate.equals("INSERT SUCCESS")) //check calling checkInsert() function receive string "INSERT SUCCESS" after redirect to index.jsp page and display record
            {
                request.setAttribute("InsertSuccessMsg",insertValidate); //setAttribute value is "InsertSuccessMsg" for insert successfully message
                RequestDispatcher rd=request.getRequestDispatcher("userIndex.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("InsertErrorMsg",insertValidate); //setAttribute value is "InsertErrorMsg" for insert fail message
                RequestDispatcher rd=request.getRequestDispatcher("addUser.jsp");
                rd.include(request, response);
            }
        }
    }

}

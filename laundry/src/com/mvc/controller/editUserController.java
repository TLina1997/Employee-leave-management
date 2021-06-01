package com.mvc.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.editUserBean;
import com.mvc.dao.editUserDao;

@WebServlet("/editUserController")
public class editUserController extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        if(request.getParameter("btn_editOrder")!=null) //check button click event not null form edit.jsp page after continue
        {
			String empType_up = request.getParameter("type");
			String id_up = request.getParameter("optionsRadios");
			String name_up = request.getParameter("name");
			String address_up = request.getParameter("add");
			String oDate_up = request.getParameter("day");
            int hidden_orderNo=Integer.parseInt(request.getParameter("hidden_orderNo")); //get hidden id name "hidden_id"
            
            editUserBean editUserBean=new editUserBean(); //this class contain setting up all receive values from edit.jsp page to seeter and getter method for application require effectively
            
            editUserBean.setEmpType_up(empType_up); 
            editUserBean.setId_up(id_up); 
            editUserBean.setName_up(name_up);
            editUserBean.setAddress_up(address_up);
            editUserBean.setoDate_up(oDate_up);//set all value through editBean object
            editUserBean.setHidden_orderNo(hidden_orderNo);
            
            editUserDao editUserDao=new editUserDao(); //this class contain main logic to perform function calling and database operation
            
            String updateValidate=editUserDao.checkUpdate(editUserBean); //send editBean object values into checkUpdate() function in EditDao class
            
            if(updateValidate.equals("UPDATE SUCCESS")) //check calling checkUpdate() function receive string "UPDATE SUCCESS" after redirect to index.jsp page and display update record
            {
                request.setAttribute("UpdateSuccessMsg",updateValidate); //setAttribute value is "UpdateSuccessMsg" for update successfully message
                RequestDispatcher rd=request.getRequestDispatcher("userIndex.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("UpdateErrorMsg",updateValidate); //setAttribute value is "UpdateErrorMsg" for update fail message
                RequestDispatcher rd=request.getRequestDispatcher("editUser.jsp");
                rd.include(request, response);
            }
        }
    }

}

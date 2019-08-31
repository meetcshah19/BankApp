package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

public class Ce extends HttpServlet{
protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	String email = request.getParameter("email");
	Integer cid=new Integer(request.getSession().getAttribute("cid").toString());
	try {
		Connection conn=DBConnection.getConnection();
		Statement createStatement=conn.createStatement();
		if(email!=null){
		createStatement.execute("update customer set email='"+email+"' where cid = "+cid.toString()+"");
		System.out.println("Changed email");
		response.sendRedirect("Home.jsp");
		}
		else{
		request.setAttribute("error1", "Please Enter New E-mail");
		RequestDispatcher rd = request.getRequestDispatcher("Ce.jsp");
		rd.forward(request, response);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
}

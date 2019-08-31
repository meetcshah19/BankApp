package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

public class ValidateLogin extends HttpServlet{
@Override
protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	Connection conn=DBConnection.getConnection();
	String email = request.getParameter("username");
	String pass = request.getParameter("pass");
	if(email.equals("admin")&&pass.equals("admin")){
		request.getSession().setAttribute("conn",conn);
		response.sendRedirect("Admin.jsp");
	}else{
	boolean flag=false;
	if(email==null||email.trim().length()==0){
		request.setAttribute("error9","<div class=\"alert alert-error\"><strong>Please enter email</strong></div>");
		flag=true;
		System.out.println("error in email bhai - login");
	}
	if(pass==null||pass.trim().length()==0){
		request.setAttribute("error10","<div class=\"alert alert-error\"><strong>Please enter password</strong></div>");
		flag=true;
		System.out.println("error in password bhai - login");
	}
	
	try {
		Statement createStatement = conn.createStatement();
		ResultSet executeQuery = createStatement.executeQuery("select cid from customer where email='"+email+"' and password='"+pass+"';");
		executeQuery.next();
		Integer cid=null;
		if(!flag&&executeQuery.isLast()){
	    cid = executeQuery.getInt("cid");}
		if(cid==null){
			System.out.println("!!!!!!!!wrong");
			if(request.getAttribute("error10")==null)
			request.setAttribute("error10","<div class=\"alert alert-error\"><strong>Wrong Username/Password</strong></div>");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			System.out.println("!!!!!!!!!right  "+cid);
			request.getSession().setAttribute("cid",cid);
			request.getSession().setAttribute("conn",conn);
			request.setAttribute("filter", true);
			request.getSession().setAttribute("Loggedin", true);
			request.getRequestDispatcher("Home.jsp").forward(request, response);		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
}
}

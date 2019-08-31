package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

public class ValidateRegister extends HttpServlet{
	
@Override
protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String p1=request.getParameter("p1");
	String p2=request.getParameter("p2");
	Integer ib=10000;
	boolean flag=false;
	if(!(email.equals("admin")&&p1.equals("admin"))){
	if(name==null||name.trim().length()==0){
		request.setAttribute("error1","<div class=\"alert alert-error\"><strong>Please enter name </strong></div>");
		flag=true;
		System.out.println("error in name bhai");
	}
	if(email==null||email.trim().length()==0){
		request.setAttribute("error2","<div class=\"alert alert-error\"><strong> Please enter email</strong></div> ");
		flag=true;
		System.out.println("error in email bhai");
	}
	if(p1==null||p1.trim().length()==0){
		request.setAttribute("error3","<div class=\"alert alert-error\"><strong> Please enter password</strong></div> ");
		flag=true;
		System.out.println("error in p1 bhai");
	}
	if(p2==null||p2.trim().length()==0){
		request.setAttribute("error4","<div class=\"alert alert-error\"><strong> Please enter repeat password</strong></div> ");
		flag=true;
		System.out.println("error in p2 bhai");
	}
	if(!p2.equalsIgnoreCase(p1)){
		request.setAttribute("error6","<div class=\"alert alert-error\"><strong> Passwords dont Match</strong></div> ");
		flag=true;
		System.out.println("error in p bhai");
	}
	
	Connection conn=DBConnection.getConnection();
	Statement createStatement=null;
	ResultSet executeQuery=null;
	try {
		createStatement = conn.createStatement();
	    executeQuery = createStatement.executeQuery("select * from customer where email='"+email+"';");
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	try {
		if(executeQuery.next()){
			request.setAttribute("error5","<div class=\"alert alert-error\"><strong> Username already used!!</strong></div> ");
			flag=true;
			System.out.println("username in use");
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	if(!flag){
	try {
		
		createStatement.execute("insert into customer (name,email,balance,password) values ('"+name+"','"+email+"',"+ib+",'"+p1+"');");
		HttpSession session = request.getSession();
		session.setAttribute("conn",conn);
		Statement createStatement2 = conn.createStatement();
		ResultSet executeQuery2 = createStatement2.executeQuery("select cid from customer where email='"+email+"' and password='"+p1+"';");
		executeQuery2.next();
		int cid = executeQuery2.getInt("cid");
		if(cid==0){
			System.out.println("!!!!!!!!wrong");
		}else{
			System.out.println("!!!!!!!!!right  "+cid);
		}
		request.getSession().setAttribute("cid",cid);
		response.sendRedirect("Home.jsp");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.forward(request,response);
	}}else{
		response.sendRedirect("Admin.jsp");
	}
}
}

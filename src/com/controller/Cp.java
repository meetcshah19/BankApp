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

import com.util.DBConnection;

public class Cp extends HttpServlet{
@Override
protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	String op=request.getParameter("op");
	String np1=request.getParameter("np1");
	String np2=request.getParameter("np2");
	int cid=new Integer(request.getSession().getAttribute("cid").toString());
	try {
		Connection conn=DBConnection.getConnection();
		Statement createStatement=conn.createStatement();
		ResultSet executeQuery2 = createStatement.executeQuery("select email from customer where cid="+cid+";");
		executeQuery2.next();
		String email=executeQuery2.getObject("email").toString();
		ResultSet executeQuery = createStatement.executeQuery("select cid from customer where email='"+email+"' and password='"+op+"';");
		executeQuery.next();
		RequestDispatcher rd=null;
		if(new Integer(executeQuery.getObject("cid").toString()).equals(new Integer(cid).toString())){
			request.setAttribute("error1", "<div class=\"alert alert-error\"><strong>Wrong old password</strong></div>");
			rd=request.getRequestDispatcher("Cp.jsp");
			rd.forward(request, response);
		}else if(!np1.trim().equals(np2.trim())){
			request.setAttribute("error2", "<div class=\"alert alert-error\"><strong>Passwords dont match</strong></div>");
			rd=request.getRequestDispatcher("Cp.jsp");
			rd.forward(request, response);
		}else{
			createStatement.execute("update customer set password='"+np1+"' where cid ="+cid+";");
			System.out.println("CHanged");
			response.sendRedirect("Home.jsp");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

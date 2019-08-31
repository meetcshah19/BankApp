package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

public class Da extends HttpServlet{
protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	Connection conn=DBConnection.getConnection();
	try {
		Statement createStatement=conn.createStatement();
		createStatement.execute("delete from customer where cid = "+new Integer((int) request.getSession().getAttribute("cid")).toString()+";");
		response.sendRedirect("index.jsp");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

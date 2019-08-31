package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

public class ValidateDeposit extends HttpServlet{
protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	int amt=new Integer(request.getParameter("amt"));
	HttpSession session = request.getSession();
	Connection conn = DBConnection.getConnection();
	Statement stmt = null;
	Date d=Calendar.getInstance().getTime();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd.hhmmss");
	String tp=sdf.format(d);
	String year = tp.substring(0, 4);
	String month = tp.substring(4, 6);
	String date = tp.substring(6, 8);
	amt= +amt;
	
	try {
		stmt = conn.createStatement();
		ResultSet set2 = stmt.executeQuery("select balance from customer where cid="+(Integer)session.getAttribute("cid")+";");
		set2.next();
		Integer bal=(Integer) set2.getObject("balance");
		stmt.execute("update customer set balance = balance + "+amt+" where cid="+(Integer)session.getAttribute("cid")+";");
		ResultSet set = stmt.executeQuery("select lasttranno from tran where cid="+(Integer)session.getAttribute("cid")+";");
		String tran="Deposited "+amt+" on "+date+"/"+month+"/"+year;
		Integer last=null;
		if (set.next()) {
		 last = (Integer) set.getObject("lasttranno");
		 System.out.println("++++++++++++++++++++++++++++++++++++"+last);
		 if(last==null){
			 last=0;
		 }
		 ++last;System.out.println("_______________________"+last);
		}else{
			last=1;
		}
		stmt.execute("insert into tran (cid,tranid,tran,lasttranno,ip,bal) values ("+(Integer)session.getAttribute("cid")+","+last+",'"+tran+"',"+(last)+",'"+"xyz"+"',"+bal+");");
		stmt.execute("update tran set lasttranno ="+last+" where cid = "+(Integer)session.getAttribute("cid")+";");
		response.sendRedirect("Home.jsp");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

<%@page import="com.controller.Online"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp" flush="true" />
<body>
<%

Connection conn=(Connection)session.getAttribute("conn");
Statement stmt=conn.createStatement();
ResultSet rs2=stmt.executeQuery("select name from customer where cid="+(Integer)session.getAttribute("cid")+";");
rs2.next();
String name="meet";
name=rs2.getObject("name").toString();
System.out.println("aa to gaya");
%>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<div class="row header">
			<!-- Begin Header -->
			<div class="span5 logo">
				<h1>ⓜⓔⓔⓣ'ⓢ ⓑⓐⓝⓚⓘⓝⓖ</h1>
				<h5>Big Things... Small Packages</h5>
			</div>
		</div>

			<h2>
			WELCOME <%=name %>
				</h2>
<br><br>
		<h1 style="text-color:red;">Sorry you cant transfer to your own account</h1>			
		<br><br>
	<a href="Home.jsp"><button type="button" class="btn btn-inverse">GO BACK</button></a>
		<h6>Users Online : <%=Online.getCounter()%></h6>
	
	</div>

</body>
</html>
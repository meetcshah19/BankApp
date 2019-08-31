<%@page import="com.controller.Online"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="mytag" uri="a" %>
    
<jsp:include page="header.jsp" flush="true" /> 

<body>
<%

Connection conn=(Connection)session.getAttribute("conn");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select balance where cid="+session.getAttribute("cid")+";");
rs.next();
int bal=rs.getInt("balance");
ResultSet rs2=stmt.executeQuery("select name where cid="+session.getAttribute("cid")+";");
rs2.next();
String name=rs.getString("name");

%>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
      <div class="row header"><!-- Begin Header -->
        <div class="span5 logo">
        	<h1>ⓜⓔⓔⓣ'ⓢ ⓑⓐⓝⓚⓘⓝⓖ</h1> 
            <h5>Big Things... Small Packages</h5>
        </div>         
      </div>
      
    <div class="row">
        <div class="span12">
            <h2><mytag:greet name="<%=name%>"/></h2>
            <p class="lead">Your current Balance = <%=bal%></p>

            <div class="row">
                
                </div>

                <div class="span6">
                <form action="Logout">
                <button type="submit">LOGOUT</button>
                </form>
                </div>

            </div>

            <h3 class="title-bg">Functionalities</h3>
            <div class="row">
                
                <div class="span4">
                    <a href="Deposit.jsp" style=""><img src="img/gallery/gallery-img-1-3col.jpg" alt="image">
                    <h5>DEPOSIT</h5></a>
                </div>
                <div class="span4">
                    <a href="Withdraw.jsp" style=""><img src="img/gallery/gallery-img-1-3col.jpg" alt="image">
                    <h5>WITHDRAW</h5></a>
                </div>
                <div class="span4">
                    <a href="Transfer.jsp" style=""><img src="img/gallery/gallery-img-1-3col.jpg" alt="image">
                    <h5>TRANSFER</h5></a>
                </div>
            </div>

        </div> 
    </div>
    	<h6>Users Online : <%=Online.getCounter()%></h6>
    
    <!-- End Container -->
    
</body>
</html>
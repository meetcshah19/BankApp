<%@page import="com.controller.Online"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="g" uri="a" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true" />
<body>
<%

Connection conn=(Connection)session.getAttribute("conn");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select balance from customer where cid="+(Integer)session.getAttribute("cid")+";");
rs.next();
int bal=rs.getInt("balance");
ResultSet rs2=stmt.executeQuery("select name from customer where cid="+(Integer)session.getAttribute("cid")+";");
rs2.next();
String name="meet";
name=rs2.getObject("name").toString();
%>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
      <div class="row header"><!-- Begin Header -->
        <div class="span5 logo">
        	<h1>ⓜⓔⓔⓣ'ⓢ ⓑⓐⓝⓚⓘⓝⓖ</h1> 
            <h5>Big Things... Small Packages</h5>
        </div>         
              <div class="span7 navigation">
            <div class="navbar hidden-phone">
            
            <ul class="nav">
            <li><a href="Cp.jsp">Change Password</a></li>
            <li><a href="Ce.jsp">Change Email</a></li>
            <li><a href="Da">Delete Account</a></li>
            <li><a href="ShowTran.jsp">Transactions</a></li>
            <li><a href="index.jsp">Logout</a></li>
            </ul>
           </div>
            </div>
           </div>
    <div class="row">
        <div class="span12">
            <h2><g:greet name="<%=name %>"/></h2>
            <p class="lead">Your current Balance = <%=bal%>Rs</p>
            </div>
</div>
            <h3 class="title-bg">Functionalities</h3>
            <div class="row">
                
                <div class="span4">
                    <a href="Deposit.jsp" style=""><img src="img/b.jpg" alt="deposit">
                    <h5>DEPOSIT</h5></a>
                </div>
                <div class="span4">
                    <a href="Withdraw.jsp" style=""><img src="img/c.jpg" alt="withdraw">
                    <h5>WITHDRAW</h5></a>
                    <%=request.getAttribute("error1")==null?"":request.getAttribute("error1") %>
                    
                </div>
                <div class="span4">
                    <a href="Transfer.jsp" style=""><img src="img/a.jpg" alt="transfer">
                    <h5>TRANSFER</h5></a>
                </div>
            </div>
	<h6>Users Online : <%=Online.getCounter()%></h6>

        </div> 
    
    <!-- End Container -->
    
</body>
</html>
<%@page import="com.controller.Online"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true" />
<body>
<%
ArrayList<String> al = new ArrayList<String>();
Connection conn=(Connection)session.getAttribute("conn");
int cid=(Integer)session.getAttribute("cid");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select tran from tran where cid="+cid+";");
for(int i=0;rs.next();i++){
	String ttran=(String)rs.getObject("tran");
    al.add(ttran);
}
Statement stmt2=conn.createStatement();
ResultSet rs2=stmt2.executeQuery("select balance from customer where cid="+(Integer)session.getAttribute("cid")+";");
rs2.next();
int bal=rs2.getInt("balance");
ResultSet rs3=stmt.executeQuery("select name from customer where cid="+(Integer)session.getAttribute("cid")+";");
rs3.next();
String name="meet";
name=rs3.getObject("name").toString();
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
            <h2>Welcome <%=name%></h2>
            <p class="lead"></p>
        </div>
	</div>
            <h3 class="title-bg">Your Transactions</h3>
            <div class="row">
                <table border="0">
                <tr><th>NO.</th><th>&nbsp;&nbsp;&nbsp;<th>TRAN</th></tr>
                <%for(int i=0;i<al.size();i++){ %>
                <tr><td><%=i%></td><td> <td><%=al.get(i)%></td></tr>
                <%} %>
                </table>
                <br>
                <a href="Home.jsp"><button type="button" class="btn btn-inverse">GO BACK</button></a>
            </div>
		<h6>Users Online : <%=Online.getCounter()%></h6>	
        </div> 
    
    <!-- End Container -->
    
</body>
</html>
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
ArrayList<Integer> al = new ArrayList<Integer>();
Connection conn=(Connection)session.getAttribute("conn");
Statement stmt=conn.createStatement();
ArrayList al2=Online.getAl();
ArrayList<String> al3= new ArrayList<String>();
System.out.println(al);
System.out.println(al2.size());
System.out.println(al3);
for(int i=0;i<al2.size();i++){
	ResultSet rs2=stmt.executeQuery("select name from customer where cid="+al2.get(i)+";");
	rs2.next();
	al3.add(rs2.getObject("name").toString());
}

int counter=Online.getCounter();
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
            <h2>Welcome Admin</h2>
            <p class="lead"></p>
        </div>
	</div>
            <h3 class="title-bg">Online Users</h3>
            <div class="row">
            <form action="Logout">
                <table border="0">
                <tr><th>Cid</th><th>&nbsp;&nbsp;&nbsp;<th>Name</th></tr>
                <%for(int i=0;i<counter;i++){ %>
                <tr><td><%=al2.get(i)%></td><td> <td><%=al3.get(i)%></td></tr>
                <%} %>
                </table>
                </form>
                <h5>Total = <%=counter%></h5>
            </div>
		<h6>Users Online : <%=Online.getCounter()%></h6>	
        </div> 
    
    <!-- End Container -->
    
</body>
</html>
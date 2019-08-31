<%@page import="java.util.Calendar"%>
<%@page import="com.controller.Online"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true" />
<body>
<%
Calendar instance = Calendar.getInstance();
instance.set(2015,2, 10);
session.setAttribute("t", session.getAttribute("cid"));
session.removeAttribute("cid");
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
		<!-- End Header -->

		<!-- Page Content    ================================================== -->
		<div class="row">
			<!--Container row-->

			<!-- Page Left Sidebar================================================== -->
			<div class="span3 sidebar page-left-sidebar">
				<!-- Begin sidebar column -->

				<!--Navigation-->
				<h5 class="title-bg">Navigation</h5>
				<ul class="post-category-list">
					<li><a href="#"><i class="icon-plus-sign"></i>About Us</a></li>
					<li><a href="#"><i class="icon-plus-sign"></i>Services</a></li>
					<li><a href="#"><i class="icon-plus-sign"></i>Mission</a></li>

				</ul>

				<!--Latest News-->

				<!--Testimonials-->
				<h5 class="title-bg">Testimonials</h5>

				<p class="quote-text side">
					"The Safest And Most Secure Bankers."<cite>- xyz, Big
						Company</cite>
				</p>

				<p class="quote-text side">
					"The Best Customer Service"<cite>- xyz, Big Company</cite>
				</p>


			</div>
			<!-- End sidebar column -->

			<!-- Page Content======================== -->
			<div class="span6">
				<!--Begin page content column-->
				
				<h3 class="title-bg">Welcome To Meet's Bank</h3>

				<img src="img/images.jpeg" alt="Image" width="600px">

				<p class="lead">Welcome to Meet's Banking. We give our
					commitment to secure and safe banking. We always welcome client
					suggestions.</p>

			</div>
			<!--End page content column-->

			<!-- Page Right Sideba================================================== -->
			<div class="span3 sidebar page-right-sidebar">
				<!-- Begin sidebar column -->
				<form action="ValidateLogin" method="post">
					<!--User Login-->
					<h5 class="title-bg">User Login</h5>
					<%=request.getAttribute("error9")==null?"":request.getAttribute("error9") %>
					<%=request.getAttribute("error10")==null?"":request.getAttribute("error10") %>
					<div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span><input
							class="span4" id="prependedInput" size="16"
							type="text" name="username" placeholder="Username" value=""
							id="usrnm">
					</div>
					<div class="input-prepend">
						<span class="add-on"><i class="icon-lock"></i></span><input
							class="span4" id="PrependedInput" size="16" type="password"
							name="pass" placeholder="Password" value="" id="pass">
					</div>
					<button class="btn btn-small btn-inverse" type="submit"
						onsubmit="ValidateLogin()">Login</button>
				</form>
				<form action="ValidateRegister" method="post" id="register">
					<!--Tabbed Content-->
					<h5 class="title-bg">Register</h5>
					<div class="tab-content">
					    <%=request.getAttribute("error1")==null?"":request.getAttribute("error1") %>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span><input
								class="span4" id="prependedInput" size="16" type="text"
								placeholder="Name" name=name id=rname>
						</div>
					    <%=request.getAttribute("error2")==null?"":request.getAttribute("error2") %>	
						<%=request.getAttribute("error5")==null?"":request.getAttribute("error5") %>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span><input
								class="span4" id="prependedInput" size="16" type="text"
								placeholder="Username/Email" name="email" id="remail" value="">
						</div>
						<%=request.getAttribute("error6")==null?"":request.getAttribute("error6") %>
						<%=request.getAttribute("error3")==null?"":request.getAttribute("error3") %>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span><input
								class="span4" id="appendedPrependedInput" size="16" type="password"
								placeholder="New Password" name="p1" value="" id="rp1">
						</div>
						<%=request.getAttribute("error4")==null?"":request.getAttribute("error4") %>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span><input
								class="span4" id="appendedPrependedInput" size="16" type="password"
								placeholder="Repeat Password" name=p2 value="" id="rp2">
						</div>
						<button class="btn btn-small btn-inverse" type="submit"
							onclick="ValidateRegister()">Register</button>
					</div>
				</form>

			</div>
			<!-- End sidebar column -->

		</div>
		<!-- End container row -->
	<h6>Users Online : <%=Online.getCounter()%></h6>

	</div>
	<!-- End Container -->

</body>
</html>

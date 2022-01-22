
<%@page import="org.pk.ecommerce.GlobalConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
session.removeAttribute(GlobalConstants.USER_DETAILS);

String register = request.getParameter("register");
String failedMesage = request.getParameter("failed");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Farmer Login | Online Agree Pet Zone</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/icon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->
<body>
	<header id="header">
		<!--header-->
		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<%@include file="icon.jsp" %>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="contact-us.jsp"><i class="fa fa-contact"></i>
										Contact Us</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i>
										Farmer Login</a></li>
								<li><a href="adminLogin.jsp"><i class="fa fa-lock"></i>
										Admin Login</a></li>
								<li><a href="driverLogin.jsp"><i class="fa fa-lock"></i>
										Driver Login</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->
	</header>
	<!--/header-->
	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-offset-4">
				<%
					if (failedMesage != null) {
					%>
					<span style="color: #FF0000; font-size: 20px"><%=failedMesage %></span>
					<%
					}
					%>					
					<%
					if (register != null && register.equals("SUCCESS")) {
					%>
					<span style="color: #00FF00; font-size: 20px">User
						Registered Successfully.</span>
					<%
					}
					%>
					<%
					if (register != null && register.equals("FAILED")) {
					%>
					<span style="color: #FF0000; font-size: 20px">User
						Registration failed.</span>
					<%
					}
					%>
					<%
					if (register != null && register.equals("EXISTS")) {
					%>
					<span style="color: #FF0000; font-size: 20px">User Already
						Exists</span>
					<%
					}
					%>
					
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form">
						<!--login form-->
						<h2>Farmer Login to your account</h2>
						<form action="common?action=login" method="post">
							<input type="email" placeholder="Email Address" name="emailId" />
							<input type="password" placeholder="Password" name="password" />
							<span> <input type="checkbox" class="checkbox">
								Keep me signed in
							</span>
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div>
					<!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form">
						<!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="common?action=registerUser" method="post">
							<input type="text" name="fullName" placeholder="Full Name" /> <input
								type="email" name="emailId" placeholder="Email Address" /> <input
								type="password" name="password" placeholder="Password" /> <input
								type="text" name="mobileNumber" placeholder="Contact" /> <input
								type="text" name="dob" placeholder="Date Of Birth" /> <select
								name="gender">
								<option value="MALE">MALE</option>
								<option value="FEMALE">FEMALE</option>
							</select> <br> <br>
							<button type="submit" class="btn btn-default">Signup</button>
						</form>
					</div>
					<!--/sign up form-->
				</div>
			</div>
		</div>
	</section>
	<!--/form-->
	<%@include file="footer.jsp"%>
	<!--/Footer-->
	<script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>

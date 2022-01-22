<%@page import="org.pk.ecommerce.dao.CustomerDao"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page
	import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="org.pk.ecommerce.GlobalConstants"%>
<%@page import="org.pk.ecommerce.entities.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%!public void jspInit() {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, getServletContext());
	}

	@Autowired
	private CustomerDao customerDao;%>
<%
User user = (User) session.getAttribute(GlobalConstants.USER_DETAILS);
String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>User Profile | Online Agree Pet Zone</title>
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

								<li><a href="userProfile.jsp"><i class="fa fa-user"></i>
										Account</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<%
								if (user == null) {
								%>
								<li><a href="login.jsp"><i class="fa fa-lock"></i>Login</a></li>
								<%
								} else {
								%>
								<li><a href="submitFeedback.jsp"><i class="fa fa-lock"></i>Feedback</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i>Logout</a></li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->
	</header>
	<!--/header-->

	<section>
		<div class="container">
		<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<%
					if (message != null) {
					%>
					<span style="font-size: 20px"><%=message%></span>
					<%
					}
					%>
				</div>
			</div>
			<div class="row" >
				<div class="signup-form col-md-4 col-md-offset-4">
					<!--sign up form-->
					<h2 style="text-align: center;">Update Profile</h2>
					<form action="common?action=updateUser" method="post">
						<input type="text" name="userId" placeholder="UserId"
							value="<%=user.getUserId()%>" style="display:none" /> <input type="text"
							name="fullName" placeholder="Full Name"
							value="<%=user.getFullName()%>" disabled="disabled" /> <input
							type="email" id="emailId" name="emailId"
							placeholder="Email Address" value="<%=user.getEmailId()%>" />
						<input type="text" name="mobileNumber"
							value="<%=user.getMobileNo()%>" placeholder="Contact" /> <input
							type="text" name="gender" value="<%=user.getGender()%>"
							placeholder="Gender" disabled="disabled" /> <input type="text"
							name="dob" value="<%=user.getDob()%>" placeholder="Date Of Birth"
							disabled="disabled" /> <input type="text" name="oldPassword"
							placeholder="Old Password" /> <input type="text"
							name="newPassword" placeholder="New Password" /> <input
							type="text" name="confirmPassword" placeholder="Confirm Password" />
						<br>
						<button type="submit" class="btn btn-default">Update</button>
						<br> <br>
					</form>
				</div>
				<!--/sign up form-->
			</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>
	<!--/Footer-->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>

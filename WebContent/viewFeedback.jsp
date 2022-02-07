<%@page import="org.pk.ecommerce.entities.product.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="org.pk.ecommerce.dao.CustomerDao"%>
<%@page
	import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
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
List<Feedback> fdList = customerDao.viewAllFeedbacks();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Feedback Form | Online Agree Pet Zone</title>
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
						<%@include file="icon.jsp"%>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="admin-orders.jsp"><i class="fa fa-user"></i>
										Welcome, <%=user.getFullName()%></a></li>
								<li><a href="userProfile.jsp"><i class="fa fa-user"></i>
										Account</a></li>
								<%
								if (user == null) {
								%>
								<li><a href="login.jsp"><i class="fa fa-lock"></i>
										Login</a></li>
								<%
								} else {
								%>
								<li><a href="admin-orders.jsp"><i class="fa fa-shop"></i>Orders</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i> Log
										out</a></li>
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

		<div class="header-bottom">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="index.jsp">Product List</a></li>
										<!-- <li><a href="checkout.jsp">Checkout</a></li> -->
										<li><a href="cart.jsp">Cart</a></li>
										<li>
											<%
											if (user == null) {
											%> <a href="login.jsp"> Login</a> <%
 } else {
 %> <a href="login.jsp"> Log out</a> <%
 }
 %>
										</li>
									</ul>
								<li><a href="contact-us.jsp">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</header>
	<!--/header-->

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="product-information">
						<div class="login-form">
							<!--login form-->
							<h2>View Feedbacks</h2>
							<table
								class="table table-responsive table-stripped table-bordered">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Farmer Name</th>
										<th>Feedback</th>
										<th>Date Time</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = 0; i < fdList.size(); i++) {
										Feedback fd = fdList.get(i);
									%>
									<tr>
										<td><%=i + 1%></td>
										<td><%=fd.getFarmerName()%></td>
										<td><%=fd.getFeedback()%></td>
										<td><%=fd.getDateTime()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--/product-details-->
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<!--/Footer-->

	<script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
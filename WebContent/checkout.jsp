
<%@page import="org.pk.ecommerce.entities.product.Cart"%>
<%@page import="org.pk.ecommerce.entities.product.Product"%>
<%@page import="org.pk.ecommerce.entities.product.SubCategory"%>
<%@page import="org.pk.ecommerce.dao.CustomerDao"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page
	import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="org.pk.ecommerce.entities.product.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.pk.ecommerce.GlobalConstants"%>
<%@page import="org.pk.ecommerce.entities.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%!
public void jspInit() {
	SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,getServletContext());
}

@Autowired
private CustomerDao customerDao;
	%>
<%
	User user = (User) session
			.getAttribute(GlobalConstants.USER_DETAILS);

	List<Category> categories = customerDao.getAllCategories();
	Cart cart = customerDao.getProductsFromCart(user.getUserId());
	
	double subTotal = 0, total = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Checkout | E-Shopper</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<link rel="shortcut icon" href="images/ico/favicon.ico">
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
		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.html"><img src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="index.jsp"><i class="fa fa-user"></i>
										Welcome, <%=user.getFullName()%></a></li>
								<li><a href="homePage.jsp"><i class="fa fa-user"></i>
										Account</a></li>
								<!-- <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li> -->
								<!-- <li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i>
										Checkout</a></li> -->
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<%
									if (user == null) {
								%>
								<li><a href="login.jsp"> <i class="fa fa-lock"> </i>Login
								</a></li>
								<%
									} else {
								%>
								<li><a href="submitFeedback.jsp"><i class="fa fa-lock"></i>Feedback</a></li>
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
	</header>
	<!--/header-->

	<section id="cart_items">
		<div class="container">		
			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-9 clearfix">
						<div class="bill-to">
							<p>Bill To</p>
							<div class="form-one">
								<form action="checkout.jsp" method="post">
									<input type="text" value="<%=user.getFullName() %>"
										placeholder="Full Name *" disabled> <input type="text"
										value="<%=user.getMobileNo() %>" placeholder="Phone number"
										disabled>
								</form>
							</div>

							<div class="form-two">
								<form action="" method="post">
									<input type="text" placeholder="Zip / Postal Code *"> <select>
										<option>-- State --</option>
										<option>Maharashtra</option>
										<option>Mdhya Pradesh</option>
										<option>Bihar</option>
										<option>Delhi</option>
										<option>Karnatak</option>										
									</select>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="review-payment">
				<h2>Review &amp; Payment</h2>
			</div>

			<section id="cart_items">
			<form action="common?action=addShippingAddress" method="post">
				<div class="container">
					<%=request.getAttribute("message") == null ? "" : request.getAttribute("message") %>
					<div class="table-responsive cart_info">

						<table class="table table-condensed">
							<thead>
								<tr class="cart_menu">
									<td class="image">Item</td>
									<td class="description"></td>
									<td class="price">Price</td>
									<td class="quantity">Quantity</td>
									<td class="total">Total</td>
									<td></td>
								</tr>
							</thead>
							<tbody>

								<% for(int i =0; i< cart.getProducts().size(); i++) {
									
									Product p = cart.getProducts().get(i);
								%>
								
								<tr>
									<td class="cart_product"><a href=""> <img
											src="<%=request.getContextPath()+"/"+p.getImageNamePath() %>"
											alt="<%=p.getProductName() %>" style="max-height:200px; max-width:200px" />
									</a></td>
									<td class="cart_description">
										<h4>
											<a href=""><%=p.getProductName() %></a>
										</h4>
									</td>
									<td class="cart_price">
										<p><%=p.getPrice() %></p>
									</td>
									<td class="cart_quantity">
										<div class="cart_quantity_button">
											<input class="cart_quantity_input" type="text"
												name="quantity" value="<%=p.getQuantity() %>"
												autocomplete="off" size="2" disabled>
										</div>
									</td>
									<td class="cart_total">
										<p class="cart_total_price">
											<%= p.getPrice() * p.getQuantity() %></p> <%subTotal+=p.getPrice() * p.getQuantity(); %>
									</td>

								</tr>
								
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="checkout-options">
								
									<ul class="nav">
										<li><button type="submit"><i class="btn btn-submit"></i>Submit</button></li>
										<li><button type="reset"><i class="fa fa-times"></i>Cancel</button></li>
									</ul>
								
							</div>
							<!--/checkout-options-->
						</div>
					</div>
				</div>
				</form>
				<br>
				<br>
			</section>
			<!--/#cart_items-->
		</div>
	</section>
	<!--/#cart_items-->

	<%@include file="footer.jsp"%>
	<!--/Footer-->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
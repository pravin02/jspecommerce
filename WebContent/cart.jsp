
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
<%!public void jspInit() {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, getServletContext());
	}

	@Autowired
	private CustomerDao customerDao;%>
<%
User user = (User) session.getAttribute(GlobalConstants.USER_DETAILS);

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
<title>Cart | Online Agree Pet Zone</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

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
								<li><a href="index.jsp"><i class="fa fa-user"></i>
										Welcome, <%=user.getFullName()%></a></li>
								<li><a href="userProfile.jsp"><i class="fa fa-user"></i>
										Account</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<%
								if (user == null) {
								%>
								<li><a href="login.jsp" name="login"><i
										class="fa fa-lock"></i> Login</a></li>
								<%
								} else {
								%>
								<li><a href="orders.jsp"><i class="fa fa-shop"></i>Orders</a></li>
								<li><a href="submitFeedback.jsp"><i class="fa fa-lock"></i>Feedback</a></li>
								<li><a href="login.jsp" name="logout"><i
										class="fa fa-lock"></i> Log out</a></li>
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
	<form action="checkout.jsp" method="post">
		<section id="cart_items">
			<div class="container">
				<div class="row alert alert-info"
					style="display: <%=request.getAttribute("message") == null ? "none" : "block" %> ">
					<div class="col-md-12 col-md-offset-4 ">
						<%=request.getAttribute("message") == null ? "" : request.getAttribute("message")%>
					</div>
				</div>

				<%
				if (cart != null) {
					if (cart.getProducts() != null) {
				%>
				<div class="table-responsive cart_info">
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td></td>
								<td class="image">Item</td>
								<td class="description"></td>
								<td class="price">Price</td>
								<td class="quantity">Quantity</td>
								<td class="total">Total</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < cart.getProducts().size(); i++) {

								Product p = cart.getProducts().get(i);
							%>
							<tr>
								<td><input type="checkbox" name="productIds"
									value="<%=p.getProductId()%>"></td>

								<td class="cart_product"><a href=""> <img
										src="<%=request.getContextPath() + "/" + p.getImageNamePath()%>"
										alt="<%=p.getProductName()%>"
										style="max-height: 200px; max-width: 200px" />
								</a></td>
								<td class="cart_description">
									<h4>
										<a href=""><%=p.getProductName()%></a>
									</h4>
								</td>
								<td class="cart_price">
									<p><%=p.getPrice()%></p>
								</td>
								<td class="cart_quantity">
									<div class="cart_quantity_button">
										<input class="cart_quantity_input" type="text" name="quantity"
											value="<%=p.getQuantity()%>" autocomplete="off" size="2"
											disabled>
									</div>
								</td>
								<td class="cart_total">
									<p class="cart_total_price"><%=p.getPrice() * p.getQuantity()%></p>
									<%
									subTotal += p.getPrice() * p.getQuantity();
									%>
								</td>

								<td class="cart_delete"><a
									href="removeFromCart.jsp?productId=<%=p.getProductId()%>"
									type="submit" class="btn btn-default add-to-cart"> <i
										class="fa fa-shopping-cart"></i>Remove
								</a></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
				<%
				}
				}
				%>
			</div>
		</section>
		<!--/#cart_items-->

		<%
		if (cart != null) {
			if (cart.getProducts() != null) {
		%>
		<section id="do_action">
			<div class="container">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span><%=subTotal%></span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span><%=subTotal%></span></li>
						</ul>
						<!-- <a class="btn btn-default update" href="">Update</a> -->
						<a href="checkout.jsp?productId=<%=cart.getProductId()%>"
							type="submit" class="btn btn-default check_out"> Check Out</a>
					</div>
				</div>
			</div>
		</section>
		<%
		}
		} else {
		%>

		<div class="container">
			<div class="row alert alert-info">
				<div class="col-sm-12 col-md-offset-4 ">
					<div class="total_area">
						No Product in Cart <a href="index.jsp"> Products</a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>

	</form>
	<!--/#do_action-->

	<%@include file="footer.jsp"%>
	<!--/Footer-->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
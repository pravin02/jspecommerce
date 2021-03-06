
<%@page import="org.pk.ecommerce.auction.Auction"%>
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
List<Auction> auctions = customerDao.getAllAuctionsRaisedByMe(user.getUserId());
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>View Auctions | Online Agree Pet Zone</title>
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
								<li><a href="javascript:void(0)"><%=user.getFullName()%>
										(<%=user.getType().name()%>)</a></li>
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
								<li><a href="startAuction.jsp"><i class="fa fa-shop"></i>Start
										Auction</a></li>
								<li><a href="viewAuctions.jsp"><i class="fa fa-shop"></i>View
										Auction</a></li>
								<li><a href="addProduct.jsp"><i class="fa fa-shop"></i>Add
										Product</a></li>
								<li><a href="orders.jsp"><i class="fa fa-shop"></i>Orders</a></li>
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
			<div class="row" style="padding-top: 20px">
				<div class="col-sm-12">
					<div class="features_items">
						<h2 class="title text-center">My Auctions</h2>
						<%
						if (auctions != null && !auctions.isEmpty()) {
							for (Auction auction : auctions) {
								Product product = auction.getProduct();
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products" style="border: solid 1px">
									<div class="productinfo text-center" style="margin: 5px">
										<img
											src="<%=request.getContextPath() + "/" + product.getImageNamePath()%>"
											alt="<%=product.getProductName()%>" />
										<p>
											ProductName -
											<%=product.getProductName()%></p>
										<h2>
											Auction Price -
											<%=auction.getPrice()%></h2>									
										
											<% if(auction.getStatus()){ %>
										<h2>
											Deal Price -
											<%=auction.getBuyPrice()%></h2>
										<h2>
											Buyer -
											<%=auction.getBuyer().getFullName()%></h2>
											<%} %>

										<a href="viewBids.jsp?auctionId=<%=auction.getAuctionId()%>">
											View Bids</a>
									</div>
								</div>
							</div>
						</div>
						<%
						}
						}
						%>
					</div>
					<!--features_items-->
				</div>
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

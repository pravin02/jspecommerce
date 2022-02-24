
<%@page import="org.pk.ecommerce.auction.Bid"%>
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
int auctionId = 0;
Auction auction = null;
try {
	auctionId = Integer.parseInt(request.getParameter("auctionId"));
	auction = this.customerDao.getAuction(auctionId);
} catch (Exception e) {
	System.err.println("ViewBids " + e.getMessage());
}

String message = (String) request.getParameter("message");
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
								<li><a href="myAuctions.jsp"><i class="fa fa-shop"></i>My
										Auctions</a></li>
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
			<div class="row">
				<div class="col-sm-12">
					<%=message != null ? message : ""%>
				</div>
			</div>
			<div class="row" style="padding-top: 20px">
				<div class="col-sm-12">
					<div class="features_items">
						<h2 class="title text-center">Auction</h2>
						<%
						if (auction != null) {
							Product product = auction.getProduct();
						%>
						<div class="col-sm-3">
							<div class="product-image-wrapper">
								<form action="ecommerce?action=addBid&auctionId=<%=auctionId%>"
									method="post">
									<div class="single-products">
										<div class="productinfo text-center" style="margin: 5px">
											<img
												src="<%=request.getContextPath() + "/" + product.getImageNamePath()%>"
												alt="<%=product.getProductName()%>" height="100" width="100" />
											<p><%=product.getProductName()%></p>
											<p><%=product.getDescription()%></p>
											<h2><%=product.getPrice()%></h2>
											<%
											if ((auction.getSellerId() == user.getUserId()) && auction.getStatus()) {
											%>
											<h2>
												<input type="text" name="bidPrice" class="form-control"
													placeholder="Enter Bid Price">
											</h2>
											<button type="submit" class="btn btn-default add-to-cart">
												Post Bid</button>
											<%
											}
											%>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-sm-9">
							<ul class="list-group">
								<%
								List<Bid> bids = auction.getBids();
								if (bids != null && !bids.isEmpty()) {
									for (Bid bid : bids) {
								%>
								<li class="list-group-item">Bidder - <%=bid.getBidder().getFullName()%>
									<br /> Bid Price - <%=bid.getPrice()%> <br /> <%
 if ((auction.getSellerId() == user.getUserId()) && auction.getStatus()) {
 %> <a href="makeTheDeal.jsp?auctionId=<%=auctionId %>&bidId=<%=bid.getBidId() %>&bidPrice=<%=bid.getPrice() %>" class="btn btn-danger">Make Deal</a> <%
 }
 %>
								</li>
								<%
								}
								}
								%>
							</ul>
						</div>
						<%
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

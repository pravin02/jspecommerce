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
	SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
			getServletContext());
}

@Autowired
private CustomerDao customerDao;
	%>
<%
	User user = (User) session
			.getAttribute(GlobalConstants.USER_DETAILS);

	List<Category> categories = customerDao.getAllCategories();
	
	
	
	Product product = null;
	
	int productId = 0;
	int quantity = 0;
	try{
		if(request.getParameter("productId") != null || request.getParameter("subCategoryId") != null || request.getParameter("quantity") != null)
			productId = Integer.parseInt(request.getParameter("productId"));
			
	}finally{
		product = customerDao.getProduct(productId);
		
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Product Details | Online Agree Pet Zone</title>
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
		<!--header-->

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
								<li><a href="userProfile.jsp"><i class="fa fa-user"></i>
										Account</a></li>								
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<%
									if (user == null) {
								%>
								<li><a href="login.jsp"><i class="fa fa-lock"></i>
										Login</a></li>
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
										<li><a href="product-details.jsp">Product Details</a></li>
										<!-- <li><a href="checkout.jsp">Checkout</a></li> -->
										<li><a href="cart.jsp">Cart</a></li>
										<li>
											<%
												if (user == null) {
											%> <a href="login.jsp"> Login</a> 
											<%
 												} else {
 											%> 
 											<a href="login.jsp"> Log out</a> 
 											<%
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
				<div class="col-sm-3 ">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<!--category-productsr-->
							<% if(categories != null && !categories.isEmpty()) {
								for(Category category : categories){							
							%>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#subCate<%=category.getCategoryId()%>"> <span
											class="badge pull-right"><i class="fa fa-plus"></i></span> <%=category.getCategoryName() %>
										</a>
									</h4>
								</div>
								<div id="subCate<%=category.getCategoryId()%>"
									class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<% if(category.getSubCategories() != null && !category.getSubCategories().isEmpty()){
											for(SubCategory subCategory: category.getSubCategories()){ %>
											<li>
												<a href="index.jsp?subCategoryId=<%=subCategory.getSubCategoryId() %>">
													<%=subCategory.getSubCategoryName() %>
												</a>
											</li>
											<%}} %>
										</ul>
									</div>
								</div>
							</div>
							<% } } %>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="product-information">
						<%=request.getAttribute("message") == null ? "" : request.getAttribute("message") %>
						<!--/product-information-->
						<img
							src="<%=request.getContextPath()+"/"+product.getImageNamePath() %>"
							alt="<%=product.getProductName() %>" style="max-height:200px; max-width:200px"/>
						<h2><%=product.getProductName() %></h2>
					</div>
					<!--/product-information-->
				</div>
				<div class="col-sm-5">
					<div class="product-information">
						<form action="addToCart.jsp" method="post">
							<span> 
								<span><%=product.getPrice() %></span>
								 <label>Quantity:</label>
								<input type="text" name="quantity" value="1"> 
								<input type="hidden" name="productId" value="<%=product.getProductId() %>">
								<button type="submit" class="btn btn-fefault cart">
									<i class="fa fa-shopping-cart"></i> Add to cart
								</button>
							</span>
							<p><%=product.getDescription() %></p>
						</form>
					</div>
				</div>
			</div>
			<!--/product-details-->
		</div>
	</section>

	<%@ include file="footer.jsp" %>
	<!--/Footer-->

	<script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
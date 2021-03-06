
<%@page import="org.pk.ecommerce.entities.order.PurchaseMaster"%>
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
List<PurchaseMaster> purchaseMasterList = this.customerDao.getPurchaseMaster(user.getUserId());
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Orders | Online Agree Pet Zone</title>
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
								<li><a href="addProduct.jsp"><i class="fa fa-shop"></i>Add
										Product</a></li>
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
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<%
							if (categories != null && !categories.isEmpty()) {
								for (Category category : categories) {
							%>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#subCate<%=category.getCategoryId()%>"> <span
											class="badge pull-right"><i class="fa fa-plus"></i></span> <%=category.getCategoryName()%>
										</a>
									</h4>
								</div>
								<div id="subCate<%=category.getCategoryId()%>"
									class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<%
											if (category.getSubCategories() != null && !category.getSubCategories().isEmpty()) {
												for (SubCategory subCategory : category.getSubCategories()) {
											%>
											<a
												href="index.jsp?subCategoryId=<%=subCategory.getSubCategoryId()%>">
												<li><%=subCategory.getSubCategoryName()%></li>
											</a>
											<%
											}
											}
											%>
										</ul>
									</div>
								</div>
							</div>
							<%
							}
							}
							%>
						</div>
					</div>
				</div>
				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<h2 class="title text-center">Orders List</h2>
						<div class="row">
							<div class="col-md-12">
								<table
									class="table table-responsive table-stripped table-bordered">
									<thead>
										<tr>
											<th>Order Id</th>
											<th>Address</th>
											<th>Contact No</th>
											<th>No Of Items</th>
											<th>Assigned Driver</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<%
										if (purchaseMasterList != null && !purchaseMasterList.isEmpty()) {
											for (PurchaseMaster pm : purchaseMasterList) {
										%>
										<tr>
											<td><a
												href="order-product-details.jsp?orderId=<%=pm.getPurchaseMasterId()%>"><%=pm.getPurchaseMasterId()%></a>
											</td>
											<td><%=pm.getShippingAddress()%></td>
											<td><%=pm.getContact()%></td>
											<td><%=pm.getPurchaseDetails().size()%></td>
											<td><%=pm.getDriverId()%></td>
											<td><%=pm.getStatus()%></td>
										</tr>
										<%
										}
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
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

<%@page import="org.pk.ecommerce.entities.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.pk.ecommerce.entities.product.SubCategory"%>
<%@page import="org.pk.ecommerce.entities.product.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.pk.ecommerce.entities.user.UserType"%>
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

String message = (String) request.getAttribute("message");

List<Category> categories = customerDao.getAllCategories();
List<SubCategory> subCategories = new ArrayList<>(0);
List<Product> products = new ArrayList<>(0);

int categoryId = 0;
int subCategoryId = 0;
try {
	categoryId = Integer.parseInt(request.getParameter("categoryId"));	
	if (categoryId > 0) {
		subCategories = customerDao.getSubCategoriesByCategoryId(categoryId);
	}
	subCategoryId = Integer.parseInt(request.getParameter("subCategoryId"));
	if (categoryId > 0) {
		products = customerDao.getAllProductList(subCategoryId, "", 0.0 );
	}
} catch (Exception e) {
}

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Start Auction | Online Agree Pet Zone</title>
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
								<li><a href="javascript:void(0)">Welcome, <%=user.getFullName()%>
										(<%=user.getType().name()%>)
								</a></li>
								<li><a href="userProfile.jsp"><i class="fa fa-user"></i>
										Account</a></li>
								<%
								if (UserType.Admin.name().equals(user.getType().name())) {
								%>
								<li><a href="admin-orders.jsp"><i class="fa fa-shop"></i>Orders</a></li>
								<li><a href="viewFeedback.jsp"><i class="fa fa-eye"></i>Feedback</a></li>
								<%
								} else if (UserType.Driver.name().equals(user.getType().name())) {
								%>
								<li><a href="driver-orders.jsp"><i class="fa fa-shop"></i>Orders</a></li>
								<%
								} else if (UserType.Farmer.name().equals(user.getType().name())) {
								%>
								<li><a href="viewAuctions.jsp"><i class="fa fa-shop"></i>View Auction</a></li>
								<li><a href="myAuctions.jsp"><i class="fa fa-shop"></i>My Auction</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<li><a href="orders.jsp"><i class="fa fa-shop"></i>Orders</a></li>
								<li><a href="submitFeedback.jsp"><i class="fa fa-lock"></i>Feedback</a></li>
								<%
								}
								%>
								<li><a href="login.jsp"><i class="fa fa-lock"></i><%=user == null ? "Login" : "Log Out"%></a></li>
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
				<%=message != null ? message : "" %>
				</div>
			</div>
			<div class="row">
				<div class="signup-form col-md-4 col-md-offset-4">
					<!--sign up form-->
					<h2 style="text-align: center;">Add Product</h2>
					<form action="ecommerce?action=startAuction" method="post">
						<script type="text/javascript">
							function categoryChangeEvent() {
								let catId = document
										.getElementById("categoryId").value;								
								window.location = window.location.origin + window.location.pathname
										+ "?categoryId=" + catId;
							}
							
							function subCategoryChangeEvent() {
								let catId = document
								.getElementById("categoryId").value;
								let subCatId = document
										.getElementById("subCategoryId").value;								
								window.location = window.location.origin + window.location.pathname
										+ "?categoryId=" + catId+"&subCategoryId="+subCatId;
							}
						</script>
						<select name="categoryId" id="categoryId"
							onchange="categoryChangeEvent()">
							<option value="0">Select Category</option>
							<%
							if (categories != null && !categories.isEmpty()) {
								for (Category category : categories) {
							%>
							<option value=<%=category.getCategoryId()%>>
								<%=category.getCategoryName()%></option>
							<%
							}
							}
							%>
						</select><br /> <br /> 
						<select name="subCategoryId" id="subCategoryId" onchange="subCategoryChangeEvent()">
							<option value="0">Select Sub Category</option>
							<%
							if (subCategories != null && !subCategories.isEmpty()) {
								for (SubCategory subCategory : subCategories) {
							%>
							<option value=<%=subCategory.getSubCategoryId()%>>
								<%=subCategory.getSubCategoryName()%></option>
							<%
							}
							}
							%>
						</select><br /> <br />
						<select name="productId">
							<option value="0">Select Product</option>
							<%
							if (products != null && !products.isEmpty()) {
								for (Product product: products) {
							%>
							<option value=<%=product.getProductId()%>>
								<%=product.getProductName()%></option>
							<%
							}
							}
							%>
						</select>
						<br /> <br />
						 <input
							type="text" name="price" placeholder="Please enter price">
						<br /> 
						<button type="submit" class="btn btn-default">Start Auction</button>
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
	<script type="text/javascript">
	var catIdControl = document.getElementById('categoryId');
	var len;
	for (var i = 0, len = catIdControl.length; i < len; i++) {
		if (catIdControl[i].value == <%=categoryId %>)
			catIdControl.options[i].selected = true;
	}
</script>
</body>
</html>

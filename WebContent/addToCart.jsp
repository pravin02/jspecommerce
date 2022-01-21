<%@page import="org.pk.ecommerce.entities.product.Cart"%>
<%@page import="org.pk.ecommerce.entities.product.Product"%>
<%@page import="org.pk.ecommerce.entities.product.SubCategory"%>
<%@page import="org.pk.ecommerce.dao.CustomerDao"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page	import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="org.pk.ecommerce.entities.product.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.pk.ecommerce.GlobalConstants"%>
<%@page import="org.pk.ecommerce.entities.user.User"%>
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

	int productId = 0;
	int quantity = 0;
	int userId = user.getUserId();
	try
	{
		productId = Integer.parseInt(request.getParameter("productId"));
		quantity = Integer.parseInt(request.getParameter("quantity"));
		
		Cart cart = new Cart();
		cart.setUserId(userId);		
		cart.setProductId(productId);
		cart.setQuantity(quantity);		
		System.out.println("customerDao "+customerDao);
		System.out.println(cart);		
		if(customerDao.addToCart(cart))
		{
			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
			request.setAttribute("message", "Product added successfully in Cart.");
			rd.forward(request, response); 
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("product-details.jsp?productId="+productId);
			request.setAttribute("message", "Error while adding product to cart.");
			rd.forward(request, response);
		}	
	}
	catch(NumberFormatException nfe)
	{
		RequestDispatcher rd = request.getRequestDispatcher("product-details.jsp?productId="+productId);
		request.setAttribute("message", "Error while adding product to cart.");
		rd.forward(request, response);
	}
%>

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
<%!

public void jspInit() {
	SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
			getServletContext());
}
@Autowired
private CustomerDao customerDao;
	%>

<%
	User user = (User) session.getAttribute(GlobalConstants.USER_DETAILS);

	int productId = 0;
	int userId = user.getUserId();
	
	
	if(request.getParameter("productId") != null){
		RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
	
	
	try
	{
		productId = Integer.parseInt(request.getParameter("productId"));
		
		
		Cart cart = new Cart();
		cart.setUserId(userId);		
		cart.setProductId(productId);
		if(customerDao.removeFromCart(cart))
		{	
			request.setAttribute("message", "Product removed successfully from Cart.");	
			
		}
		else
		{		
			request.setAttribute("message", "Error while removed product from cart.");			
		}	
	}
	catch(NumberFormatException nfe)
	{		
		request.setAttribute("message", "Error while remove product from cart.");		
	}
	finally{
		rd.include(request, response);
	}
	
	}else{
		RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
		rd.include(request, response);
	}
%>
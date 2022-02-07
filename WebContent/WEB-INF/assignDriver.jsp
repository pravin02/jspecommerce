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
<%!public void jspInit() {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, getServletContext());
	}

	@Autowired
	private CustomerDao customerDao;%>

<%
User user = (User) session.getAttribute(GlobalConstants.USER_DETAILS);

int driverId = Integer.parseInt(request.getParameter("driverId"));
int orderId = Integer.parseInt(request.getParameter("orderId"));
System.out.println("driver " + driverId);
this.customerDao.assignDriverToOrder(orderId, driverId);
System.out.println("Order assigned");
request.setAttribute("message", "Driver Assigned to order");
response.sendRedirect("order-product-details.jsp?orderId=" + orderId);
%>

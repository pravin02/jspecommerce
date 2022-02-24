

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

int auctionId = 0;
double bidPrice = 0;

try {
	auctionId = Integer.parseInt(request.getParameter("auctionId"));
	bidPrice = Double.parseDouble(request.getParameter("bidPrice"));

	if (customerDao.makeTheDeal(auctionId, user.getUserId(), bidPrice)) {
		RequestDispatcher rd = request.getRequestDispatcher(
		"viewBids.jsp?auctionId=" + auctionId + "&message=Deal accepted, closing this auction");
		rd.forward(request, response);
	} else {
		RequestDispatcher rd = request.getRequestDispatcher(
		"viewBids.jsp?auctionId=" + auctionId + "&message=Deal accepted, closing this auction");
		request.setAttribute("message", "This product already exists in cart");
		rd.forward(request, response);
	}
} catch (NumberFormatException nfe) {
	RequestDispatcher rd = request.getRequestDispatcher("viewBids.jsp?message=Something went wrong");
	request.setAttribute("message", "Error while adding product to cart.");
	rd.forward(request, response);
}
%>

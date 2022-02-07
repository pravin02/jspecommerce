/**
 * 
 */
package org.pk.ecommerce.servlets;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pk.ecommerce.GlobalConstants;
import org.pk.ecommerce.dao.CustomerDao;
import org.pk.ecommerce.entities.order.PurchaseDetail;
import org.pk.ecommerce.entities.order.PurchaseMaster;
import org.pk.ecommerce.entities.product.Cart;
import org.pk.ecommerce.entities.product.Product;
import org.pk.ecommerce.entities.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

/**
 * @author SHREE
 *
 */
public class EcommerceServlet extends HttpServlet {

	@Autowired
	private CustomerDao customerDao;

	/**
	 * 
	 */
	private static final long serialVersionUID = 5792694634285113662L;

	public EcommerceServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("purchaseProduct".equalsIgnoreCase(action.trim())) {
			try {
				String contact = request.getParameter("contact");
				String address = request.getParameter("address");
				String pinCode = request.getParameter("pinCode");
				String state = request.getParameter("state");
				User user = (User) request.getSession().getAttribute(GlobalConstants.USER_DETAILS);
				Cart cart = this.customerDao.getProductsFromCart(user.getUserId());

				System.out.println("Contact Number " + contact);
				System.out.println("Address " + address);
				System.out.println("pinCode " + pinCode);
				System.out.println("State " + state);
				System.out.println("Contact Number " + user.getUserId());
				System.out.println("No of items in cart " + cart.getProducts().size());

				List<Product> productList = cart.getProducts();

				System.out.println("No of product in cart " + productList.size());

				PurchaseMaster purchaseMaster = new PurchaseMaster();
				purchaseMaster.setUserId(user.getUserId());
				purchaseMaster.setShippingAddress(address + ", " + pinCode + ", " + state);
				purchaseMaster.setContact(contact);
				System.out.println(purchaseMaster);

				this.customerDao.addPurchaseMaster(purchaseMaster);
				purchaseMaster = this.customerDao.getLatestPurchaseMaster(user.getUserId());
				int purchaseMasterId = purchaseMaster.getPurchaseMasterId();
				System.out.println("pmid " + purchaseMasterId);

				List<PurchaseDetail> pdList = productList.stream().map(p -> new PurchaseDetail(purchaseMasterId, p))
						.collect(Collectors.toList());
				System.out.println("pdlist " + pdList.size());

				pdList.stream().forEach(pd -> {
					this.customerDao.addPurchaseDetail(pd);
				});
				System.out.println("pdlist added");
				this.customerDao.emptyCart(user.getUserId());
				System.out.println("cart empty ");
				request.setAttribute("message", "Order Placed successfully");
				response.sendRedirect("checkout.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("error " + e.getMessage());
				request.setAttribute("message", "Error while placing order " + e.getMessage());
				response.sendRedirect("checkout.jsp");
			}
		}
	}

}

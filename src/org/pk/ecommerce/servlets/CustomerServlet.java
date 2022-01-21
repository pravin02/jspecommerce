package org.pk.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pk.ecommerce.dao.CustomerDao;
import org.pk.ecommerce.entities.product.Cart;
import org.pk.ecommerce.entities.product.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = -6038939856654770161L;
	@Autowired
	private CustomerDao customerDao;
	private PrintWriter out;

	public CustomerServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// it will allowing to access spring configuration to servlet.
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		out = response.getWriter();
		// out.write("Login Succes " + customerDao.getPurchaseMaster(1));
		// out.write("Login Succes " + customerDao.getPurchaseDetails(1));
		// out.write("Login Succes " + customerDao.getProduct(1));
		Cart cart = new Cart();
		cart.setDiscount(20);
		cart.setUserId(1);
		Product product = new Product();
		product.setProductId(1);
		//cart.setProduct(product);
		out.write("" + customerDao.addToCart(cart));
	}

}
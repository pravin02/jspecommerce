package org.pk.ecommerce.servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pk.ecommerce.GlobalConstants;
import org.pk.ecommerce.dao.CommonDao;
import org.pk.ecommerce.entities.user.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

public class CommonServlet extends HttpServlet {
	private static final long serialVersionUID = -6038939856654770161L;

	@Autowired
	private CommonDao commonDao;

	public CommonServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// it will allowing to access spring configuration to servlet.
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		// register farmer action
		if (action.equalsIgnoreCase("registerUser")) {
			doActionRegisterUser(request, response);
		}

		// farmer login action
		if (action.equalsIgnoreCase("farmerLogin")) {
			String emailId = request.getParameter("emailId");
			String password = request.getParameter("password");
			User user = commonDao.loginFarmerUser(emailId, password);
			doActionLogin(request, response, user);
		}

		// Admin login action
		if (action.equalsIgnoreCase("adminLogin")) {
			String emailId = request.getParameter("emailId");
			String password = request.getParameter("password");
			User user = commonDao.loginAdminUser(emailId, password);
			doActionLogin(request, response, user);
		}

		// Driver login action
		if (action.equalsIgnoreCase("driverLogin")) {
			String emailId = request.getParameter("emailId");
			String password = request.getParameter("password");
			User user = commonDao.loginDriverUser(emailId, password);
			doActionLogin(request, response, user);
		}
	}

	public void doActionLogin(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {
		if (user != null) {
			System.out.println(" login : user=>" + user.getType().name());
			HttpSession session = request.getSession();
			session.setAttribute(GlobalConstants.USER_DETAILS, user);
			response.sendRedirect("index.jsp");
		} else {
			String action = request.getParameter("action");
			response.sendRedirect(action+".jsp?failed=Invalid Username or Password");

		}
	}

	public void doActionRegisterUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String MESSAGE = "";
		User user = fillUserDetails(request);
		if (!commonDao.isUserAllreadyRegistered(user.getEmailId())) {
			if (commonDao.registerUser(user)) {
				MESSAGE = "SUCCESS";
			} else {
				MESSAGE = "FAILED";
			}
		} else {
			MESSAGE = "EXISTS";
		}
		response.sendRedirect("login.jsp?register=" + MESSAGE);
	}

	public User fillUserDetails(HttpServletRequest request) {
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String fullName = request.getParameter("fullName");
		String mobileNo = request.getParameter("mobileNumber");
		String dob = request.getParameter("dob");
		User user = new User();
		user.setEmailId(emailId);
		user.setPassword(password);
		user.setFullName(fullName);
		user.setGender(gender);
		user.setMobileNo(mobileNo);
		user.setDob(dob);
		return user;
	}
}
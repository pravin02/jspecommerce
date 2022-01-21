package org.pk.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
	private PrintWriter out;

	public CommonServlet() {
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
		out = response.getWriter();
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("registerUser")) {

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
			String MESSAGE = "";
			boolean flag = true;

				if (!commonDao.isUserAllreadyRegistered(emailId)) {
					if (commonDao.registerUser(user)) {
						MESSAGE = "SUCCESS";
					} else {
						MESSAGE = "FAILED";
					}
				} else {
					MESSAGE = "EXISTS";
				}
			System.out.println("final  message "+MESSAGE);
			System.out.println("final flaog "+flag);
			response.sendRedirect("login.jsp?register=" + MESSAGE);
		} else if (action.equalsIgnoreCase("login")) {
			String emailId = request.getParameter("emailId");
			String password = request.getParameter("password");
			User user = commonDao.loginUser(emailId, password);
			System.out.println("login : user=>" + user);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute(GlobalConstants.USER_DETAILS, user);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("login.jsp");

			}
		}
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		out = response.getWriter();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = commonDao.loginUser(userName, password);
		if (user != null)
			out.write("Login Succes " + user);
		else
			out.write("Invalid userName or password");
	}
}
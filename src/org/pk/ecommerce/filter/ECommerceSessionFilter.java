/*package org.pk.ecommerce.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.pk.ecommerce.GlobalConstants;
import org.pk.ecommerce.entities.user.User;

public class ECommerceSessionFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request2 = (HttpServletRequest) request;
		HttpServletResponse response2 = (HttpServletResponse) response;

		System.out.println("In session filter");
		HttpSession session = request2.getSession(false);
		if (session == null || !session.isNew()) {
			System.out.println("session is new ");
			RequestDispatcher rd = request2.getRequestDispatcher("login.jsp");
			rd.forward(request2, response2);
			
		} else {
			System.out.println("session is old forwarding to servlet ");
			filterChain.doFilter(request2, response2);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}*/

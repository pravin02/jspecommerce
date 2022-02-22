/**
 * 
 */
package org.pk.ecommerce.servlets;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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

	private int maxFileSize = 1000 * 1024;
	private int maxMemSize = 500 * 1024;
	private File file;

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

	/**
	 * @Override public void doPost(HttpServletRequest request, HttpServletResponse
	 *           response) throws ServletException, IOException { String action =
	 *           request.getParameter("action"); if
	 *           ("purchaseProduct".equalsIgnoreCase(action.trim())) {
	 *           this.purchaseProduct(request, response); } else if
	 *           ("assignDriver".equalsIgnoreCase(action)) {
	 *           this.assignDriver(request, response); } else if
	 *           ("updateOrderStatus".equals(action)) {
	 *           this.updateOrderStatus(request, response); } else if
	 *           ("addProduct".equals(action)) { this.addProduct(request, response);
	 *           } }
	 * 
	 *           /**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			uploadFile(request, response);
			request.setAttribute("message", "Product Added Successfully.");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Error while add product " + e.getMessage());
		}
		response.sendRedirect("addProduct.jsp");
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void uploadFile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);
		try {
			// Parse the request to get file items.
			List<FileItem> fileItems = upload.parseRequest(request);
			// Process the uploaded file items
			Iterator<FileItem> i = fileItems.iterator();
			Product product = new Product();
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					String fileName = fi.getName();
					product.setImageNamePath("images/pets/" + fileName);
					String filePath = getServletContext().getRealPath("images") + File.separator + "pets"
							+ File.separator;

					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						String fpath = filePath + fileName.substring(fileName.lastIndexOf("\\"));
						file = new File(fpath);
					} else {
						String fpath = filePath + fileName.substring(fileName.lastIndexOf("\\") + 1);
						file = new File(fpath);
					}
					fi.write(file);
				} else {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fieldValue = fi.getString();
					if ("subCategoryId".equals(fieldName)) {
						product.setSubCategory(this.customerDao.getSubCategory(Integer.parseInt(fieldValue)));
					} else if ("productName".equals(fieldName)) {
						product.setProductName(fieldValue);
					} else if ("companyName".equals(fieldName)) {
						product.setCompanyName(fieldValue);
					} else if ("quantity".equals(fieldName)) {
						product.setQuantity(Integer.parseInt(fieldValue));
					} else if ("price".equals(fieldName)) {
						product.setPrice(Double.parseDouble(fieldValue));
					} else if ("description".equals(fieldName)) {
						product.setDescription(fieldValue);
					}
				}
			}
			this.customerDao.addProduct(product);
		} catch (Exception ex) {
			System.err.println(ex);
		}
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void assignDriver(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int driverId = Integer.parseInt(request.getParameter("driverId"));
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		this.customerDao.assignDriverToOrder(orderId, driverId);
		request.setAttribute("message", "Driver Assigned to order");
		response.sendRedirect("admin-order-product-details.jsp?orderId=" + orderId);
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void purchaseProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String contact = request.getParameter("contact");
			String address = request.getParameter("address");
			String pinCode = request.getParameter("pinCode");
			String state = request.getParameter("state");
			User user = (User) request.getSession().getAttribute(GlobalConstants.USER_DETAILS);
			Cart cart = this.customerDao.getProductsFromCart(user.getUserId());
			List<Product> productList = cart.getProducts();

			PurchaseMaster purchaseMaster = new PurchaseMaster();
			purchaseMaster.setUserId(user.getUserId());
			purchaseMaster.setShippingAddress(address + ", " + pinCode + ", " + state);
			purchaseMaster.setContact(contact);

			this.customerDao.addPurchaseMaster(purchaseMaster);
			purchaseMaster = this.customerDao.getLatestPurchaseMaster(user.getUserId());
			int purchaseMasterId = purchaseMaster.getPurchaseMasterId();

			List<PurchaseDetail> pdList = productList.stream().map(p -> new PurchaseDetail(purchaseMasterId, p))
					.collect(Collectors.toList());

			pdList.stream().forEach(pd -> {
				this.customerDao.addPurchaseDetail(pd);
			});
			this.customerDao.emptyCart(user.getUserId());
			request.setAttribute("message", "Order Placed successfully");
			response.sendRedirect("checkout.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("error " + e.getMessage());
			request.setAttribute("message", "Error while placing order " + e.getMessage());
			response.sendRedirect("checkout.jsp");
		}
	}

	public void updateOrderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		String status = request.getParameter("orderStatus");
		this.customerDao.updateOrderStatus(orderId, status);
		request.setAttribute("message", "Order status updated successfully.");
		response.sendRedirect("driver-order-product-details.jsp?orderId=" + orderId);
	}
}

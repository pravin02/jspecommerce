package org.pk.ecommerce.dao;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.pk.ecommerce.entities.order.PurchaseDetail;
import org.pk.ecommerce.entities.order.PurchaseMaster;
import org.pk.ecommerce.entities.product.Cart;
import org.pk.ecommerce.entities.product.Category;
import org.pk.ecommerce.entities.product.Product;
import org.pk.ecommerce.entities.product.SubCategory;
import org.pk.ecommerce.entities.user.ShippingAddress;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

/**
 * @author SHREE
 */
@Component
public class CustomerDaoImpl implements CustomerDao {

	/**
	 * dataSource object is useful to get driver details of different types of
	 * database vendors like MYSql, Oracle, SQL Server, Cybase
	 */
	// private DataSource dataSource;
	/**
	 * jdbcTemplateObject is used to actually make connection with database and
	 * Spring JDBC API.
	 */
	// @Autowired
	private JdbcTemplate jdbcTemplateObject;

	// private DataSource dataSource;

	/**
	 * dataSource object will be injected by spring configuration at run time.
	 * 
	 * @param dataSource
	 */
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getAllCategories()
	 */
	@Override
	public List<Category> getAllCategories() {
		String SQL = "{CALL getAllCategories()}";
		List<Category> list = jdbcTemplateObject.query(SQL,
				new RowMapper<Category>() {
					@Override
					public Category mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {
						Category object = new Category();
						object.setCategoryId(rs.getInt("categoryId"));
						object.setCategoryName(rs.getString("categoryName"));
						object.setSubCategories(getSubCategoriesByCategoryId(rs
								.getInt("categoryId")));
						return object;
					}
				});

		// return jdbcTemplateObject.update("") == 1 ? true: false;
		return (list != null && !list.isEmpty()) ? list : null;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getSubCategoriesByCategoryId(int)
	 */
	@Override
	public List<SubCategory> getAllSubCategories() {
		String SQL = "{CALL getAllSubCategories()}";
		List<SubCategory> list = jdbcTemplateObject.query(SQL,
				new RowMapper<SubCategory>() {
					@Override
					public SubCategory mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {
						SubCategory object = new SubCategory();
						object.setSubCategoryId(rs.getInt("subCategoryId"));
						object.setSubCategoryName(rs
								.getString("subCategoryName"));
						object.setDescription(rs.getString("description"));
						return object;
					}
				});
		// return jdbcTemplateObject.update("") == 1 ? true: false;
		return (list != null && !list.isEmpty()) ? list : null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getSubCategoriesByCategoryId(int)
	 */
	@Override
	public List<SubCategory> getSubCategoriesByCategoryId(int categoryId) {
		String SQL = "{CALL getSubCategoriesByCategoryId(?)}";
		List<SubCategory> list = jdbcTemplateObject.query(SQL,
				new RowMapper<SubCategory>() {
					@Override
					public SubCategory mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {
						SubCategory object = new SubCategory();
						object.setSubCategoryId(rs.getInt("subCategoryId"));
						object.setSubCategoryName(rs
								.getString("subCategoryName"));

						return object;
					}
				}, categoryId);

		// return jdbcTemplateObject.update("") == 1 ? true: false;
		return (list != null && !list.isEmpty()) ? list : null;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getProductList(int,
	 * java.lang.String, float)
	 */

	@Override
	public List<Product> getAllProductList(int subCategoryId,
			String productName, double priceRange) {
		String SQL = "{CALL getAllProductList(?, ?, ?)}";
		List<Product> list = jdbcTemplateObject.query(SQL,
				new RowMapper<Product>() {
					@Override
					public Product mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {
						Product object = new Product();
						object.setProductId(rs.getInt("productId"));
						object.setProductName(rs.getString("productName"));
						object.setPrice(rs.getDouble("price"));
						object.setImageNamePath(rs.getString("imageNamePath"));
						object.setQuantity(rs.getInt("quantity"));
						object.setDiscount(rs.getDouble("discount"));
						object.setDescription(rs.getString("description"));

						return object;
					}
				}, subCategoryId, productName, priceRange);

		// return jdbcTemplateObject.update("") == 1 ? true: false;
		return (list != null && !list.isEmpty()) ? list : null;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.pk.ecommerce.dao.CustomerDao#addPurchaseMaster(org.pk.ecommerce.entities
	 * .order.PurchaseMaster)
	 */
	@Override
	public boolean addPurchaseMaster(PurchaseMaster purchaseMaster) {
		String SQL = "{CALL addPurchaseMaster(?, ?, ?, ?, ?)}";
		return jdbcTemplateObject.update(
				SQL,
				new Object[] { purchaseMaster.getUserId(),
						purchaseMaster.getShippingAddressId(),
						purchaseMaster.getFinalAmount(),
						purchaseMaster.getFinalQuantity(),
						purchaseMaster.getDiscount() }) == 1 ? true : false;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.pk.ecommerce.dao.CustomerDao#addPurchaseDetail(org.pk.ecommerce.entities
	 * .order.PurchaseDetail)
	 */
	@Override
	public boolean addPurchaseDetail(PurchaseDetail purchaseDetail) {
		String SQL = "{CALL addPurchaseDetail(?, ?, ?, ?, ?)}";
		return jdbcTemplateObject.update(
				SQL,
				new Object[] { purchaseDetail.getPurchaseMasterId(),
						purchaseDetail.getProductId(),
						purchaseDetail.getQuantity(),
						purchaseDetail.getPrice(),
						purchaseDetail.getTotalAmount() }) == 1 ? true : false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getPurchaseEntries(int)
	 */
	@Override
	public List<PurchaseMaster> getPurchaseMaster(int userId) {
		String SQL = "{CALL getPurchaseMaster(?)}";
		List<PurchaseMaster> list = jdbcTemplateObject.query(SQL,
				new RowMapper<PurchaseMaster>() {
					@Override
					public PurchaseMaster mapRow(java.sql.ResultSet rs,
							int rowMap) throws SQLException {
						PurchaseMaster object = new PurchaseMaster();
						object.setPurchaseMasterId(rs
								.getInt("purchaseMasterId"));
						object.setUserId(rs.getInt("userId"));
						object.setShippingAddressId(rs
								.getInt("shippingAddressId"));
						object.setFinalAmount(rs.getFloat("finalAmount"));
						object.setFinalQuantity(rs.getInt("finalQuantity"));
						object.setPurchaseDetails(getPurchaseDetails(rs
								.getInt("purchaseMasterId")));
						object.setDiscount(rs.getFloat("discount"));
						object.setPurchaseDateTime(rs
								.getTimestamp("purchaseDate"));
						return object;
					}
				}, userId);

		return (list != null && !list.isEmpty()) ? list : null;

	}

	@Override
	public List<PurchaseDetail> getPurchaseDetails(int purchaseMasterId) {
		String SQL = "{CALL getPurchaseDetails(?)}";
		List<PurchaseDetail> list = jdbcTemplateObject.query(SQL,
				new RowMapper<PurchaseDetail>() {
					@Override
					public PurchaseDetail mapRow(java.sql.ResultSet rs,
							int rowMap) throws SQLException {
						PurchaseDetail object = new PurchaseDetail();
						object.setPurchaseMasterId(rs
								.getInt("purchaseMasterId"));
						object.setPurchaseDetailId(rs
								.getInt("purchaseDetailId"));
						object.setProductId(rs.getInt("productId"));
						object.setQuantity(rs.getInt("quantity"));
						object.setPrice(rs.getFloat("price"));
						object.setTotalAmount(rs.getFloat("totalAmount"));
						object.setProduct(getProduct(rs.getInt("productId")));
						return object;
					}
				}, purchaseMasterId);
		return (list != null && !list.isEmpty()) ? list : null;
	}

	@Override
	public Product getProduct(int productId) {
		String SQL = "{CALL getProductById(?)}";
		List<Product> list = jdbcTemplateObject.query(SQL,
				new RowMapper<Product>() {
					@Override
					public Product mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {
						Product object = new Product();
						object.setProductId(rs.getInt("productId"));
						object.setProductName(rs.getString("productName"));
						object.setPrice(rs.getDouble("price"));
						object.setImageNamePath(rs.getString("imageNamePath"));
						object.setQuantity(rs.getInt("quantity"));
						object.setDiscount(rs.getDouble("discount"));
						object.setDescription(rs.getString("description"));
						object.setSubCategory(getSubCategory(rs.getInt("subCategoryId")));

						SubCategory subCategory = new SubCategory();
						subCategory.setSubCategoryId(rs.getInt("subCategoryId"));
						subCategory.setSubCategoryName(rs.getString("subCategoryName"));
						subCategory.setDescription(rs.getString("description"));

						return object;
					}
				}, productId);

		return (list != null && !list.isEmpty()) ? list.get(0) : null;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getSubCategory(int)
	 */
	@Override
	public SubCategory getSubCategory(int subCategoryId) {

		String SQL = "{CALL getSubCategory(?)}";
		List<SubCategory> list = jdbcTemplateObject.query(SQL,
				new RowMapper<SubCategory>() {
					@Override
					public SubCategory mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {

						SubCategory object = new SubCategory();
						object.setSubCategoryId(rs.getInt("subCategoryId"));
						object.setSubCategoryName(rs
								.getString("subCategoryName"));
						object.setDescription(rs.getString("description"));

						return object;
					}
				}, subCategoryId);

		return (list != null && !list.isEmpty()) ? list.get(0) : null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getCategory(int)
	 */
	public Category getCategory(int categoryId) {
		String SQL = "{CALL getCategory(?)}";
		List<Category> list = jdbcTemplateObject.query(SQL,
				new RowMapper<Category>() {
					@Override
					public Category mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {

						Category object = new Category();
						object.setCategoryId(rs.getInt("categoryId"));
						object.setCategoryName(rs.getString("categoryName"));

						return object;
					}
				}, categoryId);

		return (list != null && !list.isEmpty()) ? list.get(0) : null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.pk.ecommerce.dao.CustomerDao#addToCart(org.pk.ecommerce.entities.
	 * product.Cart)
	 */

	@Override
	public boolean addToCart(Cart cart) {
		String SQL = "{CALL addToCart(?, ?, ?)}";
		return jdbcTemplateObject.update(SQL, new Object[] { cart.getUserId(),
				cart.getProductId(), cart.getQuantity() }) == 1 ? true : false;
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.pk.ecommerce.dao.CustomerDao#removeFromCart(org.pk.ecommerce.entities.
	 * product.Cart)
	 */

	@Override
	public boolean removeFromCart(Cart cart) {
		String SQL = "{CALL removeFromCart(?, ?)}";
		return jdbcTemplateObject.update(SQL, new Object[] { cart.getUserId(),
				cart.getProductId()}) == 1 ? true : false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.pk.ecommerce.dao.CustomerDao#addShippingAddress(org.pk.ecommerce.
	 * entities.user.ShippingAddress)
	 */
	@Override
	public boolean addShippingAddress(ShippingAddress shippingAddress) {
		String SQL = "{CALL addShippingAddress(?, ?, ?)}";
		return jdbcTemplateObject
				.update(SQL,
						new Object[] { shippingAddress.getUserId(),
								shippingAddress.getCity(),
								shippingAddress.getAddress() }) == 1 ? true
				: false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.pk.ecommerce.dao.CustomerDao#updateShippingAddress(org.pk.ecommerce
	 * .entities.user.ShippingAddress)
	 */
	@Override
	public boolean updateShippingAddress(ShippingAddress shippingAddress) {
		String SQL = "{CALL updateShippingAddress(?, ?, ?, ?)}";
		return jdbcTemplateObject.update(
				SQL,
				new Object[] { shippingAddress.getCity(),
						shippingAddress.getAddress(),
						shippingAddress.getUserId(),
						shippingAddress.getShippingAddressId() }) == 1 ? true
				: false;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CustomerDao#getCarts(int)
	 */
	@Override
	public List<Cart> getCarts(int userId) {
		String SQL = "{CALL getCarts(?)}";
		List<Cart> list = jdbcTemplateObject.query(SQL, new RowMapper<Cart>() {
			@Override
			public Cart mapRow(java.sql.ResultSet rs, int rowMap)
					throws SQLException {
				Cart object = new Cart();

				return object;
			}
		}, userId);

		return (list != null && !list.isEmpty()) ? list : null;
	}

	public Cart getProductsFromCart(final int userId) {
		String SQL = "{CALL getProductsFromCart(?)}";
		List<Cart> list = jdbcTemplateObject.query(SQL, new RowMapper<Cart>() {
			@Override
			public Cart mapRow(java.sql.ResultSet rs, int rowMap)
					throws SQLException {
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setProducts(getCartProducts(userId));

				return cart;
			}
		}, userId);

		return (list != null && !list.isEmpty()) ? list.get(0) : null;

	}

	private List<Product> getCartProducts(final int userId) {
		String SQL = "{CALL getProductsFromCart(?)}";
		List<Product> list = jdbcTemplateObject.query(SQL,
				new RowMapper<Product>() {
					@Override
					public Product mapRow(java.sql.ResultSet rs, int rowMap)
							throws SQLException {
						Product object = new Product();
						object.setProductId(rs.getInt("productId"));
						object.setProductName(rs.getString("productName"));
						object.setPrice(rs.getDouble("price"));
						object.setImageNamePath(rs.getString("imageNamePath"));
						object.setQuantity(rs.getInt("cartQuantity"));
						object.setDiscount(rs.getDouble("discount"));
						object.setDescription(rs.getString("description"));

						object.setSubCategory(getSubCategory(rs
								.getInt("subCategoryId")));

						SubCategory subCategory = new SubCategory();
						subCategory.setSubCategoryId(rs.getInt("subCategoryId"));
						subCategory.setSubCategoryName(rs
								.getString("subCategoryName"));
						subCategory.setDescription(rs.getString("description"));

						return object;
					}
				}, userId);

		return (list != null && !list.isEmpty()) ? list : null;

	}
}
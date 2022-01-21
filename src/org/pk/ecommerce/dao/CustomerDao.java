package org.pk.ecommerce.dao;

import java.util.List;

import org.pk.ecommerce.entities.order.PurchaseDetail;
import org.pk.ecommerce.entities.order.PurchaseMaster;
import org.pk.ecommerce.entities.product.Cart;
import org.pk.ecommerce.entities.product.Category;
import org.pk.ecommerce.entities.product.Product;
import org.pk.ecommerce.entities.product.SubCategory;
import org.pk.ecommerce.entities.user.ShippingAddress;

/**
 * @author PKCorp
 * 
 */
public interface CustomerDao {

	/**
	 * @return
	 */
	List<Category> getAllCategories();

	/**
	 * @param categoryId
	 * @return
	 */
	List<SubCategory> getSubCategoriesByCategoryId(int categoryId);

	/**
	 * @param categoryId
	 * @return
	 */
	List<SubCategory> getAllSubCategories();

	/**
	 * @return
	 */
	Category getCategory(int categoryId);

	/**
	 * @param subCategoryId
	 * @return
	 */
	SubCategory getSubCategory(int subCategoryId);

	/**
	 * @param subCategory
	 * @param productName
	 * @param priceRange
	 * @return
	 */
	List<Product> getAllProductList(int subCategoryId, String productName,
			double priceRange);

	/**
	 * @param productId
	 * @return
	 */
	Product getProduct(int productId);

	/**
	 * @param purchaseMaster
	 * @return
	 */
	boolean addPurchaseMaster(PurchaseMaster purchaseMaster);

	/**
	 * @param purchaseDetail
	 * @return
	 */
	boolean addPurchaseDetail(PurchaseDetail purchaseDetail);

	/**
	 * @param userId
	 * @return
	 */
	List<PurchaseMaster> getPurchaseMaster(int userId);

	/**
	 * @param purchaseMasterId
	 * @return
	 */
	List<PurchaseDetail> getPurchaseDetails(int purchaseMasterId);

	/**
	 * @param cart
	 * @return if cart added successfully it will return true otherwise will
	 *         return false
	 */
	boolean addToCart(Cart cart);
	/**
	 * @param cart
	 * @return if cart removed successfully it will return true otherwise will
	 *         return false
	 */
	boolean removeFromCart(Cart cart);

	/**
	 * @param shippingAddress
	 * @return
	 */
	boolean addShippingAddress(ShippingAddress shippingAddress);

	/**
	 * @param shippingAddress
	 * @return
	 */
	boolean updateShippingAddress(ShippingAddress shippingAddress);

	/**
	 * @param userId
	 * @return
	 */
	List<Cart> getCarts(int userId);

	/**
	 * @param userId
	 * @return
	 */
	Cart getProductsFromCart(int userId);

}
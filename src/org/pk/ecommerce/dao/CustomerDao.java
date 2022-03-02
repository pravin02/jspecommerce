package org.pk.ecommerce.dao;

import java.util.List;

import org.pk.ecommerce.auction.Auction;
import org.pk.ecommerce.auction.Bid;
import org.pk.ecommerce.entities.order.PurchaseDetail;
import org.pk.ecommerce.entities.order.PurchaseMaster;
import org.pk.ecommerce.entities.product.Cart;
import org.pk.ecommerce.entities.product.Category;
import org.pk.ecommerce.entities.product.Feedback;
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
	List<Product> getAllProductList(int subCategoryId, String productName, double priceRange);
	
	List<Product> getAllProductList();

	/**
	 * @param productId
	 * @return
	 */
	Product getProduct(int productId);

	/**
	 * 
	 * @param product
	 * @return
	 */
	boolean addProduct(Product product);

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

	List<PurchaseMaster> getPurchaseMasterForAdmin();

	List<PurchaseMaster> getPurchaseMasterForDriver(int userId);

	PurchaseMaster getPurchaseMasterByUserId(int orderId);

	PurchaseMaster getLatestPurchaseMaster(int userId);

	/**
	 * @param purchaseMasterId
	 * @return
	 */
	List<PurchaseDetail> getPurchaseDetails(int purchaseMasterId);

	/**
	 * @param cart
	 * @return if cart added successfully it will return true otherwise will return
	 *         false
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

	void emptyCart(int userId);

	boolean assignDriverToOrder(int orderId, int driverId);

	List<Feedback> viewAllFeedbacks();

	boolean updateOrderStatus(int orderId, String status);

	public void makeAuction(Auction auction);

	public Auction getAuction(int auctionId);

	public List<Auction> getAllAuctionsThanLoggedInId(int userId);

	public List<Auction> getAllAuctionsRaisedByMe(int userId);

	public boolean addBid(Bid bid);

	public boolean makeTheDeal(int auctionId, int userId, double bidPrice);

}
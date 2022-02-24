package org.pk.ecommerce.auction;

import java.util.List;

import org.pk.ecommerce.entities.product.Product;
import org.pk.ecommerce.entities.user.User;

public class Auction {

	private int auctionId;
	private int sellerId;
	private User seller;
	private int buyerId;
	private User buyer;
	private int productId;
	private Product product;
	private double price;
	private double buyPrice;
	private boolean status;
	private List<Bid> bids;

	/**
	 * @return the auctionId
	 */
	public int getAuctionId() {
		return auctionId;
	}

	/**
	 * @param auctionId the auctionId to set
	 */
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}

	/**
	 * @return the sellerId
	 */
	public int getSellerId() {
		return sellerId;
	}

	/**
	 * @param sellerId the sellerId to set
	 */
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	/**
	 * @return the buyerId
	 */
	public int getBuyerId() {
		return buyerId;
	}

	/**
	 * @param buyerId the buyerId to set
	 */
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return the product
	 */
	public Product getProduct() {
		return product;
	}

	/**
	 * @param product the product to set
	 */
	public void setProduct(Product product) {
		this.product = product;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the buyPrice
	 */
	public double getBuyPrice() {
		return buyPrice;
	}

	/**
	 * @param buyPrice the buyPrice to set
	 */
	public void setBuyPrice(double buyPrice) {
		this.buyPrice = buyPrice;
	}

	/**
	 * @return the status
	 */
	public boolean getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(boolean status) {
		this.status = status;
	}

	/**
	 * @return the bids
	 */
	public List<Bid> getBids() {
		return bids;
	}

	/**
	 * @param bids the bids to set
	 */
	public void setBids(List<Bid> bids) {
		this.bids = bids;
	}

	/**
	 * @return the seller
	 */
	public User getSeller() {
		return seller;
	}

	/**
	 * @param seller the seller to set
	 */
	public void setSeller(User seller) {
		this.seller = seller;
	}

	/**
	 * @return the buyer
	 */
	public User getBuyer() {
		return buyer;
	}

	/**
	 * @param buyer the buyer to set
	 */
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	@Override
	public String toString() {
		return "Auction [auctionId=" + auctionId + ", sellerId=" + sellerId + ", buyerId=" + buyerId + ", productId="
				+ productId + ", product=" + product + ", price=" + price + ", buyPrice=" + buyPrice + ", status="
				+ status + ", bids=" + bids + "]";
	}

}

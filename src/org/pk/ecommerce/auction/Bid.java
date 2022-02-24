package org.pk.ecommerce.auction;

import org.pk.ecommerce.entities.user.User;

public class Bid {

	private int bidId;
	private int auctionId;
	private int bidderId;
	private User bidder;
	private double price;

	/**
	 * @return the bidId
	 */
	public int getBidId() {
		return bidId;
	}

	/**
	 * @param bidId the bidId to set
	 */
	public void setBidId(int bidId) {
		this.bidId = bidId;
	}

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
	 * @return the bidderId
	 */
	public int getBidderId() {
		return bidderId;
	}

	/**
	 * @param bidderId the bidderId to set
	 */
	public void setBidderId(int bidderId) {
		this.bidderId = bidderId;
	}

	/**
	 * @return the bidder
	 */
	public User getBidder() {
		return bidder;
	}

	/**
	 * @param bidder the bidder to set
	 */
	public void setBidder(User bidder) {
		this.bidder = bidder;
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

	@Override
	public String toString() {
		return "Bid [bidId=" + bidId + ", auctionId=" + auctionId + ", bidderId=" + bidderId + ", bidder=" + bidder
				+ ", price=" + price + "]";
	}

}

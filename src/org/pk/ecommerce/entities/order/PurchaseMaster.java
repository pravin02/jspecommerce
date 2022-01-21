package org.pk.ecommerce.entities.order;

import java.sql.Timestamp;
import java.util.List;

public class PurchaseMaster {

	private int userId;
	private int purchaseMasterId;
	private int shippingAddressId;
	private int finalQuantity;
	private float finalAmount;
	private float discount;
	private Timestamp purchaseDateTime;

	private List<PurchaseDetail> purchaseDetails;

	/**
	 * @return
	 */
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPurchaseMasterId() {
		return purchaseMasterId;
	}

	public void setPurchaseMasterId(int purchaseMasterId) {
		this.purchaseMasterId = purchaseMasterId;
	}

	public int getShippingAddressId() {
		return shippingAddressId;
	}

	public void setShippingAddressId(int shippingAddressId) {
		this.shippingAddressId = shippingAddressId;
	}

	public int getFinalQuantity() {
		return finalQuantity;
	}

	public void setFinalQuantity(int finalQuantity) {
		this.finalQuantity = finalQuantity;
	}

	public float getFinalAmount() {
		return finalAmount;
	}

	public void setFinalAmount(float finalAmount) {
		this.finalAmount = finalAmount;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	/**
	 * @return the purchaseDetails
	 */
	public List<PurchaseDetail> getPurchaseDetails() {
		return purchaseDetails;
	}

	/**
	 * @param purchaseDetails
	 *            the purchaseDetails to set
	 */
	public void setPurchaseDetails(List<PurchaseDetail> purchaseDetails) {
		this.purchaseDetails = purchaseDetails;
	}

	/**
	 * @return the purchaseDateTime
	 */
	public Timestamp getPurchaseDateTime() {
		return purchaseDateTime;
	}

	/**
	 * @param purchaseDateTime
	 *            the purchaseDateTime to set
	 */
	public void setPurchaseDateTime(Timestamp purchaseDateTime) {
		this.purchaseDateTime = purchaseDateTime;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PurchaseMaster [userId=" + userId + ", purchaseMasterId="
				+ purchaseMasterId + ", shippingAddressId=" + shippingAddressId
				+ ", finalQuantity=" + finalQuantity + ", finalAmount="
				+ finalAmount + ", discount=" + discount
				+ ", purchaseDetails.size="
				+ (purchaseDetails != null ? purchaseDetails.size() : 0)+ "]";
	}

}

package org.pk.ecommerce.entities.order;

import java.sql.Timestamp;
import java.util.List;

public class PurchaseMaster {

	private int userId;
	private int driverId;
	private int purchaseMasterId;
	private String shippingAddress;
	private String contact;
	private String status;
	private Timestamp purchaseDateTime;

	private List<PurchaseDetail> purchaseDetails;

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the driverId
	 */
	public int getDriverId() {
		return driverId;
	}

	/**
	 * @param driverId the driverId to set
	 */
	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	/**
	 * @return the purchaseMasterId
	 */
	public int getPurchaseMasterId() {
		return purchaseMasterId;
	}

	/**
	 * @param purchaseMasterId the purchaseMasterId to set
	 */
	public void setPurchaseMasterId(int purchaseMasterId) {
		this.purchaseMasterId = purchaseMasterId;
	}

	/**
	 * @return the shippingAddress
	 */
	public String getShippingAddress() {
		return shippingAddress;
	}

	/**
	 * @param shippingAddress the shippingAddress to set
	 */
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	/**
	 * @return the contact
	 */
	public String getContact() {
		return contact;
	}

	/**
	 * @param contact the contact to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the purchaseDateTime
	 */
	public Timestamp getPurchaseDateTime() {
		return purchaseDateTime;
	}

	/**
	 * @param purchaseDateTime the purchaseDateTime to set
	 */
	public void setPurchaseDateTime(Timestamp purchaseDateTime) {
		this.purchaseDateTime = purchaseDateTime;
	}

	/**
	 * @return the purchaseDetails
	 */
	public List<PurchaseDetail> getPurchaseDetails() {
		return purchaseDetails;
	}

	/**
	 * @param purchaseDetails the purchaseDetails to set
	 */
	public void setPurchaseDetails(List<PurchaseDetail> purchaseDetails) {
		this.purchaseDetails = purchaseDetails;
	}

}

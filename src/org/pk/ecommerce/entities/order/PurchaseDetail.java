package org.pk.ecommerce.entities.order;

import org.pk.ecommerce.entities.product.Product;

public class PurchaseDetail {

	private int purchaseMasterId;
	private int purchaseDetailId;
	private int productId;
	private int quantity;
	private double price;

	private Product product;

	public PurchaseDetail() {

	}

	public PurchaseDetail(int masterId, Product product) {
		this.purchaseMasterId = masterId;
		this.productId = product.getProductId();
		this.quantity = product.getQuantity();
		this.price = product.getPrice();
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
	 * @return the purchaseDetailId
	 */
	public int getPurchaseDetailId() {
		return purchaseDetailId;
	}

	/**
	 * @param purchaseDetailId the purchaseDetailId to set
	 */
	public void setPurchaseDetailId(int purchaseDetailId) {
		this.purchaseDetailId = purchaseDetailId;
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
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PurchaseDetail [purchaseMasterId=" + purchaseMasterId + ", purchaseDetailId=" + purchaseDetailId
				+ ", productId=" + productId + ", quantity=" + quantity + ", price=" + price + ", product=" + product
				+ "]";
	}

}

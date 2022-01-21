package org.pk.ecommerce.entities.product;

import java.util.List;

public class Cart {
	private int cartId;
	private int productId;
	private int quantity;	
	private int userId;
	private float discount;
	private List<Product> products;

	/**
	 * @return the cartId
	 */
	public int getCartId() {
		return cartId;
	}

	/**
	 * @param cartId
	 *            the cartId to set
	 */
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
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
	 * @param quantity
	 *            the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	

	/**
	 * @return the products
	 */
	public List<Product> getProducts() {
		return products;
	}

	/**
	 * @param products the products to set
	 */
	public void setProducts(List<Product> products) {
		this.products = products;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the discount
	 */
	public float getDiscount() {
		return discount;
	}

	/**
	 * @param discount
	 *            the discount to set
	 */
	public void setDiscount(float discount) {
		this.discount = discount;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", productId=" + productId
				+ ", quantity=" + quantity + ", product=" + products
				+ ", userId=" + userId + ", discount=" + discount + "]";
	}

}

package org.pk.ecommerce.entities.product;

public class Product {

	private int productId;
	private SubCategory subCategory;
	private String companyName;
	private String productName;
	private String imageNamePath;
	private double priceRange;
	private int quantity;
	private double discount;
	private String description;
	private boolean isDeleted;

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
	 * @return the subCategory
	 */
	public SubCategory getSubCategory() {
		return subCategory;
	}

	/**
	 * @param subCategory
	 *            the subCategory to set
	 */
	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName
	 *            the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the imageNamePath
	 */
	public String getImageNamePath() {
		return imageNamePath;
	}

	/**
	 * @param imageNamePath
	 *            the imageNamePath to set
	 */
	public void setImageNamePath(String imageNamePath) {
		this.imageNamePath = imageNamePath;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return priceRange;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(double priceRange) {
		this.priceRange = priceRange;
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
	 * @return the discount
	 */
	public double getDiscount() {
		return discount;
	}

	/**
	 * @param d
	 *            the discount to set
	 */
	public void setDiscount(double d) {
		this.discount = d;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the isDeleted
	 */
	public boolean isDeleted() {
		return isDeleted;
	}

	/**
	 * @param isDeleted
	 *            the isDeleted to set
	 */
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

}

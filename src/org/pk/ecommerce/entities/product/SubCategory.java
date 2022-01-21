package org.pk.ecommerce.entities.product;

public class SubCategory {

	private int subCategoryId;
	private String subCategoryName;
	private String description;
	private Category category;
	/**
	 * @return the subCategoryId
	 */
	public int getSubCategoryId() {
		return subCategoryId;
	}
	/**
	 * @param subCategoryId the subCategoryId to set
	 */
	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	/**
	 * @return the subCategoryName
	 */
	public String getSubCategoryName() {
		return subCategoryName;
	}
	/**
	 * @param subCategoryName the subCategoryName to set
	 */
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
	}
	
	
	
}

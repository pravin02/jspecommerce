/**
 * 
 */
package org.pk.ecommerce.entities.product;

import java.util.List;

/**
 * @author SHREE
 * @since 1.0
 * @category ECommerce 
 *  Last modified : 3:33 PM 08/02/2017
 *  
 * 
 */
public class Category {

	private int categoryId;
	private String categoryName;
	List<SubCategory> subCategories;

	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId
	 *            the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the categoryName
	 */
	public String getCategoryName() {
		return categoryName;
	}

	/**
	 * @param categoryName
	 *            the categoryName to set
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	

	/**
	 * @return
	 */
	public List<SubCategory> getSubCategories() {
		return subCategories;
	}

	public void setSubCategories(List<SubCategory> subCategories) {
		this.subCategories = subCategories;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName="
				+ categoryName + ", categories=" + subCategories + "]";
	}
	
}

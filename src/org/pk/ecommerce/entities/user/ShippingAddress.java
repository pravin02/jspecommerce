package org.pk.ecommerce.entities.user;

public class ShippingAddress {

	private int shippingAddressId;
	private String city;
	private String address;
	private User userId;

	/**
	 * @return the shippingAddressId
	 */
	public int getShippingAddressId() {
		return shippingAddressId;
	}

	/**
	 * @param shippingAddressId
	 *            the shippingAddressId to set
	 */
	public void setShippingAddressId(int shippingAddressId) {
		this.shippingAddressId = shippingAddressId;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the userId
	 */
	public User getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(User userId) {
		this.userId = userId;
	}

}

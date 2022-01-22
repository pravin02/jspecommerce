package org.pk.ecommerce.entities.user;

public enum UserType {

	Farmer, Admin, Driver;

	public static UserType getUserType(String type) {
		if (type == null)
			return null;
		for (UserType ut : UserType.values()) {
			if (ut.name().equals(type)) {
				return ut;
			}
		}
		return null;
	}
}

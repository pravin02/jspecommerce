package org.pk.ecommerce.dao;

import java.util.List;

import org.pk.ecommerce.entities.user.User;

/**
 * @author PKCorp
 * 
 */
public interface CommonDao {
	/**
	 * @param user
	 * @return
	 */
	boolean registerUser(User user);

	/**
	 * @param userName
	 * @return
	 */
	boolean isUserAllreadyRegistered(String userName);

	/**
	 * @param mobileNumber
	 * @param emailId
	 * @return
	 */
	String isMobileOrEmailAllreadyExists(String mobileNumber, String emailId);

	/**
	 * @param userName
	 * @param password
	 * @return
	 */
	User loginFarmerUser(String userName, String password);

	/**
	 * @param userName
	 * @param password
	 * @return
	 */
	User loginAdminUser(String userName, String password);

	/**
	 * @param userName
	 * @param password
	 * @return
	 */
	User loginDriverUser(String userName, String password);

	/**
	 * @param userId
	 * @param oldPassword
	 * @param newPassword
	 * @return
	 */
	String updatePassword(String emailId, String oldPassword, String newPassword);

	/**
	 * 
	 * @param userId
	 * @return
	 */
	User getUserByEmailId(String emailId);
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	User getUserByUserId(int userId);

	/**
	 * 
	 * @param userId
	 * @param feedback
	 * @return
	 */
	boolean submitFeedback(int userId, String feedback);
	
	List<User> getAllDrivers();

}

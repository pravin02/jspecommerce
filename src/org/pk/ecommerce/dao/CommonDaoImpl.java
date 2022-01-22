package org.pk.ecommerce.dao;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.pk.ecommerce.entities.user.User;
import org.pk.ecommerce.entities.user.UserType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * LoginDaoImpl providing implementation for LoginDao interface. LoginDaoImpl
 * code used to login
 * 
 * @author SHREE
 */
@Component
public class CommonDaoImpl implements CommonDao {

	/**
	 * dataSource object is useful to get driver details of different types of
	 * database vendors like MYSql, Oracle, SQL Server, Cybase
	 */
	// private DataSource dataSource;
	/**
	 * jdbcTemplateObject is used to actually make connection with database and
	 * Spring JDBC API.
	 */
	private JdbcTemplate jdbcTemplateObject;

	@Autowired
	CustomerDao customerDao;

	// private DataSource dataSource;

	/**
	 * dataSource object will be injected by spring configuration at run time.
	 * 
	 * @param dataSource
	 */
	public void setDataSource(DataSource dataSource) {
		// this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
		// System.out.println("DataSource " + this.dataSource);
		// System.out.println("jdbcTemplateObject " + jdbcTemplateObject);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.CommonDao#registerUser(org.pk.ecommerce.entities
	 * .user.User)
	 */
	@Override
	public boolean registerUser(User user) {
		String SQL = "{CALL registerUser(?, ?, ?, ?, ?, ?)}";
		return jdbcTemplateObject.update(SQL, new Object[] { user.getEmailId(), user.getPassword(), user.getFullName(),
				user.getMobileNo(), user.getGender(), user.getDob() }) == 1 ? true : false;

	}

	/**
	 * to check user details already exists in database or not.
	 * 
	 * @see org.pk.ecommerce.dao.CommonDao#isUserAllreadyRegistered(java.lang.String)
	 * 
	 * @return will return true if userName exists in database other wise return
	 *         false.
	 */
	@Override
	public boolean isUserAllreadyRegistered(String userName) {
		String SQL = "{CALL isUserAlreadyExists(?)}";
		List<String> list = jdbcTemplateObject.query(SQL, (java.sql.ResultSet rs, int rowMap) -> rs.getString(1),
				userName);
		return !list.isEmpty();
	}

	/**
	 * to check mobileNumber or emailId exists in database or not
	 * 
	 * @see org.pk.ecommerce.dao.CommonDao#isMobileOrEmailAllreadyExists(java.lang.String,
	 *      java.lang.String)
	 * 
	 * @return java.lang.String object which may have 3 values 1) Mobile number
	 *         exists 2) Email Id exists 3) null if both not exists in database
	 */
	@Override
	public String isMobileOrEmailAllreadyExists(String mobileNumber, String emailId) {
		String SQL = "{CALL checkMobileOrEmailExists(?, ?)}";
		List<String> list = jdbcTemplateObject.query(SQL, (java.sql.ResultSet rs, int rowMap) -> rs.getString(1),
				new Object[] { mobileNumber, emailId });
		return (list != null && !list.isEmpty()) ? list.get(0) : null;
	}

	/**
	 * to validate login details of UserType ADMIN OR USER
	 * 
	 * 
	 * @param this method takes 2 values as input 1) userName and 2) password
	 * 
	 * @return It returns User Object if userName and password exists in database
	 *         otherwise it will return null
	 * @see org.pk.ecommerce.dao.CommonDao#loginUser(java.lang.String,
	 *      java.lang.String)
	 * 
	 */
	@Override
	public User loginFarmerUser(String userName, String password) {
		String SQL = "SELECT * FROM user where type = 'Farmer' and emailId=? and password=?";
		List<User> list = jdbcTemplateObject.query(SQL, (java.sql.ResultSet rs, int rowMap) -> mapRsToUser(rs),
				new Object[] { userName, password });
		return (list != null && !list.isEmpty()) ? list.get(0) : null;
	}

	@Override
	public User loginAdminUser(String userName, String password) {
		String SQL = "SELECT * FROM user where type = 'Admin' and emailId=? and password=?";
		List<User> list = jdbcTemplateObject.query(SQL, (java.sql.ResultSet rs, int rowMap) -> mapRsToUser(rs),
				new Object[] { userName, password });
		return (list != null && !list.isEmpty()) ? list.get(0) : null;
	}

	@Override
	public User loginDriverUser(String userName, String password) {
		String SQL = "SELECT * FROM user where type = 'Driver' and emailId=? and password=?";
		List<User> list = jdbcTemplateObject.query(SQL, (java.sql.ResultSet rs, int rowMap) -> mapRsToUser(rs),
				new Object[] { userName, password });
		return (list != null && !list.isEmpty()) ? list.get(0) : null;
	}

	public User mapRsToUser(java.sql.ResultSet rs) throws SQLException {
		User user = new User();
		user.setUserId(rs.getInt("userId"));
		user.setPassword(rs.getString("password"));
		user.setFullName(rs.getString("fullName"));
		user.setDob(rs.getString("dob"));
		user.setGender(rs.getString("gender"));
		user.setMobileNo(rs.getString("mobileNumber"));
		user.setEmailId(rs.getString("emailId"));
		user.setType(UserType.getUserType(rs.getString("type")));
		user.setCarts(customerDao.getCarts(rs.getInt("userId")));
		return user;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.pk.ecommerce.dao.LoginDao#updatePassword(int, java.lang.String,
	 * java.lang.String)
	 */
	public String updatePassword(String emailId, String oldPassword, String newPassword) {
		String SQL = "{CALL updatePassword(?, ?, ?)}";
		List<String> list = jdbcTemplateObject.query(SQL,
				(java.sql.ResultSet rs, int rowMap) -> rs.getString("message"), emailId, oldPassword, newPassword);
		return (list != null && list.size() == 1) ? list.get(0) : null;
	}

	@Override
	public User getUserByUserId(String emailId) {
		String SQL = "SELECT * FROM user WHERE emailId=?";
		List<User> list = jdbcTemplateObject.query(SQL, (java.sql.ResultSet rs, int rowMap) -> mapRsToUser(rs),
				emailId);
		return (list != null && list.size() == 1) ? list.get(0) : null;
	}

}
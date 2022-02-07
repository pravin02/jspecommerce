-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ecommerce
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ ecommerce;
USE ecommerce;

--
-- Table structure for table `ecommerce`.`feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedbackId` int(10) unsigned NOT NULL auto_increment,
  `userId` int(10) unsigned NOT NULL default '0',
  `feedback` varchar(1000) NOT NULL default '',
  `datetime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`feedbackId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` (`feedbackId`,`userId`,`feedback`,`datetime`) VALUES 
 (5,2,'Welcome','2021-01-01 01:01:01'),
 (6,2,'welcome','2021-01-01 01:01:01'),
 (7,2,'Notice that you must repeat the column name. Also, make sure you are using backticks instead of single quotes to escape the column name time, which prevents it from being interpreted as the mysql column type of time.','2022-02-07 20:13:33');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL auto_increment,
  `subCategoryId` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `imageNamePath` varchar(200) default NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL default '0',
  `discount` float default '0',
  `description` varchar(300) default NULL,
  `isDeleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`productId`,`subCategoryId`,`productName`,`companyName`,`imageNamePath`,`price`,`quantity`,`discount`,`description`,`isDeleted`) VALUES 
 (1,1,'Buffalo 1','buffalo','images/pets/buffalo1.jpg',80000,1,0,'new breed',0),
 (2,2,'Buffalo 2','Buffalo','images/pets/buffalo2.jpg',100000,1,0,'new breed',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `categoryId` int(11) NOT NULL auto_increment,
  `categoryName` varchar(45) NOT NULL,
  PRIMARY KEY  (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`productcategory`
--

/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` (`categoryId`,`categoryName`) VALUES 
 (1,'COW'),
 (2,'BUFFALO');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`productsubcategory`
--

DROP TABLE IF EXISTS `productsubcategory`;
CREATE TABLE `productsubcategory` (
  `subCategoryId` int(11) NOT NULL auto_increment,
  `categoryId` int(11) NOT NULL,
  `subCategoryName` varchar(50) NOT NULL,
  `description` varchar(100) default NULL,
  PRIMARY KEY  (`subCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`productsubcategory`
--

/*!40000 ALTER TABLE `productsubcategory` DISABLE KEYS */;
INSERT INTO `productsubcategory` (`subCategoryId`,`categoryId`,`subCategoryName`,`description`) VALUES 
 (1,1,'Gir',''),
 (2,1,'Red Sindhi',''),
 (3,1,'Sahiwal',''),
 (4,2,' water buffalo',''),
 (5,2,' cape buffalo',''),
 (6,2,'American buffalo','');
/*!40000 ALTER TABLE `productsubcategory` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`purchasedetails`
--

DROP TABLE IF EXISTS `purchasedetails`;
CREATE TABLE `purchasedetails` (
  `purchaseDetailId` int(11) NOT NULL auto_increment,
  `purchaseMasterId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY  (`purchaseDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`purchasedetails`
--

/*!40000 ALTER TABLE `purchasedetails` DISABLE KEYS */;
INSERT INTO `purchasedetails` (`purchaseDetailId`,`purchaseMasterId`,`productId`,`quantity`,`price`) VALUES 
 (1,3,1,1,80000),
 (2,4,2,1,100000),
 (3,5,1,1,80000),
 (4,5,2,2,100000);
/*!40000 ALTER TABLE `purchasedetails` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`purchasemaster`
--

DROP TABLE IF EXISTS `purchasemaster`;
CREATE TABLE `purchasemaster` (
  `purchaseMasterId` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL,
  `shippingAddress` varchar(400) NOT NULL default '',
  `purchaseDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `driverId` int(10) unsigned NOT NULL default '0',
  `contact` varchar(45) NOT NULL default '',
  `status` varchar(45) NOT NULL default 'Order Placed',
  PRIMARY KEY  (`purchaseMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`purchasemaster`
--

/*!40000 ALTER TABLE `purchasemaster` DISABLE KEYS */;
INSERT INTO `purchasemaster` (`purchaseMasterId`,`userId`,`shippingAddress`,`purchaseDate`,`driverId`,`contact`,`status`) VALUES 
 (3,2,'Hadapsar, Sasane Nagar, 411028, Maharashtra','2022-02-07 17:45:28',3,'07276622442','Driver Assigned'),
 (4,2,'Hadapsar, Sasane Nagar, 411028, Maharashtra','2022-02-07 17:48:43',0,'07276622442','Order Placed'),
 (5,2,'Hadapsar, Sasane Nagar, 424201, Maharashtra','2022-02-07 17:49:34',0,'7276622442','Order Placed');
/*!40000 ALTER TABLE `purchasemaster` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `cartId` int(10) unsigned NOT NULL auto_increment,
  `userId` int(10) unsigned NOT NULL default '0',
  `productId` int(10) unsigned NOT NULL default '0',
  `quantity` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cartId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`shoppingcart`
--

/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL auto_increment,
  `emailId` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullName` varchar(45) NOT NULL,
  `mobileNumber` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(10) default NULL,
  `type` enum('Farmer','Admin','Driver') NOT NULL default 'Farmer',
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`,`emailId`,`password`,`fullName`,`mobileNumber`,`gender`,`dob`,`type`) VALUES 
 (1,'ppp@gmail.com','ppp','Pravin P Patil','1234567890','MALE','01-01-2022','Admin'),
 (2,'test@gmail.com','new','Tester','1234567890','MALE','01-11-1212','Farmer'),
 (3,'driver@gmail.com','driver','Omkar Patil','1234567890','MALE','01-01-2022','Driver'),
 (4,'driver2@gmail.com','driver2','Sunil','1212121212','MALE','01-01-2022','Driver');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Procedure `ecommerce`.`addToCart`
--

DROP PROCEDURE IF EXISTS `addToCart`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addToCart`(IN p_userId INT,IN p_productId INT,IN p_quantity INTEGER)
BEGIN
  SET @v_count = 0;
  select count(quantity) into @v_count from shoppingcart where userId = p_userId and productId = p_productId;
  if (@v_count <= 0)  then
  	insert into shoppingcart(userId,productId,quantity)values(p_userId,p_productId,p_quantity);
  end if;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`checkMobileOrEmailExists`
--

DROP PROCEDURE IF EXISTS `checkMobileOrEmailExists`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkMobileOrEmailExists`(IN p_mobileNo varchar(100), IN p_userName varchar(100))
BEGIN
	select emailId from user where emailId=p_userName;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getAllCategories`
--

DROP PROCEDURE IF EXISTS `getAllCategories`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCategories`()
BEGIN



	SELECT * FROM productcategory;



END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getAllProductList`
--

DROP PROCEDURE IF EXISTS `getAllProductList`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllProductList`(IN p_subCategoryId INT, IN p_name VARCHAR(100), IN p_priceRange DOUBLE)
BEGIN

	

	SELECT 

    c.*,

    sc.*,

    p.*

FROM

    productCategory c

        INNER JOIN

    productSubCategory sc ON c.categoryId = sc.categoryId

        INNER JOIN

    product p ON sc.subCategoryId = p.subCategoryId

WHERE

    p.productname LIKE concat('%', p_name, '%')

    AND p.subCategoryId = p_subCategoryId;

    

END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getCarts`
--

DROP PROCEDURE IF EXISTS `getCarts`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarts`(IN p_userId INT)
BEGIN
	SELECT * FROM shoppingCart WHERE userId = p_userId;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getCategory`
--

DROP PROCEDURE IF EXISTS `getCategory`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCategory`(IN p_categoryId INT)
BEGIN

	SELECT * FROM productcategory WHERE categoryId = p_categoryId;

END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getProduct`
--

DROP PROCEDURE IF EXISTS `getProduct`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProduct`(IN p_productId INT)
BEGIN

	SELECT * FROM product WHERE productId = p_productId;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getProductById`
--

DROP PROCEDURE IF EXISTS `getProductById`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductById`(IN p_productId INT)
BEGIN

		SELECT p.*, psc.* FROM product p
    INNER JOIN productSubCategory psc
    ON p.subCategoryId = psc.subCategoryId
    WHERE productId = p_productId;

END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getProductsFromCart`
--

DROP PROCEDURE IF EXISTS `getProductsFromCart`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductsFromCart`(IN p_userId INT)
BEGIN
    SELECT s.cartId, s.quantity AS cartQuantity, p.*, psc.* FROM shoppingcart s
    INNER JOIN product p
    ON p.productId = s.productId
    INNER JOIN productSubCategory psc
    ON p.subCategoryId = psc.subCategoryId
    WHERE s.userId = p_userId;

END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getPurchaseDetails`
--

DROP PROCEDURE IF EXISTS `getPurchaseDetails`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPurchaseDetails`(IN p_purchaseMasterId INT)
BEGIN

	SELECT * FROM purchaseDetails WHERE purchaseMasterId = p_purchaseMasterId;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getPurchaseHistoryByUserId`
--

DROP PROCEDURE IF EXISTS `getPurchaseHistoryByUserId`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPurchaseHistoryByUserId`(IN p_userId INT)
BEGIN

	SELECT 
    pm.purchaseMasterId,
    pm.shippingAddressId,
    pm.finalAmount,
    pm.discount,
    pm.purchaseDate,
    pd.purchaseDetailId,
    pd.productId,
    pd.quantity,
    pd.price,
    pd.totalAmount
FROM
    purchaseMaster pm
        INNER JOIN
    purchaseDetails pd ON pm.purchaseMasterId = pd.purchaseMasterId
WHERE
    userId = p_userId;

END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getPurchaseMaster`
--

DROP PROCEDURE IF EXISTS `getPurchaseMaster`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPurchaseMaster`(IN p_userId INT)
BEGIN

		SELECT * FROM purchaseMaster WHERE userId = p_userId;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getShippingAddressesByUserId`
--

DROP PROCEDURE IF EXISTS `getShippingAddressesByUserId`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getShippingAddressesByUserId`(IN p_userId INT)
BEGIN
	select *from shippingaddress where userId=p_userId;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getSubCategoriesByCategoryId`
--

DROP PROCEDURE IF EXISTS `getSubCategoriesByCategoryId`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubCategoriesByCategoryId`(IN p_categoryId INT)
BEGIN

               SELECT * FROM productSubCategory WHERE categoryId = p_categoryId;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`getSubCategory`
--

DROP PROCEDURE IF EXISTS `getSubCategory`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubCategory`(IN p_subCategoryId INT)
BEGIN



	SELECT * FROM productSubCategory WHERE subCategoryId = p_subCategoryId;



END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`isUserAlreadyExists`
--

DROP PROCEDURE IF EXISTS `isUserAlreadyExists`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `isUserAlreadyExists`(IN p_userName varchar(100))
BEGIN
	select emailId from user where emailId=p_userName;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`loginUser`
--

DROP PROCEDURE IF EXISTS `loginUser`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `loginUser`(p_userName VARCHAR(100), p_password VARCHAR(20))
BEGIN

	select * from user where emailId = p_userName AND password = p_password;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`registerUser`
--

DROP PROCEDURE IF EXISTS `registerUser`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registerUser`(
IN p_emailId varchar(100), 
IN p_password varchar(15),
IN p_fullName varchar(100), 
IN p_mobileNo varchar(15),
IN p_gender varchar(10), 
IN p_dob varchar(10))
BEGIN
	
	insert into user(emailId, password, fullName, mobileNumber, gender, dob) 
    values(p_emailId,p_password,p_fullName,p_mobileNo,p_gender,p_dob);
	
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`removeFromCart`
--

DROP PROCEDURE IF EXISTS `removeFromCart`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `removeFromCart`(IN p_userId INT, IN p_productId INT)
BEGIN

	delete from shoppingCart where userId =p_userId and productId = p_productId;

END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`updatePassword`
--

DROP PROCEDURE IF EXISTS `updatePassword`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePassword`(IN p_emailId varchar(200),IN p_oldPassword varchar(100),IN p_newPassword varchar(100))
BEGIN



	DECLARE p_message VARCHAR(100);



    



    IF(select password from user where emailId = p_emailId and password <> p_oldPassword)



    THEN



		SET p_message = 'old password not matched' ;



	ELSE



		UPDATE user set password = p_newPassword where emailId = p_emailId;



        SET p_message = 'password updated successfully.' ;



    END IF;















    SELECT p_message as message;



END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`updateShippingAddress`
--

DROP PROCEDURE IF EXISTS `updateShippingAddress`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShippingAddress`(IN p_shippingAddressId INT,IN p_userId INT,IN p_city varchar(100),IN p_address varchar(300))
BEGIN
	update shippingaddress set city=p_city,address = p_address where userId=p_userId 
    and shippingAddressId=p_shippingAddressId;
    
END $$

DELIMITER ;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

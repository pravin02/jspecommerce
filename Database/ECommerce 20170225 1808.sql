-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.39


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
-- Table structure for table `ecommerce`.`product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `subCategoryId` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `imageNamePath` varchar(200) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `discount` float DEFAULT '0',
  `description` varchar(300) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`productId`,`subCategoryId`,`productName`,`companyName`,`imageNamePath`,`price`,`quantity`,`discount`,`description`,`isDeleted`) VALUES 
 (1,1,'United Colors of Benetton Black Skinny Jeans','Lee',' images\\shop\\product1.jpg',1838,70,10,'United Colors of Benetton Black Skinny Jeans',0),
 (2,1,'United Colors of Benetton Green Casuals Regular Fit Shirt','Lee','images\\shop\\product2.jpg',2339,80,15,'United Colors of Benetton Green Casuals Regular Fit Shirt',0),
 (3,2,'AT Classic Formal Shoes','Woodland','images\\shop\\product3.jpg',575,40,20,'AT Classic Formal Shoes',0),
 (4,2,'Carlton London Maroon Office Genuine Leather Formal Shoes','Woodland','images\\shop\\product4jpg',2234,60,10,'Carlton London Maroon Office Genuine Leather Formal Shoe',0),
 (5,3,'Elligator Black & Brown Casual Belt For Men - Set Of 2','Belts','images\\shop\\product5.jpg',270,45,0,'Elligator Black & Brown Casual Belt For Men - Set Of 2',0),
 (6,3,'Discover Fashion Multi PU Formal Belts','Belts','images\\shop\\product6.jpg',390,65,5,'Discover Fashion Multi PU Formal Belts',0),
 (7,4,'Dressy Multicoloured Georgette Saree','Saree','images\\shop\\product7.jpg',999,54,10,'Dressy Multicoloured Georgette Saree',0);
INSERT INTO `product` (`productId`,`subCategoryId`,`productName`,`companyName`,`imageNamePath`,`price`,`quantity`,`discount`,`description`,`isDeleted`) VALUES 
 (8,4,'Janasya Grey Crepe Anarkali Kurti','Saree','images\\shop\\product8.jpg',597,50,65,'Janasya Grey Crepe Anarkali Kurti',0),
 (9,5,'Shoe Lab Gold Wedges Heels','Shoes','images\\shop\\product9.jpg',699,90,13,'Shoe Lab Gold Wedges Heels',0),
 (10,5,'Crocs Relaxed Fit Brown Wedges ','Shoes','images\\shop\\product10.jpg',2384,50,40,'Crocs Relaxed Fit Brown Wedges ',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(45) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`productcategory`
--

/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` (`categoryId`,`categoryName`) VALUES 
 (1,'MEN\'S FASHION'),
 (2,'WOMEN\'S FASHION'),
 (3,'KID\'S TOYS & FASHION'),
 (4,'HOME & LIVING'),
 (5,'ELECTRONICS'),
 (6,'MOBILES & TABLETS'),
 (7,'BOOKS, MUSIC \r\n& GIFT CARDS');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`productsubcategory`
--

DROP TABLE IF EXISTS `productsubcategory`;
CREATE TABLE `productsubcategory` (
  `subCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `subCategoryName` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`productsubcategory`
--

/*!40000 ALTER TABLE `productsubcategory` DISABLE KEYS */;
INSERT INTO `productsubcategory` (`subCategoryId`,`categoryId`,`subCategoryName`,`description`) VALUES 
 (1,1,'Clothing','The clothes you wear often define you. Therefore'),
 (2,1,'Footwear','A shoe is not merely a fashion accessory'),
 (3,1,'Accessories','Accessories have always played a major role in perfecting ones final look. A pretty dress '),
 (4,2,'Ethnic Wear','The feminine form is graceful. Nothing brings '),
 (5,2,'Footwear','The feminine form is graceful. Nothing brings '),
 (6,2,'Accessories','The feminine form is graceful. Nothing brings'),
 (7,3,'Baby Clothing','Footwear has evolved from the early protective sandals to brogues and Oxfords.'),
 (8,3,'Boy\'s Clothing','Footwear has evolved from the early protective sandals to brogues and Oxfords.'),
 (9,3,'Kids Footwear','Footwear has evolved from the early protective sandals to brogues and Oxfords.');
/*!40000 ALTER TABLE `productsubcategory` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`purchasedetails`
--

DROP TABLE IF EXISTS `purchasedetails`;
CREATE TABLE `purchasedetails` (
  `purchaseDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseMasterId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalAmount` float NOT NULL,
  PRIMARY KEY (`purchaseDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`purchasedetails`
--

/*!40000 ALTER TABLE `purchasedetails` DISABLE KEYS */;
INSERT INTO `purchasedetails` (`purchaseDetailId`,`purchaseMasterId`,`productId`,`quantity`,`price`,`totalAmount`) VALUES 
 (1,1,1,2,300,600),
 (2,1,1,2,300,600),
 (3,2,1,2,300,600);
/*!40000 ALTER TABLE `purchasedetails` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`purchasemaster`
--

DROP TABLE IF EXISTS `purchasemaster`;
CREATE TABLE `purchasemaster` (
  `purchaseMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `shippingAddressId` int(11) NOT NULL,
  `finalAmount` float NOT NULL,
  `finalQuantity` int(11) NOT NULL,
  `discount` float NOT NULL,
  `purchaseDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchaseMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`purchasemaster`
--

/*!40000 ALTER TABLE `purchasemaster` DISABLE KEYS */;
INSERT INTO `purchasemaster` (`purchaseMasterId`,`userId`,`shippingAddressId`,`finalAmount`,`finalQuantity`,`discount`,`purchaseDate`) VALUES 
 (1,1,1,2000,3,10,'2016-12-07 15:17:34'),
 (2,2,2,2000,3,10,'2016-12-07 15:17:52');
/*!40000 ALTER TABLE `purchasemaster` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`searchhistory`
--

DROP TABLE IF EXISTS `searchhistory`;
CREATE TABLE `searchhistory` (
  `searchHistoryId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `dateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`searchHistoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`searchhistory`
--

/*!40000 ALTER TABLE `searchhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchhistory` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`shippingaddress`
--

DROP TABLE IF EXISTS `shippingaddress`;
CREATE TABLE `shippingaddress` (
  `shippingAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  PRIMARY KEY (`shippingAddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`shippingaddress`
--

/*!40000 ALTER TABLE `shippingaddress` DISABLE KEYS */;
INSERT INTO `shippingaddress` (`shippingAddressId`,`userId`,`city`,`address`) VALUES 
 (1,4,'bhusawal','hgavdhgavhgdvahdv');
/*!40000 ALTER TABLE `shippingaddress` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `cartId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL DEFAULT '0',
  `productId` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`shoppingcart`
--

/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` (`cartId`,`userId`,`productId`,`quantity`) VALUES 
 (25,1,3,1),
 (26,1,1,1);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;


--
-- Table structure for table `ecommerce`.`user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `emailId` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullName` varchar(45) NOT NULL,
  `mobileNumber` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecommerce`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`,`emailId`,`password`,`fullName`,`mobileNumber`,`gender`,`dob`) VALUES 
 (1,'ppp@gmail.com','ppp','Pravin P Patil','1234567890','MALE','02-12-1991');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Procedure `ecommerce`.`addPurchaseDetail`
--

DROP PROCEDURE IF EXISTS `addPurchaseDetail`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addPurchaseDetail`(
IN p_purchaseMasterId INT, 
IN p_productId INT, 
IN p_quantity INT, 
IN p_price FLOAT, 
IN p_totalAmount FLOAT)
BEGIN

		INSERT INTO purchaseDetails(purchaseMasterId, productId, quantity, price, totalAmount)
        VALUES(p_purchaseMasterId, p_productId, p_quantity, p_price, p_totalAmount);
        
        SELECT LAST_INSERT_ID() AS id;
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`addPurchaseMaster`
--

DROP PROCEDURE IF EXISTS `addPurchaseMaster`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addPurchaseMaster`(
IN p_userId INT, 
IN p_shippingAddressId INT, 
IN p_finalAmount FLOAT, 
IN p_finalQuantity INT, 
IN p_discount FLOAT)
BEGIN

		INSERT INTO purchaseMaster(userId, shippingAddressId, finalAmount, finalQuantity, discount)
        VALUES(p_userId, p_shippingAddressId, p_finalAmount, p_finalQuantity, p_discount);
        
        
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`addShippingAddress`
--

DROP PROCEDURE IF EXISTS `addShippingAddress`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addShippingAddress`(
IN p_userId INT,
IN p_city varchar(100),
IN p_address varchar(300))
BEGIN
	insert into shippingaddress(userId,city,address)
    values(p_userId,p_city,p_address);
END $$

DELIMITER ;

--
-- Procedure `ecommerce`.`addToCart`
--

DROP PROCEDURE IF EXISTS `addToCart`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addToCart`(IN p_userId INT,IN p_productId INT,IN p_quantity INTEGER)
BEGIN

	insert into shoppingcart(userId,productId,quantity)values(p_userId,p_productId,p_quantity);

  

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePassword`(IN p_userId INT,IN p_oldPassword varchar(100),IN p_newPassword varchar(100))
BEGIN
	DECLARE p_message VARCHAR(100);
    
    IF(select password from user where userId = p_userId and password <> p_oldPassword)
    THEN
		SET p_message = 'old password not matched' ;
	ELSE 
		UPDATE user set password = p_newPassword where userId = p_userId;
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

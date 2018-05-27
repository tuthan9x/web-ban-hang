SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CatID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Ba lô');
INSERT INTO `categories` VALUES (2, 'Túi xách');

-- ----------------------------
-- Table structure for `brands`
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
	`BrandID` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`BrandName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`BrandID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Mikkor');
INSERT INTO `brands` VALUES (2, 'Seliux');
INSERT INTO `brands` VALUES (3, 'Targus');
INSERT INTO `brands` VALUES (4, 'SimpleCarry');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `ProID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
	`Viewer` int(11) NOT NULL,
	`Sold` int(11) NOT NULL,
	`Date` datetime DEFAULT NOW(),
	`CatID` int(11) NOT NULL,
	`BrandID` int(11) NOT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products`
VALUES
	( 1, 'Balo Mikkor The Royce Backpack M Red', 'Balo Mikkor The Royce Backpack M Red được làm từ chất liệu vải 1000D Kodura chống nước tốt, kết hợp vải lót Polyester 210D in nổi logo Mikkor độc đáo. Balo có thiết kế ngăn phù hợp cho dòng laptop PC 15.6’’ và tích hợp nhiều tính năng khác.', 750000, 6, 100, 2, NOW(), 1, 1 );
INSERT INTO `products`
VALUES
	(2, 'Túi Xách Seliux M5 Grant S Red', 'Seliux M5 Grant S Red là dòng sản phẩm túi đeo chéo cao cấp, thời trang phù hợp cho iPad Air. Túi có 4 màu sắc thời trang, thiết kế tiện lợi với dây quai to bản thay đổi chiều dài linh hoạt, nhiều ngăn dễ dàng sử dụng. Túi Seliux M5 Grant S được làm từ chất liệu 1000D Checken Tex SupremeTM bền màu, khả năng kháng nước tốt.', 299000, 10, 57, 1, NOW(), 2, 2 );
INSERT INTO `products`
VALUES
	(3, 'Balo Simplecarry Sling Big M Navy', 'Simplecarry Sling Big M Navy là dòng sản phẩm balo một quai cao cấp, thời trang phù hợp cho Laptop 13’’ trở xuống. Balo một quai có 4 màu sắc thời trang, thiết kế tiện lợi với dây quai to bản thay đổi chiều dài linh hoạt, ngăn Laptop riêng biệt. Balo một quai Simplecarry Sling Big M được làm từ chất liệu Polyester bền màu, khả năng hạn chế thấm nước tốt.', 539000, 5, 68, 0, NOW(), 1, 4 );
INSERT INTO `products`
VALUES
	(4, 'Túi Xách Targus TSS84003-71 M Black', 'Lấy cảm hứng với một sự pha trộn của phong cách và chất liệu, thiết kế đặc biệt cho Apple, thương hiệu Targus mới nhất cho MacBook® mang lại ý nghĩa mới cho thế giới balo. Sự lựa chọn cẩn thận với hai tông màu chéo nhuộm polyester chất lượng cao, túi xách Targus TSS84003-71 M Blacke sẽ bảo vệ cho laptop của bạn.', 1138500, 3, 81, 2, NOW(), 2, 3 );
	
-- ----------------------------
-- Table structure for `details`
-- ----------------------------
DROP TABLE IF EXISTS `details`;
CREATE TABLE `details` (
	`DetailID` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`ProID` int(11) NOT NULL,
	`BrandName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`Origin` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`Material` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`Color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
	`Size` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`Guarantee` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`DetailID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of details
-- ----------------------------
INSERT INTO `details` VALUES (1, 1, 'Seliux', 'Việt Nam', '1000D Checken Tex SupremeTM', 'Đỏ', '27 x 19 x 7 cm', '5 năm');INSERT INTO `details` VALUES (2, 2, 'Mikkor', 'Việt Nam', '1000D kodura/ Polyester 210D', 'Đỏ', '44 x 29 x 16 cm', '5 năm');
INSERT INTO `details` VALUES (3, 3, 'Simplecarry', 'Việt Nam', 'Polyester', 'Xanh Navy', '40 x 25 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (4, 4, 'Targus', 'Taiwan, China', 'Cao su tổng hợp', 'Đen', '38.5 x 28 x 4 cm ', '1 năm');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL,
  PRIMARY KEY (`f_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'webbanhang', 'Hoàng Thu Hằng', 'hangmoon322@gmail.com', '1997-12-25', 1);
INSERT INTO `users` VALUES (2, 'khachhang', 'khachhang123', 'Đỗ Linh Chi', 'linhchi4ever@gmail.com', '1997-10-20', 0);
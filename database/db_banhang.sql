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
  `ProName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
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
    ( 1, 'Túi Xách Seliux G3 Widow Duffle M D.Grey', 'Seliux G3 Widow Duffle M D.Grey là dòng sản phẩm túi xách thể thao – du lịch của thương hiệu Seliux. Túi xách Seliux G3 Widow Duffle M thích hợp cho các bạn thường xuyên hoạt động thể thao hoặc đi du lịch/ công tác ngắn ngày chỉ cần đem theo ít đồ. Túi được làm từ chất liệu G1000 và lớp vải lót 210D Nylon hạn chế thấm nước tốt. Túi có kiểu dáng năng động, màu sắc hiện đại, đặc biệt có ngăn đựng giày được thiết kế riêng biệt.', 569000, 10, 100, 2, NOW(), 2, 2 );
 
INSERT INTO `products`
VALUES
    ( 2, 'Túi Xách Seliux M5 Grant S Red', 'Seliux M5 Grant S Red là dòng sản phẩm túi đeo chéo cao cấp, thời trang phù hợp cho iPad Air. Túi có 4 màu sắc thời trang, thiết kế tiện lợi với dây quai to bản thay đổi chiều dài linh hoạt, nhiều ngăn dễ dàng sử dụng. Túi Seliux M5 Grant S được làm từ chất liệu 1000D Checken Tex SupremeTM bền màu, khả năng kháng nước tốt.', 299000, 5, 50, 2, NOW(), 2, 2 );
 
INSERT INTO `products`
VALUES
    ( 3, 'Túi Xách Seliux F10 Skynight Messenger M Navy', 'Seliux F10 Skynight Messenger M Navy là dòng túi xách Laptop thời trang, cao cấp của thương hiệu Seliux. Túi xách thích hợp cho Laptop 13’’ trở xuống, linh hoạt sử dụng trong các môi trường hoạt động khác nhau. Kiểu dáng năng động, màu sắc cá tính, làm từ chất liệu vải 1000D Chicken Tex, mặt đáy bằng Tapaulin hạn chế thấm nước rất tốt.', 399000, 8, 70, 5, NOW(), 2, 2 );
 
INSERT INTO `products`
VALUES
    ( 4, 'Túi Xách Seliux M1 Abrams S Red/Black', 'Những chàng trai luôn có cho mình những bí quyết riêng để tự tin tỏa sáng khi đi ra ngoài. Người chọn cho mình chiếc đồng hồ đeo tay đắt giá, người trung thành với đôi giày da yêu thích sang trọng, và không ít phái mạnh chọn cách bổ sung cho mình một chiếc túi đựng ipad, túi đeo chéo thời trang đẳng cấp. Túi đeo chéo Seliux M1 Abrams S Red/Black kết hợp giữa tông màu đỏ và màu đen cùng điếm nhấn là logo nổi bật, sắc nét, gây ấn tượng cho người dùng từ cái nhìn đầu tiên.', 219000,15, 110, 7, NOW(), 2, 2 );
   
INSERT INTO `products`
VALUES
    ( 5, 'Túi Xách Seliux Túi xách Ipad Exos 4004 M Brown', 'Túi xách iPad Seliux Exos 4002 (M) Brown là mẫu mới nhất trong bộ sưu tập của dòng thương hiệu Seliux độc quyền. Thiết kế độc đáo, ấn tượng, thể hiện sự đơn giản cùng các điểm nhấn nổi bật rất trẻ trung và năng động. ', 599000,20, 150, 12, NOW(), 2, 2 );
 
INSERT INTO `products`
VALUES
    ( 6, 'Túi Xách Simplecarry Gymbag S Black', 'Sau những giờ làm việc căng thẳng, loanh quanh trong văn phòng công ty, chúng ta cần vận động, nâng cao sức khỏe. Khi bạn muốn có buổi luyện tập hiệu quả và chuyên nghiệp tại phòng tập, hãy mang theo túi thể thao Simplecarry Gymbag S Black – một sản phẩm hoàn hảo được thiết kế riêng để giúp bạn đựng đồ thể thao khi đi tập.', 495000,13, 120, 3, NOW(), 2, 4 );
   
INSERT INTO `products`
VALUES
    ( 7,'Túi Xách Simplecarry LC Ipad S Blue/Grey', 'Trên thị trường hiện nay các sản phẩm túi xách, túi đeo chéo luôn được rất nhiều bạn học sinh, sinh viên quan tâm đặc biệt là khi năm học mới sắp bắt đầu.Túi đeo Simplecarry LC Ipad S Blue/Grey chính là sự lựa chọn hoàn hảo dành cho bạn.', 350000,8, 150, 4, NOW(), 2, 4 );
   
INSERT INTO `products`
VALUES
    ( 8, 'Balo Simplecarry Sling Big M Grey', 'Simplecarry Sling Big M Grey là dòng sản phẩm balo một quai cao cấp, thời trang phù hợp cho Laptop 13’’ trở xuống. Balo một quai có 4 màu sắc thời trang, thiết kế tiện lợi với dây quai to bản thay đổi chiều dài linh hoạt, ngăn Laptop riêng biệt. Balo một quai Simplecarry Sling Big M được làm từ chất liệu Polyester bền màu, khả năng hạn chế thấm nước tốt.', 539000,10, 170, 7, NOW(), 2, 4 );
 
INSERT INTO `products`
VALUES
    ( 9, 'Túi Xách Simplecarry LC Ipad S Black', 'Một chiếc túi đeo có thiết kế đơn giản, màu sắc hài hòa mà vẫn toát lên sự lịch lãm, trẻ trung luôn là sự lựa chọn hàng đầu của giới trẻ. Túi đeo Simplecarry LC Ipad S Black sẽ khiến bạn hài lòng ngay từ cái nhìn đầu tiên. Bên cạnh đó, túi đeo Simplecarry còn kiêm tính năng là một chiếc túi xách thời trang với nhiều kiểu dáng thiết kế cá tính, đặc biệt, nổi bật, nhận được yêu thích của cả phái nam và nữ khi chọn mua sản phẩm. Phù hợp để đựng các vật dụng như laptop, máy ảnh, điện thoại... sẽ là sự lựa chọn túi xách du lịch - túi xách thể thao hoàn hảo dành cho bạn. Cũng như tận dụng như một chiếc túi xách máy ảnh cho những ai có niềm đam mê với nhiếp ảnh.', 350000,15, 140, 10, NOW(), 2, 4 );
   
INSERT INTO `products`
VALUES
    ( 10, 'Túi Xách Simplecarry Gymbag S Red/Grey', 'Là chiếc túi xách có thiết kế đơn giản và thường được giới văn phòng, những người làm kinh doanh thường xuyên sử dụng, túi đeo Simplecarry Gymbag S Orange/Grey lịch lãm đang được rất nhiều người ưa dùng. Hãy sắm ngay cho mình một chiếc túi xách thể thao, túi tập gym đến từ thương hiệu Simplecarry để thể hiện được phong cách thời trang riêng của chính mình.', 495000,30, 250, 15, NOW(), 2, 4 );
   
INSERT INTO `products`
VALUES
    ( 11, 'Túi Xách Mikkor The Leroy M Charcoal', 'Mikkor The Leroy M Charcoal là dòng sản phẩm túi du lịch – thể thao mới lạ của thương hiệu Mikkor. Quai xách độc đáo liền thân túi (vừa là quai xách, vừa là quai đeo chéo như một chiếc balo), ngăn lớn 40L, đủ sức chứa đồ cho chuyến đi 2 – 3 ngày và ngăn phụ đựng phụ kiện khác. Mikkor The Leroy 2017 gồm 3 màu sắc nổi bật: Black, Navy và Charcoal, cho bạn dễ dàng chọn lựa theo sở thích cá nhân.', 75000,50, 350, 25, NOW(), 2, 1 );
   
INSERT INTO `products`
VALUES
    ( 12, 'Túi Xách Mikkor The Boris Gym M Red', 'Được làm từ chất liệu vải cao cấp, chống nước tốt, túi xách của thương hiệu Mikkor sẽ là một gợi ý khi bạn đang lựa chọn một chiếc túi xách đồng hành cùng bạn tới phòng tập hàng ngày. Mikkor The Boris Gym M Red có ngăn chính rộng 25L cùng nhiều ngăn nhỏ khác nhau, bạn sẽ thoải mái đựng đồ cần thiết một cách ngăn nắp và ngọn gàng.', 549000,17, 200, 7, NOW(), 2, 1 );
   
INSERT INTO `products`
VALUES
    ( 13, 'Túi Xách Mikkor The Boris Sport M Navy', 'Bạn là người yêu thích thể thao, bạn đến phòng tập mỗi ngày? Vậy hãy để túi xách Mikkor The Boris Sport M Navy - một sản phẩm của thương hiệu thuần Việt Mikko đồng hành cùng bạn. Túi xách có thiết kế rộng rãi với một ngăn chính và sáu ngăn phụ để bạn thoải mái đựng được nhiều đồ. Chất liệu túi xách bền đẹp, có khả năng chống nước cùng màu xanh navy đẹp mắt, sẽ là sự lựa chọn túi xách du lịch - túi xách thể thao hoàn hảo dành cho bạn.', 549000,40, 150, 15, NOW(), 2, 1 );
   
INSERT INTO `products`
VALUES
    ( 14, 'Túi Xách Mikkor Laptop Dily Oranger M Pink/White', 'Mikkor Laptop Dily Oranger M Pink/White được may bằng chất liệu nylon Kodura bền bỉ, có khả năng chống ẩm mốc, chống bám bụi sẽ bảo vệ chiếc laptop của bạn một cách hiệu quả nhất. Với những tính năng ưu việt, Mikkor sẽ là một người bạn đồng hành đầy hữu ích cùng laptop của bạn chống chọi với điều kiện khắc nghiệt của thời tiết bên ngoài.', 599000,300, 450, 50, NOW(), 2, 1);
   
INSERT INTO `products`
VALUES
    ( 15, 'Túi Xách Mikkor Betty Tablet BT002 M Dark Mouse Grey', 'Túi đeo chéo Mikkor Betty Tablet BT002 M Dark Mouse Grey sử dụng chất liệu vải được sản xuất tại Hàn Quốc với màu sắc thời trang, cá tính và chất lượng siêu bền sẽ giúp bảo vệ tài sản của bạn một cách tốt nhất. Đây sẽ là sản phẩm vừa tiện dụng cho người đi làm, vừa có thể sử dụng cho các em học sinh, sinh viên. Túi xách Mikkor còn là loại túi chống sốc với tính năng bảo vệ vật dụng dễ vỡ bên trong cực hiệu quả. Phù hợp để đựng các vật dụng như laptop, máy ảnh, điện thoại... sẽ là sự lựa chọn túi xách du lịch - túi xách thể thao hoàn hảo dành cho bạn. Cũng như tận dụng như một chiếc túi xách máy ảnh cho những ai có niềm đam mê với nhiếp ảnh.', 290000,40, 130, 20, NOW(), 2, 1);
   
INSERT INTO `products`
VALUES
    ( 16, 'Túi Xách Targus TSM67102AP-50 M Black', 'Bạn đang sử dụng laptop thường xuyên, bạn muốn lựa chọn chiếc túi vừa phong cách vừa tiện dụng cho chiếc máy tính của mình. Túi xách Targus TSM67102AP-50 M Black thuận tiện giúp bạn mang được các đồ phụ kiện cá nhân cùng thiết kế phong cách. Đây sẽ là sự lựa chọn túi xách thời trang hoàn hảo cho bạn.', 1380000,200, 450, 40, NOW(), 2, 3);
 
INSERT INTO `products`
VALUES
    ( 17, 'Túi Xách Targus TSS84003-71 M Black', 'Lấy cảm hứng với một sự pha trộn của phong cách và chất liệu, thiết kế đặc biệt cho Apple, thương hiệu Targus mới nhất cho MacBook® mang lại ý nghĩa mới cho thế giới balo. Sự lựa chọn cẩn thận với hai tông màu chéo nhuộm polyester chất lượng cao, túi xách Targus TSS84003-71 M Blacke sẽ bảo vệ cho laptop của bạn.', 1138000,170, 250, 30, NOW(), 2, 3);
 
INSERT INTO `products`
VALUES
    ( 18, 'Túi Xách Targus TSS83905-71 M Red', 'Targus là một thương hiệu nổi tiếng trên thế giới về sản xuất và phân phối balo, cặp xách và túi đựng. Thương hiệu mang đến cho người dùng một phong cách riếng, chuyên nghiệp hơn mà không kém phần tiện dụng. Túi xách laptop Targus TSS83905-71 M Red capital được thiết kế dành cho laptop 13 inch cực sành điệu, hiện đại năng động.', 1012000,100, 230, 40, NOW(), 2, 3);
 
INSERT INTO `products`
VALUES
    ( 19, 'Túi Xách Targus TSS83902AP S Orange', 'Chiếc túi xách không những tiện dụng giúp bạn đựng được laptop và đồ dùng cá nhân, mà con thể thiện được phong cách cá tính của người dùng. Với chất liệu cao cấp cùng màu sắc nổi bật, túi xách Targus TSS83902AP S Orange sẽ là sự lựa chọn mới, sống động hơn, tự tin hơn, và cá tính mạnh mẽ hơn.', 924000,400, 350, 70, NOW(), 2, 3);
 
INSERT INTO `products`
VALUES
    ( 20, 'Túi Xách Targus TBT268AP-72 M Black', 'Hiện nay, các sản phẩm cặp laptop đang rất được các bạn trẻ như học sinh, sinh viên, nhân viên văn phòng ưa chuộng do tính tiện dụng và kiểu dáng thiết kế hiện đại, lịch sự. nắm bắt xu hướng đó, nhà sản xuất Targus đã cho ra mắt dòng sản phẩm Cặp laptop Targus TBT268AP-72 M Black. Với thiết kế hiện đại và linh hoạt, sản phẩm sẽ là một sự lựa chọn mà bạn không nên bỏ qua', 2024000,100, 450, 80, NOW(), 2, 3);
 
 INSERT INTO `products`
VALUES
	(21, 'Balo Seliux G1 Raptor Backpack M Navy', 'Thương hiệu Seliux mới ra mắt bộ sưu tập balo thời trang cao cấp với màu sắc hiện đại, năng động mang tên Seliux G1 Raptor. Balo Seliux G1 Raptor Backpack M Navy được làm từ chất liệu Polyester 1000D kết hợp vải lót 210D Nylon màu xám, trơn mị và hạn chế chống nước tốt. Balo có thiết kế ngăn rộng rãi, thêm phần ngăn Laptop 15''và Tablet.', 529000, 6, 100, 2, NOW(), 1, 1);

INSERT INTO `products`
VALUES
	(22, 'Balo Seliux G1 Raptor Backpack M Moss', 'Thương hiệu Seliux mới ra mắt bộ sưu tập balo thời trang cao cấp với màu sắc hiện đại, năng động mang tên Seliux G1 Raptor. Balo Seliux G1 Raptor Backpack M Moss được làm từ chất liệu Polyester 1000D kết hợp vải lót 210D Nylon màu xám, trơn mị và hạn chế chống nước tốt. Balo có thiết kế ngăn rộng rãi, thêm phần ngăn Laptop 15''và Tablet.', 529000, 10, 340, 4, NOW(), 1, 1);

INSERT INTO `products`
VALUES
	(23, 'Balo Seliux G1 Raptor Backpack M Grey', 'Thương hiệu Seliux mới ra mắt bộ sưu tập balo thời trang cao cấp với màu sắc hiện đại, năng động mang tên Seliux G1 Raptor. Balo Seliux G1 Raptor Backpack M Grey được làm từ chất liệu Polyester 1000D kết hợp vải lót 210D Nylon màu xám, trơn mị và hạn chế chống nước tốt. Balo có thiết kế ngăn rộng rãi, thêm phần ngăn Laptop 15''và Tablet.', 529000, 36, 200, 14, NOW(), 1, 1);

INSERT INTO `products`
VALUES
	(24,'Balo Seliux G1 Raptor Backpack M Red', 'Thương hiệu Seliux mới ra mắt bộ sưu tập balo thời trang cao cấp với màu sắc hiện đại, năng động mang tên Seliux G1 Raptor. Balo Seliux G1 Raptor Backpack M Red được làm từ chất liệu Polyester 1000D kết hợp vải lót 210D Nylon màu xám, trơn mị và hạn chế chống nước tốt. Balo có thiết kế ngăn rộng rãi, thêm phần ngăn Laptop 15" và Tablet.', 529000,50, 500, 35, NOW(), 1, 1);

INSERT INTO `products`
VALUES
	(25, 'Balo Seliux M7 Bradley Sling S Blue', 'Seliux M7 Bradley Sling S Blue là dòng sản phẩm balo một quai thời trang của thương hiệu Seliux. Balo đem lại sự tiện lợi và năng động dành cho người sử dụng. Balo được làm từ chất liệu 1000D Chicken Tex hạn chế thấm nước tốt, đệm lưới Air Mesh thoáng khí, quai có thể thay đổi chiều dài và bên đeo (trái hoặc phải)..', 419000, 34, 200, 12, NOW(), 1, 1);

INSERT INTO `products`
VALUES
	(26, 'Balo Simplecarry Sling Big M Grey', 'Simplecarry Sling Big M Grey là dòng sản phẩm balo một quai cao cấp, thời trang phù hợp cho Laptop 13''trở xuống. Balo một quai có 4 màu sắc thời trang, thiết kế tiện lợi với dây quai to bản thay đổi chiều dài linh hoạt, ngăn Laptop riêng biệt. Balo một quai Simplecarry Sling Big M được làm từ chất liệu Polyester bền màu, khả năng hạn chế thấm nước tốt.', 539000, 20, 290, 7, NOW(), 1, 2);

INSERT INTO `products`
VALUES
	(27, 'Balo Simplecarry H3 M Blue/Navy', 'Một chiếc ba lô luôn là một trong những phụ kiện không thể thiếu trong các hoạt động như đi học hay đi chơi, dã ngoại. Với cách kết hợp màu sắc hài hòa và kiểu dáng thời trang, hiện đại, Simplecarry H3 M Blue/Navy chính là người bạn đồng hành đầy cá tính dành cho bạn.', 749000, 23, 170, 5, NOW(), 1, 2);

INSERT INTO `products`
VALUES
	(28, 'Balo Simplecarry H3 M Red/Grey', 'Một chiếc ba lô luôn là một trong những phụ kiện không thể thiếu trong các hoạt động như đi học hay đi chơi, dã ngoại. Với cách kết hợp màu sắc hài hòa và kiểu dáng thời trang, hiện đại, Simplecarry H3 M Red/Grey chính là người bạn đồng hành đầy cá tính dành cho bạn.', 749000, 40, 240, 34, NOW(), 1, 2);

INSERT INTO `products`
VALUES
    (29, 'Balo Simplecarry K1 M', 'Balo ngày càng trở thành một phụ kiện không thể thiếu đối với các bạn trẻ, không chỉ bởi sự tiện dụng, mà còn bởi tính thời trang mà nó mang lại. Với màu xám nhã nhặn và kiểu dánghiện đại, đến từ thương hiệu nổi tiếng, balo Simplecarry K1 M D.Grey chính là người bạn đồng hành đầy cá tính dành cho bạn.', 690000, 34, 240, 7, NOW(), 1, 2);

INSERT INTO `products`
VALUES
    (30, 'Balo Simplecarry Sling Big M Blue', 'Simplecarry Sling Big M Blue là dòng sản phẩm balo một quai cao cấp, thời trang phù hợp cho Laptop 13''trở xuống. Balo một quai có 4 màu sắc thời trang, thiết kế tiện lợi với dây quai to bản thay đổi chiều dài linh hoạt, ngăn Laptop riêng biệt. Balo một quai Simplecarry Sling Big M được làm từ chất liệu Polyester bền màu, khả năng hạn chế thấm nước tốt.', 539000, 50, 600, 45, NOW(), 1, 2);

INSERT INTO `products`
VALUES
    (31, 'Balo Mikkor The Victor Backpack TVB004 M Dark Mouse Grey', 'Mikkor The Victor Backpack TVB004 M Dark Mouse Grey là dòng sản phẩm balo laptop nằm trong bộ sưu tập The Victor 2018 thời trang của thương hiệu Mikkor. Balo có thiết kế hiện đại, phù hợp với nhiều đối tượng sử dụng. Thiết kế ngăn dành riêng cho laptop 15.6''và ngăn phía trước đựng phụ kiện. Balo được làm từ chất liệu Supertex Kodura 1000D hạn chế thấm nước tuyệt vờit.', 749000, 60, 400, 35, NOW(), 1, 3);

INSERT INTO `products`
VALUES
    (32, 'Balo Mikkor The Lloyd Backpack TLBPM-004 M Dark Mouse Grey', 'Mikkor The Lloyd Backpack TLBPM-004 M Dark Mouse Grey là dòng sản phẩm balo laptop nằm trong bộ sưu tập chào mùa hè của thương hiệu Mikkor. Balo có thiết kế hiện đại, phù hợp với nhiều đối tượng sử dụng. Thiết kế ngăn dành riêng cho laptop 13''nằm bên trong ngăn chính và ngăn phía trước đựng phụ kiện. Balo được làm từ chất liệu 1000D Cordura có độ bền cao, chịu mài mòn, hạn chế thấm nước tốt.', 499000, 50, 490, 35, NOW(), 1, 3);

INSERT INTO `products`
VALUES
    (33, 'Balo Mikkor The Betty Slingpack M Black', 'Thương hiệu Mikkor tiếp tục ra mắt bộ sưu tập balo thời trang cao cấp với màu sắc hiện đại, năng động mang tên The Betty. Balo Mikkor The Betty Slingpack M Black được làm từ chất liệu vải 1000D Kodura Supertex hạn chế thấm nước tốt, kết hợp vải lót Polyester 210D in nổi logo Mikkor độc đáo. Balo The Betty có thiết kế quai đeo đặc biệt với dây khóa kéo sẽ “biến hóa” balo hai quai thành một quai và ngược lại, ngăn chứa thích hợp cho iPad.', 499000, 35, 200, 30, NOW(), 1, 3);

INSERT INTO `products`
VALUES
    (34, 'Balo Mikkor The Betty Slingpack M Grey', 'Thương hiệu Mikkor tiếp tục ra mắt bộ sưu tập balo thời trang cao cấp với màu sắc hiện đại, năng động mang tên The Betty. Balo Mikkor The Betty Slingpack M Grey được làm từ chất liệu vải 1000D Kodura Supertex hạn chế thấm nước tốt, kết hợp vải lót Polyester 210D in nổi logo Mikkor độc đáo. Balo The Betty có thiết kế quai đeo đặc biệt với dây khóa kéo sẽ “biến hóa” balo hai quai thành một quai và ngược lại, ngăn chứa thích hợp cho iPad.', 499000, 35, 160, 12, NOW(), 1, 3);

INSERT INTO `products`
VALUES
    (35, 'Balo Mikkor The Lloyd Backpack TLBPL-005 L Red','Mikkor The Lloyd Backpack TLBPL-005 L Red là dòng sản phẩm balo laptop nằm trong bộ sưu tập chào mùa hè của thương hiệu Mikkor. Balo có thiết kế hiện đại, phù hợp với nhiều đối tượng sử dụng. Thiết kế ngăn dành riêng cho laptop 15.6''nằm bên trong ngăn chính và ngăn phía trước đựng phụ kiện. Balo được làm từ chất liệu 1000D Cordura có độ bền cao, chịu mài mòn, hạn chế thấm nước tốt.', 549000, 30, 200, 25, NOW(), 1, 3);

INSERT INTO `products`
VALUES
    (36, 'Balo Targus TSB906-70 M Black', 'Với các bạn ưa thích du lịch,một chiếc balo có thể mang được laptop, vừa có thể kèm theo các phụ kiện cá nhân luôn có niềm yêu thích nhất định. Còn gì tuyệt vời hơn khi trong mỗi chuyến hành trình, luôn có một chiếc balo du lịch khỏe khoăn và tiện dụng đồng hành cùng bạn trên mọi nẻo đường đúng không nào. Balo Targus TSB906-70 M Black chính là sự lựa chọn hoàn hảo dành cho bạn.', 1518000, 20, 500, 9, NOW(), 1, 4);

INSERT INTO `products`
VALUES
    (37, 'Balo Targus TSB906-70 M Rust', 'Với các bạn ưa thích du lịch, Có một hệ thống xe đẩy tích hợp để khe ba lô lên lổ đựng hành lý để thuận tiện đi du lịch và tay nắm giữ phía trước . Thêm vào đó, một tay cầm đệm có một tay cầm kép để làm cho mọi cuộc hành trình thú vị hơn. Chiếc balo Targus TSB90502M Rust dành cho những bạn yêu thích thể thao, yêu thích phong cách trẻ trung, khỏe khoắn.', 1644500, 20,460,5, NOW(), 1, 4);

INSERT INTO `products`
VALUES
    (38, 'balo Targus TSB90603-70 M Plum', 'Bạn là người ưa thích khám phá những trải nghiệm mới. Một chiếc balo du lịch là vô cùng cần thiết. Với thiết kế vượt trội với việc kết hợp đựng cả máy tính xách tay, balo Targus TSB90603-70 M Plum sẽ mang đến cho bạn sự lựa chọn hoàn toàn chưa bao giờ có, sự lựa chọn mới mẻ sẽ mang đến cho bạn mợt chuyến du lịch đầy thú vị.', 1518000, 15,340,4, NOW(), 1, 4);

INSERT INTO `products`
VALUES
    (39, 'Balo Targus TSB855-70 S Black', 'Balo Targus TSB855-70 S Black là sản phẩm tiện lợi, nhỏ gọn, thoải mái, và một ba lô nhỏ nhưng không gian lớn. Được thiết kế cho túi xách đựng máy tính lên đến 14 ". 3 zippered túi cho các kích cỡ khác nhau. Với kích thước tùy chọn mở rộng, nó cho phép tăng công suất lên đến 30% khi cần thiết. Bạn thực sự cảm thấy thoải mái khi sử dụng chúng.', 1518000, 20, 240, 15, NOW(), 1, 4);

INSERT INTO `products`
VALUES
    (40, 'Balo Targus TBB574-70 M Black', 'Balo Targus TBB574-70 M Black là phiên bản cao cấp mới nhất hiện nay của dòng sản phẩm danh cho laptop. Sản phẩm có nhiều ngăn rộng rải, đựng được nhiều vật dụng hơn, được làm từ chất liệu polyester chống thấm, mang đến độ bền cao và khả năng chống chọi thời tiết tốt. Đây sẽ là sự lựa chọn balo đi học lý tưởng dành cho bạn, với các ngăn được phân chia khoa học, giúp bạn dễ dàng sắp xếp các vật dụng cá nhân của mình, đảm bảo đồ đạc bên trong luôn an toàn.', 2047000, 20, 540, 4, NOW(), 1, 4);
   
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
    `Color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    `Size` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    `Guarantee` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`DetailID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
-- ----------------------------
-- Records of details
-- ----------------------------
INSERT INTO `details` VALUES (1, 1, 'Seliux', 'Việt Nam', 'Vải G1000', 'Xám đậm', '48 x 22 x 22 cm', '5 năm');
INSERT INTO `details` VALUES (2, 2, 'Seliux', 'Việt Nam', '1000D Checken Tex SupremeTM', 'Ðỏ', '27 x 19 x 7 cm', '5 năm');
INSERT INTO `details` VALUES (3, 3, 'Seliux', 'Việt Nam', '1000D Chicken Tex/210D Ripstop', 'Xanh Navy', '42 x 31 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (4, 4, 'Seliux', 'Việt Nam', '1000D Chicken Tex, 420D Nylon', 'Ðỏ/Ðen', '23 x 28 x 2 cm', '5 năm');
INSERT INTO `details` VALUES (5, 5, 'Seliux', 'Trung Quốc', 'Polyester trượt nước', 'Nâu', '38 x 28 x 5 cm', '5 năm');
INSERT INTO `details` VALUES (6, 6, 'Simplecarry', 'Việt Nam', 'Polyester trượt nước', 'Ðen', '23 x 42 x 23 cm', '5 năm');
INSERT INTO `details` VALUES (7, 7, 'Simplecarry', 'Việt Nam', 'Polyester trượt nước', 'Xanh dương/xám', '27 x 24 x 5cm', '5 năm');
INSERT INTO `details` VALUES (8, 8, 'Simplecarry', 'Việt Nam', 'Polyester', 'Xám', '40 x 25 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (9, 9, 'Simplecarry', 'Việt Nam', 'Polyester trượt nước', 'Ðen', '27 x 24 x 5cm', '5 năm');
INSERT INTO `details` VALUES (10, 10, 'Simplecarry', 'Việt Nam', 'Polyester trượt nước', 'Xám/Ðỏ', '23 x 42 x 25 cm', '5 năm');
INSERT INTO `details` VALUES (11, 11, 'Mikkor', 'Việt Nam', '1000D Kodura/PU', 'Ðen', '53 x 28 x 30 cm', '5 năm');
INSERT INTO `details` VALUES (12, 12, 'Mikkor', 'Việt Nam', 'Kodura 1000D, phủ PU', 'Ð?', '45 x 23 x 23 cm', '5 năm');
INSERT INTO `details` VALUES (13, 13, 'Mikkor', 'Việt Nam', 'Kodura 1000D, phủ PU', 'Xanh Navy', '54 x 32 x 32 cm', '5 năm');
INSERT INTO `details` VALUES (14, 14, 'Mikkor', 'Việt Nam', '1000D Kodura', 'Hồng/trắng', '44 x 32 x 14 cm', '5 năm');
INSERT INTO `details` VALUES (15, 15, 'Mikkor', 'Việt Nam', '600D Polyester, PU 80mg', 'Xám lông chuột đậm', '23 x 28 x 2 cm', '5 năm');
INSERT INTO `details` VALUES (16, 16, 'Targus', 'Mĩ', 'Vải', 'Ðen', '34.90 x 9.53 x 25.72 cm', '1 năm');
INSERT INTO `details` VALUES (17, 17, 'Targus', 'Mĩ', 'Vải', 'Ðen', '38.5 x 28 x 4 cm', '1 năm');
INSERT INTO `details` VALUES (18, 18, 'Targus', 'Mĩ', 'Polyester ', 'Ðỏ', '38.5 x 28 x 4 cm', '1 năm');
INSERT INTO `details` VALUES (19, 19, 'Targus', 'Mĩ', 'Polyester ', 'Cam', '45.4 x 26 x 4 cm', '1 năm');
INSERT INTO `details` VALUES (20, 20, 'Targus', 'Mĩ', 'Polyester', 'Ðen', '34.5 x 8.0 x 39.5 cm', '1 năm');

INSERT INTO `details` VALUES (21, 21, 'Seliux', 'Việt Nam', '1000D Polyester/210D Nylon', 'Xanh Navy', '42 x 29 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (22, 22, 'Seliux', 'Việt Nam', '1000D Polyester/210D Nylon', 'Xanh rêu', '42 x 29 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (23, 23, 'Seliux', 'Việt Nam', '1000D Polyester/210D Nylon', 'Xám', '42 x 29 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (24, 24, 'Seliux', 'Việt Nam', '1000D Polyester/210D Nylon', 'Đỏ', '42 x 29 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (25, 25, 'Seliux', 'Việt Nam', '1000D Chicken Tex/420D Nylon', 'Xanh dương', '36 x 22 x 8 cm', '5 năm');
INSERT INTO `details` VALUES (26, 26, 'Simplecarry', 'Việt Nam', 'Polyester', 'Xám', '40 x 25 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (27, 27, 'Simplecarry', 'Việt Nam', 'Polyester', 'Xanh dương/Xanh Navy', '44 x 32 x 18 cm', '1 năm');
INSERT INTO `details` VALUES (28, 28, 'Simplecarry', 'Việt Nam', 'Polyester', 'Đỏ đậm/xám', '44 x 32 x 18 cm', '1 năm');
INSERT INTO `details` VALUES (29, 29, 'Simplecarry', 'Việt Nam', 'Polyester', 'Xám đậm/xám', '44 x 30 x 13 cm', '5 năm');
INSERT INTO `details` VALUES (30, 30, 'Simplecarry', 'Việt Nam', 'Polyester', 'Xanh', '40 x 25 x 12 cm', '5 năm');
INSERT INTO `details` VALUES (31, 31, 'Mikkor', 'Việt Nam', 'Supertex Kodura 1000D/PU', 'Xám lông chuột', '40 x 27 x 15cm', '5 năm');
INSERT INTO `details` VALUES (32, 32, 'Mikkor', 'Việt Nam', 'Kodura 600D, phủ PU', 'Xám lông chuột đậm', '44 x 30 x 16 cm', '5 năm');
INSERT INTO `details` VALUES (33, 33, 'Mikkor', 'Việt Nam', '1000D Kodura Supertex', 'Đen', '33 x 20 x 8 cm', '5 năm');
INSERT INTO `details` VALUES (34, 34, 'Mikkor', 'Việt Nam', '1000D Kodura Supertex', 'Xám lông chuột đậm', '33 x 20 x 8 cm', '5 năm');
INSERT INTO `details` VALUES (35, 35, 'Mikkor', 'Việt Nam', 'Kodura 600D/PU ', 'Đỏ', '42 x 29 x 14 cm', '1 năm');
INSERT INTO `details` VALUES (36, 36, 'Targus', 'Mỹ', 'NyLon', 'Đen', '42.5 x 29 x 17cm', '1 năm');
INSERT INTO `details` VALUES (37, 37, 'Targus', 'Mỹ', 'NyLon', 'Cam nâu', '47 x 30.5 x 19 cm', '1 năm');
INSERT INTO `details` VALUES (38, 38, 'Targus', 'Mỹ', 'NyLon', 'Tím', '42.5 x 29 x 17cm', '1 năm');
INSERT INTO `details` VALUES (39, 39, 'Targus', 'Mỹ', 'Polyester', 'Đen', '31 x 22 x 45 cm', 'Trọn đời');
INSERT INTO `details` VALUES (40, 40, 'Targus', 'Mỹ', 'Polyester', 'Đỏ', '50.8 x 30.5 x 17.8cm', '1 năm');

 
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

-- ----------------------------
-- Table structure for `orderdetails`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `OrderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Total` bigint(20) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------

ALTER TABLE orders ADD Phone VARCHAR(20) NOT NULL
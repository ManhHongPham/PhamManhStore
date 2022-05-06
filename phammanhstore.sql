-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: javaweb13
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_internal_idx` (`parent_id`),
  CONSTRAINT `fk_internal` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (38,'Tất cả','all',NULL,NULL,NULL,NULL,NULL,1,'all'),(43,'Máy ảnh','hay',NULL,NULL,NULL,NULL,38,1,'May-Anh'),(44,'Ống kính','',NULL,NULL,NULL,NULL,38,1,'Ong-king'),(45,'Thẻ nhớ','',NULL,NULL,NULL,NULL,44,1,'The-nho'),(46,'Chân máy','',NULL,NULL,NULL,NULL,43,1,'Chan-may'),(48,'Pin','',NULL,NULL,NULL,NULL,38,1,'Pin'),(49,'Micro','',NULL,NULL,NULL,NULL,45,1,'Micro'),(53,'bàn','sdfs',NULL,NULL,NULL,NULL,38,0,NULL),(54,'3','43',NULL,NULL,NULL,NULL,53,0,NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `request_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin liên hệ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (43,'','','','','',NULL,NULL,NULL,NULL,1),(44,'trần minh hùng','trần minh hùng','hung@gmail.com','đánh giá','sản phẩm tốt',NULL,NULL,NULL,NULL,1),(45,'','','','','',NULL,NULL,NULL,NULL,1),(46,'','','','','',NULL,NULL,NULL,NULL,1),(47,'','','','','',NULL,NULL,NULL,NULL,1),(48,'','','','','',NULL,NULL,NULL,NULL,1),(49,'anh mạnh','anh mạnh','phammanh1211t@gmail.com','khiếu nại','sản phẩm không đúng',NULL,NULL,NULL,NULL,1),(50,'anh mạnh','anh mạnh','phammanh1211t@gmail.com','khiếu nại','sản phẩm không đúng',NULL,NULL,NULL,NULL,1),(51,'','','','','',NULL,NULL,NULL,NULL,1),(52,'','','','','',NULL,NULL,NULL,NULL,1),(53,'','','','','',NULL,NULL,NULL,NULL,1),(54,'','','','','',NULL,NULL,NULL,NULL,1),(55,'','','','','',NULL,NULL,NULL,NULL,1),(56,'','','','','',NULL,NULL,NULL,NULL,1),(57,'','','','','',NULL,NULL,NULL,NULL,1),(58,'qư','qư','qư','qư','qư',NULL,NULL,NULL,NULL,1),(59,'qư','qư','qư','qư','qư',NULL,NULL,NULL,NULL,1),(60,'qư','qư','qư','qư','qư',NULL,NULL,NULL,NULL,1),(61,'','','','','',NULL,NULL,NULL,NULL,1),(62,'q','q','q','q','q',NULL,NULL,NULL,NULL,1),(63,'sds','sds','phammanh1211t@gmail.com','dfs','sfsdfsd',NULL,NULL,NULL,NULL,1),(64,'pham hong manh','pham hong manh','phammanh1211t@gmail.co','ho tro','alo',NULL,NULL,NULL,NULL,1),(65,'','','','','',NULL,NULL,NULL,NULL,1),(66,'manhpham','manhpham','qw','qw','qw',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(13,1) NOT NULL,
  `price_sale` decimal(13,1) DEFAULT NULL,
  `short_description` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category_products_idx` (`category_id`),
  CONSTRAINT `fk_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (112,'Canon 800D (Body)',12500000.0,NULL,'Cảm biến CMOS APS-C 24.2MP\r\nBộ xử lý hình ảnh DIGIC 7\r\nMàn hình LCD 3\" 1.04m-Dot\r\nQuay phim Full HD 1080p 60fps\r\nTốc độ chụp liên tiếp lên đến 6fps\r\nLấy nét tự động theo pha 45 điểm\r\nISO 100-25600 (mở rộng đến 51200)\r\nĐộng cơ lấy nét tự động Dual Pixel CMOS','Canon EOS 800D chính là bộ máy để bạn bắt đầu và phát triển kĩ năng chụp của mình trong mọi mục đích sử dụng. Nhiều công nghệ xịn trên máy, có cảm ứng, có xoay lật, có kết nối wifi chuyển ảnh, có màn hình hiện chuẩn màu,...','avatar/canon800D.jpg',43,NULL,NULL,NULL,NULL,1,'canon-800d-body',0),(113,'Fujifilm X-A7 (Body)',8500000.0,NULL,'Cảm biến: APS-C CMOS Sensor 24.2MP\r\nMàn hình: LCD cảm ứng 3.5\", 2.76m-Dot, xoay lật','Fujifilm vừa công bố chiếc máy ảnh X-A7 mới, cùng những tính năng tuyệt vời để thay thế cho người tiền nhiệm X-A5. Máy Ảnh Fujifilm X-A7 + Lens 15-45mm - Hàng Chính Hãng trang bị cảm biến 24.2MP CMOS, điểm lấy nét được tăng cường lên nhiều gấp 8.5 lần so với người anh em X-A5. Fujifilm X-A7 thiết kế gọn nhẹ, chất lượng hình ảnh vượt trội, cùng nhiều tính năng được cải tiến, thêm mới, hứa hẹn sẽ là một trong những lựa chọn lý tưởng, để bạn có thể gia nhập vào team máy ảnh mirrorless X Series của Fujifilm.','avatar/fuj.png',43,NULL,NULL,NULL,NULL,1,'fujifilm-x-a7-body',0),(114,'7Artisans 50mm F0.95',5500000.0,NULL,'Khẩu độ tối đa f / 0.95 nhanh phù hợp làm việc trong điều kiện ánh sáng yếu.','Ống kính 7Artisans 50mm F0.95 có độ dài thông thường APS-C: Một tiêu cự có độ dài thông thường được thiết kế để sử dụng với máy ảnh kỹ thuật số không gương lật ngàm X của Fuji,Sony E, Canon EOS M, Nikon Z và ngàm M4/3 cung cấp độ dài tiêu cự tương đương 75mm. Nó rất phù hợp để chụp hàng ngày với các đối tượng bao gồm chân dung, đường phố, cảnh đêm, phong cảnh và phóng sự.','avatar/7Artisans.png',44,NULL,NULL,NULL,NULL,1,'7artisans-50mm-f0-95',0),(115,'FUJIFILM X-T100',8000000.0,NULL,'Cảm biến CMOS Bayer APS-C 24.2MP\r\nBộ xử lý hình ảnh X-Processor Pro\r\nQuay phim UHD 4K 15fps, thời lượng 10 phút','Fujifilm X-T100 là một chiếc máy ảnh mirrorless với thiết kế nhỏ gọn và ngoại hình tinh tế. Máy ảnh Fujifilm X-T100 được trang bị cảm biến CMOS 24,2MP APS-C và cảm biến Bayer. Thân máy thiết kế kết hợp với kính ngắm điện tử OLED 2.36x, độ phóng đại 0.62x, để chụp ở tầm mắt trực quan và màn hình cảm ứng 3,0 inch có thể lật nghiêng để chụp ảnh tự sướng. Máy cũng được trang bị các kết nối không dây wifi, bluetooth để bạn có thể dễ dàng truyền tải dữ liệu sau khi chụp. Ngoài ra, máy sử dụng pin NP-W126S có thể chụp được 430 ảnh.','avatar/fuj2.png',43,NULL,NULL,NULL,NULL,1,'fujifilm-x-t100',0),(116,'FUJIFILM X-A5',5500000.0,NULL,'Cảm biến: APS-C\r\nDải ISO: 200 to 12800 (Mở rộng lên 100 - 51200)\r\nĐộ phân giải: 24.2MP','Fujifilm X-A5 là máy ảnh mirrorless thuộc dòng X-A thời trang của Fujifilm. Máy ảnh được làm từ hợp kim chống xước với gam màu chủ đạo là màu bạc kết hợp với một vài màu như đen, nâu,... tạo nên sự khác biệt mà không kém phần sang trọng. Màu sắc và kiểu dáng của Fujifilm XA5 mang đậm tính thời trang, tôn lên sự trẻ trung, năng động của người dùng. Máy ảnh trang bị màn hình cảm ứng 3 inch với 1.04 triệu điểm ảnh cho hình ảnh sắc nét, chân thực. \r\n\r\n','avatar/fuj3.png',43,NULL,NULL,NULL,NULL,1,'fujifilm-x-a5',0),(117,'Fujifilm X-T3',22500000.0,NULL,'Chụp tối đa 6 khung hình/giây\r\nTích hợp hệ thống Hybrid AF\r\nKết nối Bluetooth và Wi-Fi','Fujifilm X-T3 trang bị màn hình cảm ứng có thể tùy chỉnh và thao tác chạm và vuốt đơn giản trên màn hình LCD 3.5 inch với 2.76m-Dot, cho phép điều khiển trực quan các cài đặt chụp. Màn hình Fujifilm X-T3 cũng có thiết kế xoay lật đa chiều linh hoạt bằng khớp nối bên cạnh máy, để bạn có thể làm việc từ các góc cao, thấp và phía trước. Ngoài ra, màn hình có tỷ lệ khung hình 16: 9, rất phù hợp với các ứng dụng ghi video.','avatar/fuj4.png',43,NULL,NULL,NULL,NULL,1,'fujifilm-x-t3',0),(118,'Thẻ Nhớ SDXC Sony 64GB 94MB/s',800000.0,NULL,'Dung lượng 64GB\r\n\r\nTruyền tải tốc độ cao lên đến 94MB/s (tốc độ đọc)','Thẻ nhớ SDHC Sony 64GB 94MB/s cung cấp cho bạn bộ nhớ lưu trữ 64GB với tốc độ đọc dữ liệu tối đa lên đến 94 MB/s và tốc độ ghi tối đa lên tới 70 MB/s, bạn có thể chuyển nhanh các tệp đến thẻ một cách nhanh chóng, ngay cả những tệp lớn. Thẻ nhớ này này được thiết kế để quay video 4K, chụp liên tục tốc độ cao và tốc độ truyền nhanh.','avatar/the.png',45,NULL,NULL,NULL,NULL,0,'the-nho-sdxc-sony-64gb-94mb-s',0),(119,'Chân máy Benro T800EX',600000.0,NULL,'Số đoạn: 4, Số chân: 3\r\nChiều cao tối đa: 1450mm\r\nChiều cao khi thu gọn: 485mm\r\nKhả năng chịu lực: 3Kg','Với thiết kế dành riêng cho những chiếc máy ảnh, máy quay phim gia đình với kích thước gọn nhẹ, dễ di chuyển, dễ sử dụng. Không chỉ giúp chụp ảnh dễ dàng, giảm tình trạng mờ nhòe do rung tay, chân máy ảnh Benro T800EX còn đem lại cho bạn sự linh động để thoải mái sáng tạo những khung hình đẹp ,cũng như thoải mái mang theo trong những buổi dã ngoại du lịch cùng bạn bè người thân gia đình .','avatar/chan.png',46,NULL,NULL,NULL,NULL,1,'chan-may-benro-t800ex',0),(120,'Pin Canon Lpe6',380000.0,NULL,'Chất liệu: Lithium-ion\r\nDung lượng Pin: 1865mAh\r\nVolt (điện thế): 7.4V\r\nKích thước: 5.6 x 2.0 x 3.8 cm','Pin Canon LP-E6 là một lựa chọn hoàn hảo cho các dòng máy ảnh cao cấp. Pin có nhiệm vụ cung cấp điện để duy trì hoạt động cho máy ảnh DSLR EOS của bạn. Pin Canon LP-E6 tương thích với các bộ sạc LC-E6 và LC-E6E và dung lượng 1865mAh với một điện áp đầu ra của 7.2V.','avatar/pin.png',48,NULL,NULL,NULL,NULL,0,'pin-canon-lpe6',0),(121,'Mic Rode Wireless Go',5000000.0,NULL,'Tích hợp micro đa hướng và input micro 3.5mm\r\nBộ phát clip-on nhỏ nhất\r\nBộ thu clip-on nhỏ nhất\r\nThiết lập dễ dàng không cần menu\r\n3 thiết lập chỉnh gain','Rode Wireless GO là bộ micrphone không dây linh hoạt nhất và nhỏ nhất thế giới. Bộ phát làm việc như micro clip-on hoặc như beltpack nhỏ nhất thế giới cho micro cài áo RODE. Bộ microphone thu âm này cho âm thanh chuẩn phát sóng trong trẻo, rõ ràng, thông qua đường truyền kỹ thuật số 2.4GHz đến bộ thu on-camera siêu nhỏ gọn.','avatar/micro.png',49,NULL,NULL,NULL,NULL,0,'mic-rode-wireless-go',0);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products_images`
--

DROP TABLE IF EXISTS `tbl_products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_product_images_idx` (`product_id`),
  CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu danh sách ảnh sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products_images`
--

LOCK TABLES `tbl_products_images` WRITE;
/*!40000 ALTER TABLE `tbl_products_images` DISABLE KEYS */;
INSERT INTO `tbl_products_images` VALUES (103,'canon800D_3.jpg','image/canon800D_3.jpg',112,NULL,NULL,NULL,NULL,1),(104,'canon800D_2.jpg','image/canon800D_2.jpg',112,NULL,NULL,NULL,NULL,1),(105,'canon800D_1.jpg','image/canon800D_1.jpg',112,NULL,NULL,NULL,NULL,1),(106,'fuj_1.png','image/fuj_1.png',113,NULL,NULL,NULL,NULL,1),(107,'7Artisans_2.png','image/7Artisans_2.png',114,NULL,NULL,NULL,NULL,1),(108,'7Artisans_1.png','image/7Artisans_1.png',114,NULL,NULL,NULL,NULL,1),(109,'fuj2_3.png','image/fuj2_3.png',115,NULL,NULL,NULL,NULL,1),(110,'fuj2_2.png','image/fuj2_2.png',115,NULL,NULL,NULL,NULL,1),(111,'fuj3_3.png','image/fuj3_3.png',116,NULL,NULL,NULL,NULL,1),(112,'fuj3_2.png','image/fuj3_2.png',116,NULL,NULL,NULL,NULL,1),(113,'fuj3_1.png','image/fuj3_1.png',116,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (11,'ADMIN','control everything',NULL,NULL,NULL,NULL,1),(13,'Khach','read',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder`
--

DROP TABLE IF EXISTS `tbl_saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `seo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total_price` decimal(13,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder`
--

LOCK TABLES `tbl_saleorder` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder` DISABLE KEYS */;
INSERT INTO `tbl_saleorder` VALUES (39,'ORDER-1650297368020',0,1.00,NULL,NULL,NULL,NULL,0,'mạnh','ha noi','ORDER-1650297368020','0909888111','phammanh1211t@gmail.com',12500000.0),(40,'ORDER-1650677669804',0,3.00,NULL,NULL,NULL,NULL,0,'manh','số 33, ngõ 33, phú đô','ORDER-1650677669804','0336910771','phammanh1211t@gmail.com',26500000.0),(41,'ORDER-1650818841476',0,3.00,NULL,NULL,NULL,NULL,0,'manh','12','ORDER-1650818841476','21','phammanh@gmail.com',19500000.0);
/*!40000 ALTER TABLE `tbl_saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder_products`
--

DROP TABLE IF EXISTS `tbl_saleorder_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quality` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `price_Unit` decimal(13,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_saleorder_product_idx` (`product_id`),
  KEY `fk_saleorder_product_idx1` (`saleorder_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`),
  CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`saleorder_id`) REFERENCES `tbl_saleorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder_products`
--

LOCK TABLES `tbl_saleorder_products` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder_products` DISABLE KEYS */;
INSERT INTO `tbl_saleorder_products` VALUES (62,39,112,1,NULL,NULL,NULL,NULL,1,NULL),(63,40,114,1,NULL,NULL,NULL,NULL,1,NULL),(64,40,112,1,NULL,NULL,NULL,NULL,1,NULL),(65,40,113,1,NULL,NULL,NULL,NULL,1,NULL),(66,41,116,2,NULL,NULL,NULL,NULL,1,NULL),(67,41,113,1,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tbl_saleorder_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (11,'manh','$2a$04$GCo59PsN4doolgMwIweM/OAjsLx/E1E1ktCnHSGLBkvOnFMAQ.K9.','phammanh@gmail.com',NULL,NULL,NULL,NULL,1),(12,'thu','$2a$04$NLYU5D.hzK4kbJ4mMU10Q.JGjMQMGm40N7i6ptfll0NJbT4p9jdSW','phamthu123',NULL,NULL,NULL,NULL,1),(33,'hao nguyen','$2a$04$nPgYme1f9djuDa5a02ymQe/vtS/p0UIw3VAbTDgx3RSpGzi8H.DWK','hao1211@gmail.com',NULL,NULL,NULL,NULL,1),(34,'long','$2a$04$2ogm7.Dok2AeyU4kW0.tWOqBMbEeZ.BJ9VJskuF7YeJhM.ztaWQgG','long12@gmail.com',NULL,NULL,NULL,NULL,1),(35,'mai anh','$2a$04$c/63j7bkbj9tZcoLVAl.euanjK/eEBR53tUrS6K21ZXxkW18aIhxO','sdfsd@sfsdf.com',NULL,NULL,NULL,NULL,1),(36,'trang','$2a$04$a/fYH44vmXE6mpfNDpnS8uOunMw4xlMhFLIheIhSnRH6KhX5Uv10.','trangpham@gmail.com',NULL,NULL,NULL,NULL,1),(37,'manh','$2a$04$RKFMT8MeQJxvs.nHcjjrZuGeumSdagTjDVR3YS2h5FPDdEFHEnudi','manh123',NULL,NULL,NULL,NULL,1),(38,'minh anh','$2a$04$5T5JyDG/ZyM7kGs2.YiJzebJzX7h5rtQ3BVrWjfWBSHWn1BhGoA.K','minh@gmail.com',NULL,NULL,NULL,NULL,1),(39,'tran min','$2a$04$C9XPY3P0KzDLqJOxwxPAIuCn4.L2nfAmC2Ta6Xfzmguc/7cEQwTm.','pha',NULL,NULL,NULL,NULL,1),(40,'tran minh','$2a$04$BilWvW7xCo8OJk1.o4ciIeJ4NfcEAe4kI.7fxZiMEOjinDW6wTNZO','minh',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_roles`
--

DROP TABLE IF EXISTS `tbl_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='bảng trung gian thể hiện quan hệ n-n của users và roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_roles`
--

LOCK TABLES `tbl_users_roles` WRITE;
/*!40000 ALTER TABLE `tbl_users_roles` DISABLE KEYS */;
INSERT INTO `tbl_users_roles` VALUES (11,11),(12,13),(33,13),(34,13),(35,13),(36,13),(37,13),(38,13),(39,13),(40,13);
/*!40000 ALTER TABLE `tbl_users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-06 21:23:58

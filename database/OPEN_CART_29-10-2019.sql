-- MySQL dump 10.17  Distrib 10.3.16-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: opencarts
-- ------------------------------------------------------
-- Server version	10.3.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category_options`
--

DROP TABLE IF EXISTS `category_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_category_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_options`
--

LOCK TABLES `category_options` WRITE;
/*!40000 ALTER TABLE `category_options` DISABLE KEYS */;
INSERT INTO `category_options` VALUES (13,28,22,NULL,NULL,NULL);
/*!40000 ALTER TABLE `category_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_products`
--

DROP TABLE IF EXISTS `category_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_products_product_categories1_idx` (`category_id`),
  KEY `fk_category_products_products1_idx` (`product_id`),
  CONSTRAINT `fk_category_products_product_categories1` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_products`
--

LOCK TABLES `category_products` WRITE;
/*!40000 ALTER TABLE `category_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codes`
--

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;
INSERT INTO `codes` VALUES (1,'NORMAL','NORMAL',NULL),(2,'COLOR','COLOR',NULL),(6,'FILE_IMG',NULL,NULL);
/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Egypt',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_packages`
--

DROP TABLE IF EXISTS `country_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_packages_countries1_idx` (`country_id`),
  KEY `fk_country_packages_country_packages1_idx` (`package_id`),
  CONSTRAINT `fk_country_packages_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_packages_country_packages1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_packages`
--

LOCK TABLES `country_packages` WRITE;
/*!40000 ALTER TABLE `country_packages` DISABLE KEYS */;
INSERT INTO `country_packages` VALUES (4,1,1,NULL,NULL,NULL),(5,1,2,NULL,NULL,NULL),(6,1,7,NULL,NULL,NULL);
/*!40000 ALTER TABLE `country_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_product_categories`
--

DROP TABLE IF EXISTS `country_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_product_categories_countries1_idx` (`country_id`),
  KEY `fk_country_product_categories_product_categories1_idx` (`product_category_id`),
  CONSTRAINT `fk_country_product_categories_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_product_categories_product_categories1` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_product_categories`
--

LOCK TABLES `country_product_categories` WRITE;
/*!40000 ALTER TABLE `country_product_categories` DISABLE KEYS */;
INSERT INTO `country_product_categories` VALUES (1,1,1,NULL,NULL,NULL),(2,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `country_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_products`
--

DROP TABLE IF EXISTS `country_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_products_countries1_idx` (`country_id`),
  KEY `fk_country_products_products1_idx` (`product_id`),
  CONSTRAINT `fk_country_products_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_products`
--

LOCK TABLES `country_products` WRITE;
/*!40000 ALTER TABLE `country_products` DISABLE KEYS */;
INSERT INTO `country_products` VALUES (1,1,1,NULL,NULL,NULL),(2,1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `country_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 0,
  `is_used` tinyint(4) DEFAULT NULL,
  `is_percent` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `fk_coupons_store1_idx` (`store_id`),
  CONSTRAINT `fk_coupons_store1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,1,'NP1D12D',12,1,0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currancies`
--

DROP TABLE IF EXISTS `currancies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currancies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_currancies_countries1_idx` (`country_id`),
  CONSTRAINT `fk_currancies_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currancies`
--

LOCK TABLES `currancies` WRITE;
/*!40000 ALTER TABLE `currancies` DISABLE KEYS */;
INSERT INTO `currancies` VALUES (1,1,'EGP','MSRY',NULL,NULL,0,NULL,NULL,NULL),(2,1,'URD','URO',NULL,NULL,12,NULL,NULL,NULL);
/*!40000 ALTER TABLE `currancies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
INSERT INTO `customer_user` VALUES (1,'Casasd','c1@gmail.com',NULL,'$2y$10$A/PVDn8NMG8nU2KoCEqtuutMIPgeN0JblCNTMftJAF3IZlux2EIGe','$2y$10$uApEmhV5sfV7lheEy.21ZOme/DFxIK1nqs4hG6xM5mo3J7JT5R.A2','TCXOvYKnDS0YhbFTqPvXHk1Tvs1VHbVHFozDnbJRKDAwImOIsdNHnPb2FVmO',NULL,'2019-10-24 15:39:43');
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `discountable_type` text DEFAULT NULL,
  `discountable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discounts_coupons1_idx` (`coupon_id`),
  CONSTRAINT `fk_discounts_coupons1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `fileable_id` int(11) DEFAULT NULL,
  `fileable_type` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `url` text NOT NULL,
  `ext` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code_id_with_files_idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'0',1,'App\\models\\OptionCategory','asdasd','asas','png',NULL,NULL,NULL),(2,'0',1,'App\\models\\OptionCategory',NULL,'asdasdasd',NULL,'2019-10-26 07:43:11',NULL,'2019-10-26 07:43:11'),(34,'FILE_IMG',10,'App\\models\\OptionCategory','Option Category Image File','D2VcKtuXhciWHY6KVAYZ0784w5lrAFprr3Hi81tE.png','png','2019-10-26 17:29:57',NULL,'2019-10-26 17:29:57'),(39,'FILE_IMG',11,'App\\models\\OptionCategory','Option Category Image File','KTWtdjkXeLEks0ciAWtcXKleoANoq2spOG4bGYEm.png','png','2019-10-26 17:37:26',NULL,'2019-10-26 17:37:26'),(45,'FILE_IMG',13,'App\\models\\OptionCategory','Option Category Image File','kEVl0nspD7hyOhwEpVhEOFZfcF7jGC3wKMo3spXo.jpeg','jpeg','2019-10-27 10:45:57',NULL,'2019-10-27 10:45:57');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `loggable_id` int(11) DEFAULT NULL,
  `loggable_type` text DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2014_10_12_000000_create_users_table',2),(6,'2013_07_25_145943_create_languages_table',3),(7,'2013_07_25_145958_create_translations_table',4),(8,'2016_06_02_124154_increase_locale_length',5),(9,'2019_10_22_181833_create_permission_tables',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (1,'App\\User',1),(2,'App\\models\\CustomerUser',1);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_shippings`
--

DROP TABLE IF EXISTS `model_shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_shippings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `shippable_id` int(11) DEFAULT NULL,
  `shippable_type` varchar(100) DEFAULT NULL COMMENT 'package_product',
  `value` float DEFAULT NULL,
  `is_percentage` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_shippings`
--

LOCK TABLES `model_shippings` WRITE;
/*!40000 ALTER TABLE `model_shippings` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_taxes`
--

DROP TABLE IF EXISTS `model_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `taxable_type` varchar(100) DEFAULT NULL COMMENT 'product_package',
  `taxable_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `is_percentage` tinyint(4) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_taxes`
--

LOCK TABLES `model_taxes` WRITE;
/*!40000 ALTER TABLE `model_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_categories`
--

DROP TABLE IF EXISTS `option_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL COMMENT 'type of category (Color , Normal)',
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_option category_store_idx` (`store_id`),
  KEY `codes_fk__idx` (`store_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_categories`
--

LOCK TABLES `option_categories` WRITE;
/*!40000 ALTER TABLE `option_categories` DISABLE KEYS */;
INSERT INTO `option_categories` VALUES (1,'NORMAL',1,'dqwdqwdqwd123123','qwdqwdqwdqwdqwd123123123123','translatable.optioncategory.name.HPhy8CtFBGp1YaKH','translatable.optioncategory.description.6a1LpX3mPgxvd6qK',0,'2019-10-26 11:54:59','2019-10-26 12:34:02','2019-10-26 12:34:02'),(2,'COLOR',1,'dqwdqwdqwd','qwdqwdqwdqwdqwd','translatable.optioncategory.name.YCMsP6xe9y8Fki1m','translatable.optioncategory.description.oSTddMsVB6AFvPsx',0,'2019-10-26 11:55:05','2019-10-26 12:34:01','2019-10-26 12:34:01'),(3,'NORMAL',1,'asdasdas','ترجمه 3','translatable.optioncategory.name.yKtNOlignA6jwvC8','translatable.optioncategory.description.QClkhtKKw4y0OLsr',0,'2019-10-26 12:04:44','2019-10-26 12:33:50','2019-10-26 12:33:50'),(4,'NORMAL',1,'qwdqwd','qwdqwdqwd',NULL,NULL,0,'2019-10-26 12:05:27','2019-10-26 12:33:48','2019-10-26 12:33:48'),(5,'NORMAL',1,'asdasdasd','asdasdasdasdasd','translatable.optioncategory.name.3FWI1lwJicYY7PNC','translatable.optioncategory.description.JlQgogLiVqAJ28hr',0,'2019-10-26 12:09:10','2019-10-26 12:33:46','2019-10-26 12:33:46'),(6,'NORMAL',1,'asdasdasd','asdasdasdasdasd','translatable.optioncategory.name.hFN94zxM8N6i6ZoG','translatable.optioncategory.description.Q1JWV4ZtsONMX9cG',0,'2019-10-26 12:09:17','2019-10-26 12:33:48','2019-10-26 12:33:48'),(7,'NORMAL',1,'asdasdasd','asdasdasdasdasd','translatable.optioncategory.name.tJ95TevJQthUQpHQ','translatable.optioncategory.description.tTyzPOGNBDSetPUt',0,'2019-10-26 12:09:27','2019-10-26 12:33:44','2019-10-26 12:33:44'),(8,'NORMAL',1,'asdasdasd','asdasdasdasdasd','translatable.optioncategory.name.zeHjxqcgsaBvKLCs','translatable.optioncategory.description.PZvbFicLm10XKgg6',0,'2019-10-26 12:09:32','2019-10-26 12:33:46','2019-10-26 12:33:46'),(9,'COLOR',1,'asdasdasd','dasdasdasd','translatable.optioncategory.name.v26cYh7DyX7gLSgy','translatable.optioncategory.description.1Ookz7kVLSEduqnO',1,'2019-10-26 12:34:10','2019-10-26 12:34:58','2019-10-26 12:34:58'),(10,'COLOR',1,'qwdqwd','qwdqwdqwdqwdqwdqwd','translatable.optioncategory.name.ioh7caqW2IZssrxd','translatable.optioncategory.description.K2pa3GtZ55eC6UQ1',0,'2019-10-26 12:35:02','2019-10-26 17:37:51','2019-10-26 17:37:51'),(11,'NORMAL',1,'Hello asasa','asdasdasdasd','translatable.optioncategory.name.DPGRS0FCRvU9j8pc','translatable.optioncategory.description.hEnfVhieBDJzjYoV',0,'2019-10-26 17:30:10','2019-10-26 17:37:53','2019-10-26 17:37:53'),(12,'COLOR',1,'Main Colors','This Colors For Poducts','translatable.optioncategory.name.pEKOTpvqkKetkTUd','translatable.optioncategory.description.DuMJpzaxou9LNfr5',1,'2019-10-26 17:38:15',NULL,'2019-10-27 10:19:20'),(13,'NORMAL',1,'Shoes Size','Shoes\'s Sizes','translatable.optioncategory.name.He4a8HM4aZQTRO9p','translatable.optioncategory.description.MTEdvg5eoYuYBoYl',1,'2019-10-26 17:38:58','2019-10-27 16:23:52','2019-10-27 16:23:52'),(14,'NORMAL',1,'Glasses Axis','Glasses Axis','translatable.optioncategory.name.0wR0zatIuc6yQzQb','translatable.optioncategory.description.N5txuIej5YrH10Md',1,'2019-10-27 10:19:02','2019-10-27 10:46:05','2019-10-27 10:46:05'),(15,'NORMAL',1,'asdasdasd','asdasdasdasd','translatable.optioncategory.name.Gi014dFO86dcKNsX','translatable.optioncategory.description.rawhxgIRGkM7F96x',0,'2019-10-27 10:20:44','2019-10-27 16:23:54','2019-10-27 16:23:54'),(16,'NORMAL',1,'Aixes','asdasda','translatable.optioncategory.name.zwQG51qCE7AjSU9R','translatable.optioncategory.description.j1QuUIzEaH2EMd1x',1,'2019-10-27 16:24:06','2019-10-28 15:24:02','2019-10-28 15:24:02'),(17,'NORMAL',1,'asdasdasd','asdasdasdasdasd','translatable.optioncategory.name.kLz96qntCHDeAhqO','translatable.optioncategory.description.HZkG0d8dCpreCYxU',0,'2019-10-28 12:14:24','2019-10-28 12:15:04','2019-10-28 12:15:04'),(18,'NORMAL',1,'asdasda','sdasdasdasdasd','translatable.optioncategory.name.GDkMgLh8AdXn78r7','translatable.optioncategory.description.MWfnIRTW2YkhyWfh',0,'2019-10-28 12:15:09','2019-10-28 15:24:00','2019-10-28 15:24:00'),(19,'NORMAL',1,'asdasda','sdasdasdasd','translatable.optioncategory.name.NfmcRU8eRETat0BW','translatable.optioncategory.description.o6imMFeVIhmPogl8',0,'2019-10-28 12:16:53','2019-10-28 15:23:59','2019-10-28 15:23:59'),(20,'NORMAL',1,'asdasda','sdasdasdasd','translatable.optioncategory.name.R6Mf61YW3LFg7Arp','translatable.optioncategory.description.uLEMDx7z1yBJL8F1',0,'2019-10-28 12:40:12','2019-10-28 15:23:57','2019-10-28 15:23:57'),(21,'NORMAL',1,'asdasda','sdasdasdasd','translatable.optioncategory.name.8ILmwUC9evUklEoj','translatable.optioncategory.description.iYb88NKJHRKGZWbk',0,'2019-10-28 12:40:23','2019-10-28 15:23:55','2019-10-28 15:23:55'),(22,'NORMAL',1,'asdasda','sdasdasdasd','translatable.optioncategory.name.P34e2mERBCvzBtsm','translatable.optioncategory.description.8AsdnR7DTrd5jmpa',0,'2019-10-28 12:40:54','2019-10-28 15:23:54','2019-10-28 15:23:54'),(23,'NORMAL',1,'asdasda','sdasdasdasd','translatable.optioncategory.name.NqwBSjBrGFVEexwM','translatable.optioncategory.description.0Cjo6w2AXuJSSUDn',0,'2019-10-28 12:44:08','2019-10-28 15:23:51','2019-10-28 15:23:51'),(24,'NORMAL',1,'aaaaa','aaaaaaaaaaaaaaaaaaaa','translatable.optioncategory.name.6gz3IQPOXrdAWLHj','translatable.optioncategory.description.1c5dznSh6BlzBEtI',0,'2019-10-28 12:45:25','2019-10-28 15:23:49','2019-10-28 15:23:49'),(25,'NORMAL',1,'sdasasd','qwqwdqwdqwdqwd','translatable.optioncategory.name.SEJmYjH0ZMC3IyTB','translatable.optioncategory.description.t8iSVAJbBfeplNwP',0,'2019-10-28 15:24:27','2019-10-28 16:40:54','2019-10-28 16:40:54'),(26,'NORMAL',1,'adkljadkajsd','qwdiojqwodijqwoqjwdio','translatable.optioncategory.name.r7vGJBvtwGQ0VIvC','translatable.optioncategory.description.6twtnhe2oNefG9Zn',0,'2019-10-28 16:41:45','2019-10-28 17:12:48','2019-10-28 17:12:48'),(27,'NORMAL',1,'aaaaaaaaa','asdasdasd','translatable.optioncategory.name.gH52458gKzfsDw7w','translatable.optioncategory.description.XcTcDBuRmSovycW8',0,'2019-10-28 17:13:10','2019-10-28 17:25:53','2019-10-28 17:25:53'),(28,'NORMAL',1,'asdasdasd','wdqwdqwqwd','translatable.optioncategory.name.qYLqCaKTjYAbMw3z','translatable.optioncategory.description.JvJA8ZOh8fmvWnxS',0,'2019-10-28 17:26:00',NULL,'2019-10-28 17:26:00');
/*!40000 ALTER TABLE `option_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_options_store1_idx` (`store_id`),
  CONSTRAINT `fk_options_store1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (18,NULL,'asdasda','<p><span style=\"color: rgb(255, 194, 102);\">aaaaaaaaaaaa</span></p>','translatable.option.name.FlogNUokYOBwMSku','translatable.option.description.oElxf9DR6P47kThH',1,'2019-10-28 17:34:34',NULL,'2019-10-28 17:34:34'),(19,NULL,'qwdqwdqwdqwd','<p>wewfwef</p>','translatable.option.name.Xb4IDRu78g8rEhP2','translatable.option.description.HIQoeG5yDUiMccl6',1,'2019-10-28 17:37:16',NULL,'2019-10-28 17:37:16'),(20,NULL,'aaaaaaaaaaaaaaaaaa','<p>asdasdasdasd</p>','translatable.option.name.US1baFAUex8jhRlx','translatable.option.description.aQstWvyEmZjpU0y6',1,'2019-10-28 17:38:20',NULL,'2019-10-28 17:38:20'),(21,NULL,'aklsdjaklsjd','<p>kldjaklsjdalksjakljsd</p>','translatable.option.name.06F6hU1fiO9QYmo0','translatable.option.description.AsNM7lYe4ZqhYuAc',1,'2019-10-28 17:39:01',NULL,'2019-10-28 17:39:01'),(22,NULL,'asdasdasdasd','<p>ad121212d12d          <span style=\"color: rgb(0, 102, 204);\">aaaaaaaaaaaaaaaaaaa</span><span style=\"color: rgb(0, 102, 204); background-color: rgb(178, 107, 0);\">aaaaaaa</span></p>','translatable.option.name.jDluTt2OYYPrGb3R','translatable.option.description.03mEurTI6cZACkfC',1,'2019-10-28 17:41:46',NULL,'2019-10-28 17:42:19');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_products`
--

DROP TABLE IF EXISTS `package_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_products`
--

LOCK TABLES `package_products` WRITE;
/*!40000 ALTER TABLE `package_products` DISABLE KEYS */;
INSERT INTO `package_products` VALUES (1,1,2,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `package_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_stores`
--

DROP TABLE IF EXISTS `package_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_stores`
--

LOCK TABLES `package_stores` WRITE;
/*!40000 ALTER TABLE `package_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,NULL,1,'package_1','Pas asdasd',NULL,NULL,1,'2019-10-22 03:58:53',NULL,'2019-10-22 03:58:53'),(2,NULL,1,'package_1','Pas asdasd','translatable.package.name.SfavZVZ9cQwYDyJp','translatable.package.description.x5gQVZSSpJmwUlQ9',1,'2019-10-22 04:01:36',NULL,'2019-10-22 04:01:36'),(3,NULL,1,'name 2','aaasdasd','translatable.package.name.pK3SnFPcTfVcvIYc','translatable.package.description.0N8yF0EnIoFe6YA0',1,'2019-10-22 06:25:04',NULL,'2019-10-22 06:25:04'),(4,NULL,1,'name 3','aaasdasd','translatable.package.name.bGZ9OZ8aYzJLZKg9','translatable.package.description.i1udOuerazVwk5HC',1,'2019-10-22 06:25:40',NULL,'2019-10-22 06:25:40'),(5,NULL,1,'name 3','aaasdasd','translatable.package.name.IYDkoVuIOEDHmoDH','translatable.package.description.MMYhalfnfCtgN4CX',1,'2019-10-22 06:56:00',NULL,'2019-10-22 06:56:00'),(6,NULL,1,'name 3','aaasdasd','translatable.package.name.dLUOR53X7BGc96HJ','translatable.package.description.tx0QnyJJUUPKgunB',1,'2019-10-22 07:07:50',NULL,'2019-10-22 07:07:50'),(7,NULL,1,'name 3','aaasdasd','translatable.package.name.50UNQ8vCb2OVkmrD','translatable.package.description.Dtx61GNOVaz2TYwx',1,'2019-10-22 08:29:59',NULL,'2019-10-22 08:29:59');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'HAS_STORES','store',NULL,NULL),(2,'STORE_USER','store',NULL,NULL),(3,'ADMIN','store',NULL,NULL),(4,'','',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currancy_id` varchar(45) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `priceable_type` text DEFAULT NULL COMMENT 'product\\\\\\\\npackages\\\\\\\\noptions\\\\\\\\n',
  `priceable_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,'1',NULL,'App\\models\\Option',12,'2019-10-28 16:41:45',NULL,'2019-10-28 16:41:45'),(2,'1',1212,'App\\models\\Option',13,'2019-10-28 17:06:16',NULL,'2019-10-28 17:06:16'),(7,'<p>asdasdasdasd</p>',122.32,'App\\models\\Option',17,'2019-10-28 17:26:17',NULL,'2019-10-28 17:28:51'),(8,'1',NULL,'App\\models\\Option',18,'2019-10-28 17:34:34',NULL,'2019-10-28 17:34:34'),(9,'1',0.01,'App\\models\\Option',19,'2019-10-28 17:37:16',NULL,'2019-10-28 17:37:16'),(10,'1',0.01,'App\\models\\Option',20,'2019-10-28 17:38:20',NULL,'2019-10-28 17:38:20'),(11,'1',0.01,'App\\models\\Option',21,'2019-10-28 17:39:01',NULL,'2019-10-28 17:39:01'),(12,'1',0.01,'App\\models\\Option',22,'2019-10-28 17:41:46',NULL,'2019-10-28 17:41:46');
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,NULL,NULL,'Product 1','Product Description 1','translatable.productcategory.name.zkaFDt1UEDhFIVGf','translatable.productcategory.description.tvpIYwFZk0OphJ0i','2019-10-21 17:54:36',NULL,'2019-10-21 17:54:36'),(2,NULL,NULL,'P2','وصف الاولب','translatable.productcategory.name.Cx5rPAepErp5Cre9','translatable.productcategory.description.kjHY9B9yc2wv7VX9','2019-10-21 18:03:38',NULL,'2019-10-21 18:07:09');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_options`
--

DROP TABLE IF EXISTS `product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_options_products1_idx` (`product_id`),
  KEY `fk_product_options_options1_idx` (`option_id`),
  CONSTRAINT `fk_product_options_options1` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_options_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_options`
--

LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
INSERT INTO `product_options` VALUES (1,1,1,NULL,NULL,NULL),(3,1,2,NULL,NULL,NULL),(4,1,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_store1_idx` (`store_id`),
  CONSTRAINT `fk_products_store1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Product 1','asdasdasd',NULL,NULL,1,NULL,NULL,NULL),(2,2,'asdasd','asasas',NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super_admin','store',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_packages`
--

DROP TABLE IF EXISTS `store_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `product_limits` int(11) DEFAULT 1000,
  `category_limits` int(11) DEFAULT 1000,
  `countries_limits` int(11) DEFAULT NULL,
  `has_options` tinyint(4) DEFAULT NULL,
  `has_packages` timestamp NULL DEFAULT NULL,
  `has_logs` tinyint(4) DEFAULT NULL,
  `custom_style` tinyint(4) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_packages`
--

LOCK TABLES `store_packages` WRITE;
/*!40000 ALTER TABLE `store_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_settings`
--

DROP TABLE IF EXISTS `store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) DEFAULT NULL,
  `client_secret` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_settings`
--

LOCK TABLES `store_settings` WRITE;
/*!40000 ALTER TABLE `store_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `name_translation` text DEFAULT NULL,
  `description_translation` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Store 1','Very Good',1,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(2,'Store 2','Very Bad',1,NULL,NULL,'0000-00-00 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_users`
--

DROP TABLE IF EXISTS `supplier_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_token_UNIQUE` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_users`
--

LOCK TABLES `supplier_users` WRITE;
/*!40000 ALTER TABLE `supplier_users` DISABLE KEYS */;
INSERT INTO `supplier_users` VALUES (1,'s1','s1@gmail.com',NULL,'$2y$10$A/PVDn8NMG8nU2KoCEqtuutMIPgeN0JblCNTMftJAF3IZlux2EIGe','$2y$10$T1FuTHrxIquQGW9ecjzssODTMqUeBj5gqZB1iSnB1vs9rEyAeS4rq','d0QgnNQcypCHOVB276fSqfkK6rSeOvR5W6vfCkJD5KE3dU7ykY3g7z6CnNJ9',NULL,'2019-10-22 17:45:21');
/*!40000 ALTER TABLE `supplier_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translator_languages`
--

DROP TABLE IF EXISTS `translator_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translator_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translator_languages_locale_unique` (`locale`),
  UNIQUE KEY `translator_languages_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translator_languages`
--

LOCK TABLES `translator_languages` WRITE;
/*!40000 ALTER TABLE `translator_languages` DISABLE KEYS */;
INSERT INTO `translator_languages` VALUES (1,'ar','العربيه',NULL,NULL,NULL),(2,'en','English',NULL,NULL,NULL);
/*!40000 ALTER TABLE `translator_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translator_translations`
--

DROP TABLE IF EXISTS `translator_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translator_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(196) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unstable` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translator_translations`
--

LOCK TABLES `translator_translations` WRITE;
/*!40000 ALTER TABLE `translator_translations` DISABLE KEYS */;
INSERT INTO `translator_translations` VALUES (22,'en','*','translatable','optioncategory.name.pEKOTpvqkKetkTUd','Main Colors',0,0,'2019-10-26 17:38:15','2019-10-26 17:38:15'),(23,'en','*','translatable','optioncategory.description.DuMJpzaxou9LNfr5','This Colors For Poducts',0,0,'2019-10-26 17:38:15','2019-10-26 17:38:15'),(44,'en','*','translatable','option.name.HGm2mR8gsU0zbLYY','asdasdas',0,0,'2019-10-28 12:40:54','2019-10-28 12:40:54'),(45,'en','*','translatable','option.description.dpNh0TVpGQfQRzuH','dasdasdasd',0,0,'2019-10-28 12:40:54','2019-10-28 12:40:54'),(46,'en','*','translatable','option.name.UpzlRasmBPSEEsS3','asdasdasdasd',0,0,'2019-10-28 12:40:54','2019-10-28 12:40:54'),(47,'en','*','translatable','option.description.6ptFG4wL3gOUwxRH','asdasd',0,0,'2019-10-28 12:40:54','2019-10-28 12:40:54'),(50,'en','*','translatable','option.name.yeVNbMy6NWLUDCyi','asdasdas',0,0,'2019-10-28 12:44:08','2019-10-28 12:44:08'),(51,'en','*','translatable','option.description.xyeuQUiYBKrmI7Xf','dasdasdasd',0,0,'2019-10-28 12:44:08','2019-10-28 12:44:08'),(52,'en','*','translatable','option.name.6mxuYRa0Z9ruZE0A','asdasdasdasd',0,0,'2019-10-28 12:44:08','2019-10-28 12:44:08'),(53,'en','*','translatable','option.description.XsxJWDaAJef4Hd20','asdasd',0,0,'2019-10-28 12:44:08','2019-10-28 12:44:08'),(56,'en','*','translatable','option.name.NY7SOR9aQMoSImtA','qwdqwd',0,0,'2019-10-28 12:45:25','2019-10-28 12:45:25'),(57,'en','*','translatable','option.description.pUY6syUCX1MkgZmU','qwdqwqwd',0,0,'2019-10-28 12:45:25','2019-10-28 12:45:25'),(58,'en','*','translatable','option.name.FSm21dCNbc5EOL3v','qwqwqw',0,0,'2019-10-28 12:45:25','2019-10-28 12:45:25'),(59,'en','*','translatable','option.description.ovTI06FieQzJwK8F','aaa',0,0,'2019-10-28 12:45:25','2019-10-28 12:45:25'),(62,'en','*','translatable','option.name.wI2qlkPIKC3n4Vr5','Option 1',0,0,'2019-10-28 15:24:27','2019-10-28 15:24:27'),(63,'en','*','translatable','option.description.wC5TsK6PvnmWQQmm','asdasd',0,0,'2019-10-28 15:24:27','2019-10-28 15:24:27'),(64,'en','*','translatable','option.name.LKGh8mSAEa9ywMVC','Option 2',0,0,'2019-10-28 15:24:27','2019-10-28 15:24:27'),(65,'en','*','translatable','option.description.xqEGP1WrJe8em31s','asas',0,0,'2019-10-28 15:24:27','2019-10-28 15:24:27'),(68,'en','*','translatable','option.name.WjgulWmZom4DJmJ6','asdasda',0,0,'2019-10-28 16:41:45','2019-10-28 16:41:45'),(69,'en','*','translatable','option.name.jtu7CCNSSqEQ1pm7','asdasda',0,0,'2019-10-28 17:06:16','2019-10-28 17:06:16'),(70,'en','*','translatable','option.description.XNwzyrDEisrdRDAO','<p>wdqwdqwdqwdqwdqwd</p>',0,0,'2019-10-28 17:06:16','2019-10-28 17:06:16'),(73,'en','*','translatable','option.name.uLd8q9iqVpfJBhCt','asdasdasdasd',0,0,'2019-10-28 17:13:10','2019-10-28 17:13:10'),(74,'en','*','translatable','option.description.s7ABXrUdx9Ovbfle','<p>asdasdasdasd</p>',0,0,'2019-10-28 17:13:10','2019-10-28 17:13:10'),(75,'en','*','translatable','option.name.ybUDrjitr6Zhle4i','asdasdasdasd',0,0,'2019-10-28 17:22:14','2019-10-28 17:22:14'),(76,'en','*','translatable','option.description.r9UbGKQunqYvX7m3','<p>asdasdasdasd</p>',0,0,'2019-10-28 17:22:14','2019-10-28 17:22:14'),(77,'en','*','translatable','option.name.LiAx5oRAXbQHiTNr','asdasdasdasd',0,0,'2019-10-28 17:22:14','2019-10-28 17:22:14'),(78,'en','*','translatable','option.description.QBjUZVJ2ixUOnpXJ','<p>asdasdasdasd</p>',0,0,'2019-10-28 17:22:14','2019-10-28 17:22:14'),(79,'en','*','translatable','optioncategory.name.qYLqCaKTjYAbMw3z','asdasdasd',0,0,'2019-10-28 17:26:00','2019-10-28 17:26:00'),(80,'en','*','translatable','optioncategory.description.JvJA8ZOh8fmvWnxS','wdqwdqwqwd',0,0,'2019-10-28 17:26:00','2019-10-28 17:26:00'),(81,'en','*','translatable','option.name.Z0bXlldMrZi5MZ4t','qwdqwdqwdqwdqwd',0,0,'2019-10-28 17:26:17','2019-10-28 17:26:17'),(82,'en','*','translatable','option.description.VBx95nqnTslwCVE5','<p>asdasdasdasd</p>',0,0,'2019-10-28 17:26:17','2019-10-28 17:26:17'),(83,'en','*','translatable','option.name.FlogNUokYOBwMSku','asdasda',0,0,'2019-10-28 17:34:34','2019-10-28 17:34:34'),(84,'en','*','translatable','option.description.oElxf9DR6P47kThH','<p><span style=\"color: rgb(255, 194, 102);\">aaaaaaaaaaaa</span></p>',0,0,'2019-10-28 17:34:34','2019-10-28 17:34:34'),(85,'en','*','translatable','option.name.Xb4IDRu78g8rEhP2','qwdqwdqwdqwd',0,0,'2019-10-28 17:37:16','2019-10-28 17:37:16'),(86,'en','*','translatable','option.description.HIQoeG5yDUiMccl6','<p>wewfwef</p>',0,0,'2019-10-28 17:37:16','2019-10-28 17:37:16'),(87,'en','*','translatable','option.name.US1baFAUex8jhRlx','aaaaaaaaaaaaaaaaaa',0,0,'2019-10-28 17:38:20','2019-10-28 17:38:20'),(88,'en','*','translatable','option.description.aQstWvyEmZjpU0y6','<p>asdasdasdasd</p>',0,0,'2019-10-28 17:38:20','2019-10-28 17:38:20'),(89,'en','*','translatable','option.name.06F6hU1fiO9QYmo0','aklsdjaklsjd',0,0,'2019-10-28 17:39:01','2019-10-28 17:39:01'),(90,'en','*','translatable','option.description.AsNM7lYe4ZqhYuAc','<p>kldjaklsjdalksjakljsd</p>',0,0,'2019-10-28 17:39:01','2019-10-28 17:39:01'),(91,'en','*','translatable','option.name.jDluTt2OYYPrGb3R','asdasdasdasd',0,0,'2019-10-28 17:41:46','2019-10-28 17:41:46'),(92,'en','*','translatable','option.description.03mEurTI6cZACkfC','<p>ad121212d12d          <span style=\"color: rgb(0, 102, 204);\">aaaaaaaaaaaaaaaaaaa</span><span style=\"color: rgb(0, 102, 204); background-color: rgb(178, 107, 0);\">aaaaaaa</span></p>',0,0,'2019-10-28 17:41:46','2019-10-28 17:42:19');
/*!40000 ALTER TABLE `translator_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stores`
--

DROP TABLE IF EXISTS `user_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stores`
--

LOCK TABLES `user_stores` WRITE;
/*!40000 ALTER TABLE `user_stores` DISABLE KEYS */;
INSERT INTO `user_stores` VALUES (1,1,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Root','root@root.com',NULL,'$2y$10$A/PVDn8NMG8nU2KoCEqtuutMIPgeN0JblCNTMftJAF3IZlux2EIGe','$2y$10$LGukvG/.R5kCSYH8LflNxekAjvizkD3zi8bFX0HrRpEkgcsf5S.qC','VSO0V8jwILBIYGDp1QYWLTBatmf8j7Fr6YrXThJIKuNgIKXvmOGQUkMRREX8',NULL,'2019-10-24 15:29:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-29 10:09:56

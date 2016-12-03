/*
SQLyog Community Edition- MySQL GUI v7.11 
MySQL - 5.7.14-log : Database - product_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`product_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `product_db`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`,`category_description`,`created_at`,`updated_at`) values (1,'Books','Selection of books from textbooks to literature','2016-12-02 14:38:37','2016-12-02 14:38:37'),(2,'Office Supplies','Supplies for everday office operation','2016-12-02 14:42:38','2016-12-02 14:42:38'),(3,'Laptops','Brands from different manufacturer are available here','2016-12-02 14:47:28','2016-12-02 14:47:28'),(4,'Appliances','Kitchen and home appliances','2016-12-02 14:50:42','2016-12-02 14:50:42');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_12_02_135722_create_category_table',1),(4,'2016_12_02_142251_create_product_table',2);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_category_id_index` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`category_id`,`product_name`,`product_description`,`created_at`,`updated_at`) values (1,1,'World History','A reference book','2016-12-02 14:51:56','2016-12-02 14:51:56'),(2,1,'My ABC','Toddlers\' first book to learn their ABC','2016-12-02 14:53:24','2016-12-02 14:53:24'),(3,1,'1st Grade Math','Math reference book for 1st graders','2016-12-02 14:54:14','2016-12-02 14:54:14'),(4,1,'The Great Gatsby','A classic novel','2016-12-02 14:55:28','2016-12-02 14:55:28'),(5,1,'Our Nation, Our World','Social studies reference books for primary school','2016-12-02 14:56:45','2016-12-02 14:56:45'),(6,3,'HP Pavilion Laptop','8GB RAM, 1TB HDD, Windows 10 Home edited','2016-12-02 14:58:12','2016-12-02 15:13:56'),(7,3,'Nextbook Flex ','64GB Intel Quad Core Windows 10','2016-12-02 15:00:02','2016-12-02 15:00:02'),(8,3,'enovo 80SB0002US Flex 4','2.3 15.6tch 8gb 256gb W10 edited','2016-12-02 15:01:35','2016-12-02 15:13:56'),(9,3,'Apple MacBook Air MJVE2LL','13.3 Inch Laptop (128 GB) NEWEST VERSION','2016-12-02 15:02:59','2016-12-02 15:02:59'),(10,3,'HP Flyer Red','500GB Hard Drive and Windows 10 Home','2016-12-02 15:03:56','2016-12-02 15:03:56'),(11,2,'Stapler','Looking Stapler Set No 10 SG1693001','2016-12-02 15:05:17','2016-12-02 15:05:17'),(12,2,'Tape Dispenser ','Lacut Tape Dispenser S4832388 Yellow','2016-12-02 15:06:00','2016-12-02 15:06:00'),(13,2,'Smead Folder ','Smead Folder  Cream 11904','2016-12-02 15:06:30','2016-12-02 15:06:30'),(14,4,'Microwave Oven','Viking Professional Series 2 cu ft. Microwave Oven Stainless Steel','2016-12-02 15:08:20','2016-12-02 15:08:20'),(15,4,'Philips Daily Collection Coffee Maker','Philips Daily Collection HD7434 20 0 92 Litre Coffee Maker (Black Metal)','2016-12-02 15:09:54','2016-12-02 15:09:54');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

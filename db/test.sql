/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-05-31 17:20:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'hung', '<p>123</p>', '1', 'upload/May/03-54-05-^A8D962A1A69091B48634CC220950BC574D7E158D5C6392C1A4^pimgpsh_fullsize_distr.png', '2019-05-31 15:47:50', '2019-05-31 15:54:05');
INSERT INTO `blog` VALUES ('2', 'Co Báº¿ bÃ¡n diá»ƒm', '<p>123213</p>', '1', 'upload/May/03-55-18-600x315 (4).jpg', '2019-05-31 15:55:18', null);
INSERT INTO `blog` VALUES ('3', 'Campaign', '<p>nhac hay</p>', '4', 'upload/May/04-38-39-600x315 (4).jpg', '2019-05-31 16:38:40', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'SÃ¡ch', '0', '2019-05-31 09:32:40', null);
INSERT INTO `category` VALUES ('2', 'SÃ¡ch dáº¡y nháº¡c', '1', '2019-05-31 09:52:53', null);
INSERT INTO `category` VALUES ('3', 'SÃ¡ch Thieu nhi', '2', '2019-05-31 09:54:07', null);
INSERT INTO `category` VALUES ('4', 'Nháº¡c', '0', '2019-05-31 15:47:03', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'hung', 'phuc@gmail.com', '$2y$08$dmJYMnhyZGg2NFBmL0JCd.O52IoQyDLwp2ILlNMPg7S2nsz/VW1La', null, '2019-05-31 08:30:23', null);
INSERT INTO `users` VALUES ('2', 'hung', 'admin@ad.vn', 'b9e5a760ce5fe1d7d58d4c2c148012e0', null, '2019-05-31 08:42:50', null);

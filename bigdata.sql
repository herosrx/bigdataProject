/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : bigdata

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 23/05/2024 18:04:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_app_user
-- ----------------------------
DROP TABLE IF EXISTS `account_app_user`;
CREATE TABLE `account_app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_german2_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_german2_ci NOT NULL,
  `mail` varchar(200) COLLATE utf8mb4_german2_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_german2_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_german2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_german2_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add user', 2, 'add_user');
INSERT INTO `auth_permission` VALUES (5, 'Can change user', 2, 'change_user');
INSERT INTO `auth_permission` VALUES (6, 'Can delete user', 2, 'delete_user');
INSERT INTO `auth_permission` VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can add group', 4, 'add_group');
INSERT INTO `auth_permission` VALUES (11, 'Can change group', 4, 'change_group');
INSERT INTO `auth_permission` VALUES (12, 'Can delete group', 4, 'delete_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (20, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (21, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (22, 'Can add province city', 8, 'add_provincecity');
INSERT INTO `auth_permission` VALUES (23, 'Can change province city', 8, 'change_provincecity');
INSERT INTO `auth_permission` VALUES (24, 'Can delete province city', 8, 'delete_provincecity');
INSERT INTO `auth_permission` VALUES (25, 'Can add city house price', 9, 'add_cityhouseprice');
INSERT INTO `auth_permission` VALUES (26, 'Can change city house price', 9, 'change_cityhouseprice');
INSERT INTO `auth_permission` VALUES (27, 'Can delete city house price', 9, 'delete_cityhouseprice');
INSERT INTO `auth_permission` VALUES (28, 'Can add regional area', 10, 'add_regionalarea');
INSERT INTO `auth_permission` VALUES (29, 'Can change regional area', 10, 'change_regionalarea');
INSERT INTO `auth_permission` VALUES (30, 'Can delete regional area', 10, 'delete_regionalarea');
INSERT INTO `auth_permission` VALUES (31, 'Can add area', 11, 'add_area');
INSERT INTO `auth_permission` VALUES (32, 'Can change area', 11, 'change_area');
INSERT INTO `auth_permission` VALUES (33, 'Can delete area', 11, 'delete_area');
INSERT INTO `auth_permission` VALUES (34, 'Can add source', 12, 'add_source');
INSERT INTO `auth_permission` VALUES (35, 'Can change source', 12, 'change_source');
INSERT INTO `auth_permission` VALUES (36, 'Can delete source', 12, 'delete_source');
INSERT INTO `auth_permission` VALUES (37, 'Can add source city', 13, 'add_sourcecity');
INSERT INTO `auth_permission` VALUES (38, 'Can change source city', 13, 'change_sourcecity');
INSERT INTO `auth_permission` VALUES (39, 'Can delete source city', 13, 'delete_sourcecity');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_german2_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_german2_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_german2_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_german2_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_german2_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$100000$vOKIuVHE2UJX$I10/z4XPMYyQwC8OUeYjpACOf+Vw20uuppyWFxZ++Wg=', '2024-05-23 10:01:20.116270', 1, 'admin', '', '', 'admin@qq.com', 1, 1, '2024-05-18 12:58:30.239919');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for cjgl_app_area
-- ----------------------------
DROP TABLE IF EXISTS `cjgl_app_area`;
CREATE TABLE `cjgl_app_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_zwm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `area_ywm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_website` varchar(200) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_link` varchar(300) COLLATE utf8mb4_german2_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `province_city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cjgl_app_area_province_city_id_664080e8_fk_cjgl_app_` (`province_city_id`),
  CONSTRAINT `cjgl_app_area_province_city_id_664080e8_fk_cjgl_app_` FOREIGN KEY (`province_city_id`) REFERENCES `cjgl_app_provincecity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of cjgl_app_area
-- ----------------------------
BEGIN;
INSERT INTO `cjgl_app_area` VALUES (1, '朝阳', 'chaoyang', '安居客', 'https://beijing.anjuke.com/market/chaoyang/', '2024-05-21 23:28:15.000000', NULL, 1);
INSERT INTO `cjgl_app_area` VALUES (2, '大兴', 'daxing', '安居客', 'https://beijing.anjuke.com/market/daxing/', '2024-05-21 23:28:56.000000', NULL, 1);
INSERT INTO `cjgl_app_area` VALUES (3, '长安', 'changan', '安居客', 'https://sjz.anjuke.com/market/changana/', '2024-05-21 23:29:55.000000', NULL, 4);
INSERT INTO `cjgl_app_area` VALUES (4, '桥西', 'qiaoxi', '安居客', 'https://sjz.anjuke.com/market/qiaoxi/', '2024-05-21 23:30:31.000000', NULL, 4);
INSERT INTO `cjgl_app_area` VALUES (5, '阳高', 'yanggao', '安居客', 'https://datong.anjuke.com/market/yanggao/', '2024-05-21 23:32:08.000000', NULL, 7);
COMMIT;

-- ----------------------------
-- Table structure for cjgl_app_cityhouseprice
-- ----------------------------
DROP TABLE IF EXISTS `cjgl_app_cityhouseprice`;
CREATE TABLE `cjgl_app_cityhouseprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_zwm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `year` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `year_listing_price` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `month` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `month_listing_price` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `day` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `day_listing_price` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `week` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `week_listing_price` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `bsy` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `bqn` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_website` varchar(200) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_link` varchar(300) COLLATE utf8mb4_german2_ci NOT NULL,
  `cj_date` varchar(300) COLLATE utf8mb4_german2_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `province_city_id` int(11) NOT NULL,
  `regional_area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cjgl_app_cityhouseprice_area_id_b8dd9c32_fk_cjgl_app_area_id` (`area_id`),
  KEY `cjgl_app_cityhousepr_province_city_id_fcf6f378_fk_cjgl_app_` (`province_city_id`),
  KEY `cjgl_app_cityhousepr_regional_area_id_f8300185_fk_cjgl_app_` (`regional_area_id`),
  CONSTRAINT `cjgl_app_cityhousepr_province_city_id_fcf6f378_fk_cjgl_app_` FOREIGN KEY (`province_city_id`) REFERENCES `cjgl_app_provincecity` (`id`),
  CONSTRAINT `cjgl_app_cityhousepr_regional_area_id_f8300185_fk_cjgl_app_` FOREIGN KEY (`regional_area_id`) REFERENCES `cjgl_app_regionalarea` (`id`),
  CONSTRAINT `cjgl_app_cityhouseprice_area_id_b8dd9c32_fk_cjgl_app_area_id` FOREIGN KEY (`area_id`) REFERENCES `cjgl_app_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of cjgl_app_cityhouseprice
-- ----------------------------
BEGIN;
INSERT INTO `cjgl_app_cityhouseprice` VALUES (1, '北京', '2024', '52160', '05', '50201', '19', '50201', '05-19', '50201', '1.78 ', '12.53 ', '安居客', 'https://beijing.anjuke.com/market/', '2024-05-19', '2024-05-20 11:14:33.000000', NULL, NULL, 1, NULL);
INSERT INTO `cjgl_app_cityhouseprice` VALUES (3, '北京', '2024', '52160', '05', '50201', '18', '50201', '05-12', '50201', '1.78 ', '12.53 ', '安居客', 'https://beijing.anjuke.com/market/', '2024-05-18', '2024-05-20 11:29:33.000000', NULL, NULL, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cjgl_app_provincecity
-- ----------------------------
DROP TABLE IF EXISTS `cjgl_app_provincecity`;
CREATE TABLE `cjgl_app_provincecity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_zwm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `province_ywm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `city_zwm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `city_ywm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `dm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `sjdm` varchar(100) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `source_website` varchar(200) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_link` varchar(300) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of cjgl_app_provincecity
-- ----------------------------
BEGIN;
INSERT INTO `cjgl_app_provincecity` VALUES (1, '北京市', 'beijingshi', '北京', 'beijing', '110000', '0', '安居客', 'https://beijing.anjuke.com/market/', '2024-05-20 11:13:30.000000', NULL);
INSERT INTO `cjgl_app_provincecity` VALUES (2, '天津市', 'tianjinshi', '天津', 'tianjin', '120000', '0', '安居客', 'https://tianjin.anjuke.com/market/?from=fangjia', '2024-05-20 12:50:01.000000', NULL);
INSERT INTO `cjgl_app_provincecity` VALUES (3, '河北省', 'hebeisheng', '河北省', 'hebeisheng', '130000', '0', '安居客', NULL, '2024-05-20 12:50:54.000000', NULL);
INSERT INTO `cjgl_app_provincecity` VALUES (4, '河北省', 'hebeisheng', '石家庄市', 'shijiazhuangshi', '130100', '130000', '安居客', 'https://sjz.anjuke.com/market/?from=fangjia', '2024-05-20 12:51:52.000000', NULL);
INSERT INTO `cjgl_app_provincecity` VALUES (5, '河北省', 'hebeisheng', '廊坊市', 'shijiazhuangshi', '131000', '130000', '安居客', 'https://sjz.anjuke.com/market/?from=fangjia', '2024-05-20 12:51:52.000000', NULL);
INSERT INTO `cjgl_app_provincecity` VALUES (6, '山西省', 'shanxisheng', '山西省', 'shanxisheng', '140000', '0', '安居客', NULL, '2024-05-20 12:54:44.000000', NULL);
INSERT INTO `cjgl_app_provincecity` VALUES (7, '山西省', 'shanxisheng', '大同市', 'datongshi', '140200', '140000', '安居客', 'https://datong.anjuke.com/market/?from=fangjia', '2024-05-20 12:56:01.000000', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cjgl_app_regionalarea
-- ----------------------------
DROP TABLE IF EXISTS `cjgl_app_regionalarea`;
CREATE TABLE `cjgl_app_regionalarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regional_area_zwm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `regional_area_ywm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_website` varchar(200) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_link` varchar(300) COLLATE utf8mb4_german2_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cjgl_app_regionalarea_area_id_121e193d_fk_cjgl_app_area_id` (`area_id`),
  CONSTRAINT `cjgl_app_regionalarea_area_id_121e193d_fk_cjgl_app_area_id` FOREIGN KEY (`area_id`) REFERENCES `cjgl_app_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of cjgl_app_regionalarea
-- ----------------------------
BEGIN;
INSERT INTO `cjgl_app_regionalarea` VALUES (1, '大望路', 'dawanglu', '安居客', 'https://beijing.anjuke.com/market/chaoyang-q-dawanglu/', '2024-05-22 00:09:39.000000', NULL, 1);
INSERT INTO `cjgl_app_regionalarea` VALUES (2, '百子湾', 'baiziwan', '安居客', 'https://beijing.anjuke.com/market/chaoyang-q-baiziwan/', '2024-05-22 00:10:24.000000', NULL, 1);
INSERT INTO `cjgl_app_regionalarea` VALUES (3, '保利', 'baoli', '安居客', 'https://sjz.anjuke.com/market/changana-q-blsjz/', '2024-05-22 00:11:37.000000', NULL, 3);
INSERT INTO `cjgl_app_regionalarea` VALUES (4, '云林路', 'yunlinlu', '安居客', 'https://datong.anjuke.com/market/yanggao-q-ylldtygx/', '2024-05-22 00:13:17.000000', NULL, 5);
COMMIT;

-- ----------------------------
-- Table structure for cjgl_app_source
-- ----------------------------
DROP TABLE IF EXISTS `cjgl_app_source`;
CREATE TABLE `cjgl_app_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_zwm` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_ywm` varchar(100) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `source_link` varchar(500) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `source_remarks` longtext COLLATE utf8mb4_german2_ci,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of cjgl_app_source
-- ----------------------------
BEGIN;
INSERT INTO `cjgl_app_source` VALUES (1, '安居客', 'anjuke', NULL, '安居客网站', '2024-05-21 14:06:26.000000', NULL);
INSERT INTO `cjgl_app_source` VALUES (2, '搜房网', 'soufangwang', 'www.soufang.com', '搜房网网站', '2024-05-21 14:06:58.000000', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cjgl_app_sourcecity
-- ----------------------------
DROP TABLE IF EXISTS `cjgl_app_sourcecity`;
CREATE TABLE `cjgl_app_sourcecity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_city` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_city_area` varchar(100) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `source_city_area_regional` varchar(100) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `source_link` varchar(500) COLLATE utf8mb4_german2_ci NOT NULL,
  `source_remarks` longtext COLLATE utf8mb4_german2_ci,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cjgl_app_sourcecity_source_id_73f9179c_fk_cjgl_app_source_id` (`source_id`),
  CONSTRAINT `cjgl_app_sourcecity_source_id_73f9179c_fk_cjgl_app_source_id` FOREIGN KEY (`source_id`) REFERENCES `cjgl_app_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of cjgl_app_sourcecity
-- ----------------------------
BEGIN;
INSERT INTO `cjgl_app_sourcecity` VALUES (1, '北京', NULL, NULL, 'https://beijing.anjuke.com/market/', '安居客北京站', '2024-05-21 14:08:16.000000', NULL, 1);
INSERT INTO `cjgl_app_sourcecity` VALUES (2, '北京', '朝阳', NULL, 'https://beijing.anjuke.com/market/chaoyang/', '安居客北京朝阳地区', '2024-05-21 14:09:38.000000', NULL, 1);
INSERT INTO `cjgl_app_sourcecity` VALUES (3, '北京', '朝阳', '大望路', 'https://beijing.anjuke.com/market/chaoyang-q-dawanglu/', '安居客北京朝阳大望路地区', '2024-05-21 14:10:28.000000', NULL, 1);
INSERT INTO `cjgl_app_sourcecity` VALUES (4, '天津', NULL, NULL, 'https://tianjin.anjuke.com/market/?from=fangjia', '安居客天津站', '2024-05-21 14:12:44.000000', NULL, 1);
INSERT INTO `cjgl_app_sourcecity` VALUES (5, '石家庄', NULL, NULL, 'https://sjz.anjuke.com/market/?from=fangjia', '安居客石家庄地区', '2024-05-21 14:13:41.000000', NULL, 1);
INSERT INTO `cjgl_app_sourcecity` VALUES (6, '北京', NULL, NULL, 'https://beijing.soufagnwang.com/', '搜房网北京站', '2024-05-21 15:52:19.000000', NULL, 2);
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_german2_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_german2_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_german2_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (7, 'account_app', 'user');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (11, 'cjgl_app', 'area');
INSERT INTO `django_content_type` VALUES (9, 'cjgl_app', 'cityhouseprice');
INSERT INTO `django_content_type` VALUES (8, 'cjgl_app', 'provincecity');
INSERT INTO `django_content_type` VALUES (10, 'cjgl_app', 'regionalarea');
INSERT INTO `django_content_type` VALUES (12, 'cjgl_app', 'source');
INSERT INTO `django_content_type` VALUES (13, 'cjgl_app', 'sourcecity');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_german2_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_german2_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'account_app', '0001_initial', '2024-05-18 12:56:30.048295');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2024-05-18 12:56:30.096469');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-05-18 12:56:30.536730');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0001_initial', '2024-05-18 12:56:30.668275');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0002_logentry_remove_auto_add', '2024-05-18 12:56:30.688730');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-05-18 12:56:30.805466');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-05-18 12:56:30.868091');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-05-18 12:56:30.927412');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-05-18 12:56:30.946378');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-05-18 12:56:31.013121');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-05-18 12:56:31.018118');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-18 12:56:31.040290');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-05-18 12:56:31.227411');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-18 12:56:31.306262');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2024-05-18 12:56:31.777765');
INSERT INTO `django_migrations` VALUES (19, 'cjgl_app', '0001_initial', '2024-05-20 02:54:41.627894');
INSERT INTO `django_migrations` VALUES (20, 'cjgl_app', '0002_source', '2024-05-20 14:26:57.596728');
INSERT INTO `django_migrations` VALUES (21, 'cjgl_app', '0002_source_sourcecity', '2024-05-21 06:05:34.736768');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_german2_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_german2_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('0nkc9scs4mt7uhgqr2qklp9wa3v3lopk', 'NTgyNjI5YTI5NWVlMzk5NTczODRlNzY5YTI0ZjY2ODM0MDMxM2RmMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDAsImlzX2xvZ2luIjp0cnVlLCJ1c2VyIjoiYWRtaW4iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2024-05-21 09:29:15.768096');
INSERT INTO `django_session` VALUES ('0umoyg49e97eihcaufsh55d3asdl0doo', 'ZTUyMTFhZDY1ODkxM2E2M2FkNTI1ZjEwMTk3YWJiMGVkY2ZkZmYzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJ1c2VyIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-19 00:45:24.141701');
INSERT INTO `django_session` VALUES ('1yixbmor0m4tbkeltvb74fy01s94y9oc', 'ZGZmNzAzNzY1YTg0ZDE0MWUwMDAwMDhlMDUxZmQ1MjA1NTgxZTY0Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDAsImlzX2xvZ2luIjp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIn0=', '2024-05-20 04:04:25.655840');
INSERT INTO `django_session` VALUES ('3h87j4zvtqfcsne3t6apl1j5ot821fsi', 'ZjNkODMzNGE2OWI3MmNhYTNiZDk4MjAxNWNiMWU2ZDg0NjhlYjJlYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-23 11:12:25.726400');
INSERT INTO `django_session` VALUES ('4gws1avg0kanlbgl0hvnxgt7a3enkgvd', 'ZjRkZjdjNGRiNTY2OTgzYTdmMGM1NjVkZDljZWViMDc3OGRkODExYzp7InVzZXIiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiaXNfbG9naW4iOnRydWUsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMH0=', '2024-05-20 05:32:21.051975');
INSERT INTO `django_session` VALUES ('5fs9gwukqv5v4l4795jlfsj66oxgzb3w', 'NTA4MDRhMzNlZjExYmMyOWEzYWJiNGFkYzAxZGYzZmExMmE5MTgxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiaXNfbG9naW4iOnRydWUsIl9hdXRoX3VzZXJfaWQiOiIxIiwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMH0=', '2024-05-21 10:36:55.715949');
INSERT INTO `django_session` VALUES ('8c0l1laaoj5f63ri0s1bmt85g3jd7yxe', 'ZGRmN2IwOTUzYzkwNmM0MDNkNGY2ODRmMjYyZTAwNTlkZmJhYzY2Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiaXNfbG9naW4iOnRydWUsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMCwidXNlciI6ImFkbWluIn0=', '2024-05-23 10:53:55.467962');
INSERT INTO `django_session` VALUES ('aamroyi93lum2hp6ao0w5a26ob0ox917', 'YWI4Mzk3ODllYzU5YWI3M2I2MWUzMDBkYjNhZGY1ODY5ZWRkZTVlMDp7ImlzX2xvZ2luIjpmYWxzZX0=', '2024-06-02 13:51:05.297197');
INSERT INTO `django_session` VALUES ('b75x34iaonxalxzdi3n4j4qecnxcz2q7', 'NDQ1NGY2OTQ0MDEyMGQyYjFiNDQ0MjlhOWQ3ZjJjMDg4NjZhZmNlNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlciI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-19 17:33:04.968917');
INSERT INTO `django_session` VALUES ('c25g2nxxhrupiama8t8l99gghqamlhfb', 'NjQxZTQzMmNjM2M0MTM4NDVlZTc4YmQyYzVjOWQzOTE4MDgzZjk3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsInVzZXIiOiJhZG1pbiIsImlzX2xvZ2luIjpmYWxzZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDB9', '2024-05-21 09:00:23.737686');
INSERT INTO `django_session` VALUES ('c8izkr7ivzzjckpocxx1tsn0xmxaledw', 'ZTUyMTFhZDY1ODkxM2E2M2FkNTI1ZjEwMTk3YWJiMGVkY2ZkZmYzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJ1c2VyIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-19 01:06:29.497895');
INSERT INTO `django_session` VALUES ('dfbczygjwsfe540e4kn7numl38sge1q5', 'ZTU5NDZiN2U1MjY4NDMzMGE0MGNjNjhkYjRjMGYyNzNmMmVlYjgwOTp7ImlzX2xvZ2luIjp0cnVlLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwidXNlciI6ImFkbWluIn0=', '2024-05-19 03:28:51.615466');
INSERT INTO `django_session` VALUES ('f857px7zk3dl2b81tru0r4arm2k0kdq3', 'ZDc0NDIwNDRlMjViMzhlY2JmZTQ0YmNiMjI3MWUyOTc3M2Q2Nzg1Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJ1c2VyIjoiYWRtaW4iLCJpc19sb2dpbiI6ZmFsc2V9', '2024-05-19 01:06:10.191091');
INSERT INTO `django_session` VALUES ('fsucx630ymogwe7kgnlzepmh33n0uhpm', 'YTA0NjVkN2UwYTQ2ZTQ2NWVjNWNjMDkzMDVjMjFiODAxYjNlYzMxMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlciI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJpc19sb2dpbiI6ZmFsc2V9', '2024-05-19 17:31:29.703768');
INSERT INTO `django_session` VALUES ('ftwpzxu4heulu8ph7j901g9lxrw9ygoj', 'ODUwZWQxYzA3N2FiMjEyMjg1NjkzOTg1ZjcxZTYwMDNkZmViZWVlYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJpc19sb2dpbiI6dHJ1ZSwidXNlciI6ImFkbWluIn0=', '2024-05-19 15:43:33.771891');
INSERT INTO `django_session` VALUES ('gqqenqwjnbznpqpyf0qqt0pzwb8ax86h', 'MTAxNTE5MDQ3N2M4YzllZGJkZDBiYjc4ZWE4MjZlZjI4ODg1OTZiMTp7ImlzX2xvZ2luIjp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIiwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMH0=', '2024-05-21 09:00:36.868178');
INSERT INTO `django_session` VALUES ('hauqafj367tx4blfpd7fervpv2gzeelg', 'N2NiMjcwMjI0MzgwMGZjYmUyMTJmNWZjMWQ4NDdiZTJjYTUwNDAyNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJpc19sb2dpbiI6dHJ1ZSwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMH0=', '2024-05-19 11:58:24.842805');
INSERT INTO `django_session` VALUES ('hkuzvqf8687j4iv0jkochv5n2qa7vs1o', 'ZmU1ZTM5NjU4Njk3MjBjZmFiZDU5OTVlODU4OTVkNzQwNWU1NTc4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiaXNfbG9naW4iOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoiMSIsInVzZXIiOiJhZG1pbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDB9', '2024-05-21 10:33:26.587700');
INSERT INTO `django_session` VALUES ('hxtlw3e5rm5qtx7r6hl2d617lo18n7uf', 'ZGFlODZlNDU3OTdlNzk1YmQwM2U5ZDViZWZmNWUzY2VmN2FlZDg0Yzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDAsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2024-05-19 01:19:54.092677');
INSERT INTO `django_session` VALUES ('lbzn9am0ekwpy4ukea40u08axf6f53xy', 'NDA0YTYwNGUyODMwZTViNGQ4Y2VmOGE2ZThiNjk3NmMzZjg3YjZkNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsInVzZXIiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiaXNfbG9naW4iOnRydWUsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2024-05-21 06:11:05.741275');
INSERT INTO `django_session` VALUES ('lrxonom9fmdw50zapbjrbnv3kg6sclnw', 'ZDVhNGFhZjU1NWQzZmE1ZmYzODM1MDc5MmZiMjA1YTA4ZDQyYTgyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJ1c2VyIjoiYWRtaW4iLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiaXNfbG9naW4iOnRydWUsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2024-05-20 15:59:56.824577');
INSERT INTO `django_session` VALUES ('lsi363pkps0yqofa5ufbv2k6vw4bsmjt', 'NTMwYTU5MjZlZTliYTczYTU1MmFiOGU3NjQyMWI1N2NlYTNmZDkwZDp7ImlzX2xvZ2luIjp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsInVzZXIiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMH0=', '2024-05-18 23:21:39.230001');
INSERT INTO `django_session` VALUES ('nr44bswf7tx4wvi1oe22x2cnethmc0sr', 'ZDdiYjMxNzY5N2Q2YTE1ZjdjNzZiMGM0ZTdhMjdhODZjZjRmZTE2Zjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlciI6ImFkbWluIiwiaXNfbG9naW4iOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2024-05-23 11:43:10.169398');
INSERT INTO `django_session` VALUES ('oh7egvmtc182d5ud8zr8xbiqc0xs7z44', 'ODUwZWQxYzA3N2FiMjEyMjg1NjkzOTg1ZjcxZTYwMDNkZmViZWVlYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJpc19sb2dpbiI6dHJ1ZSwidXNlciI6ImFkbWluIn0=', '2024-05-19 15:31:21.478030');
INSERT INTO `django_session` VALUES ('omxiybn9x2u3jy5bmyhfoao4twygq6co', 'ZjRkZjdjNGRiNTY2OTgzYTdmMGM1NjVkZDljZWViMDc3OGRkODExYzp7InVzZXIiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiaXNfbG9naW4iOnRydWUsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMH0=', '2024-05-20 05:31:54.813897');
INSERT INTO `django_session` VALUES ('onrodkcuucrnloy2mnx4mtbo70ewg41z', 'YTNjYmY4ZTk3NzY3NGVmMDFmMjIwZjkzOTY0YTFiNWY3ODE4ZGY1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwMCwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-20 01:26:38.262304');
INSERT INTO `django_session` VALUES ('r89tv6yi14jfzwlqkd1h9rr1lrjj4imk', 'N2NmNzNlODYwYzM2Zjg1MzFiNTFiZmYxYzhiZGNkYzU2MTI4MTk0MTp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyIjoiYWRtaW4iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-18 15:42:33.345470');
INSERT INTO `django_session` VALUES ('svvadtuo0r42350kqbithfww5uuknyr5', 'MzJmY2JkNTg5MGYzN2U3NDZlNWJlODQwMmRhYjljNjQ0OWFlMjZmMjp7ImlzX2xvZ2luIjpmYWxzZSwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyIjoiYWRtaW4iLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDB9', '2024-05-18 23:21:22.459007');
INSERT INTO `django_session` VALUES ('sziw8xlny33s544ogccn14pjip0xv9rj', 'ZTUyMTFhZDY1ODkxM2E2M2FkNTI1ZjEwMTk3YWJiMGVkY2ZkZmYzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJ1c2VyIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-19 00:43:20.331459');
INSERT INTO `django_session` VALUES ('tqxm176kc1u2bc0qke0paw1171t8yizk', 'MTY3MjYyYzg3ZWM1NWVmZjJjNGMzZTAyNTFkNTM1ZDE3NzVlZTdjMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDAsImlzX2xvZ2luIjpmYWxzZSwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2024-05-21 09:28:03.224379');
INSERT INTO `django_session` VALUES ('u3c5y8q1ves20vsfthfumg60zhbwky38', 'NTgyNjI5YTI5NWVlMzk5NTczODRlNzY5YTI0ZjY2ODM0MDMxM2RmMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDAsImlzX2xvZ2luIjp0cnVlLCJ1c2VyIjoiYWRtaW4iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2024-05-21 09:27:05.489582');
INSERT INTO `django_session` VALUES ('um274q1kjb7xhsl21sqmcunv6vnc6382', 'NDg2YzJlNjUyN2MxMzc1ZTEyZTJlMjQyZmE5N2FmZTFlMGI1ZmNmZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwMCwidXNlciI6ImFkbWluIiwiaXNfbG9naW4iOnRydWUsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2024-05-19 03:00:46.280568');
INSERT INTO `django_session` VALUES ('umykfv1lotiv0gx42clx4bed9xq27y1e', 'NjQxZTQzMmNjM2M0MTM4NDVlZTc4YmQyYzVjOWQzOTE4MDgzZjk3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsInVzZXIiOiJhZG1pbiIsImlzX2xvZ2luIjpmYWxzZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDB9', '2024-05-21 07:59:40.454314');
INSERT INTO `django_session` VALUES ('v8n3pto1g1i7q7kmzb4tu1kiug1o9tcm', 'ZjczOGJkYWNmNTU0ODI5NWZmNzE4ZmE0MjA2NTcyZDNkODg2MTkzMTp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-21 13:16:12.823302');
INSERT INTO `django_session` VALUES ('wr4n3izunlf32e9hea4fit6fh0bva02y', 'MGI5MTNkZmMwZmMzZDIxMTRmMzRmMzlhMDRmMTdmMDYzNWMyYzAyOTp7InVzZXIiOiJhZG1pbiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMH0=', '2024-05-22 15:13:55.418751');
INSERT INTO `django_session` VALUES ('x1m9ff754d7fga4a8cmmot4jki2v1e72', 'NDhhNjI4ZWQ5OGRmZWU2YmI5NTNmMGU5ZmI1ZjE4YjljYjM0NWUyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgzY2I3NzBjOGQ5MmE5MjE3NjkwNGJmY2NmZTQ4NmU1ZGFjNWFmMyIsInVzZXIiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-18 14:39:01.568141');
INSERT INTO `django_session` VALUES ('xqrdbtg15e3rozlg6cee9domfc16pir8', 'ZTUyMTFhZDY1ODkxM2E2M2FkNTI1ZjEwMTk3YWJiMGVkY2ZkZmYzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJ1c2VyIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-19 00:42:51.521629');
INSERT INTO `django_session` VALUES ('y51pffrt6xzmqmygm21tpd04t0mpr404', 'MmQwNDE3NmU3NWY2ZTc1NTFjMDZlOWIzZTc1YjkzNGZiNzdlZDgyNjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJpc19sb2dpbiI6dHJ1ZSwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIn0=', '2024-05-21 05:19:42.070269');
INSERT INTO `django_session` VALUES ('y8oprbkas7axiupsv4ypmvmoa0z64oxu', 'MTEwNjkzM2IxMTliYjRmYTJlYmRlY2EzMDJiNDBhNTM3NTczNzI3Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDAsInVzZXIiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2024-05-20 08:12:21.058553');
INSERT INTO `django_session` VALUES ('yhpvyw8dmnyp87oojh7v00q1s6wj7ott', 'YmM3ZWFjODAwNTI0ODMwYmY4NDNmNjk0ZmMzNzdkNTQ2MzhhM2I0MDp7ImlzX2xvZ2luIjp0cnVlLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwMCwidXNlciI6ImFkbWluIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIn0=', '2024-05-19 03:31:24.712284');
INSERT INTO `django_session` VALUES ('yjyyj9rhhpbkdoihxm3i0xwecvyw50wl', 'ZmU1ZTM5NjU4Njk3MjBjZmFiZDU5OTVlODU4OTVkNzQwNWU1NTc4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiaXNfbG9naW4iOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoiMSIsInVzZXIiOiJhZG1pbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjI4M2NiNzcwYzhkOTJhOTIxNzY5MDRiZmNjZmU0ODZlNWRhYzVhZjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDB9', '2024-05-21 10:28:12.857733');
INSERT INTO `django_session` VALUES ('z9js6nkf25j8dm817snalpq8t1br9ymp', 'M2VjNTY2NjYyMGUwY2RlZWE0YTU4ZDVjY2ExOTJjYzQxNmUxOTA0ZTp7InVzZXIiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODNjYjc3MGM4ZDkyYTkyMTc2OTA0YmZjY2ZlNDg2ZTVkYWM1YWYzIn0=', '2024-05-21 16:40:52.129701');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

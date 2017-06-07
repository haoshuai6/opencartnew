-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016-08-05
-- 服务器版本: 5.5.40
-- PHP 版本: 5.6.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `OC2.1-PRO`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `oc_address`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate`
--

DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_activity`
--

DROP TABLE IF EXISTS `oc_affiliate_activity`;
CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_login`
--

DROP TABLE IF EXISTS `oc_affiliate_login`;
CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_transaction`
--

DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `oc_api`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE IF NOT EXISTS `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '182.150.145.25'),
(2, 1, '182.150.145.17'),
(3, 1, '::1'),
(4, 1, '182.150.144.228'),
(5, 1, '182.150.145.166'),
(6, 2, '182.150.147.10'),
(7, 2, '182.150.150.64'),
(8, 2, '182.150.145.10'),
(9, 2, '118.113.216.244'),
(10, 2, '182.150.151.39'),
(11, 2, '118.114.163.160');

-- --------------------------------------------------------

--
-- 表的结构 `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE IF NOT EXISTS `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `oc_api_session`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

--
-- 转存表中的数据 `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(107, 7, '', 'catalog/demo/banners/oc-banner-2.jpg', 3),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(106, 7, '', 'catalog/demo/banners/oc-banner-5.jpg', 2),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0),
(105, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/oc-banner-4.jpg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image_description`
--

DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(107, 2, 7, 'MacBookAir2'),
(87, 2, 6, 'HP Banner'),
(93, 2, 8, 'Canon'),
(92, 2, 8, 'Burger King'),
(91, 2, 8, 'Coca Cola'),
(90, 2, 8, 'Disney'),
(89, 2, 8, 'Dell'),
(106, 2, 7, 'MacBookAir'),
(88, 2, 8, 'Harley Davidson'),
(94, 2, 8, 'NFL'),
(95, 2, 8, 'RedBull'),
(96, 2, 8, 'Sony'),
(97, 2, 8, 'Starbucks'),
(98, 2, 8, 'Nintendo'),
(105, 2, 7, 'iPhone 6');

-- --------------------------------------------------------

--
-- 表的结构 `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE IF NOT EXISTS `oc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=318 ;

--
-- 转存表中的数据 `oc_cart`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- 转存表中的数据 `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2016-02-03 18:01:24'),
(27, 'catalog/demo/product/iphone.jpg', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2016-02-05 09:34:38'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2016-02-03 18:08:39'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2016-02-03 17:56:47'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2016-02-03 17:53:30'),
(17, 'catalog/product/clothing/women-clothing/fision1.jpg', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2016-02-03 17:54:40'),
(28, 'catalog/demo/product/macbook.jpg', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2016-02-05 10:26:49'),
(26, 'catalog/demo/product/macbook.jpg', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2016-02-05 09:33:50'),
(29, 'catalog/demo/product/macbook.jpg', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2016-02-05 10:27:23'),
(30, 'catalog/demo/product/samsungtab.jpg', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2016-02-05 10:25:22'),
(31, 'catalog/demo/product/iphone.jpg', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2016-02-05 10:25:37'),
(32, 'catalog/demo/product/thunderboltdisplay.jpg', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2016-02-05 10:27:04'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2016-02-03 17:57:28'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(62, '', 0, 1, 1, 9, 1, '2016-02-06 16:19:03', '2016-02-12 13:40:02'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2016-02-03 17:52:39'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2016-02-03 17:52:55'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2016-02-03 17:54:00'),
(59, 'catalog/product/clothing/women-clothing/white-clothing-1.jpg', 0, 1, 1, 0, 1, '2016-01-28 10:55:04', '2016-01-28 10:55:04'),
(60, 'catalog/product/clothing/women-clothing/white-clothing-3.jpg', 59, 0, 1, 1, 1, '2016-01-28 11:11:12', '2016-01-28 11:11:12'),
(61, 'catalog/product/clothing/men-clothing/niuzai-man-clothing-1.jpg', 59, 0, 1, 2, 1, '2016-01-28 16:33:37', '2016-01-28 16:33:37');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 2, '显示器', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '显示器', '', ''),
(33, 2, '照相机', '&lt;p&gt;照相机&lt;br&gt;&lt;/p&gt;', '照相机', '', ''),
(32, 2, '网络摄像机', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '网络摄像机', '', ''),
(31, 2, '扫描仪', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '扫描仪', '', ''),
(30, 2, '打印机', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '打印机', '', ''),
(29, 2, '鼠标', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '鼠标', '', ''),
(27, 2, '苹果', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '苹果 ', '', ''),
(26, 2, '个人电脑', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '个人电脑', '', ''),
(17, 2, '软件', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '软件 ', '', ''),
(25, 2, '配 件', '&lt;p&gt;配 件&lt;br&gt;&lt;/p&gt;', '配 件', '', ''),
(20, 2, '台式机', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', '台式机', 'Example of category description', ''),
(35, 2, 'test 1', '', '', '', ''),
(36, 2, 'test 2', '', '', '', ''),
(18, 2, '笔记本电脑', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '笔记本电脑', '', ''),
(45, 2, 'Windows', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Windows', '', ''),
(46, 2, '苹果', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '苹果 ', '', ''),
(62, 2, '专业版购买', '&lt;h4&gt;&lt;span style=&quot;font-weight: bold; background-color: rgb(255, 0, 0); color: rgb(255, 255, 255);&quot;&gt;您看到的是opencart2.1中文专业版，如果需要，请购买使用版权，购买地址：&lt;/span&gt;&lt;/h4&gt;&lt;h4 style=&quot;line-height: 1.8;&quot;&gt;&lt;a href=&quot;http://www.opencart.cn/app/plans/opencart2-ecommerce-website-pro-wechat-solution.html&quot; target=&quot;_blank&quot; style=&quot;font-weight: bold; color: rgb(0, 0, 0); background-color: rgb(107, 173, 222);&quot;&gt;http://www.opencart.cn/app/plans/opencart2-ecommerce-website-pro-wechat-solution.html&lt;/a&gt;&lt;/h4&gt;', '专业版购买', '您看到的是opencart中文专业版，如果需要，请购买使用版权，购买地址：', '您看到的是opencart中文专业版，如果需要，请购买使用版权，购买地址：'),
(57, 2, '平板', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '平板 ', '', ''),
(24, 2, '手机', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '手机和PDA', '', ''),
(59, 2, '服装', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '服装产品', '', ''),
(60, 2, '女装', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '女装产品', '', ''),
(61, 2, '男装', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '男装产品', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_mobile`
--

DROP TABLE IF EXISTS `oc_category_mobile`;
CREATE TABLE IF NOT EXISTS `oc_category_mobile` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_mobile`
--

INSERT INTO `oc_category_mobile` (`category_id`, `image`) VALUES
(20, 'catalog/product/clothing/women-clothing/fision12.jpg'),
(27, 'catalog/product/clothing/women-clothing/fision9.jpg'),
(26, 'catalog/product/clothing/women-clothing/fision12.jpg'),
(45, 'catalog/product/clothing/women-clothing/fision8.jpg'),
(46, 'catalog/product/clothing/women-clothing/personality-clothing-4.jpg'),
(18, 'catalog/product/clothing/women-clothing/fision7.jpg'),
(57, 'catalog/product/clothing/women-clothing/fision4.jpg'),
(25, 'catalog/product/clothing/women-clothing/fision11.jpg'),
(30, 'catalog/product/clothing/women-clothing/fision3.jpg'),
(31, 'catalog/product/clothing/women-clothing/fision12.jpg'),
(28, 'catalog/product/clothing/women-clothing/personality-clothing-2.jpg'),
(32, 'catalog/product/clothing/women-clothing/personality-clothing-3.jpg'),
(29, 'catalog/product/clothing/women-clothing/sanwei-clothing-2.jpg'),
(24, 'catalog/product/clothing/women-clothing/zoom-clothing-2.jpg'),
(33, 'catalog/product/clothing/women-clothing/zoom-clothing-4.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(62, 62, 0),
(57, 57, 0),
(59, 59, 0),
(60, 59, 0),
(60, 60, 1),
(61, 59, 0),
(61, 61, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(33, 0, 0),
(59, 0, 0),
(60, 0, 0),
(61, 0, 0),
(20, 0, 0),
(27, 0, 0),
(26, 0, 0),
(45, 0, 0),
(46, 0, 0),
(18, 0, 0),
(57, 0, 0),
(25, 0, 0),
(17, 0, 0),
(30, 0, 0),
(31, 0, 0),
(28, 0, 0),
(32, 0, 0),
(29, 0, 0),
(24, 0, 0),
(62, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(35, 0),
(36, 0),
(45, 0),
(46, 0),
(57, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_city`
--

DROP TABLE IF EXISTS `oc_city`;
CREATE TABLE IF NOT EXISTS `oc_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2818 ;

--
-- 转存表中的数据 `oc_city`
--

INSERT INTO `oc_city` (`city_id`, `zone_id`, `name`, `status`, `sort_order`) VALUES
(1, 360, '河东', 1, 0),
(2, 360, '河西', 1, 0),
(3, 360, '南开', 1, 0),
(4, 360, '河北', 1, 0),
(5, 360, '红桥', 1, 0),
(6, 360, '塘沽', 1, 0),
(7, 360, '汉沽', 1, 0),
(8, 360, '大港', 1, 0),
(9, 360, '东丽', 1, 0),
(10, 360, '西青', 1, 0),
(11, 360, '津南', 1, 0),
(12, 360, '北辰', 1, 0),
(13, 360, '武清', 1, 0),
(14, 360, '宝坻', 1, 0),
(15, 361, '蓟县', 1, 0),
(16, 361, '宁河', 1, 0),
(17, 361, '静海', 1, 0),
(18, 19, '长安', 1, 0),
(19, 19, '桥东', 1, 0),
(20, 19, '桥西', 1, 0),
(21, 19, '新华', 1, 0),
(22, 19, '裕华', 1, 0),
(23, 19, '井陉矿', 1, 0),
(24, 19, '辛集', 1, 0),
(25, 19, '藁城', 1, 0),
(26, 19, '晋州', 1, 0),
(27, 19, '新乐', 1, 0),
(28, 19, '鹿泉', 1, 0),
(29, 19, '井陉', 1, 0),
(30, 19, '正定', 1, 0),
(31, 19, '栾城', 1, 0),
(32, 19, '行唐', 1, 0),
(33, 19, '灵寿', 1, 0),
(34, 19, '高邑', 1, 0),
(35, 19, '深泽', 1, 0),
(36, 19, '赞皇', 1, 0),
(37, 19, '无极', 1, 0),
(38, 19, '平山', 1, 0),
(39, 19, '元氏', 1, 0),
(40, 19, '赵县', 1, 0),
(41, 20, '路北', 1, 0),
(42, 20, '路南', 1, 0),
(43, 20, '古冶', 1, 0),
(44, 20, '开平', 1, 0),
(45, 20, '丰润', 1, 0),
(46, 20, '丰南', 1, 0),
(47, 20, '遵化', 1, 0),
(48, 20, '迁安', 1, 0),
(49, 20, '滦县', 1, 0),
(50, 20, '滦南', 1, 0),
(51, 20, '乐亭', 1, 0),
(52, 20, '迁西', 1, 0),
(53, 20, '玉田', 1, 0),
(54, 20, '唐海', 1, 0),
(55, 21, '海港', 1, 0),
(56, 21, '山海关', 1, 0),
(57, 21, '北戴河', 1, 0),
(58, 21, '昌黎', 1, 0),
(59, 21, '抚宁', 1, 0),
(60, 21, '卢龙', 1, 0),
(61, 21, '青龙', 1, 0),
(62, 22, '丛台', 1, 0),
(63, 22, '邯山', 1, 0),
(64, 22, '复兴', 1, 0),
(65, 22, '峰峰', 1, 0),
(66, 22, '武安', 1, 0),
(67, 22, '邯郸', 1, 0),
(68, 22, '临漳', 1, 0),
(69, 22, '成安', 1, 0),
(70, 22, '大名', 1, 0),
(71, 22, '涉县', 1, 0),
(72, 22, '磁县', 1, 0),
(73, 22, '肥乡', 1, 0),
(74, 22, '永年', 1, 0),
(75, 22, '邱县', 1, 0),
(76, 22, '鸡泽', 1, 0),
(77, 22, '广平', 1, 0),
(78, 22, '馆陶', 1, 0),
(79, 22, '魏县', 1, 0),
(80, 22, '曲周', 1, 0),
(81, 23, '桥东', 1, 0),
(82, 23, '桥西', 1, 0),
(83, 23, '南宫', 1, 0),
(84, 23, '沙河', 1, 0),
(85, 23, '邢台', 1, 0),
(86, 23, '临城', 1, 0),
(87, 23, '内丘', 1, 0),
(88, 23, '柏乡', 1, 0),
(89, 23, '隆尧', 1, 0),
(90, 23, '任县', 1, 0),
(91, 23, '南和', 1, 0),
(92, 23, '宁晋', 1, 0),
(93, 23, '巨鹿', 1, 0),
(94, 23, '新河', 1, 0),
(95, 23, '广宗', 1, 0),
(96, 23, '平乡', 1, 0),
(97, 23, '威县', 1, 0),
(98, 23, '清河', 1, 0),
(99, 23, '临西', 1, 0),
(100, 24, '新市', 1, 0),
(101, 24, '北市', 1, 0),
(102, 24, '南市', 1, 0),
(103, 24, '定州', 1, 0),
(104, 24, '涿州', 1, 0),
(105, 24, '安国', 1, 0),
(106, 24, '高碑店', 1, 0),
(107, 24, '满城', 1, 0),
(108, 24, '清苑', 1, 0),
(109, 24, '易县', 1, 0),
(110, 24, '徐水', 1, 0),
(111, 24, '涞源', 1, 0),
(112, 24, '定兴', 1, 0),
(113, 24, '顺平', 1, 0),
(114, 24, '唐县', 1, 0),
(115, 24, '望都', 1, 0),
(116, 24, '涞水', 1, 0),
(117, 24, '高阳', 1, 0),
(118, 24, '安新', 1, 0),
(119, 24, '雄县', 1, 0),
(120, 24, '容城', 1, 0),
(121, 24, '曲阳', 1, 0),
(122, 24, '阜平', 1, 0),
(123, 24, '博野', 1, 0),
(124, 24, '蠡县', 1, 0),
(125, 25, '桥西', 1, 0),
(126, 25, '桥东', 1, 0),
(127, 25, '宣化', 1, 0),
(128, 25, '下花园', 1, 0),
(129, 25, '宣化', 1, 0),
(130, 25, '张北', 1, 0),
(131, 25, '康保', 1, 0),
(132, 25, '沽源', 1, 0),
(133, 25, '尚义', 1, 0),
(134, 25, '蔚县', 1, 0),
(135, 25, '阳原', 1, 0),
(136, 25, '怀安', 1, 0),
(137, 25, '万全', 1, 0),
(138, 25, '怀来', 1, 0),
(139, 25, '涿鹿', 1, 0),
(140, 25, '赤城', 1, 0),
(141, 25, '崇礼', 1, 0),
(142, 26, '双桥', 1, 0),
(143, 26, '双滦', 1, 0),
(144, 26, '鹰手营子矿区', 1, 0),
(145, 26, '承德', 1, 0),
(146, 26, '兴隆', 1, 0),
(147, 26, '平泉', 1, 0),
(148, 26, '滦平', 1, 0),
(149, 26, '隆化', 1, 0),
(150, 26, '丰宁', 1, 0),
(151, 26, '宽城', 1, 0),
(152, 26, '围场', 1, 0),
(153, 27, '运河', 1, 0),
(154, 27, '新华', 1, 0),
(155, 27, '泊头', 1, 0),
(156, 27, '任丘', 1, 0),
(157, 27, '黄骅', 1, 0),
(158, 27, '河间', 1, 0),
(159, 27, '沧县', 1, 0),
(160, 27, '青县', 1, 0),
(161, 27, '东光', 1, 0),
(162, 27, '海兴', 1, 0),
(163, 27, '盐山', 1, 0),
(164, 27, '肃宁', 1, 0),
(165, 27, '南皮', 1, 0),
(166, 27, '吴桥', 1, 0),
(167, 27, '献县', 1, 0),
(168, 27, '孟村', 1, 0),
(169, 28, '安次', 1, 0),
(170, 28, '广阳', 1, 0),
(171, 28, '霸州', 1, 0),
(172, 28, '三河', 1, 0),
(173, 28, '固安', 1, 0),
(174, 28, '永清', 1, 0),
(175, 28, '香河', 1, 0),
(176, 28, '大城', 1, 0),
(177, 28, '文安', 1, 0),
(178, 28, '大厂', 1, 0),
(179, 29, '桃城', 1, 0),
(180, 29, '冀州', 1, 0),
(181, 29, '深州', 1, 0),
(182, 29, '枣强', 1, 0),
(183, 29, '武邑', 1, 0),
(184, 29, '武强', 1, 0),
(185, 29, '饶阳', 1, 0),
(186, 29, '安平', 1, 0),
(187, 29, '故城', 1, 0),
(188, 29, '景县', 1, 0),
(189, 29, '阜城', 1, 0),
(190, 30, '小店', 1, 0),
(191, 30, '迎泽', 1, 0),
(192, 30, '尖草坪', 1, 0),
(193, 30, '万柏林', 1, 0),
(194, 30, '晋源', 1, 0),
(195, 30, '古交', 1, 0),
(196, 30, '清徐', 1, 0),
(197, 30, '阳曲', 1, 0),
(198, 30, '娄烦', 1, 0),
(199, 31, '矿区', 1, 0),
(200, 31, '南郊', 1, 0),
(201, 31, '新荣', 1, 0),
(202, 31, '阳高', 1, 0),
(203, 31, '天镇', 1, 0),
(204, 31, '广灵', 1, 0),
(205, 31, '灵丘', 1, 0),
(206, 31, '浑源', 1, 0),
(207, 31, '左云', 1, 0),
(208, 31, '大同', 1, 0),
(209, 32, '矿区', 1, 0),
(210, 32, '郊区', 1, 0),
(211, 32, '平定', 1, 0),
(212, 32, '盂县', 1, 0),
(213, 33, '郊区', 1, 0),
(214, 33, '潞城', 1, 0),
(215, 33, '长治', 1, 0),
(216, 33, '襄垣', 1, 0),
(217, 33, '屯留', 1, 0),
(218, 33, '平顺', 1, 0),
(219, 33, '黎城', 1, 0),
(220, 33, '壶关', 1, 0),
(221, 33, '长子', 1, 0),
(222, 33, '武乡', 1, 0),
(223, 33, '沁县', 1, 0),
(224, 33, '沁源', 1, 0),
(225, 34, '高平', 1, 0),
(226, 34, '泽州', 1, 0),
(227, 34, '沁水', 1, 0),
(228, 34, '阳城', 1, 0),
(229, 34, '陵川', 1, 0),
(230, 35, '平鲁', 1, 0),
(231, 35, '山阴', 1, 0),
(232, 35, '应县', 1, 0),
(233, 35, '右玉', 1, 0),
(234, 35, '怀仁', 1, 0),
(235, 36, '介休', 1, 0),
(236, 36, '榆社', 1, 0),
(237, 36, '左权', 1, 0),
(238, 36, '和顺', 1, 0),
(239, 36, '昔阳', 1, 0),
(240, 36, '寿阳', 1, 0),
(241, 36, '太谷', 1, 0),
(242, 36, '祁县', 1, 0),
(243, 36, '平遥', 1, 0),
(244, 36, '灵石', 1, 0),
(245, 37, '永济', 1, 0),
(246, 37, '河津', 1, 0),
(247, 37, '芮城', 1, 0),
(248, 37, '临猗', 1, 0),
(249, 37, '万荣', 1, 0),
(250, 37, '新绛', 1, 0),
(251, 37, '稷山', 1, 0),
(252, 37, '闻喜', 1, 0),
(253, 37, '夏县', 1, 0),
(254, 37, '绛县', 1, 0),
(255, 37, '平陆', 1, 0),
(256, 37, '垣曲', 1, 0),
(257, 38, '原平', 1, 0),
(258, 38, '定襄', 1, 0),
(259, 38, '五台', 1, 0),
(260, 38, '代县', 1, 0),
(261, 38, '繁峙', 1, 0),
(262, 38, '宁武', 1, 0),
(263, 38, '静乐', 1, 0),
(264, 38, '神池', 1, 0),
(265, 38, '五寨', 1, 0),
(266, 38, '岢岚', 1, 0),
(267, 38, '河曲', 1, 0),
(268, 38, '保德', 1, 0),
(269, 38, '偏关', 1, 0),
(270, 39, '侯马', 1, 0),
(271, 39, '霍州', 1, 0),
(272, 39, '曲沃', 1, 0),
(273, 39, '翼城', 1, 0),
(274, 39, '襄汾', 1, 0),
(275, 39, '洪洞', 1, 0),
(276, 39, '古县', 1, 0),
(277, 39, '安泽', 1, 0),
(278, 39, '浮山', 1, 0),
(279, 39, '吉县', 1, 0),
(280, 39, '乡宁', 1, 0),
(281, 39, '蒲县', 1, 0),
(282, 39, '大宁', 1, 0),
(283, 39, '永和', 1, 0),
(284, 39, '隰县', 1, 0),
(285, 39, '汾西', 1, 0),
(286, 40, '孝义', 1, 0),
(287, 40, '汾阳', 1, 0),
(288, 40, '文水', 1, 0),
(289, 40, '中阳', 1, 0),
(290, 40, '兴县', 1, 0),
(291, 40, '临县', 1, 0),
(292, 40, '方山', 1, 0),
(293, 40, '柳林', 1, 0),
(294, 40, '岚县', 1, 0),
(295, 40, '交口', 1, 0),
(296, 40, '交城', 1, 0),
(297, 40, '石楼', 1, 0),
(298, 41, '回民', 1, 0),
(299, 41, '新城', 1, 0),
(300, 41, '玉泉', 1, 0),
(301, 41, '赛罕', 1, 0),
(302, 41, '托克托', 1, 0),
(303, 41, '武川', 1, 0),
(304, 41, '和林格尔', 1, 0),
(305, 41, '清水河', 1, 0),
(306, 41, '土默特左旗', 1, 0),
(307, 42, '昆都仑', 1, 0),
(308, 42, '东河', 1, 0),
(309, 42, '青山', 1, 0),
(310, 42, '石拐', 1, 0),
(311, 42, '白云矿', 1, 0),
(312, 42, '九原', 1, 0),
(313, 42, '固阳', 1, 0),
(314, 42, '土默特右旗', 1, 0),
(315, 42, '达尔罕茂明安联合旗', 1, 0),
(316, 43, '海勃湾', 1, 0),
(317, 43, '乌达', 1, 0),
(318, 43, '海南', 1, 0),
(319, 44, '红山', 1, 0),
(320, 44, '元宝山', 1, 0),
(321, 44, '松山', 1, 0),
(322, 44, '宁城', 1, 0),
(323, 44, '林西', 1, 0),
(324, 44, '阿鲁科尔沁旗', 1, 0),
(325, 44, '巴林左旗', 1, 0),
(326, 44, '巴林右旗', 1, 0),
(327, 44, '克什克腾旗', 1, 0),
(328, 44, '翁牛特旗', 1, 0),
(329, 44, '喀喇沁旗', 1, 0),
(330, 44, '敖汉旗', 1, 0),
(331, 45, '科尔沁', 1, 0),
(332, 45, '霍林郭勒', 1, 0),
(333, 45, '开鲁', 1, 0),
(334, 45, '库伦旗', 1, 0),
(335, 45, '奈曼旗', 1, 0),
(336, 45, '扎鲁特旗', 1, 0),
(337, 45, '科尔沁左翼中旗', 1, 0),
(338, 45, '科尔沁左翼后旗', 1, 0),
(339, 46, '东胜', 1, 0),
(340, 46, '达拉特旗', 1, 0),
(341, 46, '准格尔旗', 1, 0),
(342, 46, '鄂托克前旗', 1, 0),
(343, 46, '鄂托克旗', 1, 0),
(344, 46, '杭锦旗', 1, 0),
(345, 46, '乌审旗', 1, 0),
(346, 46, '伊金霍洛旗', 1, 0),
(347, 47, '海拉尔', 1, 0),
(348, 47, '满洲里', 1, 0),
(349, 47, '扎兰屯', 1, 0),
(350, 47, '牙克石', 1, 0),
(351, 47, '根河', 1, 0),
(352, 47, '额尔古纳', 1, 0),
(353, 47, '阿荣旗', 1, 0),
(354, 47, '新巴尔虎右旗', 1, 0),
(355, 47, '新巴尔虎左旗', 1, 0),
(356, 47, '陈巴尔虎旗', 1, 0),
(357, 47, '鄂伦春自治旗', 1, 0),
(358, 47, '鄂温克族自治旗', 1, 0),
(359, 47, '莫力达瓦达斡尔族自治旗', 1, 0),
(360, 48, '集宁', 1, 0),
(361, 48, '丰镇', 1, 0),
(362, 48, '卓资', 1, 0),
(363, 48, '化德', 1, 0),
(364, 48, '商都', 1, 0),
(365, 48, '兴和', 1, 0),
(366, 48, '凉城', 1, 0),
(367, 48, '察哈尔右翼前旗', 1, 0),
(368, 48, '察哈尔右翼中旗', 1, 0),
(369, 48, '察哈尔右翼后旗', 1, 0),
(370, 48, '四子王旗', 1, 0),
(371, 49, '锡林浩特', 1, 0),
(372, 49, '二连浩特', 1, 0),
(373, 49, '多伦', 1, 0),
(374, 49, '阿巴嘎旗', 1, 0),
(375, 49, '苏尼特左旗', 1, 0),
(376, 49, '苏尼特右旗', 1, 0),
(377, 49, '东乌珠穆沁旗', 1, 0),
(378, 49, '西乌珠穆沁旗', 1, 0),
(379, 49, '太仆寺旗', 1, 0),
(380, 49, '镶黄旗', 1, 0),
(381, 49, '正镶白旗', 1, 0),
(382, 49, '正蓝旗', 1, 0),
(383, 50, '临河', 1, 0),
(384, 50, '五原', 1, 0),
(385, 50, '磴口', 1, 0),
(386, 50, '乌拉特前旗', 1, 0),
(387, 50, '乌拉特中旗', 1, 0),
(388, 50, '乌拉特后旗', 1, 0),
(389, 50, '杭锦后旗', 1, 0),
(390, 51, '阿拉善左旗', 1, 0),
(391, 51, '阿拉善右旗', 1, 0),
(392, 51, '额济纳旗', 1, 0),
(393, 52, '乌兰浩特', 1, 0),
(394, 52, '阿尔山', 1, 0),
(395, 52, '突泉', 1, 0),
(396, 52, '科尔沁右翼前旗', 1, 0),
(397, 52, '科尔沁右翼中旗', 1, 0),
(398, 52, '扎赉特旗', 1, 0),
(399, 53, '和平', 1, 0),
(400, 53, '大东', 1, 0),
(401, 53, '皇姑', 1, 0),
(402, 53, '铁西', 1, 0),
(403, 53, '苏家屯', 1, 0),
(404, 53, '东陵', 1, 0),
(405, 53, '新城子', 1, 0),
(406, 53, '于洪', 1, 0),
(407, 53, '新民', 1, 0),
(408, 53, '辽中', 1, 0),
(409, 53, '康平', 1, 0),
(410, 53, '法库', 1, 0),
(411, 54, '西岗', 1, 0),
(412, 54, '中山', 1, 0),
(413, 54, '沙河口', 1, 0),
(414, 54, '甘井子', 1, 0),
(415, 54, '旅顺口', 1, 0),
(416, 54, '金州', 1, 0),
(417, 54, '瓦房店', 1, 0),
(418, 54, '普兰店', 1, 0),
(419, 54, '庄河', 1, 0),
(420, 54, '长海', 1, 0),
(421, 55, '铁东', 1, 0),
(422, 55, '铁西', 1, 0),
(423, 55, '立山', 1, 0),
(424, 55, '千山', 1, 0),
(425, 55, '海城', 1, 0),
(426, 55, '台安', 1, 0),
(427, 55, '岫岩', 1, 0),
(428, 56, '新抚', 1, 0),
(429, 56, '东洲', 1, 0),
(430, 56, '望花', 1, 0),
(431, 56, '顺城', 1, 0),
(432, 56, '抚顺', 1, 0),
(433, 56, '新宾', 1, 0),
(434, 56, '清原', 1, 0),
(435, 57, '平山', 1, 0),
(436, 57, '溪湖', 1, 0),
(437, 57, '明山', 1, 0),
(438, 57, '南芬', 1, 0),
(439, 57, '本溪', 1, 0),
(440, 57, '桓仁', 1, 0),
(441, 58, '振兴', 1, 0),
(442, 58, '元宝', 1, 0),
(443, 58, '振安', 1, 0),
(444, 58, '凤城', 1, 0),
(445, 58, '东港', 1, 0),
(446, 58, '宽甸', 1, 0),
(447, 59, '太和', 1, 0),
(448, 59, '古塔', 1, 0),
(449, 59, '凌河', 1, 0),
(450, 59, '凌海', 1, 0),
(451, 59, '北宁', 1, 0),
(452, 59, '黑山', 1, 0),
(453, 59, '义县', 1, 0),
(454, 60, '龙港', 1, 0),
(455, 60, '连山', 1, 0),
(456, 60, '南票', 1, 0),
(457, 60, '兴城', 1, 0),
(458, 60, '绥中', 1, 0),
(459, 60, '建昌', 1, 0),
(460, 61, '站前', 1, 0),
(461, 61, '西市', 1, 0),
(462, 61, '鲅鱼圈', 1, 0),
(463, 61, '老边', 1, 0),
(464, 61, '大石桥', 1, 0),
(465, 61, '盖州', 1, 0),
(466, 62, '双台子', 1, 0),
(467, 62, '兴隆台', 1, 0),
(468, 62, '大洼', 1, 0),
(469, 62, '盘山', 1, 0),
(470, 63, '海州', 1, 0),
(471, 63, '新邱', 1, 0),
(472, 63, '太平', 1, 0),
(473, 63, '清河门', 1, 0),
(474, 63, '细河', 1, 0),
(475, 63, '彰武', 1, 0),
(476, 63, '阜新', 1, 0),
(477, 64, '白塔', 1, 0),
(478, 64, '文圣', 1, 0),
(479, 64, '宏伟', 1, 0),
(480, 64, '弓长岭', 1, 0),
(481, 64, '太子河', 1, 0),
(482, 64, '灯塔', 1, 0),
(483, 64, '辽阳', 1, 0),
(484, 65, '银州', 1, 0),
(485, 65, '清河', 1, 0),
(486, 65, '调兵山', 1, 0),
(487, 65, '开原', 1, 0),
(488, 65, '铁岭', 1, 0),
(489, 65, '西丰', 1, 0),
(490, 65, '昌图', 1, 0),
(491, 66, '双塔', 1, 0),
(492, 66, '龙城', 1, 0),
(493, 66, '北票', 1, 0),
(494, 66, '凌源', 1, 0),
(495, 66, '朝阳', 1, 0),
(496, 66, '建平', 1, 0),
(497, 66, '喀喇沁左翼', 1, 0),
(498, 67, '朝阳', 1, 0),
(499, 67, '南关', 1, 0),
(500, 67, '宽城', 1, 0),
(501, 67, '二道', 1, 0),
(502, 67, '绿园', 1, 0),
(503, 67, '双阳', 1, 0),
(504, 67, '德惠', 1, 0),
(505, 67, '九台', 1, 0),
(506, 67, '榆树', 1, 0),
(507, 67, '农安', 1, 0),
(508, 68, '船营', 1, 0),
(509, 68, '龙潭', 1, 0),
(510, 68, '昌邑', 1, 0),
(511, 68, '丰满', 1, 0),
(512, 68, '磐石', 1, 0),
(513, 68, '蛟河', 1, 0),
(514, 68, '桦甸', 1, 0),
(515, 68, '舒兰', 1, 0),
(516, 68, '永吉', 1, 0),
(517, 69, '铁西', 1, 0),
(518, 69, '铁东', 1, 0),
(519, 69, '双辽', 1, 0),
(520, 69, '公主岭', 1, 0),
(521, 69, '梨树', 1, 0),
(522, 69, '伊通', 1, 0),
(523, 70, '龙山', 1, 0),
(524, 70, '西安', 1, 0),
(525, 70, '东丰', 1, 0),
(526, 70, '东辽', 1, 0),
(527, 71, '东昌', 1, 0),
(528, 71, '二道江', 1, 0),
(529, 71, '梅河口', 1, 0),
(530, 71, '集安', 1, 0),
(531, 71, '通化', 1, 0),
(532, 71, '辉南', 1, 0),
(533, 71, '柳河', 1, 0),
(534, 72, '八道江', 1, 0),
(535, 72, '临江', 1, 0),
(536, 72, '江源', 1, 0),
(537, 72, '抚松', 1, 0),
(538, 72, '靖宇', 1, 0),
(539, 72, '长白', 1, 0),
(540, 73, '宁江', 1, 0),
(541, 73, '扶余', 1, 0),
(542, 73, '长岭', 1, 0),
(543, 73, '乾安', 1, 0),
(544, 73, '前郭尔罗斯', 1, 0),
(545, 74, '洮北', 1, 0),
(546, 74, '大安', 1, 0),
(547, 74, '洮南', 1, 0),
(548, 74, '镇赉', 1, 0),
(549, 74, '通榆', 1, 0),
(550, 75, '延吉', 1, 0),
(551, 75, '图们', 1, 0),
(552, 75, '敦化', 1, 0),
(553, 75, '珲春', 1, 0),
(554, 75, '龙井', 1, 0),
(555, 75, '和龙', 1, 0),
(556, 75, '汪清', 1, 0),
(557, 75, '安图', 1, 0),
(558, 76, '南岗', 1, 0),
(559, 76, '道外', 1, 0),
(560, 76, '太平', 1, 0),
(561, 76, '香坊', 1, 0),
(562, 76, '动力', 1, 0),
(563, 76, '平房', 1, 0),
(564, 76, '双城', 1, 0),
(565, 76, '尚志', 1, 0),
(566, 76, '五常', 1, 0),
(567, 76, '阿城', 1, 0),
(568, 76, '呼兰', 1, 0),
(569, 76, '依兰', 1, 0),
(570, 76, '方正', 1, 0),
(571, 76, '宾县', 1, 0),
(572, 76, '巴彦', 1, 0),
(573, 76, '木兰', 1, 0),
(574, 76, '通河', 1, 0),
(575, 76, '延寿', 1, 0),
(576, 77, '龙沙', 1, 0),
(577, 77, '建华', 1, 0),
(578, 77, '铁峰', 1, 0),
(579, 77, '昂昂溪', 1, 0),
(580, 77, '富拉尔基', 1, 0),
(581, 77, '碾子山', 1, 0),
(582, 77, '梅里斯达斡尔', 1, 0),
(583, 77, '讷河', 1, 0),
(584, 77, '龙江', 1, 0),
(585, 77, '依安', 1, 0),
(586, 77, '泰来', 1, 0),
(587, 77, '甘南', 1, 0),
(588, 77, '富裕', 1, 0),
(589, 77, '克山', 1, 0),
(590, 77, '克东', 1, 0),
(591, 77, '拜泉', 1, 0),
(592, 78, '兴山', 1, 0),
(593, 78, '向阳', 1, 0),
(594, 78, '工农', 1, 0),
(595, 78, '南山', 1, 0),
(596, 78, '兴安', 1, 0),
(597, 78, '东山', 1, 0),
(598, 78, '萝北', 1, 0),
(599, 78, '绥滨', 1, 0),
(600, 79, '尖山', 1, 0),
(601, 79, '岭东', 1, 0),
(602, 79, '四方台', 1, 0),
(603, 79, '宝山', 1, 0),
(604, 79, '集贤', 1, 0),
(605, 79, '友谊', 1, 0),
(606, 79, '宝清', 1, 0),
(607, 79, '饶河', 1, 0),
(608, 80, '鸡冠', 1, 0),
(609, 80, '恒山', 1, 0),
(610, 80, '滴道', 1, 0),
(611, 80, '梨树', 1, 0),
(612, 80, '城子河', 1, 0),
(613, 80, '麻山', 1, 0),
(614, 80, '虎林', 1, 0),
(615, 80, '密山', 1, 0),
(616, 80, '鸡东', 1, 0),
(617, 81, '萨尔图', 1, 0),
(618, 81, '龙凤', 1, 0),
(619, 81, '让胡路', 1, 0),
(620, 81, '大同', 1, 0),
(621, 81, '红岗', 1, 0),
(622, 81, '肇州', 1, 0),
(623, 81, '肇源', 1, 0),
(624, 81, '林甸', 1, 0),
(625, 81, '杜尔伯特', 1, 0),
(626, 82, '伊春', 1, 0),
(627, 82, '南岔', 1, 0),
(628, 82, '友好', 1, 0),
(629, 82, '西林', 1, 0),
(630, 82, '翠峦', 1, 0),
(631, 82, '新青', 1, 0),
(632, 82, '美溪', 1, 0),
(633, 82, '金山屯', 1, 0),
(634, 82, '五营', 1, 0),
(635, 82, '乌马河', 1, 0),
(636, 82, '汤旺河', 1, 0),
(637, 82, '带岭', 1, 0),
(638, 82, '乌伊岭', 1, 0),
(639, 82, '红星', 1, 0),
(640, 82, '上甘岭', 1, 0),
(641, 82, '铁力', 1, 0),
(642, 82, '嘉荫', 1, 0),
(643, 83, '爱民', 1, 0),
(644, 83, '东安', 1, 0),
(645, 83, '阳明', 1, 0),
(646, 83, '西安', 1, 0),
(647, 83, '穆棱', 1, 0),
(648, 83, '绥芬河', 1, 0),
(649, 83, '海林', 1, 0),
(650, 83, '宁安', 1, 0),
(651, 83, '东宁', 1, 0),
(652, 83, '林口', 1, 0),
(653, 84, '前进', 1, 0),
(654, 84, '永红', 1, 0),
(655, 84, '向阳', 1, 0),
(656, 84, '东风', 1, 0),
(657, 84, '郊区', 1, 0),
(658, 84, '同江', 1, 0),
(659, 84, '富锦', 1, 0),
(660, 84, '桦南', 1, 0),
(661, 84, '桦川', 1, 0),
(662, 84, '汤原', 1, 0),
(663, 84, '抚远', 1, 0),
(664, 85, '桃山', 1, 0),
(665, 85, '新兴', 1, 0),
(666, 85, '茄子河', 1, 0),
(667, 85, '勃利', 1, 0),
(668, 86, '爱辉', 1, 0),
(669, 86, '北安', 1, 0),
(670, 86, '五大连池', 1, 0),
(671, 86, '嫩江', 1, 0),
(672, 86, '逊克', 1, 0),
(673, 86, '孙吴', 1, 0),
(674, 87, '北林', 1, 0),
(675, 87, '安达', 1, 0),
(676, 87, '肇东', 1, 0),
(677, 87, '海伦', 1, 0),
(678, 87, '望奎', 1, 0),
(679, 87, '兰西', 1, 0),
(680, 87, '青冈', 1, 0),
(681, 87, '庆安', 1, 0),
(682, 87, '明水', 1, 0),
(683, 87, '绥棱', 1, 0),
(684, 88, '呼玛', 1, 0),
(685, 88, '塔河', 1, 0),
(686, 88, '漠河', 1, 0),
(687, 89, '玄武', 1, 0),
(688, 89, '白下', 1, 0),
(689, 89, '秦淮', 1, 0),
(690, 89, '建邺', 1, 0),
(691, 89, '鼓楼', 1, 0),
(692, 89, '下关', 1, 0),
(693, 89, '浦口', 1, 0),
(694, 89, '六合', 1, 0),
(695, 89, '栖霞', 1, 0),
(696, 89, '雨花台', 1, 0),
(697, 89, '江宁', 1, 0),
(698, 89, '溧水', 1, 0),
(699, 89, '高淳', 1, 0),
(700, 90, '云龙', 1, 0),
(701, 90, '鼓楼', 1, 0),
(702, 90, '九里', 1, 0),
(703, 90, '贾汪', 1, 0),
(704, 90, '泉山', 1, 0),
(705, 90, '邳州', 1, 0),
(706, 90, '新沂', 1, 0),
(707, 90, '铜山', 1, 0),
(708, 90, '睢宁', 1, 0),
(709, 90, '沛县', 1, 0),
(710, 90, '丰县', 1, 0),
(711, 91, '新浦', 1, 0),
(712, 91, '连云', 1, 0),
(713, 91, '海州', 1, 0),
(714, 91, '赣榆', 1, 0),
(715, 91, '灌云', 1, 0),
(716, 91, '东海', 1, 0),
(717, 91, '灌南', 1, 0),
(718, 92, '清河', 1, 0),
(719, 92, '清浦', 1, 0),
(720, 92, '楚州', 1, 0),
(721, 92, '淮阴', 1, 0),
(722, 92, '金湖', 1, 0),
(723, 92, '盱眙', 1, 0),
(724, 92, '洪泽', 1, 0),
(725, 92, '涟水', 1, 0),
(726, 93, '宿城', 1, 0),
(727, 93, '宿豫', 1, 0),
(728, 93, '沭阳', 1, 0),
(729, 93, '泗阳', 1, 0),
(730, 93, '泗洪', 1, 0),
(731, 94, '城区', 1, 0),
(732, 94, '东台', 1, 0),
(733, 94, '大丰', 1, 0),
(734, 94, '盐都', 1, 0),
(735, 94, '射阳', 1, 0),
(736, 94, '阜宁', 1, 0),
(737, 94, '滨海', 1, 0),
(738, 94, '响水', 1, 0),
(739, 94, '建湖', 1, 0),
(740, 95, '广陵', 1, 0),
(741, 95, '维扬', 1, 0),
(742, 95, '邗江', 1, 0),
(743, 95, '仪征', 1, 0),
(744, 95, '江都', 1, 0),
(745, 95, '高邮', 1, 0),
(746, 95, '宝应', 1, 0),
(747, 96, '海陵', 1, 0),
(748, 96, '高港', 1, 0),
(749, 96, '靖江', 1, 0),
(750, 96, '泰兴', 1, 0),
(751, 96, '姜堰', 1, 0),
(752, 96, '兴化', 1, 0),
(753, 97, '崇川', 1, 0),
(754, 97, '港闸', 1, 0),
(755, 97, '海门', 1, 0),
(756, 97, '启东', 1, 0),
(757, 97, '通州', 1, 0),
(758, 97, '如皋', 1, 0),
(759, 97, '如东', 1, 0),
(760, 97, '海安', 1, 0),
(761, 98, '京口', 1, 0),
(762, 98, '润州', 1, 0),
(763, 98, '丹徒', 1, 0),
(764, 98, '丹阳', 1, 0),
(765, 98, '句容', 1, 0),
(766, 99, '钟楼', 1, 0),
(767, 99, '天宁', 1, 0),
(768, 99, '戚墅堰', 1, 0),
(769, 99, '新北', 1, 0),
(770, 99, '金坛', 1, 0),
(771, 99, '溧阳', 1, 0),
(772, 100, '崇安', 1, 0),
(773, 100, '南长', 1, 0),
(774, 100, '北塘', 1, 0),
(775, 100, '滨湖', 1, 0),
(776, 100, '惠山', 1, 0),
(777, 100, '锡山', 1, 0),
(778, 100, '江阴', 1, 0),
(779, 100, '宜兴', 1, 0),
(780, 101, '金阊', 1, 0),
(781, 101, '沧浪', 1, 0),
(782, 101, '平江', 1, 0),
(783, 101, '虎丘', 1, 0),
(784, 101, '吴中', 1, 0),
(785, 101, '相城', 1, 0),
(786, 101, '吴江', 1, 0),
(787, 101, '昆山', 1, 0),
(788, 101, '太仓', 1, 0),
(789, 101, '常熟', 1, 0),
(790, 101, '张家港', 1, 0),
(791, 102, '拱墅', 1, 0),
(792, 102, '上城', 1, 0),
(793, 102, '下城', 1, 0),
(794, 102, '江干', 1, 0),
(795, 102, '西湖', 1, 0),
(796, 102, '滨江', 1, 0),
(797, 102, '余杭', 1, 0),
(798, 102, '萧山', 1, 0),
(799, 102, '临安', 1, 0),
(800, 102, '富阳', 1, 0),
(801, 102, '建德', 1, 0),
(802, 102, '桐庐', 1, 0),
(803, 102, '淳安', 1, 0),
(804, 103, '海曙', 1, 0),
(805, 103, '江东', 1, 0),
(806, 103, '江北', 1, 0),
(807, 103, '镇海', 1, 0),
(808, 103, '北仑', 1, 0),
(809, 103, '鄞州', 1, 0),
(810, 103, '余姚', 1, 0),
(811, 103, '慈溪', 1, 0),
(812, 103, '奉化', 1, 0),
(813, 103, '宁海', 1, 0),
(814, 103, '象山', 1, 0),
(815, 104, '鹿城', 1, 0),
(816, 104, '龙湾', 1, 0),
(817, 104, '瓯海', 1, 0),
(818, 104, '瑞安', 1, 0),
(819, 104, '乐清', 1, 0),
(820, 104, '永嘉', 1, 0),
(821, 104, '文成', 1, 0),
(822, 104, '平阳', 1, 0),
(823, 104, '泰顺', 1, 0),
(824, 104, '洞头', 1, 0),
(825, 104, '苍南', 1, 0),
(826, 105, '秀城', 1, 0),
(827, 105, '秀洲', 1, 0),
(828, 105, '海宁', 1, 0),
(829, 105, '平湖', 1, 0),
(830, 105, '桐乡', 1, 0),
(831, 105, '嘉善', 1, 0),
(832, 105, '海盐', 1, 0),
(833, 106, '长兴', 1, 0),
(834, 106, '德清', 1, 0),
(835, 106, '安吉', 1, 0),
(836, 107, '越城', 1, 0),
(837, 107, '诸暨', 1, 0),
(838, 107, '上虞', 1, 0),
(839, 107, '嵊州', 1, 0),
(840, 107, '绍兴', 1, 0),
(841, 107, '新昌', 1, 0),
(842, 108, '婺城', 1, 0),
(843, 108, '金东', 1, 0),
(844, 108, '兰溪', 1, 0),
(845, 108, '永康', 1, 0),
(846, 108, '义乌', 1, 0),
(847, 108, '东阳', 1, 0),
(848, 108, '武义', 1, 0),
(849, 108, '浦江', 1, 0),
(850, 108, '磐安', 1, 0),
(851, 109, '柯城', 1, 0),
(852, 109, '衢江', 1, 0),
(853, 109, '江山', 1, 0),
(854, 109, '常山', 1, 0),
(855, 109, '开化', 1, 0),
(856, 109, '龙游', 1, 0),
(857, 110, '定海', 1, 0),
(858, 110, '普陀', 1, 0),
(859, 110, '岱山', 1, 0),
(860, 110, '嵊泗', 1, 0),
(861, 111, '椒江', 1, 0),
(862, 111, '黄岩', 1, 0),
(863, 111, '路桥', 1, 0),
(864, 111, '临海', 1, 0),
(865, 111, '温岭', 1, 0),
(866, 111, '三门', 1, 0),
(867, 111, '天台', 1, 0),
(868, 111, '仙居', 1, 0),
(869, 111, '玉环', 1, 0),
(870, 112, '莲都', 1, 0),
(871, 112, '龙泉', 1, 0),
(872, 112, '缙云', 1, 0),
(873, 112, '青田', 1, 0),
(874, 112, '云和', 1, 0),
(875, 112, '遂昌', 1, 0),
(876, 112, '松阳', 1, 0),
(877, 112, '庆元', 1, 0),
(878, 112, '景宁', 1, 0),
(879, 113, '瑶海', 1, 0),
(880, 113, '庐阳', 1, 0),
(881, 113, '蜀山', 1, 0),
(882, 113, '包河', 1, 0),
(883, 113, '长丰', 1, 0),
(884, 113, '肥东', 1, 0),
(885, 113, '肥西', 1, 0),
(886, 114, '镜湖', 1, 0),
(887, 114, '马塘', 1, 0),
(888, 114, '新芜', 1, 0),
(889, 114, '鸠江', 1, 0),
(890, 114, '芜湖', 1, 0),
(891, 114, '繁昌', 1, 0),
(892, 114, '南陵', 1, 0),
(893, 115, '中市', 1, 0),
(894, 115, '东市', 1, 0),
(895, 115, '西市', 1, 0),
(896, 115, '郊区', 1, 0),
(897, 115, '怀远', 1, 0),
(898, 115, '五河', 1, 0),
(899, 115, '固镇', 1, 0),
(900, 116, '田家庵', 1, 0),
(901, 116, '大通', 1, 0),
(902, 116, '谢家集', 1, 0),
(903, 116, '八公山', 1, 0),
(904, 116, '潘集', 1, 0),
(905, 116, '凤台', 1, 0),
(906, 117, '雨山', 1, 0),
(907, 117, '花山', 1, 0),
(908, 117, '金家庄', 1, 0),
(909, 117, '当涂', 1, 0),
(910, 118, '相山', 1, 0),
(911, 118, '杜集', 1, 0),
(912, 118, '烈山', 1, 0),
(913, 118, '濉溪', 1, 0),
(914, 119, '铜官山', 1, 0),
(915, 119, '狮子山', 1, 0),
(916, 119, '郊区', 1, 0),
(917, 119, '铜陵', 1, 0),
(918, 120, '迎江', 1, 0),
(919, 120, '大观', 1, 0),
(920, 120, '郊区', 1, 0),
(921, 120, '桐城', 1, 0),
(922, 120, '怀宁', 1, 0),
(923, 120, '枞阳', 1, 0),
(924, 120, '潜山', 1, 0),
(925, 120, '太湖', 1, 0),
(926, 120, '宿松', 1, 0),
(927, 120, '望江', 1, 0),
(928, 120, '岳西', 1, 0),
(929, 121, '屯溪', 1, 0),
(930, 121, '黄山', 1, 0),
(931, 121, '徽州', 1, 0),
(932, 121, '歙县', 1, 0),
(933, 121, '休宁', 1, 0),
(934, 121, '黟县', 1, 0),
(935, 121, '祁门', 1, 0),
(936, 122, '琅琊', 1, 0),
(937, 122, '南谯', 1, 0),
(938, 122, '明光', 1, 0),
(939, 122, '天长', 1, 0),
(940, 122, '来安', 1, 0),
(941, 122, '全椒', 1, 0),
(942, 122, '定远', 1, 0),
(943, 122, '凤阳', 1, 0),
(944, 123, '颖州', 1, 0),
(945, 123, '颖东', 1, 0),
(946, 123, '颖泉', 1, 0),
(947, 123, '界首', 1, 0),
(948, 123, '临泉', 1, 0),
(949, 123, '太和', 1, 0),
(950, 123, '阜南', 1, 0),
(951, 123, '颖上', 1, 0),
(952, 124, '埇桥', 1, 0),
(953, 124, '砀山', 1, 0),
(954, 124, '萧县', 1, 0),
(955, 124, '灵璧', 1, 0),
(956, 124, '泗县', 1, 0),
(957, 125, '居巢', 1, 0),
(958, 125, '庐江', 1, 0),
(959, 125, '无为', 1, 0),
(960, 125, '含山', 1, 0),
(961, 125, '和县', 1, 0),
(962, 126, '金安', 1, 0),
(963, 126, '裕安', 1, 0),
(964, 126, '寿县', 1, 0),
(965, 126, '霍邱', 1, 0),
(966, 126, '舒城', 1, 0),
(967, 126, '金寨', 1, 0),
(968, 126, '霍山', 1, 0),
(969, 127, '谯城', 1, 0),
(970, 127, '涡阳', 1, 0),
(971, 127, '蒙城', 1, 0),
(972, 127, '利辛', 1, 0),
(973, 128, '贵池', 1, 0),
(974, 128, '东至', 1, 0),
(975, 128, '石台', 1, 0),
(976, 128, '青阳', 1, 0),
(977, 129, '宣州', 1, 0),
(978, 129, '宁国', 1, 0),
(979, 129, '郎溪', 1, 0),
(980, 129, '广德', 1, 0),
(981, 129, '泾县', 1, 0),
(982, 129, '旌德', 1, 0),
(983, 129, '绩溪', 1, 0),
(984, 130, '台江', 1, 0),
(985, 130, '仓山', 1, 0),
(986, 130, '马尾', 1, 0),
(987, 130, '晋安', 1, 0),
(988, 130, '福清', 1, 0),
(989, 130, '长乐', 1, 0),
(990, 130, '闽侯', 1, 0),
(991, 130, '连江', 1, 0),
(992, 130, '罗源', 1, 0),
(993, 130, '闽清', 1, 0),
(994, 130, '永泰', 1, 0),
(995, 130, '平潭', 1, 0),
(996, 131, '鼓浪屿', 1, 0),
(997, 131, '思明', 1, 0),
(998, 131, '杏林', 1, 0),
(999, 131, '湖里', 1, 0),
(1000, 131, '集美', 1, 0),
(1001, 131, '同安', 1, 0),
(1002, 132, '三元', 1, 0),
(1003, 132, '永安', 1, 0),
(1004, 132, '明溪', 1, 0),
(1005, 132, '清流', 1, 0),
(1006, 132, '宁化', 1, 0),
(1007, 132, '大田', 1, 0),
(1008, 132, '尤溪', 1, 0),
(1009, 132, '沙县', 1, 0),
(1010, 132, '将乐', 1, 0),
(1011, 132, '泰宁', 1, 0),
(1012, 132, '建宁', 1, 0),
(1013, 133, '涵江', 1, 0),
(1014, 133, '荔城', 1, 0),
(1015, 134, '丰泽', 1, 0),
(1016, 134, '洛江', 1, 0),
(1017, 134, '泉港', 1, 0),
(1018, 134, '石狮', 1, 0),
(1019, 134, '晋江', 1, 0),
(1020, 134, '南安', 1, 0),
(1021, 134, '惠安', 1, 0),
(1022, 134, '安溪', 1, 0),
(1023, 134, '永春', 1, 0),
(1024, 134, '德化', 1, 0),
(1025, 135, '龙文', 1, 0),
(1026, 135, '龙海', 1, 0),
(1027, 135, '云霄', 1, 0),
(1028, 135, '漳浦', 1, 0),
(1029, 135, '诏安', 1, 0),
(1030, 135, '长泰', 1, 0),
(1031, 135, '东山', 1, 0),
(1032, 135, '南靖', 1, 0),
(1033, 135, '平和', 1, 0),
(1034, 135, '华安', 1, 0),
(1035, 136, '邵武', 1, 0),
(1036, 136, '武夷山', 1, 0),
(1037, 136, '建瓯', 1, 0),
(1038, 136, '建阳', 1, 0),
(1039, 136, '顺昌', 1, 0),
(1040, 136, '浦城', 1, 0),
(1041, 136, '光泽', 1, 0),
(1042, 136, '松溪', 1, 0),
(1043, 136, '政和', 1, 0),
(1044, 137, '漳平', 1, 0),
(1045, 137, '长汀', 1, 0),
(1046, 137, '永定', 1, 0),
(1047, 137, '上杭', 1, 0),
(1048, 137, '武平', 1, 0),
(1049, 137, '连城', 1, 0),
(1050, 138, '福安', 1, 0),
(1051, 138, '福鼎', 1, 0),
(1052, 138, '寿宁', 1, 0),
(1053, 138, '霞浦', 1, 0),
(1054, 138, '柘荣', 1, 0),
(1055, 138, '屏南', 1, 0),
(1056, 138, '古田', 1, 0),
(1057, 138, '周宁', 1, 0),
(1058, 139, '西湖', 1, 0),
(1059, 139, '青云谱', 1, 0),
(1060, 139, '湾里', 1, 0),
(1061, 139, '青山湖', 1, 0),
(1062, 139, '南昌', 1, 0),
(1063, 139, '新建', 1, 0),
(1064, 139, '安义', 1, 0),
(1065, 139, '进贤', 1, 0),
(1066, 140, '昌江', 1, 0),
(1067, 140, '乐平', 1, 0),
(1068, 140, '浮梁', 1, 0),
(1069, 141, '湘东', 1, 0),
(1070, 141, '莲花', 1, 0),
(1071, 141, '上栗', 1, 0),
(1072, 141, '芦溪', 1, 0),
(1073, 142, '庐山', 1, 0),
(1074, 142, '瑞昌', 1, 0),
(1075, 142, '九江', 1, 0),
(1076, 142, '武宁', 1, 0),
(1077, 142, '修水', 1, 0),
(1078, 142, '永修', 1, 0),
(1079, 142, '德安', 1, 0),
(1080, 142, '星子', 1, 0),
(1081, 142, '都昌', 1, 0),
(1082, 142, '湖口', 1, 0),
(1083, 142, '彭泽', 1, 0),
(1084, 143, '分宜', 1, 0),
(1085, 144, '贵溪', 1, 0),
(1086, 144, '余江', 1, 0),
(1087, 145, '瑞金', 1, 0),
(1088, 145, '南康', 1, 0),
(1089, 145, '赣县', 1, 0),
(1090, 145, '信丰', 1, 0),
(1091, 145, '大余', 1, 0),
(1092, 145, '上犹', 1, 0),
(1093, 145, '崇义', 1, 0),
(1094, 145, '安远', 1, 0),
(1095, 145, '龙南', 1, 0),
(1096, 145, '定南', 1, 0),
(1097, 145, '全南', 1, 0),
(1098, 145, '宁都', 1, 0),
(1099, 145, '于都', 1, 0),
(1100, 145, '兴国', 1, 0),
(1101, 145, '会昌', 1, 0),
(1102, 145, '寻乌', 1, 0),
(1103, 145, '石城', 1, 0),
(1104, 146, '青原', 1, 0),
(1105, 146, '井冈山', 1, 0),
(1106, 146, '吉安', 1, 0),
(1107, 146, '吉水', 1, 0),
(1108, 146, '峡江', 1, 0),
(1109, 146, '新干', 1, 0),
(1110, 146, '永丰', 1, 0),
(1111, 146, '泰和', 1, 0),
(1112, 146, '遂川', 1, 0),
(1113, 146, '万安', 1, 0),
(1114, 146, '安福', 1, 0),
(1115, 146, '永新', 1, 0),
(1116, 147, '丰城', 1, 0),
(1117, 147, '樟树', 1, 0),
(1118, 147, '高安', 1, 0),
(1119, 147, '奉新', 1, 0),
(1120, 147, '万载', 1, 0),
(1121, 147, '上高', 1, 0),
(1122, 147, '宜丰', 1, 0),
(1123, 147, '靖安', 1, 0),
(1124, 147, '铜鼓', 1, 0),
(1125, 148, '南城', 1, 0),
(1126, 148, '黎川', 1, 0),
(1127, 148, '南丰', 1, 0),
(1128, 148, '崇仁', 1, 0),
(1129, 148, '乐安', 1, 0),
(1130, 148, '宜黄', 1, 0),
(1131, 148, '金溪', 1, 0),
(1132, 148, '资溪', 1, 0),
(1133, 148, '东乡', 1, 0),
(1134, 148, '广昌', 1, 0),
(1135, 149, '德兴', 1, 0),
(1136, 149, '上饶', 1, 0),
(1137, 149, '广丰', 1, 0),
(1138, 149, '玉山', 1, 0),
(1139, 149, '铅山', 1, 0),
(1140, 149, '横峰', 1, 0),
(1141, 149, '弋阳', 1, 0),
(1142, 149, '余干', 1, 0),
(1143, 149, '波阳', 1, 0),
(1144, 149, '万年', 1, 0),
(1145, 149, '婺源', 1, 0),
(1146, 150, '市中', 1, 0),
(1147, 150, '历下', 1, 0),
(1148, 150, '槐荫', 1, 0),
(1149, 150, '天桥', 1, 0),
(1150, 150, '历城', 1, 0),
(1151, 150, '长清', 1, 0),
(1152, 150, '章丘', 1, 0),
(1153, 150, '平阴', 1, 0),
(1154, 150, '济阳', 1, 0),
(1155, 150, '商河', 1, 0),
(1156, 151, '市南', 1, 0),
(1157, 151, '市北', 1, 0),
(1158, 151, '四方', 1, 0),
(1159, 151, '黄岛', 1, 0),
(1160, 151, '崂山', 1, 0),
(1161, 151, '城阳', 1, 0),
(1162, 151, '李沧', 1, 0),
(1163, 151, '胶州', 1, 0),
(1164, 151, '即墨', 1, 0),
(1165, 151, '平度', 1, 0),
(1166, 151, '胶南', 1, 0),
(1167, 151, '莱西', 1, 0),
(1168, 152, '张店', 1, 0),
(1169, 152, '淄川', 1, 0),
(1170, 152, '博山', 1, 0),
(1171, 152, '临淄', 1, 0),
(1172, 152, '周村', 1, 0),
(1173, 152, '桓台', 1, 0),
(1174, 152, '高青', 1, 0),
(1175, 152, '沂源', 1, 0),
(1176, 153, '市中', 1, 0),
(1177, 153, '薛城', 1, 0),
(1178, 153, '峄城', 1, 0),
(1179, 153, '台儿庄', 1, 0),
(1180, 153, '山亭', 1, 0),
(1181, 153, '滕州', 1, 0),
(1182, 154, '东营', 1, 0),
(1183, 154, '河口', 1, 0),
(1184, 154, '垦利', 1, 0),
(1185, 154, '利津', 1, 0),
(1186, 154, '广饶', 1, 0),
(1187, 155, '潍城', 1, 0),
(1188, 155, '寒亭', 1, 0),
(1189, 155, '坊子', 1, 0),
(1190, 155, '奎文', 1, 0),
(1191, 155, '安丘', 1, 0),
(1192, 155, '昌邑', 1, 0),
(1193, 155, '高密', 1, 0),
(1194, 155, '青州', 1, 0),
(1195, 155, '诸城', 1, 0),
(1196, 155, '寿光', 1, 0),
(1197, 155, '临朐', 1, 0),
(1198, 155, '昌乐', 1, 0),
(1199, 156, '芝罘', 1, 0),
(1200, 156, '福山', 1, 0),
(1201, 156, '莱山', 1, 0),
(1202, 156, '牟平', 1, 0),
(1203, 156, '栖霞', 1, 0),
(1204, 156, '海阳', 1, 0),
(1205, 156, '龙口', 1, 0),
(1206, 156, '莱阳', 1, 0),
(1207, 156, '莱州', 1, 0),
(1208, 156, '蓬莱', 1, 0),
(1209, 156, '招远', 1, 0),
(1210, 156, '长岛', 1, 0),
(1211, 157, '环翠', 1, 0),
(1212, 157, '荣成', 1, 0),
(1213, 157, '乳山', 1, 0),
(1214, 157, '文登', 1, 0),
(1215, 159, '泰山', 1, 0),
(1216, 159, '岱岳', 1, 0),
(1217, 159, '新泰', 1, 0),
(1218, 159, '肥城', 1, 0),
(1219, 159, '宁阳', 1, 0),
(1220, 159, '东平', 1, 0),
(1221, 160, '东港', 1, 0),
(1222, 160, '五莲', 1, 0),
(1223, 160, '莒县', 1, 0),
(1224, 161, '莱城', 1, 0),
(1225, 161, '钢城', 1, 0),
(1226, 162, '兰山', 1, 0),
(1227, 162, '罗庄', 1, 0),
(1228, 162, '河东', 1, 0),
(1229, 162, '郯城', 1, 0),
(1230, 162, '苍山', 1, 0),
(1231, 162, '莒南', 1, 0),
(1232, 162, '沂水', 1, 0),
(1233, 162, '蒙阴', 1, 0),
(1234, 162, '平邑', 1, 0),
(1235, 162, '费县', 1, 0),
(1236, 162, '沂南', 1, 0),
(1237, 162, '临沭', 1, 0),
(1238, 163, '德城', 1, 0),
(1239, 163, '乐陵', 1, 0),
(1240, 163, '禹城', 1, 0),
(1241, 163, '陵县', 1, 0),
(1242, 163, '平原', 1, 0),
(1243, 163, '夏津', 1, 0),
(1244, 163, '武城', 1, 0),
(1245, 163, '齐河', 1, 0),
(1246, 163, '临邑', 1, 0),
(1247, 163, '宁津', 1, 0),
(1248, 163, '庆云', 1, 0),
(1249, 164, '东昌府', 1, 0),
(1250, 164, '临清', 1, 0),
(1251, 164, '阳谷', 1, 0),
(1252, 164, '莘县', 1, 0),
(1253, 164, '茌平', 1, 0),
(1254, 164, '东阿', 1, 0),
(1255, 164, '冠县', 1, 0),
(1256, 164, '高唐', 1, 0),
(1257, 165, '滨城', 1, 0),
(1258, 165, '惠民', 1, 0),
(1259, 165, '阳信', 1, 0),
(1260, 165, '无棣', 1, 0),
(1261, 165, '沾化', 1, 0),
(1262, 165, '博兴', 1, 0),
(1263, 165, '邹平', 1, 0),
(1264, 166, '牡丹', 1, 0),
(1265, 166, '曹县', 1, 0),
(1266, 166, '定陶', 1, 0),
(1267, 166, '成武', 1, 0),
(1268, 166, '单县', 1, 0),
(1269, 166, '巨野', 1, 0),
(1270, 166, '郓城', 1, 0),
(1271, 166, '鄄城', 1, 0),
(1272, 166, '东明', 1, 0),
(1273, 167, '中原', 1, 0),
(1274, 167, '二七', 1, 0),
(1275, 167, '管城', 1, 0),
(1276, 167, '金水', 1, 0),
(1277, 167, '上街', 1, 0),
(1278, 167, '邙山', 1, 0),
(1279, 167, '新郑', 1, 0),
(1280, 167, '登封', 1, 0),
(1281, 167, '新密', 1, 0),
(1282, 167, '巩义', 1, 0),
(1283, 167, '荥阳', 1, 0),
(1284, 167, '中牟', 1, 0),
(1285, 168, '鼓楼', 1, 0),
(1286, 168, '龙亭', 1, 0),
(1287, 168, '顺河', 1, 0),
(1288, 168, '南关', 1, 0),
(1289, 168, '郊区', 1, 0),
(1290, 168, '杞县', 1, 0),
(1291, 168, '通许', 1, 0),
(1292, 168, '尉氏', 1, 0),
(1293, 168, '开封', 1, 0),
(1294, 168, '兰考', 1, 0),
(1295, 169, '西工', 1, 0),
(1296, 169, '老城', 1, 0),
(1297, 169, '瀍河', 1, 0),
(1298, 169, '涧西', 1, 0),
(1299, 169, '吉利', 1, 0),
(1300, 169, '洛龙', 1, 0),
(1301, 169, '偃师', 1, 0),
(1302, 169, '孟津', 1, 0),
(1303, 169, '新安', 1, 0),
(1304, 169, '栾川', 1, 0),
(1305, 169, '嵩县', 1, 0),
(1306, 169, '汝阳', 1, 0),
(1307, 169, '宜阳', 1, 0),
(1308, 169, '洛宁', 1, 0),
(1309, 169, '伊川', 1, 0),
(1310, 170, '新华', 1, 0),
(1311, 170, '卫东', 1, 0),
(1312, 170, '湛河', 1, 0),
(1313, 170, '石龙', 1, 0),
(1314, 170, '舞钢', 1, 0),
(1315, 170, '汝州', 1, 0),
(1316, 170, '宝丰', 1, 0),
(1317, 170, '叶县', 1, 0),
(1318, 170, '鲁山', 1, 0),
(1319, 170, '郏县', 1, 0),
(1320, 171, '山阳', 1, 0),
(1321, 171, '解放', 1, 0),
(1322, 171, '中站', 1, 0),
(1323, 171, '马村', 1, 0),
(1324, 171, '孟州', 1, 0),
(1325, 171, '沁阳', 1, 0),
(1326, 171, '修武', 1, 0),
(1327, 171, '博爱', 1, 0),
(1328, 171, '武陟', 1, 0),
(1329, 171, '温县', 1, 0),
(1330, 172, '淇滨', 1, 0),
(1331, 172, '山城', 1, 0),
(1332, 172, '鹤山', 1, 0),
(1333, 172, '浚县', 1, 0),
(1334, 172, '淇县', 1, 0),
(1335, 173, '新华', 1, 0),
(1336, 173, '红旗', 1, 0),
(1337, 173, '北站', 1, 0),
(1338, 173, '郊区', 1, 0),
(1339, 173, '卫辉', 1, 0),
(1340, 173, '辉县', 1, 0),
(1341, 173, '新乡', 1, 0),
(1342, 173, '获嘉', 1, 0),
(1343, 173, '原阳', 1, 0),
(1344, 173, '延津', 1, 0),
(1345, 173, '封丘', 1, 0),
(1346, 173, '长垣', 1, 0),
(1347, 174, '北关', 1, 0),
(1348, 174, '文峰', 1, 0),
(1349, 174, '殷都', 1, 0),
(1350, 174, '龙安', 1, 0),
(1351, 174, '林州', 1, 0),
(1352, 174, '安阳', 1, 0),
(1353, 174, '汤阴', 1, 0),
(1354, 174, '滑县', 1, 0),
(1355, 174, '内黄', 1, 0),
(1356, 175, '市区', 1, 0),
(1357, 175, '清丰', 1, 0),
(1358, 175, '南乐', 1, 0),
(1359, 175, '范县', 1, 0),
(1360, 175, '台前', 1, 0),
(1361, 175, '濮阳', 1, 0),
(1362, 176, '魏都', 1, 0),
(1363, 176, '禹州', 1, 0),
(1364, 176, '长葛', 1, 0),
(1365, 176, '许昌', 1, 0),
(1366, 176, '鄢陵', 1, 0),
(1367, 176, '襄城', 1, 0),
(1368, 177, '源汇', 1, 0),
(1369, 177, '舞阳', 1, 0),
(1370, 177, '临颖', 1, 0),
(1371, 177, '郾城', 1, 0),
(1372, 178, '湖滨', 1, 0),
(1373, 178, '义马', 1, 0),
(1374, 178, '灵宝', 1, 0),
(1375, 178, '渑池', 1, 0),
(1376, 178, '陕县', 1, 0),
(1377, 178, '卢氏', 1, 0),
(1378, 179, '卧龙', 1, 0),
(1379, 179, '宛城', 1, 0),
(1380, 179, '邓州', 1, 0),
(1381, 179, '南召', 1, 0),
(1382, 179, '方城', 1, 0),
(1383, 179, '西峡', 1, 0),
(1384, 179, '镇平', 1, 0),
(1385, 179, '内乡', 1, 0),
(1386, 179, '淅川', 1, 0),
(1387, 179, '社旗', 1, 0),
(1388, 179, '唐河', 1, 0),
(1389, 179, '新野', 1, 0),
(1390, 179, '桐柏', 1, 0),
(1391, 180, '梁园', 1, 0),
(1392, 180, '睢阳', 1, 0),
(1393, 180, '永城', 1, 0),
(1394, 180, '虞城', 1, 0),
(1395, 180, '民权', 1, 0),
(1396, 180, '宁陵', 1, 0),
(1397, 180, '睢县', 1, 0),
(1398, 180, '夏邑', 1, 0),
(1399, 180, '柘城', 1, 0),
(1400, 181, '浉河', 1, 0),
(1401, 181, '平桥', 1, 0),
(1402, 181, '息县', 1, 0),
(1403, 181, '淮滨', 1, 0),
(1404, 181, '潢川', 1, 0),
(1405, 181, '光山', 1, 0),
(1406, 181, '固始', 1, 0),
(1407, 181, '商城', 1, 0),
(1408, 181, '罗山', 1, 0),
(1409, 181, '新县', 1, 0),
(1410, 182, '川汇', 1, 0),
(1411, 182, '项城', 1, 0),
(1412, 182, '扶沟', 1, 0),
(1413, 182, '西华', 1, 0),
(1414, 182, '商水', 1, 0),
(1415, 182, '太康', 1, 0),
(1416, 182, '鹿邑', 1, 0),
(1417, 182, '郸城', 1, 0),
(1418, 182, '淮阳', 1, 0),
(1419, 182, '沈丘', 1, 0),
(1420, 183, '驿城', 1, 0),
(1421, 183, '确山', 1, 0),
(1422, 183, '泌阳', 1, 0),
(1423, 183, '遂平', 1, 0),
(1424, 183, '西平', 1, 0),
(1425, 183, '上蔡', 1, 0),
(1426, 183, '汝南', 1, 0),
(1427, 183, '平舆', 1, 0),
(1428, 183, '新蔡', 1, 0),
(1429, 183, '正阳', 1, 0),
(1430, 185, '江岸', 1, 0),
(1431, 185, '江汉', 1, 0),
(1432, 185, '硚口', 1, 0),
(1433, 185, '汉阳', 1, 0),
(1434, 185, '武昌', 1, 0),
(1435, 185, '青山', 1, 0),
(1436, 185, '洪山', 1, 0),
(1437, 185, '东西湖', 1, 0),
(1438, 185, '汉南', 1, 0),
(1439, 185, '蔡甸', 1, 0),
(1440, 185, '江夏', 1, 0),
(1441, 185, '黄陂', 1, 0),
(1442, 185, '新洲', 1, 0),
(1443, 186, '黄石港', 1, 0),
(1444, 186, '西塞山', 1, 0),
(1445, 186, '下陆', 1, 0),
(1446, 186, '铁山', 1, 0),
(1447, 186, '大冶', 1, 0),
(1448, 186, '阳新', 1, 0),
(1449, 187, '襄城', 1, 0),
(1450, 187, '樊城', 1, 0),
(1451, 187, '襄阳', 1, 0),
(1452, 187, '老河口', 1, 0),
(1453, 187, '枣阳', 1, 0),
(1454, 187, '宜城', 1, 0),
(1455, 187, '南漳', 1, 0),
(1456, 187, '谷城', 1, 0),
(1457, 187, '保康', 1, 0),
(1458, 188, '张湾', 1, 0),
(1459, 188, '茅箭', 1, 0),
(1460, 188, '丹江口', 1, 0),
(1461, 188, '郧县', 1, 0),
(1462, 188, '竹山', 1, 0),
(1463, 188, '房县', 1, 0),
(1464, 188, '郧西', 1, 0),
(1465, 188, '竹溪', 1, 0),
(1466, 189, '沙市', 1, 0),
(1467, 189, '荆州', 1, 0),
(1468, 189, '石首', 1, 0),
(1469, 189, '洪湖', 1, 0),
(1470, 189, '松滋', 1, 0),
(1471, 189, '江陵', 1, 0),
(1472, 189, '公安', 1, 0),
(1473, 189, '监利', 1, 0),
(1474, 190, '西陵', 1, 0),
(1475, 190, '伍家岗', 1, 0),
(1476, 190, '点军', 1, 0),
(1477, 190, '猇亭', 1, 0),
(1478, 190, '夷陵', 1, 0),
(1479, 190, '枝江', 1, 0),
(1480, 190, '宜都', 1, 0),
(1481, 190, '当阳', 1, 0),
(1482, 190, '远安', 1, 0),
(1483, 190, '兴山', 1, 0),
(1484, 190, '秭归', 1, 0),
(1485, 190, '长阳', 1, 0),
(1486, 190, '五峰', 1, 0),
(1487, 191, '东宝', 1, 0),
(1488, 191, '掇刀', 1, 0),
(1489, 191, '钟祥', 1, 0),
(1490, 191, '沙洋', 1, 0),
(1491, 191, '京山', 1, 0),
(1492, 192, '鄂城', 1, 0),
(1493, 192, '梁子湖', 1, 0),
(1494, 192, '华容', 1, 0),
(1495, 193, '孝南', 1, 0),
(1496, 193, '应城', 1, 0),
(1497, 193, '安陆', 1, 0),
(1498, 193, '汉川', 1, 0),
(1499, 193, '孝昌', 1, 0),
(1500, 193, '大悟', 1, 0),
(1501, 193, '云梦', 1, 0),
(1502, 194, '黄州', 1, 0),
(1503, 194, '麻城', 1, 0),
(1504, 194, '武穴', 1, 0),
(1505, 194, '红安', 1, 0),
(1506, 194, '罗田', 1, 0),
(1507, 194, '英山', 1, 0),
(1508, 194, '浠水', 1, 0),
(1509, 194, '蕲春', 1, 0),
(1510, 194, '黄梅', 1, 0),
(1511, 194, '团风', 1, 0),
(1512, 195, '咸安', 1, 0),
(1513, 195, '赤壁', 1, 0),
(1514, 195, '嘉鱼', 1, 0),
(1515, 195, '通城', 1, 0),
(1516, 195, '崇阳', 1, 0),
(1517, 195, '通山', 1, 0),
(1518, 196, '曾都', 1, 0),
(1519, 196, '广水', 1, 0),
(1520, 197, '恩施', 1, 0),
(1521, 197, '利川', 1, 0),
(1522, 197, '建始', 1, 0),
(1523, 197, '巴东', 1, 0),
(1524, 197, '宣恩', 1, 0),
(1525, 197, '咸丰', 1, 0),
(1526, 197, '来凤', 1, 0),
(1527, 197, '鹤峰', 1, 0),
(1528, 198, '潜江', 1, 0),
(1529, 198, '神农架林', 1, 0),
(1530, 199, '岳麓', 1, 0),
(1531, 199, '芙蓉', 1, 0),
(1532, 199, '天心', 1, 0),
(1533, 199, '开福', 1, 0),
(1534, 199, '雨花', 1, 0),
(1535, 199, '浏阳', 1, 0),
(1536, 199, '长沙', 1, 0),
(1537, 199, '望城', 1, 0),
(1538, 199, '宁乡', 1, 0),
(1539, 200, '天元', 1, 0),
(1540, 200, '荷塘', 1, 0),
(1541, 200, '芦淞', 1, 0),
(1542, 200, '石峰', 1, 0),
(1543, 200, '醴陵', 1, 0),
(1544, 200, '株洲', 1, 0),
(1545, 200, '攸县', 1, 0),
(1546, 200, '茶陵', 1, 0),
(1547, 200, '炎陵', 1, 0),
(1548, 201, '雨湖', 1, 0),
(1549, 201, '岳塘', 1, 0),
(1550, 201, '湘乡', 1, 0),
(1551, 201, '韶山', 1, 0),
(1552, 201, '湘潭', 1, 0),
(1553, 202, '雁峰', 1, 0),
(1554, 202, '珠晖', 1, 0),
(1555, 202, '石鼓', 1, 0),
(1556, 202, '蒸湘', 1, 0),
(1557, 202, '南岳', 1, 0),
(1558, 202, '常宁', 1, 0),
(1559, 202, '耒阳', 1, 0),
(1560, 202, '衡阳', 1, 0),
(1561, 202, '衡南', 1, 0),
(1562, 202, '衡山', 1, 0),
(1563, 202, '衡东', 1, 0),
(1564, 202, '祁东', 1, 0),
(1565, 203, '大祥', 1, 0),
(1566, 203, '北塔', 1, 0),
(1567, 203, '武冈', 1, 0),
(1568, 203, '邵东', 1, 0),
(1569, 203, '邵阳', 1, 0),
(1570, 203, '新邵', 1, 0),
(1571, 203, '隆回', 1, 0),
(1572, 203, '洞口', 1, 0),
(1573, 203, '绥宁', 1, 0),
(1574, 203, '新宁', 1, 0),
(1575, 203, '城步', 1, 0),
(1576, 204, '岳阳楼', 1, 0),
(1577, 204, '君山', 1, 0),
(1578, 204, '云溪', 1, 0),
(1579, 204, '汨罗', 1, 0),
(1580, 204, '临湘', 1, 0),
(1581, 204, '岳阳', 1, 0),
(1582, 204, '华容', 1, 0),
(1583, 204, '湘阴', 1, 0),
(1584, 204, '平江', 1, 0),
(1585, 205, '武陵', 1, 0),
(1586, 205, '鼎城', 1, 0),
(1587, 205, '津市', 1, 0),
(1588, 205, '安乡', 1, 0),
(1589, 205, '汉寿', 1, 0),
(1590, 205, '澧县', 1, 0),
(1591, 205, '临澧', 1, 0),
(1592, 205, '桃源', 1, 0),
(1593, 205, '石门', 1, 0),
(1594, 206, '永定', 1, 0),
(1595, 206, '武陵源', 1, 0),
(1596, 206, '慈利', 1, 0),
(1597, 206, '桑植', 1, 0),
(1598, 207, '赫山', 1, 0),
(1599, 207, '资阳', 1, 0),
(1600, 207, '沅江', 1, 0),
(1601, 207, '南县', 1, 0),
(1602, 207, '桃江', 1, 0),
(1603, 207, '安化', 1, 0),
(1604, 208, '北湖', 1, 0),
(1605, 208, '苏仙', 1, 0),
(1606, 208, '资兴', 1, 0),
(1607, 208, '桂阳', 1, 0),
(1608, 208, '永兴', 1, 0),
(1609, 208, '宜章', 1, 0),
(1610, 208, '嘉禾', 1, 0),
(1611, 208, '临武', 1, 0),
(1612, 208, '汝城', 1, 0),
(1613, 208, '桂东', 1, 0),
(1614, 208, '安仁', 1, 0),
(1615, 209, '冷水滩', 1, 0),
(1616, 209, '芝山', 1, 0),
(1617, 209, '东安', 1, 0),
(1618, 209, '道县', 1, 0),
(1619, 209, '宁远', 1, 0),
(1620, 209, '江永', 1, 0),
(1621, 209, '蓝山', 1, 0),
(1622, 209, '新田', 1, 0),
(1623, 209, '双牌', 1, 0),
(1624, 209, '祁阳', 1, 0),
(1625, 209, '江华', 1, 0),
(1626, 210, '洪江', 1, 0),
(1627, 210, '沅陵', 1, 0),
(1628, 210, '辰溪', 1, 0),
(1629, 210, '溆浦', 1, 0),
(1630, 210, '中方', 1, 0),
(1631, 210, '会同', 1, 0),
(1632, 210, '麻阳', 1, 0),
(1633, 210, '新晃', 1, 0),
(1634, 210, '芷江', 1, 0),
(1635, 210, '靖州', 1, 0),
(1636, 210, '通道', 1, 0),
(1637, 211, '娄星', 1, 0),
(1638, 211, '冷水江', 1, 0),
(1639, 211, '涟源', 1, 0),
(1640, 211, '双峰', 1, 0),
(1641, 211, '新化', 1, 0),
(1642, 212, '吉首', 1, 0),
(1643, 212, '泸溪', 1, 0),
(1644, 212, '凤凰', 1, 0),
(1645, 212, '花垣', 1, 0),
(1646, 212, '保靖', 1, 0),
(1647, 212, '古丈', 1, 0),
(1648, 212, '永顺', 1, 0),
(1649, 212, '龙山', 1, 0),
(1650, 213, '越秀', 1, 0),
(1651, 213, '东山', 1, 0),
(1652, 213, '荔湾', 1, 0),
(1653, 213, '海珠', 1, 0),
(1654, 213, '天河', 1, 0),
(1655, 213, '芳村', 1, 0),
(1656, 213, '白云', 1, 0),
(1657, 213, '黄埔', 1, 0),
(1658, 213, '番禺', 1, 0),
(1659, 213, '花都', 1, 0),
(1660, 213, '增城', 1, 0),
(1661, 213, '从化', 1, 0),
(1662, 214, '罗湖', 1, 0),
(1663, 214, '南山', 1, 0),
(1664, 214, '宝安', 1, 0),
(1665, 214, '龙岗', 1, 0),
(1666, 214, '盐田', 1, 0),
(1667, 215, '香洲', 1, 0),
(1668, 215, '斗门', 1, 0),
(1669, 215, '金湾', 1, 0),
(1670, 216, '金园', 1, 0),
(1671, 216, '达濠', 1, 0),
(1672, 216, '龙湖', 1, 0),
(1673, 216, '升平', 1, 0),
(1674, 216, '河浦', 1, 0),
(1675, 216, '澄海', 1, 0),
(1676, 216, '潮阳', 1, 0),
(1677, 216, '南澳', 1, 0),
(1678, 217, '北江', 1, 0),
(1679, 217, '武江', 1, 0),
(1680, 217, '浈江', 1, 0),
(1681, 217, '乐昌', 1, 0),
(1682, 217, '南雄', 1, 0),
(1683, 217, '曲江', 1, 0),
(1684, 217, '始兴', 1, 0),
(1685, 217, '仁化', 1, 0),
(1686, 217, '翁源', 1, 0),
(1687, 217, '新丰', 1, 0),
(1688, 217, '乳源', 1, 0),
(1689, 218, '源城', 1, 0),
(1690, 218, '紫金', 1, 0),
(1691, 218, '龙川', 1, 0),
(1692, 218, '连平', 1, 0),
(1693, 218, '和平', 1, 0),
(1694, 218, '东源', 1, 0),
(1695, 219, '梅江', 1, 0),
(1696, 219, '兴宁', 1, 0),
(1697, 219, '梅县', 1, 0),
(1698, 219, '大埔', 1, 0),
(1699, 219, '丰顺', 1, 0),
(1700, 219, '五华', 1, 0),
(1701, 219, '平远', 1, 0),
(1702, 219, '蕉岭', 1, 0),
(1703, 220, '惠城', 1, 0),
(1704, 220, '惠阳', 1, 0),
(1705, 220, '博罗', 1, 0),
(1706, 220, '惠东', 1, 0),
(1707, 220, '龙门', 1, 0),
(1708, 221, '城区', 1, 0),
(1709, 221, '陆丰', 1, 0),
(1710, 221, '海丰', 1, 0),
(1711, 221, '陆河', 1, 0),
(1712, 224, '江海', 1, 0),
(1713, 224, '蓬江', 1, 0),
(1714, 224, '新会', 1, 0),
(1715, 224, '恩平', 1, 0),
(1716, 224, '台山', 1, 0),
(1717, 224, '开平', 1, 0),
(1718, 224, '鹤山', 1, 0),
(1719, 225, '禅城', 1, 0),
(1720, 225, '高明', 1, 0),
(1721, 225, '顺德', 1, 0),
(1722, 225, '南海', 1, 0),
(1723, 225, '三水', 1, 0),
(1724, 226, '江城', 1, 0),
(1725, 226, '阳春', 1, 0),
(1726, 226, '阳西', 1, 0),
(1727, 226, '阳东', 1, 0),
(1728, 227, '赤坎', 1, 0),
(1729, 227, '霞山', 1, 0),
(1730, 227, '坡头', 1, 0),
(1731, 227, '麻章', 1, 0),
(1732, 227, '吴川', 1, 0),
(1733, 227, '廉江', 1, 0),
(1734, 227, '雷州', 1, 0),
(1735, 227, '遂溪', 1, 0),
(1736, 227, '徐闻', 1, 0),
(1737, 228, '茂南', 1, 0),
(1738, 228, '茂港', 1, 0),
(1739, 228, '化州', 1, 0),
(1740, 228, '信宜', 1, 0),
(1741, 228, '高州', 1, 0),
(1742, 228, '电白', 1, 0),
(1743, 229, '端州', 1, 0),
(1744, 229, '鼎湖', 1, 0),
(1745, 229, '高要', 1, 0),
(1746, 229, '四会', 1, 0),
(1747, 229, '广宁', 1, 0),
(1748, 229, '怀集', 1, 0),
(1749, 229, '封开', 1, 0),
(1750, 229, '德庆', 1, 0),
(1751, 230, '清城', 1, 0),
(1752, 230, '英德', 1, 0),
(1753, 230, '连州', 1, 0),
(1754, 230, '佛冈', 1, 0),
(1755, 230, '阳山', 1, 0),
(1756, 230, '清新', 1, 0),
(1757, 230, '连山', 1, 0),
(1758, 230, '连南', 1, 0),
(1759, 231, '湘桥', 1, 0),
(1760, 231, '潮安', 1, 0),
(1761, 231, '饶平', 1, 0),
(1762, 232, '榕城', 1, 0),
(1763, 232, '普宁', 1, 0),
(1764, 232, '揭东', 1, 0),
(1765, 232, '揭西', 1, 0),
(1766, 232, '惠来', 1, 0),
(1767, 233, '云城', 1, 0),
(1768, 233, '罗定', 1, 0),
(1769, 233, '云安', 1, 0),
(1770, 233, '新兴', 1, 0),
(1771, 233, '郁南', 1, 0),
(1772, 234, '新城', 1, 0),
(1773, 234, '兴宁', 1, 0),
(1774, 234, '城北', 1, 0),
(1775, 234, '江南', 1, 0),
(1776, 234, '永新', 1, 0),
(1777, 234, '邕宁', 1, 0),
(1778, 234, '武鸣', 1, 0),
(1779, 234, '宾阳', 1, 0),
(1780, 234, '上林', 1, 0),
(1781, 234, '马山', 1, 0),
(1782, 235, '城中', 1, 0),
(1783, 235, '鱼峰', 1, 0),
(1784, 235, '柳南', 1, 0),
(1785, 235, '柳北', 1, 0),
(1786, 235, '柳江', 1, 0),
(1787, 235, '柳城', 1, 0),
(1788, 235, '鹿寨', 1, 0),
(1789, 235, '融安', 1, 0),
(1790, 235, '融水', 1, 0),
(1791, 235, '三江', 1, 0),
(1792, 236, '秀峰', 1, 0),
(1793, 236, '叠彩', 1, 0),
(1794, 236, '象山', 1, 0),
(1795, 236, '七星', 1, 0),
(1796, 236, '雁山', 1, 0),
(1797, 236, '阳朔', 1, 0),
(1798, 236, '临桂', 1, 0),
(1799, 236, '灵川', 1, 0),
(1800, 236, '全州', 1, 0),
(1801, 236, '兴安', 1, 0),
(1802, 236, '永福', 1, 0),
(1803, 236, '灌阳', 1, 0),
(1804, 236, '资源', 1, 0),
(1805, 236, '平乐', 1, 0),
(1806, 236, '荔浦', 1, 0),
(1807, 236, '龙胜', 1, 0),
(1808, 236, '恭城', 1, 0),
(1809, 237, '万秀', 1, 0),
(1810, 237, '蝶山', 1, 0),
(1811, 237, '市郊', 1, 0),
(1812, 237, '岑溪', 1, 0),
(1813, 237, '苍梧', 1, 0),
(1814, 237, '藤县', 1, 0),
(1815, 237, '蒙山', 1, 0),
(1816, 238, '海城', 1, 0),
(1817, 238, '银海', 1, 0),
(1818, 238, '铁山港', 1, 0),
(1819, 238, '合浦', 1, 0),
(1820, 239, '港口', 1, 0),
(1821, 239, '防城', 1, 0),
(1822, 239, '东兴', 1, 0),
(1823, 239, '上思', 1, 0),
(1824, 240, '钦南', 1, 0),
(1825, 240, '钦北', 1, 0),
(1826, 240, '灵山', 1, 0),
(1827, 240, '浦北', 1, 0),
(1828, 241, '港北', 1, 0),
(1829, 241, '港南', 1, 0),
(1830, 241, '桂平', 1, 0),
(1831, 241, '平南', 1, 0),
(1832, 242, '北流', 1, 0),
(1833, 242, '兴业', 1, 0),
(1834, 242, '容县', 1, 0),
(1835, 242, '陆川', 1, 0),
(1836, 242, '博白', 1, 0),
(1837, 243, '田阳', 1, 0),
(1838, 243, '田东', 1, 0),
(1839, 243, '平果', 1, 0),
(1840, 243, '德保', 1, 0),
(1841, 243, '靖西', 1, 0),
(1842, 243, '那坡', 1, 0),
(1843, 243, '凌云', 1, 0),
(1844, 243, '乐业', 1, 0),
(1845, 243, '西林', 1, 0),
(1846, 243, '田林', 1, 0),
(1847, 243, '隆林', 1, 0),
(1848, 244, '八步', 1, 0),
(1849, 244, '昭平', 1, 0),
(1850, 244, '钟山', 1, 0),
(1851, 244, '富川', 1, 0),
(1852, 245, '金城江', 1, 0),
(1853, 245, '宜州', 1, 0),
(1854, 245, '南丹', 1, 0),
(1855, 245, '天峨', 1, 0),
(1856, 245, '凤山', 1, 0),
(1857, 245, '东兰', 1, 0),
(1858, 245, '巴马', 1, 0),
(1859, 245, '都安', 1, 0),
(1860, 245, '大化', 1, 0),
(1861, 245, '罗城', 1, 0),
(1862, 245, '环江', 1, 0),
(1863, 246, '兴宾', 1, 0),
(1864, 246, '合山', 1, 0),
(1865, 246, '象州', 1, 0),
(1866, 246, '武宣', 1, 0),
(1867, 246, '忻城', 1, 0),
(1868, 246, '金秀', 1, 0),
(1869, 247, '凭祥', 1, 0),
(1870, 247, '扶绥', 1, 0),
(1871, 247, '大新', 1, 0),
(1872, 247, '天等', 1, 0),
(1873, 247, '宁明', 1, 0),
(1874, 247, '龙州', 1, 0),
(1875, 248, '秀英', 1, 0),
(1876, 248, '新华', 1, 0),
(1877, 248, '振东', 1, 0),
(1878, 248, '秀英', 1, 0),
(1879, 248, '琼山', 1, 0),
(1880, 250, '澄迈', 1, 0),
(1881, 250, '定安', 1, 0),
(1882, 250, '屯昌', 1, 0),
(1883, 250, '昌江', 1, 0),
(1884, 250, '白沙', 1, 0),
(1885, 250, '琼中', 1, 0),
(1886, 250, '陵水', 1, 0),
(1887, 250, '保亭', 1, 0);
INSERT INTO `oc_city` (`city_id`, `zone_id`, `name`, `status`, `sort_order`) VALUES
(1888, 250, '乐东', 1, 0),
(1889, 251, '青羊', 1, 0),
(1890, 251, '锦江', 1, 0),
(1891, 251, '金牛', 1, 0),
(1892, 251, '武侯', 1, 0),
(1893, 251, '成华', 1, 0),
(1894, 251, '龙泉驿', 1, 0),
(1895, 251, '青白江', 1, 0),
(1896, 251, '新都', 1, 0),
(1897, 251, '温江', 1, 0),
(1898, 251, '崇州', 1, 0),
(1899, 251, '邛崃', 1, 0),
(1900, 251, '都江堰', 1, 0),
(1901, 251, '金堂', 1, 0),
(1902, 251, '双流', 1, 0),
(1903, 251, '郫县', 1, 0),
(1904, 251, '大邑', 1, 0),
(1905, 251, '蒲江', 1, 0),
(1906, 251, '新津', 1, 0),
(1907, 252, '大安', 1, 0),
(1908, 252, '贡井', 1, 0),
(1909, 252, '自流井', 1, 0),
(1910, 252, '沿滩', 1, 0),
(1911, 252, '荣县', 1, 0),
(1912, 252, '富顺', 1, 0),
(1913, 253, '东区', 1, 0),
(1914, 253, '西区', 1, 0),
(1915, 253, '仁和', 1, 0),
(1916, 253, '米易', 1, 0),
(1917, 253, '盐边', 1, 0),
(1918, 254, '江阳', 1, 0),
(1919, 254, '纳溪', 1, 0),
(1920, 254, '龙马潭', 1, 0),
(1921, 254, '泸县', 1, 0),
(1922, 254, '合江', 1, 0),
(1923, 254, '叙永', 1, 0),
(1924, 254, '古蔺', 1, 0),
(1925, 255, '旌阳', 1, 0),
(1926, 255, '什邡', 1, 0),
(1927, 255, '广汉', 1, 0),
(1928, 255, '绵竹', 1, 0),
(1929, 255, '罗江', 1, 0),
(1930, 255, '中江', 1, 0),
(1931, 256, '涪城', 1, 0),
(1932, 256, '游仙', 1, 0),
(1933, 256, '江油', 1, 0),
(1934, 256, '三台', 1, 0),
(1935, 256, '盐亭', 1, 0),
(1936, 256, '安县', 1, 0),
(1937, 256, '梓潼', 1, 0),
(1938, 256, '北川', 1, 0),
(1939, 256, '平武', 1, 0),
(1940, 257, '市中', 1, 0),
(1941, 257, '元坝', 1, 0),
(1942, 257, '朝天', 1, 0),
(1943, 257, '旺苍', 1, 0),
(1944, 257, '青川', 1, 0),
(1945, 257, '剑阁', 1, 0),
(1946, 257, '苍溪', 1, 0),
(1947, 258, '市中', 1, 0),
(1948, 258, '蓬溪', 1, 0),
(1949, 258, '射洪', 1, 0),
(1950, 258, '大英', 1, 0),
(1951, 259, '市中', 1, 0),
(1952, 259, '东兴', 1, 0),
(1953, 259, '威远', 1, 0),
(1954, 259, '资中', 1, 0),
(1955, 259, '隆昌', 1, 0),
(1956, 260, '市中', 1, 0),
(1957, 260, '沙湾', 1, 0),
(1958, 260, '五通桥', 1, 0),
(1959, 260, '金口河', 1, 0),
(1960, 260, '峨眉山', 1, 0),
(1961, 260, '犍为', 1, 0),
(1962, 260, '井研', 1, 0),
(1963, 260, '夹江', 1, 0),
(1964, 260, '沐川', 1, 0),
(1965, 260, '峨边', 1, 0),
(1966, 260, '马边', 1, 0),
(1967, 261, '顺庆', 1, 0),
(1968, 261, '高坪', 1, 0),
(1969, 261, '嘉陵', 1, 0),
(1970, 261, '阆中', 1, 0),
(1971, 261, '南部', 1, 0),
(1972, 261, '营山', 1, 0),
(1973, 261, '蓬安', 1, 0),
(1974, 261, '仪陇', 1, 0),
(1975, 261, '西充', 1, 0),
(1976, 262, '翠屏', 1, 0),
(1977, 262, '宜宾', 1, 0),
(1978, 262, '南溪', 1, 0),
(1979, 262, '江安', 1, 0),
(1980, 262, '长宁', 1, 0),
(1981, 262, '高县', 1, 0),
(1982, 262, '筠连', 1, 0),
(1983, 262, '珙县', 1, 0),
(1984, 262, '兴文', 1, 0),
(1985, 262, '屏山', 1, 0),
(1986, 263, '广安', 1, 0),
(1987, 263, '华蓥', 1, 0),
(1988, 263, '岳池', 1, 0),
(1989, 263, '武胜', 1, 0),
(1990, 263, '邻水', 1, 0),
(1991, 264, '通川', 1, 0),
(1992, 264, '万源', 1, 0),
(1993, 264, '达县', 1, 0),
(1994, 264, '宣汉', 1, 0),
(1995, 264, '开江', 1, 0),
(1996, 264, '大竹', 1, 0),
(1997, 264, '渠县', 1, 0),
(1998, 265, '东坡', 1, 0),
(1999, 265, '仁寿', 1, 0),
(2000, 265, '彭山', 1, 0),
(2001, 265, '洪雅', 1, 0),
(2002, 265, '丹棱', 1, 0),
(2003, 265, '青神', 1, 0),
(2004, 266, '雨城', 1, 0),
(2005, 266, '名山', 1, 0),
(2006, 266, '荥经', 1, 0),
(2007, 266, '汉源', 1, 0),
(2008, 266, '石棉', 1, 0),
(2009, 266, '天全', 1, 0),
(2010, 266, '芦山', 1, 0),
(2011, 266, '宝兴', 1, 0),
(2012, 267, '巴州', 1, 0),
(2013, 267, '通江', 1, 0),
(2014, 267, '南江', 1, 0),
(2015, 267, '平昌', 1, 0),
(2016, 268, '雁江', 1, 0),
(2017, 268, '简阳', 1, 0),
(2018, 268, '乐至', 1, 0),
(2019, 268, '安岳', 1, 0),
(2020, 269, '马尔康', 1, 0),
(2021, 269, '汶川', 1, 0),
(2022, 269, '理县', 1, 0),
(2023, 269, '茂县', 1, 0),
(2024, 269, '松潘', 1, 0),
(2025, 269, '九寨沟', 1, 0),
(2026, 269, '金川', 1, 0),
(2027, 269, '小金', 1, 0),
(2028, 269, '黑水', 1, 0),
(2029, 269, '壤塘', 1, 0),
(2030, 269, '阿坝', 1, 0),
(2031, 269, '若尔盖', 1, 0),
(2032, 269, '红原', 1, 0),
(2033, 270, '康定', 1, 0),
(2034, 270, '泸定', 1, 0),
(2035, 270, '丹巴', 1, 0),
(2036, 270, '九龙', 1, 0),
(2037, 270, '雅江', 1, 0),
(2038, 270, '道孚', 1, 0),
(2039, 270, '炉霍', 1, 0),
(2040, 270, '甘孜', 1, 0),
(2041, 270, '新龙', 1, 0),
(2042, 270, '德格', 1, 0),
(2043, 270, '白玉', 1, 0),
(2044, 270, '石渠', 1, 0),
(2045, 270, '色达', 1, 0),
(2046, 270, '理塘', 1, 0),
(2047, 270, '巴塘', 1, 0),
(2048, 270, '乡城', 1, 0),
(2049, 270, '稻城', 1, 0),
(2050, 270, '得荣', 1, 0),
(2051, 271, '西昌', 1, 0),
(2052, 271, '盐源', 1, 0),
(2053, 271, '德昌', 1, 0),
(2054, 271, '会理', 1, 0),
(2055, 271, '会东', 1, 0),
(2056, 271, '宁南', 1, 0),
(2057, 271, '普格', 1, 0),
(2058, 271, '布拖', 1, 0),
(2059, 271, '金阳', 1, 0),
(2060, 271, '昭觉', 1, 0),
(2061, 271, '喜德', 1, 0),
(2062, 271, '冕宁', 1, 0),
(2063, 271, '越西', 1, 0),
(2064, 271, '甘洛', 1, 0),
(2065, 271, '美姑', 1, 0),
(2066, 271, '雷波', 1, 0),
(2067, 271, '木里', 1, 0),
(2068, 272, '南明', 1, 0),
(2069, 272, '云岩', 1, 0),
(2070, 272, '花溪', 1, 0),
(2071, 272, '乌当', 1, 0),
(2072, 272, '白云', 1, 0),
(2073, 272, '小河', 1, 0),
(2074, 272, '清镇', 1, 0),
(2075, 272, '开阳', 1, 0),
(2076, 272, '修文', 1, 0),
(2077, 272, '息烽', 1, 0),
(2078, 273, '钟山', 1, 0),
(2079, 273, '盘县', 1, 0),
(2080, 273, '六枝特', 1, 0),
(2081, 273, '水城', 1, 0),
(2082, 274, '红花岗', 1, 0),
(2083, 274, '赤水', 1, 0),
(2084, 274, '仁怀', 1, 0),
(2085, 274, '遵义', 1, 0),
(2086, 274, '桐梓', 1, 0),
(2087, 274, '绥阳', 1, 0),
(2088, 274, '正安', 1, 0),
(2089, 274, '凤冈', 1, 0),
(2090, 274, '湄潭', 1, 0),
(2091, 274, '余庆', 1, 0),
(2092, 274, '习水', 1, 0),
(2093, 274, '道真', 1, 0),
(2094, 274, '务川', 1, 0),
(2095, 275, '西秀', 1, 0),
(2096, 275, '平坝', 1, 0),
(2097, 275, '普定', 1, 0),
(2098, 275, '关岭', 1, 0),
(2099, 275, '镇宁', 1, 0),
(2100, 275, '紫云', 1, 0),
(2101, 276, '铜仁', 1, 0),
(2102, 276, '江口', 1, 0),
(2103, 276, '石阡', 1, 0),
(2104, 276, '思南', 1, 0),
(2105, 276, '德江', 1, 0),
(2106, 276, '玉屏', 1, 0),
(2107, 276, '印江', 1, 0),
(2108, 276, '沿河', 1, 0),
(2109, 276, '松桃', 1, 0),
(2110, 276, '万山特', 1, 0),
(2111, 277, '毕节', 1, 0),
(2112, 277, '大方', 1, 0),
(2113, 277, '黔西', 1, 0),
(2114, 277, '金沙', 1, 0),
(2115, 277, '织金', 1, 0),
(2116, 277, '纳雍', 1, 0),
(2117, 277, '赫章', 1, 0),
(2118, 277, '威宁', 1, 0),
(2119, 278, '兴义', 1, 0),
(2120, 278, '兴仁', 1, 0),
(2121, 278, '普安', 1, 0),
(2122, 278, '晴隆', 1, 0),
(2123, 278, '贞丰', 1, 0),
(2124, 278, '望谟', 1, 0),
(2125, 278, '册亨', 1, 0),
(2126, 278, '安龙', 1, 0),
(2127, 279, '凯里', 1, 0),
(2128, 279, '黄平', 1, 0),
(2129, 279, '施秉', 1, 0),
(2130, 279, '三穗', 1, 0),
(2131, 279, '镇远', 1, 0),
(2132, 279, '岑巩', 1, 0),
(2133, 279, '天柱', 1, 0),
(2134, 279, '锦屏', 1, 0),
(2135, 279, '剑河', 1, 0),
(2136, 279, '台江', 1, 0),
(2137, 279, '黎平', 1, 0),
(2138, 279, '榕江', 1, 0),
(2139, 279, '从江', 1, 0),
(2140, 279, '雷山', 1, 0),
(2141, 279, '麻江', 1, 0),
(2142, 279, '丹寨', 1, 0),
(2143, 280, '都匀', 1, 0),
(2144, 280, '福泉', 1, 0),
(2145, 280, '荔波', 1, 0),
(2146, 280, '贵定', 1, 0),
(2147, 280, '瓮安', 1, 0),
(2148, 280, '独山', 1, 0),
(2149, 280, '平塘', 1, 0),
(2150, 280, '罗甸', 1, 0),
(2151, 280, '长顺', 1, 0),
(2152, 280, '龙里', 1, 0),
(2153, 280, '惠水', 1, 0),
(2154, 280, '三都', 1, 0),
(2155, 281, '盘龙', 1, 0),
(2156, 281, '五华', 1, 0),
(2157, 281, '官渡', 1, 0),
(2158, 281, '西山', 1, 0),
(2159, 281, '东川', 1, 0),
(2160, 281, '安宁', 1, 0),
(2161, 281, '呈贡', 1, 0),
(2162, 281, '晋宁', 1, 0),
(2163, 281, '富民', 1, 0),
(2164, 281, '宜良', 1, 0),
(2165, 281, '嵩明', 1, 0),
(2166, 281, '石林', 1, 0),
(2167, 281, '禄劝', 1, 0),
(2168, 281, '寻甸', 1, 0),
(2169, 282, '麒麟', 1, 0),
(2170, 282, '宣威', 1, 0),
(2171, 282, '马龙', 1, 0),
(2172, 282, '沾益', 1, 0),
(2173, 282, '罗平', 1, 0),
(2174, 282, '师宗', 1, 0),
(2175, 282, '陆良', 1, 0),
(2176, 282, '会泽', 1, 0),
(2177, 283, '红塔', 1, 0),
(2178, 283, '江川', 1, 0),
(2179, 283, '澄江', 1, 0),
(2180, 283, '通海', 1, 0),
(2181, 283, '华宁', 1, 0),
(2182, 283, '易门', 1, 0),
(2183, 283, '峨山', 1, 0),
(2184, 283, '新平', 1, 0),
(2185, 283, '元江', 1, 0),
(2186, 284, '隆阳', 1, 0),
(2187, 284, '施甸', 1, 0),
(2188, 284, '腾冲', 1, 0),
(2189, 284, '龙陵', 1, 0),
(2190, 284, '昌宁', 1, 0),
(2191, 285, '昭阳', 1, 0),
(2192, 285, '鲁甸', 1, 0),
(2193, 285, '巧家', 1, 0),
(2194, 285, '盐津', 1, 0),
(2195, 285, '大关', 1, 0),
(2196, 285, '永善', 1, 0),
(2197, 285, '绥江', 1, 0),
(2198, 285, '镇雄', 1, 0),
(2199, 285, '彝良', 1, 0),
(2200, 285, '威信', 1, 0),
(2201, 285, '水富', 1, 0),
(2202, 286, '思茅', 1, 0),
(2203, 286, '普洱', 1, 0),
(2204, 286, '墨江', 1, 0),
(2205, 286, '景东', 1, 0),
(2206, 286, '景谷', 1, 0),
(2207, 286, '镇沅', 1, 0),
(2208, 286, '江城', 1, 0),
(2209, 286, '孟连', 1, 0),
(2210, 286, '澜沧', 1, 0),
(2211, 286, '西盟', 1, 0),
(2212, 287, '临沧', 1, 0),
(2213, 287, '凤庆', 1, 0),
(2214, 287, '云县', 1, 0),
(2215, 287, '永德', 1, 0),
(2216, 287, '镇康', 1, 0),
(2217, 287, '双江', 1, 0),
(2218, 287, '耿马', 1, 0),
(2219, 287, '沧源', 1, 0),
(2220, 288, '丽江', 1, 0),
(2221, 288, '永胜', 1, 0),
(2222, 288, '华坪', 1, 0),
(2223, 288, '宁蒗', 1, 0),
(2224, 289, '文山', 1, 0),
(2225, 289, '砚山', 1, 0),
(2226, 289, '西畴', 1, 0),
(2227, 289, '麻栗坡', 1, 0),
(2228, 289, '马关', 1, 0),
(2229, 289, '丘北', 1, 0),
(2230, 289, '广南', 1, 0),
(2231, 289, '富宁', 1, 0),
(2232, 290, '个旧', 1, 0),
(2233, 290, '开远', 1, 0),
(2234, 290, '蒙自', 1, 0),
(2235, 290, '绿春', 1, 0),
(2236, 290, '建水', 1, 0),
(2237, 290, '石屏', 1, 0),
(2238, 290, '弥勒', 1, 0),
(2239, 290, '泸西', 1, 0),
(2240, 290, '元阳', 1, 0),
(2241, 290, '红河', 1, 0),
(2242, 290, '金平', 1, 0),
(2243, 290, '河口', 1, 0),
(2244, 290, '屏边', 1, 0),
(2245, 291, '景洪', 1, 0),
(2246, 291, '勐海', 1, 0),
(2247, 291, '勐腊', 1, 0),
(2248, 292, '楚雄', 1, 0),
(2249, 292, '双柏', 1, 0),
(2250, 292, '牟定', 1, 0),
(2251, 292, '南华', 1, 0),
(2252, 292, '姚安', 1, 0),
(2253, 292, '大姚', 1, 0),
(2254, 292, '永仁', 1, 0),
(2255, 292, '元谋', 1, 0),
(2256, 292, '武定', 1, 0),
(2257, 292, '禄丰', 1, 0),
(2258, 293, '大理', 1, 0),
(2259, 293, '祥云', 1, 0),
(2260, 293, '宾川', 1, 0),
(2261, 293, '弥渡', 1, 0),
(2262, 293, '永平', 1, 0),
(2263, 293, '云龙', 1, 0),
(2264, 293, '洱源', 1, 0),
(2265, 293, '剑川', 1, 0),
(2266, 293, '鹤庆', 1, 0),
(2267, 293, '漾濞', 1, 0),
(2268, 293, '南涧', 1, 0),
(2269, 293, '巍山', 1, 0),
(2270, 294, '潞西', 1, 0),
(2271, 294, '瑞丽', 1, 0),
(2272, 294, '梁河', 1, 0),
(2273, 294, '盈江', 1, 0),
(2274, 294, '陇川', 1, 0),
(2275, 295, '泸水', 1, 0),
(2276, 295, '福贡', 1, 0),
(2277, 295, '贡山', 1, 0),
(2278, 295, '兰坪', 1, 0),
(2279, 296, '香格里拉', 1, 0),
(2280, 296, '德钦', 1, 0),
(2281, 296, '维西', 1, 0),
(2282, 297, '城关', 1, 0),
(2283, 297, '林周', 1, 0),
(2284, 297, '当雄', 1, 0),
(2285, 297, '尼木', 1, 0),
(2286, 297, '曲水', 1, 0),
(2287, 297, '堆龙德庆', 1, 0),
(2288, 297, '达孜', 1, 0),
(2289, 297, '墨竹工卡', 1, 0),
(2290, 298, '那曲', 1, 0),
(2291, 298, '嘉黎', 1, 0),
(2292, 298, '比如', 1, 0),
(2293, 298, '聂荣', 1, 0),
(2294, 298, '安多', 1, 0),
(2295, 298, '申扎', 1, 0),
(2296, 298, '索县', 1, 0),
(2297, 298, '班戈', 1, 0),
(2298, 298, '巴青', 1, 0),
(2299, 298, '尼玛', 1, 0),
(2300, 299, '昌都', 1, 0),
(2301, 299, '江达', 1, 0),
(2302, 299, '贡觉', 1, 0),
(2303, 299, '类乌齐', 1, 0),
(2304, 299, '丁青', 1, 0),
(2305, 299, '察雅', 1, 0),
(2306, 299, '八宿', 1, 0),
(2307, 299, '左贡', 1, 0),
(2308, 299, '芒康', 1, 0),
(2309, 299, '洛隆', 1, 0),
(2310, 299, '边坝', 1, 0),
(2311, 300, '乃东', 1, 0),
(2312, 300, '扎囊', 1, 0),
(2313, 300, '贡嘎', 1, 0),
(2314, 300, '桑日', 1, 0),
(2315, 300, '琼结', 1, 0),
(2316, 300, '曲松', 1, 0),
(2317, 300, '措美', 1, 0),
(2318, 300, '洛扎', 1, 0),
(2319, 300, '加查', 1, 0),
(2320, 300, '隆子', 1, 0),
(2321, 300, '错那', 1, 0),
(2322, 300, '浪卡子', 1, 0),
(2323, 301, '日喀则', 1, 0),
(2324, 301, '南木林', 1, 0),
(2325, 301, '江孜', 1, 0),
(2326, 301, '定日', 1, 0),
(2327, 301, '萨迦', 1, 0),
(2328, 301, '拉孜', 1, 0),
(2329, 301, '昂仁', 1, 0),
(2330, 301, '谢通门', 1, 0),
(2331, 301, '白朗', 1, 0),
(2332, 301, '仁布', 1, 0),
(2333, 301, '康马', 1, 0),
(2334, 301, '定结', 1, 0),
(2335, 301, '仲巴', 1, 0),
(2336, 301, '亚东', 1, 0),
(2337, 301, '吉隆', 1, 0),
(2338, 301, '聂拉木', 1, 0),
(2339, 301, '萨嘎', 1, 0),
(2340, 301, '岗巴', 1, 0),
(2341, 302, '噶尔', 1, 0),
(2342, 302, '普兰', 1, 0),
(2343, 302, '札达', 1, 0),
(2344, 302, '日土', 1, 0),
(2345, 302, '革吉', 1, 0),
(2346, 302, '改则', 1, 0),
(2347, 302, '措勤', 1, 0),
(2348, 303, '林芝', 1, 0),
(2349, 303, '工布江达', 1, 0),
(2350, 303, '米林', 1, 0),
(2351, 303, '墨脱', 1, 0),
(2352, 303, '波密', 1, 0),
(2353, 303, '察隅', 1, 0),
(2354, 303, '朗县', 1, 0),
(2355, 304, '莲湖', 1, 0),
(2356, 304, '新城', 1, 0),
(2357, 304, '碑林', 1, 0),
(2358, 304, '灞桥', 1, 0),
(2359, 304, '未央', 1, 0),
(2360, 304, '雁塔', 1, 0),
(2361, 304, '阎良', 1, 0),
(2362, 304, '临潼', 1, 0),
(2363, 304, '长安', 1, 0),
(2364, 304, '蓝田', 1, 0),
(2365, 304, '周至', 1, 0),
(2366, 304, '户县', 1, 0),
(2367, 304, '高陵', 1, 0),
(2368, 305, '王益', 1, 0),
(2369, 305, '印台', 1, 0),
(2370, 305, '耀州', 1, 0),
(2371, 305, '宜君', 1, 0),
(2372, 306, '渭滨', 1, 0),
(2373, 306, '金台', 1, 0),
(2374, 306, '宝鸡', 1, 0),
(2375, 306, '凤翔', 1, 0),
(2376, 306, '岐山', 1, 0),
(2377, 306, '扶风', 1, 0),
(2378, 306, '眉县', 1, 0),
(2379, 306, '陇县', 1, 0),
(2380, 306, '千阳', 1, 0),
(2381, 306, '麟游', 1, 0),
(2382, 306, '凤县', 1, 0),
(2383, 306, '太白', 1, 0),
(2384, 307, '秦都', 1, 0),
(2385, 307, '杨凌', 1, 0),
(2386, 307, '渭城', 1, 0),
(2387, 307, '兴平', 1, 0),
(2388, 307, '三原', 1, 0),
(2389, 307, '泾阳', 1, 0),
(2390, 307, '乾县', 1, 0),
(2391, 307, '礼泉', 1, 0),
(2392, 307, '永寿', 1, 0),
(2393, 307, '彬县', 1, 0),
(2394, 307, '长武', 1, 0),
(2395, 307, '旬邑', 1, 0),
(2396, 307, '淳化', 1, 0),
(2397, 307, '武功', 1, 0),
(2398, 308, '临渭', 1, 0),
(2399, 308, '华阴', 1, 0),
(2400, 308, '韩城', 1, 0),
(2401, 308, '华县', 1, 0),
(2402, 308, '潼关', 1, 0),
(2403, 308, '大荔', 1, 0),
(2404, 308, '蒲城', 1, 0),
(2405, 308, '澄城', 1, 0),
(2406, 308, '白水', 1, 0),
(2407, 308, '合阳', 1, 0),
(2408, 308, '富平', 1, 0),
(2409, 309, '宝塔', 1, 0),
(2410, 309, '延长', 1, 0),
(2411, 309, '延川', 1, 0),
(2412, 309, '子长', 1, 0),
(2413, 309, '安塞', 1, 0),
(2414, 309, '志丹', 1, 0),
(2415, 309, '吴旗', 1, 0),
(2416, 309, '甘泉', 1, 0),
(2417, 309, '富县', 1, 0),
(2418, 309, '洛川', 1, 0),
(2419, 309, '宜川', 1, 0),
(2420, 309, '黄龙', 1, 0),
(2421, 309, '黄陵', 1, 0),
(2422, 310, '汉台', 1, 0),
(2423, 310, '南郑', 1, 0),
(2424, 310, '城固', 1, 0),
(2425, 310, '洋县', 1, 0),
(2426, 310, '西乡', 1, 0),
(2427, 310, '勉县', 1, 0),
(2428, 310, '宁强', 1, 0),
(2429, 310, '略阳', 1, 0),
(2430, 310, '镇巴', 1, 0),
(2431, 310, '留坝', 1, 0),
(2432, 310, '佛坪', 1, 0),
(2433, 311, '榆阳', 1, 0),
(2434, 311, '神木', 1, 0),
(2435, 311, '府谷', 1, 0),
(2436, 311, '横山', 1, 0),
(2437, 311, '靖边', 1, 0),
(2438, 311, '定边', 1, 0),
(2439, 311, '绥德', 1, 0),
(2440, 311, '米脂', 1, 0),
(2441, 311, '佳县', 1, 0),
(2442, 311, '吴堡', 1, 0),
(2443, 311, '清涧', 1, 0),
(2444, 311, '子洲', 1, 0),
(2445, 312, '汉滨', 1, 0),
(2446, 312, '汉阴', 1, 0),
(2447, 312, '石泉', 1, 0),
(2448, 312, '宁陕', 1, 0),
(2449, 312, '紫阳', 1, 0),
(2450, 312, '岚皋', 1, 0),
(2451, 312, '平利', 1, 0),
(2452, 312, '镇坪', 1, 0),
(2453, 312, '旬阳', 1, 0),
(2454, 312, '白河', 1, 0),
(2455, 313, '商州', 1, 0),
(2456, 313, '洛南', 1, 0),
(2457, 313, '丹凤', 1, 0),
(2458, 313, '商南', 1, 0),
(2459, 313, '山阳', 1, 0),
(2460, 313, '镇安', 1, 0),
(2461, 313, '柞水', 1, 0),
(2462, 314, '城关', 1, 0),
(2463, 314, '七里河', 1, 0),
(2464, 314, '西固', 1, 0),
(2465, 314, '安宁', 1, 0),
(2466, 314, '红古', 1, 0),
(2467, 314, '永登', 1, 0),
(2468, 314, '皋兰', 1, 0),
(2469, 314, '榆中', 1, 0),
(2470, 315, '金川', 1, 0),
(2471, 315, '永昌', 1, 0),
(2472, 316, '白银', 1, 0),
(2473, 316, '平川', 1, 0),
(2474, 316, '靖远', 1, 0),
(2475, 316, '会宁', 1, 0),
(2476, 316, '景泰', 1, 0),
(2477, 317, '秦城', 1, 0),
(2478, 317, '北道', 1, 0),
(2479, 317, '清水', 1, 0),
(2480, 317, '秦安', 1, 0),
(2481, 317, '甘谷', 1, 0),
(2482, 317, '武山', 1, 0),
(2483, 317, '张家川', 1, 0),
(2484, 319, '凉州', 1, 0),
(2485, 319, '民勤', 1, 0),
(2486, 319, '古浪', 1, 0),
(2487, 319, '天祝', 1, 0),
(2488, 320, '甘州', 1, 0),
(2489, 320, '民乐', 1, 0),
(2490, 320, '临泽', 1, 0),
(2491, 320, '高台', 1, 0),
(2492, 320, '山丹', 1, 0),
(2493, 320, '肃南', 1, 0),
(2494, 321, '崆峒', 1, 0),
(2495, 321, '泾川', 1, 0),
(2496, 321, '灵台', 1, 0),
(2497, 321, '崇信', 1, 0),
(2498, 321, '华亭', 1, 0),
(2499, 321, '庄浪', 1, 0),
(2500, 321, '静宁', 1, 0),
(2501, 322, '肃州', 1, 0),
(2502, 322, '玉门', 1, 0),
(2503, 322, '敦煌', 1, 0),
(2504, 322, '金塔', 1, 0),
(2505, 322, '安西', 1, 0),
(2506, 322, '肃北', 1, 0),
(2507, 322, '阿克塞', 1, 0),
(2508, 323, '西峰', 1, 0),
(2509, 323, '庆城', 1, 0),
(2510, 323, '环县', 1, 0),
(2511, 323, '华池', 1, 0),
(2512, 323, '合水', 1, 0),
(2513, 323, '正宁', 1, 0),
(2514, 323, '宁县', 1, 0),
(2515, 323, '镇原', 1, 0),
(2516, 324, '定西', 1, 0),
(2517, 324, '通渭', 1, 0),
(2518, 324, '临洮', 1, 0),
(2519, 324, '漳县', 1, 0),
(2520, 324, '岷县', 1, 0),
(2521, 324, '渭源', 1, 0),
(2522, 324, '陇西', 1, 0),
(2523, 325, '成县', 1, 0),
(2524, 325, '武都', 1, 0),
(2525, 325, '宕昌', 1, 0),
(2526, 325, '康县', 1, 0),
(2527, 325, '文县', 1, 0),
(2528, 325, '西和', 1, 0),
(2529, 325, '礼县', 1, 0),
(2530, 325, '两当', 1, 0),
(2531, 325, '徽县', 1, 0),
(2532, 326, '合作', 1, 0),
(2533, 326, '临潭', 1, 0),
(2534, 326, '卓尼', 1, 0),
(2535, 326, '舟曲', 1, 0),
(2536, 326, '迭部', 1, 0),
(2537, 326, '玛曲', 1, 0),
(2538, 326, '碌曲', 1, 0),
(2539, 326, '夏河', 1, 0),
(2540, 327, '临夏', 1, 0),
(2541, 327, '临夏', 1, 0),
(2542, 327, '康乐', 1, 0),
(2543, 327, '永靖', 1, 0),
(2544, 327, '广河', 1, 0),
(2545, 327, '和政', 1, 0),
(2546, 327, '东乡族自治县', 1, 0),
(2547, 327, '积石山', 1, 0),
(2548, 328, '城中', 1, 0),
(2549, 328, '城东', 1, 0),
(2550, 328, '城西', 1, 0),
(2551, 328, '城北', 1, 0),
(2552, 328, '大通', 1, 0),
(2553, 328, '湟源', 1, 0),
(2554, 328, '湟中', 1, 0),
(2555, 329, '平安', 1, 0),
(2556, 329, '乐都', 1, 0),
(2557, 329, '民和', 1, 0),
(2558, 329, '互助', 1, 0),
(2559, 329, '化隆', 1, 0),
(2560, 329, '循化', 1, 0),
(2561, 330, '海晏', 1, 0),
(2562, 330, '祁连', 1, 0),
(2563, 330, '刚察', 1, 0),
(2564, 330, '门源', 1, 0),
(2565, 331, '同仁', 1, 0),
(2566, 331, '尖扎', 1, 0),
(2567, 331, '泽库', 1, 0),
(2568, 331, '河南', 1, 0),
(2569, 332, '共和', 1, 0),
(2570, 332, '同德', 1, 0),
(2571, 332, '贵德', 1, 0),
(2572, 332, '兴海', 1, 0),
(2573, 332, '贵南', 1, 0),
(2574, 333, '玛沁', 1, 0),
(2575, 333, '班玛', 1, 0),
(2576, 333, '甘德', 1, 0),
(2577, 333, '达日', 1, 0),
(2578, 333, '久治', 1, 0),
(2579, 333, '玛多', 1, 0),
(2580, 334, '玉树', 1, 0),
(2581, 334, '杂多', 1, 0),
(2582, 334, '称多', 1, 0),
(2583, 334, '治多', 1, 0),
(2584, 334, '囊谦', 1, 0),
(2585, 334, '曲麻莱', 1, 0),
(2586, 335, '德令哈', 1, 0),
(2587, 335, '格尔木', 1, 0),
(2588, 335, '乌兰', 1, 0),
(2589, 335, '都兰', 1, 0),
(2590, 335, '天峻', 1, 0),
(2591, 336, '西夏', 1, 0),
(2592, 336, '贺兰', 1, 0),
(2593, 336, '新城', 1, 0),
(2594, 336, '郊区', 1, 0),
(2595, 337, '大武口', 1, 0),
(2596, 337, '石嘴山', 1, 0),
(2597, 337, '平罗', 1, 0),
(2598, 337, '陶乐', 1, 0),
(2599, 337, '惠农', 1, 0),
(2600, 338, '利通', 1, 0),
(2601, 338, '青铜峡', 1, 0),
(2602, 338, '中卫', 1, 0),
(2603, 338, '中宁', 1, 0),
(2604, 338, '盐池', 1, 0),
(2605, 338, '同心', 1, 0),
(2606, 339, '原州', 1, 0),
(2607, 339, '海原', 1, 0),
(2608, 339, '西吉', 1, 0),
(2609, 339, '隆德', 1, 0),
(2610, 339, '泾源', 1, 0),
(2611, 339, '彭阳', 1, 0),
(2612, 340, '天山', 1, 0),
(2613, 340, '沙依巴克', 1, 0),
(2614, 340, '新市', 1, 0),
(2615, 340, '水磨沟', 1, 0),
(2616, 340, '头屯河', 1, 0),
(2617, 340, '达坂城', 1, 0),
(2618, 340, '乌鲁木齐', 1, 0),
(2619, 341, '克拉玛依', 1, 0),
(2620, 341, '独山子', 1, 0),
(2621, 341, '白碱滩', 1, 0),
(2622, 341, '乌尔禾', 1, 0),
(2623, 343, '吐鲁番', 1, 0),
(2624, 343, '鄯善', 1, 0),
(2625, 343, '托克逊', 1, 0),
(2626, 344, '哈密', 1, 0),
(2627, 344, '伊吾', 1, 0),
(2628, 344, '巴里坤', 1, 0),
(2629, 345, '和田', 1, 0),
(2630, 345, '和田', 1, 0),
(2631, 345, '墨玉', 1, 0),
(2632, 345, '皮山', 1, 0),
(2633, 345, '洛浦', 1, 0),
(2634, 345, '策勒', 1, 0),
(2635, 345, '于田', 1, 0),
(2636, 345, '民丰', 1, 0),
(2637, 346, '阿克苏', 1, 0),
(2638, 346, '温宿', 1, 0),
(2639, 346, '库车', 1, 0),
(2640, 346, '沙雅', 1, 0),
(2641, 346, '新和', 1, 0),
(2642, 346, '拜城', 1, 0),
(2643, 346, '乌什', 1, 0),
(2644, 346, '阿瓦提', 1, 0),
(2645, 346, '柯坪', 1, 0),
(2646, 347, '喀什', 1, 0),
(2647, 347, '疏附', 1, 0),
(2648, 347, '疏勒', 1, 0),
(2649, 347, '英吉沙', 1, 0),
(2650, 347, '泽普', 1, 0),
(2651, 347, '莎车', 1, 0),
(2652, 347, '叶城', 1, 0),
(2653, 347, '麦盖提', 1, 0),
(2654, 347, '岳普湖', 1, 0),
(2655, 347, '伽师', 1, 0),
(2656, 347, '巴楚', 1, 0),
(2657, 347, '塔什库尔干塔吉克', 1, 0),
(2658, 348, '阿克陶', 1, 0),
(2659, 348, '阿合奇', 1, 0),
(2660, 348, '乌恰', 1, 0),
(2661, 349, '库尔勒', 1, 0),
(2662, 349, '轮台', 1, 0),
(2663, 349, '尉犁', 1, 0),
(2664, 349, '若羌', 1, 0),
(2665, 349, '且末', 1, 0),
(2666, 349, '和静', 1, 0),
(2667, 349, '和硕', 1, 0),
(2668, 349, '博湖', 1, 0),
(2669, 349, '焉耆', 1, 0),
(2670, 350, '昌吉', 1, 0),
(2671, 350, '阜康', 1, 0),
(2672, 350, '米泉', 1, 0),
(2673, 350, '呼图壁', 1, 0),
(2674, 350, '玛纳斯', 1, 0),
(2675, 350, '奇台', 1, 0),
(2676, 350, '吉木萨尔', 1, 0),
(2677, 350, '木垒', 1, 0),
(2678, 351, '博乐', 1, 0),
(2679, 351, '精河', 1, 0),
(2680, 351, '温泉', 1, 0),
(2681, 352, '奎屯', 1, 0),
(2682, 352, '伊宁', 1, 0),
(2683, 352, '霍城', 1, 0),
(2684, 352, '巩留', 1, 0),
(2685, 352, '新源', 1, 0),
(2686, 352, '昭苏', 1, 0),
(2687, 352, '特克斯', 1, 0),
(2688, 352, '尼勒克', 1, 0),
(2689, 352, '察布查尔锡伯', 1, 0),
(2690, 353, '塔城', 1, 0),
(2691, 353, '乌苏', 1, 0),
(2692, 353, '额敏', 1, 0),
(2693, 353, '沙湾', 1, 0),
(2694, 353, '托里', 1, 0),
(2695, 353, '裕民', 1, 0),
(2696, 353, '和布克赛尔', 1, 0),
(2697, 354, '阿勒泰', 1, 0),
(2698, 354, '布尔津', 1, 0),
(2699, 354, '富蕴', 1, 0),
(2700, 354, '福海', 1, 0),
(2701, 354, '哈巴河', 1, 0),
(2702, 354, '青河', 1, 0),
(2703, 354, '吉木乃', 1, 0),
(2704, 355, '黄浦', 1, 0),
(2705, 355, '卢湾', 1, 0),
(2706, 355, '徐汇', 1, 0),
(2707, 355, '长宁', 1, 0),
(2708, 355, '静安', 1, 0),
(2709, 355, '普陀', 1, 0),
(2710, 355, '闸北', 1, 0),
(2711, 355, '虹口', 1, 0),
(2712, 355, '杨浦', 1, 0),
(2713, 355, '宝山', 1, 0),
(2714, 355, '闵行', 1, 0),
(2715, 355, '嘉定', 1, 0),
(2716, 355, '浦东新', 1, 0),
(2717, 355, '松江', 1, 0),
(2718, 355, '金山', 1, 0),
(2719, 355, '青浦', 1, 0),
(2720, 355, '南汇', 1, 0),
(2721, 355, '奉贤', 1, 0),
(2722, 356, '崇明', 1, 0),
(2723, 357, '渝中', 1, 0),
(2724, 357, '大渡口', 1, 0),
(2725, 357, '江北', 1, 0),
(2726, 357, '沙坪坝', 1, 0),
(2727, 357, '九龙坡', 1, 0),
(2728, 357, '南岸', 1, 0),
(2729, 357, '北碚', 1, 0),
(2730, 357, '万盛', 1, 0),
(2731, 357, '双桥', 1, 0),
(2732, 357, '渝北', 1, 0),
(2733, 357, '巴南', 1, 0),
(2734, 357, '万州', 1, 0),
(2735, 357, '涪陵', 1, 0),
(2736, 357, '黔江', 1, 0),
(2737, 357, '长寿', 1, 0),
(2738, 358, '永川', 1, 0),
(2739, 358, '合川', 1, 0),
(2740, 358, '江津', 1, 0),
(2741, 358, '南川', 1, 0),
(2742, 359, '綦江', 1, 0),
(2743, 359, '潼南', 1, 0),
(2744, 359, '荣昌', 1, 0),
(2745, 359, '璧山', 1, 0),
(2746, 359, '大足', 1, 0),
(2747, 359, '铜梁', 1, 0),
(2748, 359, '梁平', 1, 0),
(2749, 359, '城口', 1, 0),
(2750, 359, '垫江', 1, 0),
(2751, 359, '武隆', 1, 0),
(2752, 359, '丰都', 1, 0),
(2753, 359, '奉节', 1, 0),
(2754, 359, '开县', 1, 0),
(2755, 359, '云阳', 1, 0),
(2756, 359, '忠县', 1, 0),
(2757, 359, '巫溪', 1, 0),
(2758, 359, '巫山', 1, 0),
(2759, 359, '石柱', 1, 0),
(2760, 359, '秀山', 1, 0),
(2761, 359, '酉阳', 1, 0),
(2762, 359, '彭水', 1, 0),
(2763, 98, '扬中', 1, 0),
(2764, 53, '沈河', 1, 0),
(2765, 130, '鼓楼', 1, 0),
(2766, 251, '彭州', 1, 0),
(2767, 214, '福田', 1, 0),
(2768, 234, '青秀', 1, 0),
(2769, 4225, '东城', 1, 0),
(2770, 4225, '丰台', 1, 0),
(2771, 4225, '大兴', 1, 0),
(2772, 4225, '宣武', 1, 0),
(2773, 4225, '密云', 1, 0),
(2774, 4225, '崇文', 1, 0),
(2775, 4225, '平谷', 1, 0),
(2776, 4225, '延庆', 1, 0),
(2777, 4225, '怀柔', 1, 0),
(2778, 4225, '房山', 1, 0),
(2779, 4225, '昌平', 1, 0),
(2780, 4225, '朝阳', 1, 0),
(2781, 4225, '海淀', 1, 0),
(2782, 4225, '石景山', 1, 0),
(2783, 4225, '西城', 1, 0),
(2784, 4225, '通州', 1, 0),
(2785, 4225, '顺义', 1, 0),
(2786, 4225, '门头沟', 1, 0),
(2787, 158, '兖州区', 1, 0),
(2788, 158, '任城区', 1, 0),
(2789, 158, '高新区', 1, 0),
(2790, 158, '太白湖新区', 1, 0),
(2791, 158, '济宁经济技术开发区', 1, 0),
(2792, 158, '嘉祥县', 1, 0),
(2793, 158, '汶上县', 1, 0),
(2794, 158, '泗水县', 1, 0),
(2795, 158, '梁山县', 1, 0),
(2796, 158, '曲阜市', 1, 0),
(2797, 158, '微山县', 1, 0),
(2798, 158, '邹城市', 1, 0),
(2799, 158, '鱼台县', 1, 0),
(2800, 158, '金乡县', 1, 0),
(2801, 222, '莞城区', 1, 0),
(2802, 222, '东城区', 1, 0),
(2803, 222, '南城区', 1, 0),
(2804, 222, '万江区', 1, 0),
(2805, 223, '石岐区', 1, 0),
(2806, 223, '东区', 1, 0),
(2807, 223, '西区', 1, 0),
(2808, 223, '南区', 1, 0),
(2809, 223, '火炬区', 1, 0),
(2810, 223, '五桂山区', 1, 0),
(2811, 249, '吉阳区', 1, 0),
(2812, 249, '崖州区', 1, 0),
(2813, 249, '海棠区', 1, 0),
(2814, 249, '天涯区', 1, 0),
(2815, 318, '雄关区', 1, 0),
(2816, 318, '长城区', 1, 0),
(2817, 318, '镜铁区', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(34, '台湾', 'tw', 'TAI', '', 0, 1),
(32, '香港', 'xg', 'HKG', '', 0, 1),
(31, '新疆', 'xj', 'XIN', '', 0, 1),
(30, '宁夏', 'nx', 'NXA', '', 0, 1),
(29, '青海', 'qh', 'QIH', '', 0, 1),
(28, '甘肃', 'gs', 'GAN', '', 0, 1),
(27, '陕西', 'sx', 'SHA', '', 0, 1),
(26, '西藏', 'xc', 'TIB', '', 0, 1),
(25, '云南', 'yn', 'YUN', '', 0, 1),
(24, '贵州', 'gz', 'GUI', '', 0, 1),
(23, '四川', 'sc', 'SCH', '', 0, 1),
(22, '重庆', 'cq', 'CHQ', '', 0, 1),
(21, '海南', 'hn', 'HAI', '', 0, 1),
(20, '广西', 'gx', 'GXI', '', 0, 1),
(19, '广东', 'gd', 'GUD', '', 0, 1),
(18, '湖南', 'hn', 'HUN', '', 0, 1),
(17, '湖北', 'hb', 'HUB', '', 0, 1),
(16, '河南', 'hn', 'HEN', '', 0, 1),
(15, '山东', 'sd', 'SHD', '', 0, 1),
(14, '江西', 'jx', 'JXI', '', 0, 1),
(13, '福建', 'fj', 'FUJ', '', 0, 1),
(12, '安徽', 'ah', 'ANH', '', 0, 1),
(11, '浙江', 'zj', 'ZHJ', '', 0, 1),
(9, '上海', 'sh', 'SHH', '', 0, 1),
(8, '黑龙江', 'hl', 'HLJ', '', 0, 1),
(7, '吉林', 'jl', 'JIL', '', 0, 1),
(4, '山西', 'sx', 'SHX', '', 0, 1),
(5, '内蒙古', 'nm', 'NMG', '', 0, 1),
(6, '辽宁', 'ln', 'LIA', '', 0, 1),
(3, '河北', 'hb', 'HEB', '', 0, 1),
(2, '天津', 'tj', 'TAJ', '', 0, 1),
(1, '北京', 'bj', 'BEJ', '', 0, 1),
(10, '江苏', 'js', 'JSU', '', 0, 1),
(33, '澳门', 'am', 'MAC', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18'),
(7, '相机类满100减30优惠券', '111111', 'F', '30.0000', 1, 0, '100.0000', '2016-01-27', '2016-03-12', 177, '1', 1, '2016-01-27 09:36:13'),
(8, '手机类满200元享9折优惠', '222222', 'P', '10.0000', 1, 0, '200.0000', '2016-01-27', '2016-03-12', 133, '2', 1, '2016-01-27 09:37:48'),
(10, '全场满200减20元优惠券', '3fa3fsd23r', 'F', '20.0000', 1, 1, '200.0000', '2016-02-03', '2017-04-27', 0, '5', 1, '2016-02-04 14:55:32'),
(12, '全场满100 送 20的优惠券', 'oc100-20', 'F', '20.0000', 1, 0, '100.0000', '2016-02-12', '2016-03-12', 1, '1', 1, '2016-02-12 23:29:34');

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_coupon_category`
--

INSERT INTO `oc_coupon_category` (`coupon_id`, `category_id`) VALUES
(7, 33),
(8, 24);

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_customer`
--

DROP TABLE IF EXISTS `oc_coupon_customer`;
CREATE TABLE IF NOT EXISTS `oc_coupon_customer` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_customer_group`
--

DROP TABLE IF EXISTS `oc_coupon_customer_group`;
CREATE TABLE IF NOT EXISTS `oc_coupon_customer_group` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_coupon_customer_group`
--

INSERT INTO `oc_coupon_customer_group` (`coupon_id`, `customer_group_id`) VALUES
(7, 1),
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, '人民币', 'CNY', '￥', '', '2', 1.00000000, 1, '2015-12-10 22:19:57');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL,
  `qq_openid` varchar(50) DEFAULT NULL,
  `weibo_uid` varchar(50) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- 转存表中的数据 `oc_customer`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=546 ;

--
-- 转存表中的数据 `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(541, 125, 'register', '{"customer_id":125,"name":"opencart"}', '127.0.0.1', '2016-08-04 17:24:33'),
(542, 125, 'address_add', '{"customer_id":"125","name":"opencart"}', '127.0.0.1', '2016-08-04 17:24:59'),
(543, 125, 'address_add', '{"customer_id":"125","name":"opencart"}', '127.0.0.1', '2016-08-04 17:34:26'),
(544, 125, 'address_add', '{"customer_id":"125","name":"opencart"}', '127.0.0.1', '2016-08-04 17:35:16'),
(545, 125, 'address_add', '{"customer_id":"125","name":"opencart"}', '127.0.0.1', '2016-08-04 17:35:45');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=222 ;

--
-- 转存表中的数据 `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(221, 125, '127.0.0.1', '2016-08-04 17:24:34');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  `order_recharge_id` int(11) NOT NULL DEFAULT '0',
  `withdraw_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE IF NOT EXISTS `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_custom_field`
--

INSERT INTO `oc_custom_field` (`custom_field_id`, `type`, `value`, `location`, `status`, `sort_order`) VALUES
(1, 'text', '', 'address', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_custom_field_customer_group`
--

INSERT INTO `oc_custom_field_customer_group` (`custom_field_id`, `customer_group_id`, `required`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_custom_field_description`
--

INSERT INTO `oc_custom_field_description` (`custom_field_id`, `language_id`, `name`) VALUES
(1, 2, '手机号码');

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send'),
(2, 'qq_login', 'post.customer.logout', 'module/qq_login/logout'),
(3, 'qq_login', 'post.customer.logout', 'module/qq_login/logout'),
(4, 'weibo_login', 'post.customer.logout', 'module/weibo_login/logout'),
(5, 'kuaidi_chaxun', 'post.module.kuaidi_chaxun', 'module/kuaidi_chaxun/install'),
(6, 'kuaidi_chaxun', 'post.module.kuaidi_chaxun', 'module/kuaidi_chaxun/install');

-- --------------------------------------------------------

--
-- 表的结构 `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(22, 'captcha', 'basic_captcha'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'shipping', 'free'),
(21, 'payment', 'bank_transfer'),
(23, 'captcha', 'basic_captcha'),
(24, 'feed', 'google_sitemap'),
(25, 'feed', 'google_sitemap'),
(26, 'module', 'qq_login'),
(27, 'module', 'qq_login'),
(28, 'module', 'weibo_login'),
(29, 'captcha', 'google_captcha'),
(30, 'module', 'online'),
(31, 'module', 'online'),
(32, 'payment', 'alipay'),
(33, 'payment', 'alipay'),
(36, 'module', 'kuaidi_chaxun'),
(37, 'module', 'kuaidi_chaxun'),
(38, 'module', 'news'),
(39, 'module', 'news_archive'),
(40, 'module', 'ncategory'),
(41, 'module', 'flash_sale'),
(42, 'module', 'flash_sale'),
(43, 'module', 'pim'),
(44, 'module', 'latest'),
(45, 'module', 'special'),
(46, 'payment', 'weipay'),
(47, 'module', 'mobile_slideshow'),
(54, 'module', 'mobile_category'),
(49, 'module', 'mobile_latest'),
(50, 'module', 'mobile_featured'),
(51, 'module', 'mobile_banner'),
(52, 'module', 'mobile_hot_search'),
(53, 'module', 'sms'),
(55, 'payment', 'alipay_direct'),
(56, 'analytics', 'google_analytics');

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_flash_sale`
--

DROP TABLE IF EXISTS `oc_flash_sale`;
CREATE TABLE IF NOT EXISTS `oc_flash_sale` (
  `flash_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(4) DEFAULT '1',
  `display_quantity` int(4) DEFAULT '1',
  `flash_sale_price` decimal(15,4) DEFAULT '0.0000',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`flash_sale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_flash_sale_activity`
--

DROP TABLE IF EXISTS `oc_flash_sale_activity`;
CREATE TABLE IF NOT EXISTS `oc_flash_sale_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_flash_sale_description`
--

DROP TABLE IF EXISTS `oc_flash_sale_description`;
CREATE TABLE IF NOT EXISTS `oc_flash_sale_description` (
  `flash_sale_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `product_name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`flash_sale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, '华东地区', '华东地区', '2016-02-12 22:20:15', '2009-01-06 23:26:25'),
(4, '全 国', '国内各省', '2016-01-18 20:53:51', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 2, '关于我们', '&lt;p&gt;&lt;a href=&quot;http://www.opencart.cn/&quot; target=&quot;_blank&quot; style=&quot;word-wrap: break-word; outline: none; color: rgb(51, 51, 51); font-family: ''Microsoft yahei'', 微软雅黑, Arial, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; text-indent: 30px; background-color: rgb(242, 242, 242);&quot;&gt;【OpenCart中文网站】&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: ''Microsoft yahei'', 微软雅黑, Arial, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; text-indent: 30px; background-color: rgb(242, 242, 242);&quot;&gt;是opencart.com已认证的合作伙伴，在中国地区支持OpenCart软件的最大社区，我们的目的是支持OpenCart开源软件在中国地区的发展，并为OpenCart软件爱好者提供交流的网络平台，我们专注于OpenCart开发设计、定制等。&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n', '关于我们', '', ''),
(5, 2, '条款及条件', '&lt;p&gt;\r\n	条款及条件&lt;/p&gt;\r\n', '条款及条件', '', ''),
(3, 2, '隐私政策', '&lt;p&gt;\r\n	隐私政策&lt;/p&gt;\r\n', '隐私政策', '', ''),
(6, 2, '最新公告', '&lt;p&gt;\r\n	最新公告&lt;/p&gt;\r\n', '最新公告', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(5, 0, 0),
(3, 0, 0),
(6, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, '简体中文', 'zh_CN', 'zh_CN.UTF-8,zh_CN,zh-cn,china', 'cn.png', 'zh-CN', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, '登录'),
(15, '博客'),
(17, '手机搜索');

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=179 ;

--
-- 转存表中的数据 `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2),
(79, 6, 'account', 'column_right', 2),
(90, 15, 'news_archive', 'column_right', 3),
(89, 15, 'ncategory', 'column_right', 2),
(176, 1, 'mobile_latest.36', 'content_top', 13),
(175, 1, 'mobile_slideshow.34', 'content_top', 10),
(174, 1, 'special.33', 'content_top', 3),
(173, 1, 'latest.32', 'content_top', 2),
(172, 1, 'featured.28', 'content_top', 4),
(115, 17, 'mobile_hot_search', 'content_top', 1),
(171, 1, 'slideshow.27', 'content_top', 1),
(170, 1, 'mobile_featured.38', 'content_top', 12),
(177, 1, 'carousel.29', 'content_top', 5),
(178, 1, 'mobile_category', 'content_top', 11);

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- 转存表中的数据 `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(56, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(82, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(72, 14, 0, 'account/login'),
(63, 15, 0, 'news/ncategory'),
(71, 17, 0, 'mobile/search');

-- --------------------------------------------------------

--
-- 表的结构 `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- 表的结构 `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, '厘米', 'cm'),
(2, 2, '毫米', 'mm'),
(3, 2, '英寸', 'in');

-- --------------------------------------------------------

--
-- 表的结构 `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, '无需FTP配置使用OCMOD方式上传安装扩充功能', 'noftp_ocmod', 'opencart.cn', '1.1.1', 'http://www.opencart.cn', '<modification>\r\n    <name>无需FTP配置使用OCMOD方式上传安装扩充功能</name>\r\n	<version>1.1.1</version>\r\n	<link>http://www.opencart.cn</link>\r\n	<author>opencart.cn</author>\r\n	<code>noftp_ocmod</code>\r\n\r\n	<file path="admin/controller/extension/installer.php">\r\n		<operation>\r\n			<search ><![CDATA[''url''  => str_replace(''&amp;'', ''&'', $this->url->link(''extension/installer/ftp'', ''token='' . $this->session->data[''token''], ''SSL'')),]]></search>\r\n			<add position="replace"><![CDATA[''url''  => str_replace(''&amp;'', ''&'', $this->url->link(''extension/installer/localcopy'', ''token='' . $this->session->data[''token''], ''SSL'')),]]></add>\r\n		</operation>\r\n\r\n		<operation>\r\n			<search><![CDATA[public function unzip() {]]></search>\r\n			<add position="before"><![CDATA[			\r\n	public function localcopy() {\r\n		$this->load->language(''extension/installer'');\r\n\r\n		$json = array();\r\n\r\n		if (!$this->user->hasPermission(''modify'', ''extension/installer'')) {\r\n			$json[''error''] = $this->language->get(''error_permission'');\r\n		}\r\n\r\n        \r\n        $directory = DIR_UPLOAD  . str_replace(array(''../'', ''..\\\\'', ''..''), '''', $this->request->post[''path'']) . ''/upload/'';\r\n        \r\n\r\n		if (!is_dir($directory)) {\r\n			$json[''error''] = $this->language->get(''error_directory'');\r\n		}\r\n\r\n		if (!$json) {\r\n			// Get a list of files ready to upload\r\n			$files = array();\r\n\r\n			$path = array($directory . ''*'');\r\n\r\n			while (count($path) != 0) {\r\n				$next = array_shift($path);\r\n\r\n				foreach (glob($next) as $file) {\r\n					if (is_dir($file)) {\r\n						$path[] = $file . ''/*'';\r\n					}\r\n\r\n					$files[] = $file;\r\n				}\r\n			}\r\n\r\n			$root = dirname(DIR_APPLICATION).''/'';\r\n\r\n			foreach ($files as $file) {\r\n				// Upload everything in the upload directory\r\n				$destination = $root.substr($file, strlen($directory));\r\n\r\n				if (is_dir($file)) {\r\n					$list = glob(rtrim($destination, ''/'').''/*'');\r\n\r\n					if (!file_exists($destination)) {\r\n						if (!mkdir($destination)) {\r\n							$json[''error''] = sprintf($this->language->get(''error_ftp_directory''), $destination);\r\n						}\r\n					}\r\n				}\r\n\r\n				if (is_file($file)) {\r\n					if (!copy($file, $destination)) {\r\n						$json[''error''] = sprintf($this->language->get(''error_ftp_file''), $file);\r\n					}\r\n				}\r\n			}\r\n		}\r\n\r\n		$this->response->addHeader(''Content-Type: application/json'');\r\n		$this->response->setOutput(json_encode($json));\r\n	}]]></add>\r\n		</operation>\r\n	</file>	\r\n</modification>', 1, '2015-12-15 16:11:25'),
(4, 'News/Blog integration OCmod', 'Newsblog', 'www.opencart.cn', '1.1', 'http://www.opencart.cn', '<?xml version="1.0" encoding="UTF-8"?>\r\n<modification>\r\n	<name>News/Blog integration OCmod</name>\r\n	<version>1.1</version>\r\n	<link>http://www.opencart.cn</link>\r\n	<author>www.opencart.cn</author>\r\n	<code>Newsblog</code>\r\n	<file path="admin/controller/common/menu.php">\r\n		<operation>\r\n			<search><![CDATA[$data[''openbay_link_amazonus_links''] = $this->url->link(''openbay/amazonus/itemlinks'', ''token='' . $this->session->data[''token''], ''SSL'');]]></search>\r\n			<add position="after"><![CDATA[\r\n\r\n			$this->language->load(''common/newspanel'');\r\n\r\n			$data[''nmod''] = $this->url->link(''module/news'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n\r\n			$data[''ncmod''] = $this->url->link(''module/ncategory'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n\r\n			$data[''namod''] = $this->url->link(''module/news_archive'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n\r\n			$data[''npages''] = $this->url->link(''catalog/news'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n\r\n			$data[''ncategory''] = $this->url->link(''catalog/ncategory'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n\r\n			$data[''tocomments''] = $this->url->link(''catalog/ncomments'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n\r\n			$data[''nauthor''] = $this->url->link(''catalog/nauthor'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n\r\n			$data[''text_commod''] = $this->language->get(''text_commod'');\r\n\r\n			$data[''entry_npages''] = $this->language->get(''entry_npages'');\r\n\r\n			$data[''entry_nmod''] = $this->language->get(''entry_nmod'');\r\n\r\n			$data[''entry_ncmod''] = $this->language->get(''entry_ncmod'');\r\n\r\n			$data[''entry_namod''] = $this->language->get(''entry_namod'');\r\n\r\n			$data[''entry_ncategory''] = $this->language->get(''entry_ncategory'');\r\n\r\n			$data[''text_nauthor''] = $this->language->get(''text_nauthor'');\r\n\r\n		]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="admin/view/template/common/menu.tpl">\r\n		<operation>\r\n			<search><![CDATA[<li id="reports"><a class="parent"><i class="fa fa-bar-chart-o fa-fw"></i> <span><?php echo $text_reports; ?></span></a>]]></search>\r\n			<add position="before"><![CDATA[\r\n			<li id="blog"><a class="parent"><i class="fa fa-book fa-fw"></i> <span>News/Blog</span></a>\r\n				<ul>\r\n					<li><a href="<?php echo $npages; ?>"><?php echo $entry_npages; ?></a></li>\r\n					<li><a href="<?php echo $ncategory; ?>"><?php echo $entry_ncategory; ?></a></li>\r\n					<li><a href="<?php echo $tocomments; ?>"><?php echo $text_commod; ?></a></li>\r\n					<li><a href="<?php echo $nauthor; ?>"><?php echo $text_nauthor; ?></a></li>\r\n					<li><a href="<?php echo $nmod; ?>"><?php echo $entry_nmod; ?></a></li>\r\n					<li><a href="<?php echo $ncmod; ?>"><?php echo $entry_ncmod; ?></a></li>\r\n					<li><a href="<?php echo $namod; ?>"><?php echo $entry_namod; ?></a></li>\r\n				</ul>\r\n			</li>\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="admin/controller/common/dashboard.php">\r\n		<operation>\r\n			<search><![CDATA[$data[''footer''] = $this->load->controller(''common/footer'');]]></search>\r\n			<add position="after"><![CDATA[$data[''newspanel''] = $this->load->controller(''common/newspanel'');]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="admin/view/template/common/dashboard.tpl">\r\n		<operation>\r\n			<search><![CDATA[<?php if ($error_install) { ?>]]></search>\r\n			<add position="before"><![CDATA[  <?php echo $newspanel; ?>\r\n							<br />]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/column_left.php">\r\n		<operation>\r\n			<search><![CDATA[$this->load->model(''catalog/information'');]]></search>\r\n			<add position="after"><![CDATA[$this->load->model(''catalog/news'');\r\n			$this->load->model(''catalog/ncategory'');\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[if ($route == ''product/category'' && isset($this->request->get[''path''])) {]]></search>\r\n			<add position="before"><![CDATA[\r\n			if ($route == ''news/article'' && isset($this->request->get[''news_id''])) {\r\n				$layout_id = $this->model_catalog_news->getNewsLayoutId($this->request->get[''news_id'']);\r\n			}\r\n			if ($route == ''news/ncategory'' && isset($this->request->get[''ncat''])) {\r\n				$ncat = explode(''_'', (string)$this->request->get[''ncat'']);\r\n\r\n				$layout_id = $this->model_catalog_ncategory->getncategoryLayoutId(end($ncat));\r\n			}\r\n		]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/column_right.php">\r\n		<operation>\r\n			<search><![CDATA[$this->load->model(''catalog/information'');]]></search>\r\n			<add position="after"><![CDATA[$this->load->model(''catalog/news'');\r\n			$this->load->model(''catalog/ncategory'');\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[if ($route == ''product/category'' && isset($this->request->get[''path''])) {]]></search>\r\n			<add position="before"><![CDATA[\r\n			if ($route == ''news/article'' && isset($this->request->get[''news_id''])) {\r\n				$layout_id = $this->model_catalog_news->getNewsLayoutId($this->request->get[''news_id'']);\r\n			}\r\n			if ($route == ''news/ncategory'' && isset($this->request->get[''ncat''])) {\r\n				$ncat = explode(''_'', (string)$this->request->get[''ncat'']);\r\n\r\n				$layout_id = $this->model_catalog_ncategory->getncategoryLayoutId(end($ncat));\r\n			}\r\n		]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/content_top.php">\r\n		<operation>\r\n			<search><![CDATA[$this->load->model(''catalog/information'');]]></search>\r\n			<add position="after"><![CDATA[$this->load->model(''catalog/news'');\r\n			$this->load->model(''catalog/ncategory'');\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[if ($route == ''product/category'' && isset($this->request->get[''path''])) {]]></search>\r\n			<add position="before"><![CDATA[\r\n			if ($route == ''news/article'' && isset($this->request->get[''news_id''])) {\r\n				$layout_id = $this->model_catalog_news->getNewsLayoutId($this->request->get[''news_id'']);\r\n			}\r\n			if ($route == ''news/ncategory'' && isset($this->request->get[''ncat''])) {\r\n				$ncat = explode(''_'', (string)$this->request->get[''ncat'']);\r\n\r\n				$layout_id = $this->model_catalog_ncategory->getncategoryLayoutId(end($ncat));\r\n			}\r\n		]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/content_bottom.php">\r\n		<operation>\r\n			<search><![CDATA[$this->load->model(''catalog/information'');]]></search>\r\n			<add position="after"><![CDATA[$this->load->model(''catalog/news'');\r\n			$this->load->model(''catalog/ncategory'');\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[if ($route == ''product/category'' && isset($this->request->get[''path''])) {]]></search>\r\n			<add position="before"><![CDATA[\r\n			if ($route == ''news/article'' && isset($this->request->get[''news_id''])) {\r\n				$layout_id = $this->model_catalog_news->getNewsLayoutId($this->request->get[''news_id'']);\r\n			}\r\n			if ($route == ''news/ncategory'' && isset($this->request->get[''ncat''])) {\r\n				$ncat = explode(''_'', (string)$this->request->get[''ncat'']);\r\n\r\n				$layout_id = $this->model_catalog_ncategory->getncategoryLayoutId(end($ncat));\r\n			}\r\n		]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/seo_url.php">\r\n		<operation>\r\n			<search><![CDATA[if (isset($this->request->get[''route''])) {]]></search>\r\n			<add position="before"><![CDATA[\r\n        if ($this->request->get[''route''] != ''product/product'' && $this->request->get[''route''] != ''product/category'' && $this->request->get[''route''] != ''product/manufacturer/info'' && $this->request->get[''route''] != ''information/information'') {\r\n			$blog_headlines = $this->config->get(''ncategory_bnews_headlines_url'') ? $this->config->get(''ncategory_bnews_headlines_url'') : ''blog-headlines'';\r\n\r\n			$blogparts = explode(''/'', $this->request->get[''_route_'']);\r\n\r\n			if (utf8_strlen(end($blogparts)) == 0) {\r\n				array_pop($blogparts);\r\n			}\r\n\r\n\r\n			foreach ($blogparts as $part) {\r\n					/* default article seo urls */\r\n					if (strpos($part, ''blogcat'') === 0) {\r\n						$ncatid = (int)str_replace("blogcat", "", $part);\r\n						if (!isset($this->request->get[''ncat''])) {\r\n							$this->request->get[''ncat''] = $ncatid;\r\n						} else {\r\n							$this->request->get[''ncat''] .= ''_'' . $ncatid;\r\n						}\r\n					}\r\n					if (strpos($part, ''blogart'') === 0) {\r\n						$this->request->get[''news_id''] = (int)str_replace("blogart", "", $part);\r\n					}\r\n					if (strpos($part, ''blogauthor'') === 0) {\r\n						$this->request->get[''author''] = (int)str_replace("blogauthor", "", $part);\r\n					}\r\n					if (strpos($part, ''blogarchive-'') === 0) {\r\n						$this->request->get[''archive''] = (string)str_replace("blogarchive-", "", $part);\r\n					}\r\n					/* end of default article urls */\r\n				$query     =     $this->db->query( " SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = ''" . $this->db->escape($part) . "'' " );\r\n\r\n				if ($part == $blog_headlines) {\r\n					$query->num_rows = true;\r\n					$query->row[''query''] = "-=-";\r\n				}\r\n\r\n				if ($query->num_rows) {\r\n					$url = explode(''='', $query->row[''query'']);\r\n					/* custom article urls */\r\n					if ($url[0] == ''news_id'') {\r\n						$this->request->get[''news_id''] = $url[1];\r\n					}\r\n					if ($url[0] == ''nauthor_id'') {\r\n						$this->request->get[''author''] = $url[1];\r\n					}\r\n					if ($url[0] == ''ncategory_id'') {\r\n						if (!isset($this->request->get[''ncat''])) {\r\n							$this->request->get[''ncat''] = $url[1];\r\n						} else {\r\n							$this->request->get[''ncat''] .= ''_'' . $url[1];\r\n						}\r\n					}\r\n					/* end of custom article urls */\r\n				}\r\n			}\r\n			if (!isset($this->request->get[''route'']) || (isset($this->request->get[''route'']) && $this->request->get[''route''] == "error/not_found")) {\r\n\r\n				if (isset($this->request->get[''news_id''])) {\r\n					$this->request->get[''route''] = ''news/article'';\r\n				} elseif (isset($this->request->get[''ncat'']) || isset($this->request->get[''author'']) || $this->request->get[''_route_''] ==  $blog_headlines || isset($this->request->get[''archive''])) {\r\n					$this->request->get[''route''] = ''news/ncategory'';\r\n				}\r\n			}\r\n        }\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[} elseif ($key == ''path'') {]]></search>\r\n			<add position="replace"><![CDATA[\r\n			} elseif ($data[''route''] == ''news/article'' && $key == ''news_id'') {\r\n				$query    =    $this->db->query( "SELECT * FROM " . DB_PREFIX . "url_alias where  `query` = ''" . $this->db->escape($key . ''='' . (int)$value ) . "''");\r\n				if ($query->num_rows) {\r\n					$url .= ''/'' . $query->row[''keyword''];\r\n					unset($data[$key]);\r\n				} else {\r\n					$url .= ''/blogart'' . (int)$value;\r\n					unset($data[$key]);\r\n				}\r\n			} elseif (($data[''route''] == ''news/ncategory'' || $data[''route''] == ''news/article'') && $key == ''author'') {\r\n				$realkey = "nauthor_id";\r\n				$query   =    $this->db->query( "SELECT * FROM " . DB_PREFIX . "url_alias where  `query` = ''" . $this->db->escape($realkey . ''='' . (int)$value) . "''" );\r\n				if ($query->num_rows) {\r\n					$url .= ''/'' . $query->row[''keyword''];\r\n					unset($data[$key]);\r\n				} else {\r\n					$url .= ''/blogauthor'' . (int)$value;\r\n					unset($data[$key]);\r\n				}\r\n			} elseif (($data[''route''] == ''news/ncategory'' || $data[''route''] == ''news/article'') && $key == ''archive'') {\r\n				$url .= ''/blogarchive-'' . (string)$value;\r\n				unset($data[$key]);\r\n			} elseif ($key == ''ncat'') {\r\n				$ncategories = explode(''_'', $value);\r\n\r\n				foreach ($ncategories as $ncategory) {\r\n					$query    =    $this->db->query( "SELECT * FROM " . DB_PREFIX . "url_alias where  `query` = ''ncategory_id=" . (int)$ncategory . "''" );\r\n					if ($query->num_rows) {\r\n						$url .= ''/'' . $query->row[''keyword''];\r\n					} else {\r\n						$url .= ''/blogcat'' . $ncategory;\r\n					}\r\n				}\r\n				unset($data[$key]);\r\n			} elseif ((isset($data[''route'']) && $data[''route''] == ''news/ncategory'' && $key != ''ncat'' && $key != ''author'' && $key != ''page'' && $key != ''archive'') || (isset($data[''route'']) && $data[''route''] == ''news/article'' && $key != ''page'')) {\r\n				$blog_headlines = $this->config->get(''ncategory_bnews_headlines_url'') ? $this->config->get(''ncategory_bnews_headlines_url'') : ''blog-headlines'';\r\n				$url .=  ''/''.$blog_headlines;\r\n			} elseif ($key == ''path'') {]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/footer.php">\r\n		<operation>\r\n			<search><![CDATA[$data[''newsletter''] = $this->url->link(''account/newsletter'', '''', ''SSL'');]]></search>\r\n			<add position="before"><![CDATA[\r\n		$this->language->load(''module/news'');\r\n		$data[''blog_url''] = $this->url->link(''news/ncategory'');\r\n		$data[''blog_name''] = $this->language->get(''text_blogpage'');\r\n		]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/view/theme/*/template/common/footer.tpl">\r\n		<operation>\r\n			<search><![CDATA[<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>]]></search>\r\n			<add position="after"><![CDATA[\r\n			<li><a href="<?php echo $blog_url; ?>"><?php echo $blog_name; ?></a></li>\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="system/library/document.php">\r\n		<operation>\r\n			<search><![CDATA[private $scripts = array();]]></search>\r\n			<add position="after"><![CDATA[\r\n			private $extra_tags = array();\r\n			public function addExtraTag($property, $content = '''', $name=''''){\r\n				$this->extra_tags[md5($property)] = array(\r\n					''property'' => $property,\r\n					''content''  => $content,\r\n					''name''     => $name,\r\n				);\r\n			}\r\n\r\n			public function getExtraTags(){\r\n				return $this->extra_tags;\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/header.php">\r\n		<operation>\r\n			<search><![CDATA[$data[''scripts''] = $this->document->getScripts();]]></search>\r\n			<add position="after"><![CDATA[$data[''extra_tags''] = $this->document->getExtraTags();]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/view/theme/*/template/common/header.tpl">\r\n		<operation>\r\n			<search><![CDATA[<?php if ($description) { ?>]]></search>\r\n			<add position="before"><![CDATA[<?php foreach($extra_tags as $extra_tag) {?>\r\n<meta <?php echo ($extra_tag[''name'']) ? ''name="'' . $extra_tag[''name''] . ''" '' : ''''; ?><?php echo (!in_array($extra_tag[''property''], array("noprop", "noprop1", "noprop2", "noprop3", "noprop4"))) ? ''property="'' . $extra_tag[''property''] . ''" '' : ''''; ?> content="<?php echo addslashes($extra_tag[''content'']); ?>" />\r\n<?php } ?>]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>\r\n', 1, '2016-02-14 11:49:59');

-- --------------------------------------------------------

--
-- 表的结构 `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["40","42","30","56"],"limit":"4","width":"300","height":"300","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"500","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}'),
(32, '最新商品', 'latest', '{"name":"\\u6700\\u65b0\\u5546\\u54c1","limit":"4","width":"300","height":"300","status":"1"}'),
(33, '特价商品', 'special', '{"name":"\\u7279\\u4ef7\\u5546\\u54c1","limit":"4","width":"400","height":"400","status":"1"}'),
(34, '手机首页幻灯片', 'mobile_slideshow', '{"name":"\\u624b\\u673a\\u9996\\u9875\\u5e7b\\u706f\\u7247","banner_id":"7","width":"750","height":"329","status":"1","mobile_only":"1"}'),
(38, '手机推荐商品', 'mobile_featured', '{"name":"\\u624b\\u673a\\u63a8\\u8350\\u5546\\u54c1","product":["59","61","62","63"],"limit":"4","width":"300","height":"300","status":"1","mobile_only":"1"}'),
(36, '手机最新商品', 'mobile_latest', '{"name":"\\u624b\\u673a\\u6700\\u65b0\\u5546\\u54c1","limit":"4","width":"300","height":"300","status":"1","mobile_only":"1"}');

-- --------------------------------------------------------

--
-- 表的结构 `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1006543 ;

--
-- 转存表中的数据 `oc_order`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_custom_field`
--

DROP TABLE IF EXISTS `oc_order_custom_field`;
CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;

--
-- 转存表中的数据 `oc_order_product`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_product_review`
--

DROP TABLE IF EXISTS `oc_order_product_review`;
CREATE TABLE IF NOT EXISTS `oc_order_product_review` (
  `order_product_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_product_review_id`),
  KEY `order_product_id` (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_recharge`
--

DROP TABLE IF EXISTS `oc_order_recharge`;
CREATE TABLE IF NOT EXISTS `oc_order_recharge` (
  `order_recharge_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `recharge_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_recharge_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_recurring`
--

DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_recurring_transaction`
--

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_shippingtrack`
--

DROP TABLE IF EXISTS `oc_order_shippingtrack`;
CREATE TABLE IF NOT EXISTS `oc_order_shippingtrack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `kd_kuaidi_code` varchar(64) NOT NULL,
  `kd_kuaidi_number` varchar(64) NOT NULL,
  `kd_comment` varchar(128) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 2, '处理中'),
(3, 2, '已发货'),
(7, 2, '已取消'),
(5, 2, '已完成'),
(1, 2, '待处理'),
(15, 2, '已付款');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=330 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- 转存表中的数据 `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 4, 6, 'catalog/product/clothing/women-clothing/fision11.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:59:00', '2016-02-01 18:48:43'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 993, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 958, 5, 'catalog/product/clothing/women-clothing/fision6.jpg', 8, 1, '0.0100', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:12', '2016-02-01 18:47:58'),
(41, 'Product 14', '', '', '', '', '', '', '', 971, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/product/clothing/women-clothing/zoom-clothing-4.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 0, '2009-02-03 21:07:37', '2016-01-28 18:18:19'),
(43, 'Product 16', '', '', '', '', '', '', '', 927, 5, 'catalog/product/clothing/women-clothing/fision6.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2016-02-05 10:13:06'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Product 18', '', '', '', '', '', '', '', 997, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 0, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 994, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2011-04-26 08:57:34', '2011-09-30 01:06:23'),
(50, '女士上衣', '', '', '', '', '', '', '1', 20, 6, 'catalog/product/clothing/women-clothing/white-clothing-1.jpg', 0, 1, '109.0000', 10, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, 0, '2016-01-28 11:09:19', '2016-02-04 11:27:47'),
(51, '女士休闲', '', '', '', '', '', '', '', 38, 6, 'catalog/product/clothing/women-clothing/personality-clothing-4.jpg', 0, 1, '200.0000', 20, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 2, 1, 0, '2016-01-28 11:34:33', '2016-01-28 14:26:40'),
(52, '女士旗袍', '', '', '', '', '', '', '', 69, 6, 'catalog/product/clothing/women-clothing/fision7.jpg', 0, 1, '120.0000', 12, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 4, 1, 0, '2016-01-28 14:14:26', '2016-02-01 18:30:46'),
(53, '女士休闲', '', '', '', '', '', '', '', 38, 6, 'catalog/product/clothing/women-clothing/personality-clothing-1.jpg', 0, 1, '200.0000', 20, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, 0, '2016-01-28 14:19:43', '2016-01-28 14:21:34'),
(54, '女士衬衫', '', '', '', '', '', '', '', 65, 6, 'catalog/product/clothing/women-clothing/zoom-clothing-1.jpg', 0, 1, '89.0000', 8, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 3, 1, 0, '2016-01-28 14:58:44', '0000-00-00 00:00:00'),
(55, '女士衬衫', '', '', '', '', '', '', '', 65, 6, 'catalog/product/clothing/women-clothing/zoom-clothing-4.jpg', 0, 1, '89.0000', 8, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 3, 1, 0, '2016-01-28 15:02:57', '2016-01-28 15:04:04'),
(56, '女士衬衫', '', '', '', '', '', '', '', 10, 6, 'catalog/product/clothing/women-clothing/fision3.jpg', 0, 1, '2223.0000', 5, 0, '2016-02-11', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 4, 1, 0, '2016-01-28 15:42:01', '2016-02-13 11:47:05'),
(57, '男士牛仔', '', '', '', '', '', '', '', 60, 6, 'catalog/product/clothing/men-clothing/niuzai-man-clothing-1.jpg', 0, 1, '258.0000', 25, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, 0, '2016-01-28 16:40:47', '2016-02-01 16:28:34'),
(58, '男士夹克', '', '', '', '', '', '', '', 25, 6, 'catalog/product/clothing/women-clothing/fision1.jpg', 0, 1, '125.0000', 8, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 2, 1, 0, '2016-01-28 16:55:56', '2016-01-28 18:36:54'),
(59, '女士大衣', '', '', '', '', '', '', '', 40, 6, 'catalog/product/clothing/women-clothing/fision4.jpg', 0, 1, '0.0100', 100, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 4, 0, 0, '2016-01-28 17:21:54', '2016-02-14 14:49:16'),
(60, '女士上衣', '', '', '', '', '', '', '1', 20, 6, 'catalog/product/clothing/women-clothing/white-clothing-1.jpg', 0, 1, '109.0000', 10, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, 0, '2016-02-01 18:33:29', '2016-02-04 14:50:50'),
(61, 'Product 15', '', '', '', '', '', '', '', 988, 5, 'catalog/product/clothing/women-clothing/fision10.jpg', 8, 1, '100.0000', 100, 9, '2016-02-12', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 0, '2016-02-01 18:33:29', '2016-02-15 20:56:21'),
(62, '女士旗袍', '', '', '', '', '', '', '', 69, 7, 'catalog/product/clothing/women-clothing/fision9.jpg', 0, 1, '120.0000', 120, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 4, 1, 0, '2016-02-01 18:40:20', '2016-02-14 14:22:45'),
(63, '女士衬衫', '', '', '', '', '', '', '', 65, 6, 'catalog/product/clothing/women-clothing/fision11.jpg', 0, 1, '89.0000', 80, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 3, 1, 0, '2016-02-01 18:42:25', '2016-02-15 21:05:16');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 2, '1'),
(47, 4, 2, '16GB'),
(43, 4, 2, '8gb'),
(42, 3, 2, '100mhz'),
(47, 2, 2, '4'),
(61, 3, 2, '100mhz');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(35, 2, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '', '', ''),
(48, 2, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(40, 2, '支付测试商品', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'fdasfd', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(44, 2, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', ''),
(45, 2, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(36, 2, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(46, 2, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', ''),
(41, 2, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', ''),
(34, 2, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(43, 2, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(31, 2, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', ''),
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30&quot;', '', ''),
(30, 2, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'Canon EOS 5D', '', ''),
(50, 2, '2015秋装新款韩版纯色上衣V领修身显瘦长袖T恤打底衫女 T2086 纯白色 L', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '女士纯白上衣', '', ''),
(51, 2, 'JDIU高端定制落肩衣服圆领头中款针织休闲上衣宽松个性短袖新款', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '上衣宽松个性', '', ''),
(52, 2, '网软服饰欧美夏季连衣裙复古真丝裙子民族风水墨图案旗袍款短裙', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '水墨图案旗袍', '', ''),
(53, 2, 'JDIU高端定制落肩衣服圆领头中款针织休闲上衣宽松个性短袖新款', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/personality-clothing-desciption-5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '上衣宽松个性', '', ''),
(54, 2, '长袖衬衫女2016春装新款女装OL职业装中长款宽松大码', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-5.jpg&quot;&gt;&amp;nbsp;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', 'OL职业装', '', ''),
(55, 2, '长袖衬衫女2016春装新款女装OL职业装中长款宽松大码', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-5.jpg&quot;&gt;&amp;nbsp;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', 'OL职业装', '', ''),
(56, 2, '2015春装新款桑蚕丝女式长袖衬衣大码上衣修身显瘦真丝衬衫', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/sanwei-clothing-description-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/sanwei-clothing-description-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/sanwei-clothing-description-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/sanwei-clothing-description-4.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '桑蚕丝女式', '', ''),
(57, 2, '2015秋冬新品牛仔夹克男装时尚百搭牛仔外套', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/niuzai-man-clothing-5.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/niuzai-man-clothing-6.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/niuzai-man-clothing-7.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/niuzai-man-clothing-8.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '新品牛仔夹克', '', ''),
(58, 2, '夹克 2016春装热卖 男士拼接外套 潮男 jacket', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/jiake-man-clothing-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/jiake-man-clothing-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/jiake-man-clothing-5.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/jiake-man-clothing-6.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/men-clothing/jiake-man-clothing-7.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', ' 男士拼接外套', '', ''),
(59, 2, '2015冬装新品欧洲站 粉色翻领中长款羊毛毛呢大衣外套女', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/dayi-women-clothing-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/dayi-women-clothing-5.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/dayi-women-clothing-6.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/dayi-women-clothing-7.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/dayi-women-clothing-8.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '粉色翻领中长款', '', ''),
(60, 2, 'zz秋装新款韩版纯色上衣V领修身显瘦长袖T恤打底衫女 T2086 纯白色 L', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/white-clothing-desciotion-5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '女士纯白上衣', '', ''),
(61, 2, '春装上新 女装', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30&quot;', '', ''),
(62, 2, '服饰欧美夏季连衣裙复古真丝裙子民族风水墨图案旗袍款短裙', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-3.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-4.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/cheongsam-clothing-description-5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '水墨图案', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(63, 2, '衬衫女2016春装新款女装OL职业装中长款宽松大码', '&lt;p&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-5.jpg&quot;&gt;&amp;nbsp;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-1.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-2.jpg&quot;&gt;&lt;img src=&quot;http://mall.opencart.cn/image/catalog/product/clothing/women-clothing/zoom-clothing-discription-3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', 'OL职业装', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=465 ;

--
-- 转存表中的数据 `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(443, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(442, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(441, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(464, 61, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(463, 61, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(462, 61, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2520 ;

--
-- 转存表中的数据 `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2475, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(2473, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(2498, 43, 'catalog/demo/macbook_5.jpg', 0),
(2497, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(2472, 40, 'catalog/demo/iphone_2.jpg', 0),
(2471, 40, 'catalog/demo/iphone_5.jpg', 0),
(2474, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(2470, 40, 'catalog/demo/iphone_3.jpg', 0),
(2469, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(2496, 43, 'catalog/demo/macbook_2.jpg', 0),
(2495, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2423, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2422, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2421, 42, 'catalog/demo/hp_1.jpg', 0),
(2420, 42, 'catalog/demo/canon_logo.jpg', 0),
(2490, 50, 'catalog/product/clothing/women-clothing/white-clothing-3.jpg', 2),
(2395, 51, 'catalog/product/clothing/women-clothing/personality-clothing-3.jpg', 4),
(2394, 51, 'catalog/product/clothing/women-clothing/personality-clothing-2.jpg', 3),
(2393, 51, 'catalog/product/clothing/women-clothing/personality-clothing-1.jpg', 2),
(2438, 52, 'catalog/product/clothing/women-clothing/fision6.jpg', 0),
(2391, 53, 'catalog/product/clothing/women-clothing/personality-clothing-3.jpg', 4),
(2390, 53, 'catalog/product/clothing/women-clothing/personality-clothing-2.jpg', 3),
(2389, 53, 'catalog/product/clothing/women-clothing/personality-clothing-4.jpg', 0),
(2396, 54, 'catalog/product/clothing/women-clothing/zoom-clothing-2.jpg', 2),
(2397, 54, 'catalog/product/clothing/women-clothing/zoom3.jpg', 3),
(2398, 54, 'catalog/product/clothing/women-clothing/zoom-clothing-4.jpg', 4),
(2407, 55, 'catalog/product/clothing/women-clothing/zoom-clothing-4.jpg', 4),
(2406, 55, 'catalog/product/clothing/women-clothing/zoom3.jpg', 3),
(2405, 55, 'catalog/product/clothing/women-clothing/zoom-clothing-2.jpg', 2),
(2506, 56, 'catalog/product/clothing/women-clothing/sanwei-clothing-1.jpg', 0),
(2505, 56, 'catalog/product/clothing/women-clothing/sanwei-clothing-2.jpg', 0),
(2504, 56, 'catalog/product/clothing/women-clothing/sanwei-clothing-4`.jpg', 0),
(2437, 57, 'catalog/product/clothing/men-clothing/niuzai-man-clothing-2.jpg', 0),
(2436, 57, 'catalog/product/clothing/men-clothing/niuzai-man-clothing-3.jpg', 0),
(2435, 57, 'catalog/product/clothing/men-clothing/niuzai-man-clothing-4.jpg', 0),
(2427, 58, 'catalog/product/clothing/men-clothing/jiake-man-clothing-1.jpg', 0),
(2513, 59, 'catalog/product/clothing/women-clothing/dayi-women-clothing-2.jpg', 0),
(2512, 59, 'catalog/product/clothing/women-clothing/dayi-women-clothing-3.jpg', 0),
(2424, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2491, 60, 'catalog/product/clothing/women-clothing/white-clothing-3.jpg', 2),
(2516, 61, 'catalog/product/clothing/women-clothing/fision12.jpg', 0),
(2515, 61, 'catalog/product/clothing/women-clothing/fision1.jpg', 0),
(2514, 61, 'catalog/product/clothing/women-clothing/fision11.jpg', 0),
(2511, 62, 'catalog/product/clothing/women-clothing/fision6.jpg', 0),
(2519, 63, 'catalog/product/clothing/women-clothing/zoom-clothing-4.jpg', 4),
(2518, 63, 'catalog/product/clothing/women-clothing/zoom3.jpg', 3),
(2517, 63, 'catalog/product/clothing/women-clothing/zoom-clothing-2.jpg', 2);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=236 ;

--
-- 转存表中的数据 `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(222, 42, 7, '', 1),
(219, 42, 8, '2011-02-20', 1),
(208, 42, 4, 'test', 1),
(218, 42, 1, '', 1),
(209, 42, 6, '', 1),
(217, 42, 5, '', 1),
(223, 42, 2, '', 1),
(226, 30, 5, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(230, 61, 1, '', 1),
(232, 61, 5, '', 1),
(233, 61, 2, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 4, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(19, 230, 61, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(18, 230, 61, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(17, 230, 61, 1, 32, 94, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(20, 232, 61, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(21, 232, 61, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(23, 232, 61, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(22, 232, 61, 5, 39, 90, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(24, 233, 61, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(27, 233, 61, 2, 23, 46, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(25, 233, 61, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(26, 233, 61, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_questions`
--

DROP TABLE IF EXISTS `oc_product_questions`;
CREATE TABLE IF NOT EXISTS `oc_product_questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `product_question` longtext NOT NULL,
  `product_answer` longtext NOT NULL,
  `product_status` int(11) NOT NULL,
  `product_question_helpfull` int(11) NOT NULL,
  `product_question_nothelpfull` int(11) NOT NULL,
  `question_asked_date` datetime NOT NULL,
  `question_answred_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_product_questions`
--

INSERT INTO `oc_product_questions` (`id`, `product_id`, `user_name`, `product_question`, `product_answer`, `product_status`, `product_question_helpfull`, `product_question_nothelpfull`, `question_asked_date`, `question_answred_date`) VALUES
(1, 63, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-04 12:39:02', '0000-00-00 00:00:00'),
(2, 62, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-04 15:29:22', '0000-00-00 00:00:00'),
(3, 51, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-05 10:44:54', '0000-00-00 00:00:00'),
(4, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-17 00:19:42', '0000-00-00 00:00:00'),
(5, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-17 00:19:45', '0000-00-00 00:00:00'),
(6, 62, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-18 09:51:28', '0000-00-00 00:00:00'),
(7, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-18 10:18:07', '0000-00-00 00:00:00'),
(8, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-18 10:18:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_recurring`
--

DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(40, 61),
(41, 42),
(41, 61),
(42, 40),
(42, 41),
(61, 40),
(61, 41);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=559 ;

--
-- 转存表中的数据 `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(546, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(554, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(551, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000),
(557, 61, 1, 50),
(558, 63, 1, 20);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=485 ;

--
-- 转存表中的数据 `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(452, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(470, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(469, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00'),
(477, 50, 1, 0, '10.0000', '0000-00-00', '0000-00-00'),
(457, 52, 1, 1, '58.0000', '2016-01-28', '2016-02-06'),
(447, 55, 1, 1, '66.0000', '2016-01-28', '2016-03-03'),
(482, 56, 1, 1, '210.0000', '2016-01-28', '2016-03-02'),
(454, 58, 1, 1, '45.0000', '2016-01-28', '2016-01-30'),
(478, 60, 1, 0, '10.0000', '0000-00-00', '0000-00-00'),
(483, 61, 1, 1, '10.0000', '2016-02-01', '2016-03-10'),
(484, 63, 1, 1, '66.0000', '2016-01-28', '2016-03-03');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(33, 20),
(33, 28),
(35, 20),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(49, 57),
(50, 59),
(50, 60),
(51, 59),
(51, 60),
(52, 59),
(52, 60),
(53, 59),
(53, 60),
(54, 59),
(54, 60),
(55, 59),
(55, 60),
(56, 59),
(56, 60),
(57, 59),
(57, 61),
(58, 59),
(58, 61),
(59, 59),
(59, 60),
(60, 59),
(60, 60),
(61, 59),
(61, 60),
(62, 59),
(62, 60),
(63, 59),
(63, 60);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(40, 0, 0),
(50, 0, 0),
(51, 0, 0),
(52, 0, 0),
(53, 0, 0),
(54, 0, 0),
(55, 0, 0),
(56, 0, 0),
(57, 0, 0),
(58, 0, 0),
(59, 0, 0),
(42, 0, 0),
(60, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(30, 0, 0),
(43, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_recurring`
--

DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_recurring_description`
--

DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 2, '已退款'),
(2, 2, '信用卡已退款'),
(3, 2, '已寄出替换商品');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 2, '没有收到商品'),
(2, 2, '发错商品'),
(3, 2, '错误下单'),
(4, 2, '商品质量问题，请详细描述'),
(5, 2, '其它，请说明原因');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, '待处理'),
(3, 2, '已完成'),
(2, 2, '等待商品寄回');

-- --------------------------------------------------------

--
-- 表的结构 `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_nauthor`
--

DROP TABLE IF EXISTS `oc_sb_nauthor`;
CREATE TABLE IF NOT EXISTS `oc_sb_nauthor` (
  `nauthor_id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`nauthor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_sb_nauthor`
--

INSERT INTO `oc_sb_nauthor` (`nauthor_id`, `adminid`, `name`, `image`) VALUES
(1, '0', 'TL ', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_nauthor_description`
--

DROP TABLE IF EXISTS `oc_sb_nauthor_description`;
CREATE TABLE IF NOT EXISTS `oc_sb_nauthor_description` (
  `nauthor_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `ctitle` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`nauthor_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_sb_nauthor_description`
--

INSERT INTO `oc_sb_nauthor_description` (`nauthor_id`, `language_id`, `ctitle`, `description`, `meta_description`, `meta_keyword`) VALUES
(1, 2, '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_ncategory`
--

DROP TABLE IF EXISTS `oc_sb_ncategory`;
CREATE TABLE IF NOT EXISTS `oc_sb_ncategory` (
  `ncategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ncategory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=61 ;

--
-- 转存表中的数据 `oc_sb_ncategory`
--

INSERT INTO `oc_sb_ncategory` (`ncategory_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(59, '', 0, 0, 10, 0, 1, '2016-02-01 10:00:26', '2016-02-01 10:00:26'),
(60, '', 0, 0, 10, 0, 1, '2016-02-01 10:00:52', '2016-02-01 10:00:52');

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_ncategory_description`
--

DROP TABLE IF EXISTS `oc_sb_ncategory_description`;
CREATE TABLE IF NOT EXISTS `oc_sb_ncategory_description` (
  `ncategory_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ncategory_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_sb_ncategory_description`
--

INSERT INTO `oc_sb_ncategory_description` (`ncategory_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(59, 2, 'opencart发布新闻', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(60, 2, 'opencart技术开发', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_ncategory_to_layout`
--

DROP TABLE IF EXISTS `oc_sb_ncategory_to_layout`;
CREATE TABLE IF NOT EXISTS `oc_sb_ncategory_to_layout` (
  `ncategory_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`ncategory_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_sb_ncategory_to_layout`
--

INSERT INTO `oc_sb_ncategory_to_layout` (`ncategory_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_ncategory_to_store`
--

DROP TABLE IF EXISTS `oc_sb_ncategory_to_store`;
CREATE TABLE IF NOT EXISTS `oc_sb_ncategory_to_store` (
  `ncategory_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`ncategory_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_sb_ncategory_to_store`
--

INSERT INTO `oc_sb_ncategory_to_store` (`ncategory_id`, `store_id`) VALUES
(59, 0),
(60, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_ncomments`
--

DROP TABLE IF EXISTS `oc_sb_ncomments`;
CREATE TABLE IF NOT EXISTS `oc_sb_ncomments` (
  `ncomment_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `language_id` int(2) NOT NULL,
  `reply_id` int(11) NOT NULL DEFAULT '0',
  `author` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `text` text COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ncomment_id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news`
--

DROP TABLE IF EXISTS `oc_sb_news`;
CREATE TABLE IF NOT EXISTS `oc_sb_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `nauthor_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `acom` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `gal_thumb_w` int(5) NOT NULL,
  `gal_thumb_h` int(5) NOT NULL,
  `gal_popup_w` int(5) NOT NULL,
  `gal_popup_h` int(5) NOT NULL,
  `gal_slider_h` int(4) NOT NULL,
  `gal_slider_t` int(1) NOT NULL,
  `date_pub` datetime DEFAULT NULL,
  `gal_slider_w` int(4) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_sb_news`
--

INSERT INTO `oc_sb_news` (`news_id`, `nauthor_id`, `status`, `image`, `acom`, `date_added`, `date_updated`, `image2`, `sort_order`, `gal_thumb_w`, `gal_thumb_h`, `gal_popup_w`, `gal_popup_h`, `gal_slider_h`, `gal_slider_t`, `date_pub`, `gal_slider_w`) VALUES
(1, 0, 1, '', 0, '2016-02-01 02:01:01', '2016-02-01 02:01:01', '', 1, 150, 150, 700, 700, 400, 1, '2016-01-31 02:01:01', 980),
(2, 1, 1, '', 0, '2016-02-01 02:02:45', '2016-02-01 02:02:45', '', 1, 150, 150, 700, 700, 400, 1, '2016-01-31 02:02:45', 980);

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_archive`
--

DROP TABLE IF EXISTS `oc_sb_news_archive`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_archive` (
  `news_archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(3) NOT NULL,
  `year` int(4) NOT NULL,
  `months` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`news_archive_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_sb_news_archive`
--

INSERT INTO `oc_sb_news_archive` (`news_archive_id`, `store_id`, `year`, `months`) VALUES
(1, 0, 2016, 'a:1:{i:2;i:2;}');

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_description`
--

DROP TABLE IF EXISTS `oc_sb_news_description`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_description` (
  `news_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ctitle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_bin NOT NULL,
  `ntags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cfield1` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cfield2` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cfield3` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cfield4` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`news_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_sb_news_description`
--

INSERT INTO `oc_sb_news_description` (`news_id`, `language_id`, `title`, `ctitle`, `description`, `description2`, `meta_desc`, `meta_key`, `ntags`, `cfield1`, `cfield2`, `cfield3`, `cfield4`) VALUES
(1, 2, 'OpenCart V2.2.0.1发布', '', '&lt;p&gt;opencart V2.2.0.1版本今日发布，该版本修复了大量bug，并对诸多功能进行了改进，使得用户体验更好。&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', '', '', ''),
(2, 2, 'OpenCart 成为世界最流行的中小型电商系统。', '', '&lt;p&gt;据世界权威机构XXXXX最新统计数据显示，OPENCART成为全球最流行的中小型电商系统，其方便易用，快速建站，开源的特性使得其建站成本低、二次开发方便。赢得了全球爱好者加入开发，并且得到迅速推广。最终成为最受欢迎的电商系统。&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_gallery`
--

DROP TABLE IF EXISTS `oc_sb_news_gallery`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_gallery` (
  `news_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `text` text NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_related`
--

DROP TABLE IF EXISTS `oc_sb_news_related`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_related` (
  `news_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_to_layout`
--

DROP TABLE IF EXISTS `oc_sb_news_to_layout`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_to_layout` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_sb_news_to_layout`
--

INSERT INTO `oc_sb_news_to_layout` (`news_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_to_ncategory`
--

DROP TABLE IF EXISTS `oc_sb_news_to_ncategory`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_to_ncategory` (
  `news_id` int(11) NOT NULL,
  `ncategory_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`ncategory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_to_store`
--

DROP TABLE IF EXISTS `oc_sb_news_to_store`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_to_store` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_sb_news_to_store`
--

INSERT INTO `oc_sb_news_to_store` (`news_id`, `store_id`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_sb_news_video`
--

DROP TABLE IF EXISTS `oc_sb_news_video`;
CREATE TABLE IF NOT EXISTS `oc_sb_news_video` (
  `news_video_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `video` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4844 ;

--
-- 转存表中的数据 `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(4556, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(1683, 0, 'basic_captcha', 'basic_captcha_status', '1', 0),
(4564, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(4588, 0, 'cod', 'cod_status', '1', 0),
(4555, 0, 'shipping', 'shipping_status', '1', 0),
(4554, 0, 'shipping', 'shipping_estimator', '0', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(4129, 0, 'flat', 'flat_sort_order', '1', 0),
(4128, 0, 'flat', 'flat_status', '1', 0),
(4127, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(4126, 0, 'flat', 'flat_tax_class_id', '0', 0),
(4125, 0, 'flat', 'flat_cost', '5.00', 0),
(4553, 0, 'credit', 'credit_sort_order', '7', 0),
(4552, 0, 'credit', 'credit_status', '0', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(2556, 0, 'ncategory', 'ncategory_bnews_thumb_height', '230', 0),
(4523, 0, 'voucher', 'voucher_sort_order', '8', 0),
(4522, 0, 'voucher', 'voucher_status', '1', 0),
(4563, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(4562, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(3747, 0, 'alipay', 'alipay_sort_order', '', 0),
(4832, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(3882, 0, 'online', 'online_status', '1', 0),
(4163, 0, 'free', 'free_sort_order', '', 0),
(4161, 0, 'free', 'free_geo_zone_id', '0', 0),
(4583, 0, 'bank_transfer', 'bank_transfer_status', '1', 0),
(4582, 0, 'bank_transfer', 'bank_transfer_geo_zone_id', '0', 0),
(4581, 0, 'bank_transfer', 'bank_transfer_order_status_id', '2', 0),
(4580, 0, 'bank_transfer', 'bank_transfer_total', '0.1', 0),
(3377, 0, 'qq_login', 'qq_login_return_url', 'http://mall.opencart.cn/qqlogincallback.php', 0),
(3376, 0, 'qq_login', 'qq_login_customer_group_id', '1', 0),
(3375, 0, 'qq_login', 'qq_login_debug', '0', 0),
(3374, 0, 'qq_login', 'qq_login_secret', 'b02408f659de0c65063b85951e752977', 0),
(3373, 0, 'qq_login', 'qq_login_client_id', '101279118', 0),
(3383, 0, 'weibo_login', 'weibo_login_return_url', 'http://mall.opencart.cn/weibologincallback.php', 0),
(3382, 0, 'weibo_login', 'weibo_login_customer_group_id', '1', 0),
(3381, 0, 'weibo_login', 'weibo_login_debug', '0', 0),
(3380, 0, 'weibo_login', 'weibo_login_secret', '1797b28c5dcfcd7eff8eb29a77184ce7', 0),
(3379, 0, 'weibo_login', 'weibo_login_client_id', '2994320577', 0),
(3881, 0, 'online', 'online_image', 'catalog/banner/weixin.png', 0),
(3880, 0, 'online', 'online_qq3', '9358972', 0),
(3879, 0, 'online', 'online_qq2', '9358972', 0),
(3878, 0, 'online', 'online_qq', '9358972', 0),
(3877, 0, 'online', 'online_telephone', '13888888888', 0),
(4821, 0, 'config', 'config_mail_alert', '', 0),
(4822, 0, 'config', 'config_maintenance', '0', 0),
(4823, 0, 'config', 'config_seo_url', '0', 0),
(4824, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(4831, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(4830, 0, 'config', 'config_file_max_size', '300000', 0),
(4825, 0, 'config', 'config_compression', '0', 0),
(4826, 0, 'config', 'config_secure', '0', 0),
(4827, 0, 'config', 'config_password', '1', 0),
(4828, 0, 'config', 'config_shared', '0', 0),
(4829, 0, 'config', 'config_encryption', 'pxdy2WRj8KYKSj8mApWvcVm6lMWpHbvllwd8VCPACEQGNZiBewfJV5rAgGQh7HCEfMZu8vrFN5d7n4khTNMgfYXcqvstpnJD7TF4waUJ45JfMfcdNnVZfFKohUgjVUYwIK2px3dj0DpYfTl5THIqHPd6MQUzYX4tNpg5OYRMH7LkVVKsrg1FZwKKwoB9PUKDFcKecCUq2Gf1wiByEOzTYRCvI7X9TBp8o585Kl0G9vJKwgOBRlM7X6nbSAf2qdRJ80fuI2BPEOZRoEN4ZC3uBQreTPVvPub73DfowAgDhmlclKJSFEdBvdbsaKY2nbChmVCuQJGyFdQzLikRIXhLt5KOL9hmGFTnDvbko2PJjJyMmLyPI8zMNimL6Bq9goSinw6DnXhxZYOxmcaNmAUDOpG9IxOWedfbQ9bKcB878Sbg0J7d5cofF809yoKcQCqLFOXarnFAdHn03ITgJVIWk54pSfMSWXRU5iEviOFBMV9adZDMu6x8GhAyubZzGkEzc2Oi9c4MN7VDWkeBlsLXL3ONXumbDoQsdyKc8VIZPXesE0FTYYA8QjuOWhKnMKg7ccuW4JIOTvQK1jS9R8otSIhJmLWiEJbE0tVwYCmXC1eS2Aey8DpzXLVvlb7ldNiEVR0RaxfZqYfEmwOdklaa2EY8kc9MH1mEXwuoNDu5P9E820mQdwPjrFq6IyZwyLbD4gtJuGMyzMAs75HqvlTF8qPUNoPKRZQ4kwKwfGh03xYzFlOwHBnWWuHrG5kwAWlknom0EM3G7lAiLaqQVhxPbOsuvuraHampseTvts0P29ngwUArcX0YnHWKNXR0q1QIVbRamFzTiPTuOmWzALU34xNGAJAc6wpU4JJsRkkpbOfyIesxz7BnhEYQj4ZjMNUuXISkI0FpyqhciCQPcTOferKr9l6Fi1v7aZXULNcGELsBuY9iO2T2kfUyqnxmvgxTWB4CCgBhzBeVGY1IsYz56FmLlpBnnnMwtivYlany7NcYMZpQhMRto3LE81GuGhPd', 0),
(4820, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(4818, 0, 'config', 'config_mail_smtp_password', '', 0),
(4819, 0, 'config', 'config_mail_smtp_port', '25', 0),
(4817, 0, 'config', 'config_mail_smtp_username', 'smtp.163.com', 0),
(4815, 0, 'config', 'config_mail_parameter', '', 0),
(4816, 0, 'config', 'config_mail_smtp_hostname', 'support@163.com', 0),
(4814, 0, 'config', 'config_mail_protocol', 'mail', 0),
(4813, 0, 'config', 'config_ftp_status', '0', 0),
(4812, 0, 'config', 'config_ftp_root', '', 0),
(4811, 0, 'config', 'config_ftp_password', '', 0),
(4810, 0, 'config', 'config_ftp_username', '', 0),
(4809, 0, 'config', 'config_ftp_port', '21', 0),
(4808, 0, 'config', 'config_ftp_hostname', 'cn2101.opencart.cn', 0),
(4807, 0, 'config', 'config_image_location_height', '50', 0),
(4806, 0, 'config', 'config_image_location_width', '268', 0),
(4805, 0, 'config', 'config_image_cart_height', '100', 0),
(4804, 0, 'config', 'config_image_cart_width', '100', 0),
(4803, 0, 'config', 'config_image_wishlist_height', '100', 0),
(4802, 0, 'config', 'config_image_wishlist_width', '100', 0),
(4801, 0, 'config', 'config_image_compare_height', '100', 0),
(3745, 0, 'alipay', 'alipay_trade_finished', '7', 0),
(3746, 0, 'alipay', 'alipay_status', '0', 0),
(3744, 0, 'alipay', 'alipay_wait_buyer_confirm', '7', 0),
(3743, 0, 'alipay', 'alipay_wait_seller_send', '7', 0),
(3742, 0, 'alipay', 'alipay_wait_buyer_pay', '7', 0),
(3740, 0, 'alipay', 'alipay_currency_code', 'CNY', 0),
(3741, 0, 'alipay', 'alipay_order_status_id', '7', 0),
(3738, 0, 'alipay', 'alipay_security_code', '63yf4qs9ht0t6ufjhcqeecsjy5488x77', 0),
(4800, 0, 'config', 'config_image_compare_width', '100', 0),
(4799, 0, 'config', 'config_image_related_height', '300', 0),
(4798, 0, 'config', 'config_image_related_width', '300', 0),
(2420, 0, 'alipaybank', 'alipaybank_total', '0.01', 0),
(2421, 0, 'alipaybank', 'alipaybank_key', '4z13uewj5od9ktghb29lq7gdi2n05y77', 0),
(2422, 0, 'alipaybank', 'alipaybank_merid', '2088711473900778', 0),
(2423, 0, 'alipaybank', 'alipaybank_seller_email', 'payment@opencart.cn', 0),
(2424, 0, 'alipaybank', 'alipaybank_order_status_id', '15', 0),
(2425, 0, 'alipaybank', 'alipaybank_status', '1', 0),
(2426, 0, 'alipaybank', 'alipaybank_sort_order', '1', 0),
(2548, 0, 'ncategory', 'ncategory_status', '1', 0),
(2549, 0, 'ncategory', 'ncategory_bnews_order', '0', 0),
(2550, 0, 'ncategory', 'ncategory_bnews_display_style', '0', 0),
(2551, 0, 'ncategory', 'ncategory_bnews_tplpick', '0', 0),
(2552, 0, 'ncategory', 'ncategory_bnews_display_elements', '["name","image","da","du","author","category","desc","button","com"]', 1),
(2553, 0, 'ncategory', 'ncategory_bnews_image_width', '80', 0),
(2554, 0, 'ncategory', 'ncategory_bnews_image_height', '80', 0),
(2555, 0, 'ncategory', 'ncategory_bnews_thumb_width', '230', 0),
(2546, 0, 'kuaidi_chaxun', 'kuaidi_chaxun_key', 'e2f9a1e16125fcc5', 0),
(2547, 0, 'kuaidi_chaxun', 'kuaidi_chaxun_shuju', '[{"code":"shentong","name":"\\u7533\\u901a","status":"1","sort_order":"1"},{"code":"ems","name":"EMS","status":"1","sort_order":"2"},{"code":"shunfeng","name":"\\u987a\\u4e30\\u901f\\u9012","status":"1","sort_order":"3"},{"code":"yuantong","name":"\\u5706\\u901a\\u901f\\u9012","status":"1","sort_order":"4"},{"code":"zhongtong","name":"\\u4e2d\\u901a\\u901f\\u9012","status":"1","sort_order":"5"},{"code":"yunda","name":"\\u97f5\\u8fbe\\u5feb\\u8fd0","status":"1","sort_order":"6"},{"code":"tiantian","name":"\\u5929\\u5929\\u5feb\\u9012","status":"1","sort_order":"7"},{"code":"huitongkuaidi","name":"\\u6c47\\u901a\\u5feb\\u8fd0","status":"1","sort_order":"8"},{"code":"quanfengkuaidi","name":"\\u5168\\u5cf0\\u5feb\\u9012","status":"1","sort_order":"9"},{"code":"debangwuliu","name":"\\u5fb7\\u90a6\\u7269\\u6d41","status":"1","sort_order":"10"},{"code":"zhaijisong","name":"\\u5b85\\u6025\\u9001","status":"1","sort_order":"11"}]', 1),
(2557, 0, 'ncategory', 'ncategory_bnews_catalog_limit', '14', 0),
(2558, 0, 'ncategory', 'ncategory_bnews_admin_limit', '20', 0),
(2559, 0, 'ncategory', 'ncategory_bnews_headlines_url', 'blog-headlines', 0),
(2560, 0, 'ncategory', 'ncategory_bnews_desc_length', '600', 0),
(2561, 0, 'ncategory', 'ncategory_bnews_disqus_status', '0', 0),
(2562, 0, 'ncategory', 'ncategory_bnews_disqus_sname', 'short_name', 0),
(2563, 0, 'ncategory', 'ncategory_bnews_fbcom_status', '0', 0),
(2564, 0, 'ncategory', 'ncategory_bnews_fbcom_appid', '', 0),
(2565, 0, 'ncategory', 'ncategory_bnews_fbcom_posts', '10', 0),
(2566, 0, 'ncategory', 'ncategory_bnews_fbcom_theme', 'dark', 0),
(2567, 0, 'ncategory', 'ncategory_bnews_facebook_tags', '0', 0),
(2568, 0, 'ncategory', 'ncategory_bnews_twitter_tags', '0', 0),
(2569, 0, 'news_archive', 'news_archive_status', '1', 0),
(2570, 0, 'news_archive', 'news_archive_build', '0', 0),
(2571, 0, 'news_archive', 'news_archive_date', 'da', 0),
(2572, 0, 'news_archive', 'news_archive_months', '{"jan":{"2":"2016\\u5e741\\u6708"},"feb":{"2":"2016\\u5e742\\u6708"},"march":{"2":"2016\\u5e743\\u6708"},"april":{"2":"2016\\u5e744\\u6708"},"may":{"2":"2016\\u5e745\\u6708"},"june":{"2":"2016\\u5e746\\u6708"},"july":{"2":"2016\\u5e747\\u6708"},"aug":{"2":"2016\\u5e748\\u6708"},"sep":{"2":"2016\\u5e749\\u6708"},"oct":{"2":"2016\\u5e7410\\u6708"},"nov":{"2":"2016\\u5e7411\\u6708"},"dec":{"2":"2016\\u5e7412\\u6708"}}', 1),
(2690, 0, 'pim', 'pim_status', '1', 0),
(2691, 0, 'pim', 'pim_miu', '0', 0),
(2692, 0, 'pim', 'pim_deletedef', '0', 0),
(2693, 0, 'pim', 'pim_copyOverwrite', '0', 0),
(2694, 0, 'pim', 'pim_uploadOverwrite', '0', 0),
(2695, 0, 'pim', 'pim_uploadMaxSize', '999', 0),
(2696, 0, 'pim', 'pim_uploadMaxType', 'M', 0),
(2697, 0, 'pim', 'pim_language', 'zh_CN', 0),
(2698, 0, 'pim', 'pim_width', '800', 0),
(2699, 0, 'pim', 'pim_height', '400', 0),
(4797, 0, 'config', 'config_image_additional_height', '450', 0),
(4796, 0, 'config', 'config_image_additional_width', '450', 0),
(4795, 0, 'config', 'config_image_product_height', '310', 0),
(4794, 0, 'config', 'config_image_product_width', '310', 0),
(4793, 0, 'config', 'config_image_popup_height', '800', 0),
(4791, 0, 'config', 'config_image_thumb_height', '450', 0),
(4792, 0, 'config', 'config_image_popup_width', '800', 0),
(4789, 0, 'config', 'config_image_category_height', '80', 0),
(4790, 0, 'config', 'config_image_thumb_width', '450', 0),
(4788, 0, 'config', 'config_image_category_width', '80', 0),
(4787, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(4786, 0, 'config', 'config_logo', 'catalog/logo3.png', 0),
(4785, 0, 'config', 'config_captcha_page', '["return","contact"]', 1),
(4784, 0, 'config', 'config_captcha', 'basic_captcha', 0),
(4783, 0, 'config', 'config_return_status_id', '1', 0),
(4782, 0, 'config', 'config_return_id', '5', 0),
(4781, 0, 'config', 'config_affiliate_mail', '1', 0),
(4779, 0, 'config', 'config_affiliate_commission', '5', 0),
(4780, 0, 'config', 'config_affiliate_id', '5', 0),
(4777, 0, 'config', 'config_affiliate_approval', '0', 0),
(4778, 0, 'config', 'config_affiliate_auto', '0', 0),
(4776, 0, 'config', 'config_stock_checkout', '0', 0),
(4775, 0, 'config', 'config_stock_warning', '0', 0),
(4774, 0, 'config', 'config_stock_display', '0', 0),
(4773, 0, 'config', 'config_api_id', '4', 0),
(4772, 0, 'config', 'config_order_mail', '1', 0),
(4771, 0, 'config', 'config_fraud_status_id', '7', 0),
(4770, 0, 'config', 'config_unpaid_time', '0', 0),
(4768, 0, 'config', 'config_cancled_status', '2', 0),
(4769, 0, 'config', 'config_complete_time', '0', 0),
(4767, 0, 'config', 'config_shipped_status_id', '2', 0),
(4766, 0, 'config', 'config_paid_status', '["15"]', 1),
(4765, 0, 'config', 'config_unpaid_status_id', '2', 0),
(4764, 0, 'config', 'config_complete_status', '["5"]', 1),
(4763, 0, 'config', 'config_processing_status', '["2","3","5","1"]', 1),
(4762, 0, 'config', 'config_weixin_payment', '["bank_transfer","cod","weipay"]', 1),
(4761, 0, 'config', 'config_mobile_payment', '["bank_transfer","cod"]', 1),
(4760, 0, 'config', 'config_pc_payment', '["alipay_direct","bank_transfer","cod","free_checkout"]', 1),
(4759, 0, 'config', 'config_order_status_id', '1', 0),
(4758, 0, 'config', 'config_checkout_id', '5', 0),
(4757, 0, 'config', 'config_checkout_guest', '1', 0),
(4755, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(4756, 0, 'config', 'config_cart_weight', '1', 0),
(4752, 0, 'config', 'config_login_attempts', '5', 0),
(4753, 0, 'config', 'config_account_id', '3', 0),
(4754, 0, 'config', 'config_account_mail', '0', 0),
(4751, 0, 'config', 'config_customer_price', '0', 0),
(2934, 0, 'weipay', 'weipay_key', 'c213253a6ebcbdcb2585588f1dd2e1c7', 0),
(2935, 0, 'weipay', 'weipay_appid', 'wx26fcda00d566abb7', 0),
(2936, 0, 'weipay', 'weipay_mchid', '10033187', 0),
(2937, 0, 'weipay', 'weipay_appsecret', 'c0e4069e8830774ad6a031c09a78ecd7', 0),
(2938, 0, 'weipay', 'weipay_order_status_id', '5', 0),
(2939, 0, 'weipay', 'weipay_status', '1', 0),
(2940, 0, 'weipay', 'weipay_sort_order', '5', 0),
(2942, 0, 'mobile_hot_search', 'mobile_hot_search_title', '热门关键字', 0),
(2943, 0, 'mobile_hot_search', 'mobile_hot_search_status', '1', 0),
(2944, 0, 'mobile_hot_search', 'mobile_hot_search', '[{"keyword":"\\u51ac\\u88c5","href":"","style":"","sort_order":"","status":"1"},{"keyword":"\\u6625\\u88c5","href":"","style":"","sort_order":"","status":"1"},{"keyword":"\\u79cb\\u88c5","href":"","style":"","sort_order":"","status":"1"},{"keyword":"v\\u9886","href":"","style":"","sort_order":"","status":"1"}]', 1),
(4587, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(4586, 0, 'cod', 'cod_order_status_id', '1', 0),
(4750, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(4749, 0, 'config', 'config_customer_group_id', '1', 0),
(4748, 0, 'config', 'config_customer_online', '0', 0),
(4746, 0, 'config', 'config_tax_default', 'shipping', 0),
(4747, 0, 'config', 'config_tax_customer', 'shipping', 0),
(4162, 0, 'free', 'free_status', '1', 0),
(4160, 0, 'free', 'free_total', '50', 0),
(3757, 0, 'config_c123', 'config_c123_status', '1', 0),
(3755, 0, 'config_c123', 'config_c123_cgid', '52', 0),
(3756, 0, 'config_c123', 'config_c123_csid', '', 0),
(3754, 0, 'config_c123', 'config_c123_authkey', 'EB003F5666A0F96BB56DCEB29FE16C77', 0),
(4538, 0, 'mobile_category', 'mobile_category', '[{"category_id":"59","sort_order":"1","status":"1"},{"category_id":"20","sort_order":"2","status":"1"},{"category_id":"18","sort_order":"3","status":"1"},{"category_id":"57","sort_order":"4","status":"1"},{"category_id":"25","sort_order":"5","status":"1"},{"category_id":"17","sort_order":"6","status":"1"},{"category_id":"24","sort_order":"7","status":"1"},{"category_id":"32","sort_order":"8","status":"1"}]', 1),
(4539, 0, 'mobile_category', 'mobile_category_mobile_only', '1', 0),
(3739, 0, 'alipay', 'alipay_partner', '2088002964544277', 0),
(3737, 0, 'alipay', 'alipay_seller_email', 'scsunboy@sina.com', 0),
(3736, 0, 'alipay', 'alipay_total', '0.01', 0),
(4585, 0, 'cod', 'cod_total', '0.01', 0),
(4843, 0, 'alipay_direct', 'alipay_direct_sort_order', '', 0),
(4842, 0, 'alipay_direct', 'alipay_direct_status', '1', 0),
(4841, 0, 'alipay_direct', 'alipay_direct_trade_finished', '15', 0),
(4839, 0, 'alipay_direct', 'alipay_direct_partner', '2099002964544269', 0),
(4840, 0, 'alipay_direct', 'alipay_direct_currency_code', 'CNY', 0),
(4838, 0, 'alipay_direct', 'alipay_direct_security_code', '63yf4qs9ht0t6ufjhcqeecsjy5477xpy', 0),
(4837, 0, 'alipay_direct', 'alipay_direct_seller_email', 'pay@opencart.cn', 0),
(4836, 0, 'alipay_direct', 'alipay_direct_total', '0.01', 0),
(3378, 0, 'qq_login', 'qq_login_status', '1', 0),
(3384, 0, 'weibo_login', 'weibo_login_status', '1', 0),
(3753, 0, 'config_c123', 'config_c123_ac', '9001@501238260007', 0),
(3758, 0, 'google_analytics', 'google_analytics_code', '&lt;script&gt;\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(&quot;script&quot;);\r\n  hm.src = &quot;//hm.baidu.com/hm.js?752079c169218184ec5f539120602ec2&quot;;\r\n  var s = document.getElementsByTagName(&quot;script&quot;)[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n&lt;/script&gt;', 0),
(3759, 0, 'google_analytics', 'google_analytics_status', '1', 0),
(4536, 0, 'mobile_category', 'mobile_category_title', '手机首页商品分类', 0),
(4537, 0, 'mobile_category', 'mobile_category_status', '1', 0),
(4745, 0, 'config', 'config_tax', '0', 0),
(4579, 0, 'bank_transfer', 'bank_transfer_bank2', '下单后请将货款转账到成都招商银行天府支行\r\n开户名：成都光大网络科技有限公司 \r\n账号： 62260908888888', 0),
(4584, 0, 'bank_transfer', 'bank_transfer_sort_order', '', 0),
(4589, 0, 'cod', 'cod_sort_order', '5', 0),
(4744, 0, 'config', 'config_voucher_max', '1000', 0),
(4724, 0, 'config', 'config_fax', '', 0),
(4725, 0, 'config', 'config_image', '', 0),
(4726, 0, 'config', 'config_open', '', 0),
(4727, 0, 'config', 'config_comment', '', 0),
(4728, 0, 'config', 'config_country_id', '23', 0),
(4729, 0, 'config', 'config_zone_id', '251', 0),
(4730, 0, 'config', 'config_language', 'zh_CN', 0),
(4731, 0, 'config', 'config_admin_language', 'zh_CN', 0),
(4732, 0, 'config', 'config_currency', 'CNY', 0),
(4733, 0, 'config', 'config_currency_auto', '0', 0),
(4734, 0, 'config', 'config_length_class_id', '1', 0),
(4735, 0, 'config', 'config_weight_class_id', '1', 0),
(4736, 0, 'config', 'config_product_count', '1', 0),
(4737, 0, 'config', 'config_product_limit', '15', 0),
(4738, 0, 'config', 'config_product_description_length', '100', 0),
(4739, 0, 'config', 'config_limit_admin', '20', 0),
(4740, 0, 'config', 'config_review_status', '1', 0),
(4741, 0, 'config', 'config_review_guest', '1', 0),
(4742, 0, 'config', 'config_review_mail', '0', 0),
(4743, 0, 'config', 'config_voucher_min', '1', 0),
(4721, 0, 'config', 'config_geocode', '4OS1ut0EX72MCu0R3P1lqCTu', 0),
(4722, 0, 'config', 'config_email', 'support@opencart.cn', 0),
(4723, 0, 'config', 'config_telephone', '028-87966209', 0),
(4715, 0, 'config', 'config_meta_keyword', 'OpenCart中文专业版2.1,由www.opencart.cn出品', 0),
(4716, 0, 'config', 'config_template', 'monkey', 0),
(4717, 0, 'config', 'config_layout_id', '4', 0),
(4718, 0, 'config', 'config_name', 'OpenCart中文专业版2.1', 0),
(4719, 0, 'config', 'config_owner', 'sunboy', 0),
(4720, 0, 'config', 'config_address', '成都市高新西区天目路77号保利香槟国际  成都光大网络科技有限公司', 0),
(4714, 0, 'config', 'config_meta_description', 'OpenCart中文专业版2.1,由www.opencart.cn出品', 0),
(4713, 0, 'config', 'config_meta_title', 'OpenCart中文专业版2.1', 0),
(4833, 0, 'config', 'config_error_display', '0', 0),
(4834, 0, 'config', 'config_error_log', '1', 0),
(4835, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 2, '任有货'),
(5, 2, '已售罄'),
(6, 2, '请等2-3天'),
(8, 2, '需预定');

-- --------------------------------------------------------

--
-- 表的结构 `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 转存表中的数据 `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- 转存表中的数据 `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- 表的结构 `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_url_alias`
--

DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=899 ;

--
-- 转存表中的数据 `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(824, 'product_id=48', 'ipod-classic'),
(887, 'category_id=20', 'desktops'),
(888, 'category_id=26', 'pc'),
(889, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(844, 'information_id=4', 'about_us'),
(768, 'product_id=42', 'test'),
(781, 'category_id=36', 'test2'),
(875, 'category_id=18', 'laptop-notebook'),
(874, 'category_id=46', 'macs'),
(873, 'category_id=45', 'windows'),
(886, 'category_id=25', 'component'),
(895, 'category_id=29', 'mouse'),
(893, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(891, 'category_id=30', 'printer'),
(892, 'category_id=31', 'scanner'),
(894, 'category_id=32', 'web-camera'),
(876, 'category_id=57', 'tablet'),
(878, 'category_id=17', 'software'),
(884, 'category_id=24', 'smartphone'),
(885, 'category_id=33', 'camera'),
(898, 'category_id=62', 'opencart-pro-buy.html'),
(809, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(890, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(851, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(848, 'information_id=6', 'delivery'),
(846, 'information_id=3', 'privacy'),
(845, 'information_id=5', 'terms'),
(869, 'news/headlines', 'blogspage');

-- --------------------------------------------------------

--
-- 表的结构 `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_user`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/askquestion","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/nauthor","catalog\\/ncategory","catalog\\/ncomments","catalog\\/news","catalog\\/option","catalog\\/oreview","catalog\\/product","catalog\\/product_quick","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/newspanel","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/city","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/category3","module\\/featured","module\\/filter","module\\/flash_sale","module\\/google_hangouts","module\\/html","module\\/information","module\\/kuaidi_chaxun","module\\/latest","module\\/ncategory","module\\/news","module\\/news_archive","module\\/online","module\\/qq_login","module\\/slideshow","module\\/special","module\\/store","module\\/weibo_login","payment\\/alipay","payment\\/alipaybank","payment\\/bank_transfer","payment\\/cod","payment\\/free_checkout","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","sale\\/withdraw","setting\\/setting","setting\\/store","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/pickup","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/news","module\\/news_archive","module\\/ncategory","module\\/flash_sale","module\\/flash_sale","module\\/pim","module\\/latest","module\\/special","payment\\/weipay","module\\/mobile_slideshow","module\\/mobile_category","module\\/mobile_latest","module\\/mobile_featured","module\\/mobile_banner","module\\/mobile_hot_search","module\\/sms","module\\/mobile_category","payment\\/alipay_direct","analytics\\/google_analytics"],"modify":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/askquestion","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/nauthor","catalog\\/ncategory","catalog\\/ncomments","catalog\\/news","catalog\\/option","catalog\\/oreview","catalog\\/product","catalog\\/product_quick","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/newspanel","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/city","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/category3","module\\/featured","module\\/filter","module\\/flash_sale","module\\/google_hangouts","module\\/html","module\\/information","module\\/kuaidi_chaxun","module\\/latest","module\\/ncategory","module\\/news","module\\/news_archive","module\\/online","module\\/qq_login","module\\/slideshow","module\\/special","module\\/store","module\\/weibo_login","payment\\/alipay","payment\\/alipaybank","payment\\/bank_transfer","payment\\/cod","payment\\/free_checkout","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","sale\\/withdraw","setting\\/setting","setting\\/store","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/pickup","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/news","module\\/news_archive","module\\/ncategory","module\\/flash_sale","module\\/flash_sale","module\\/pim","module\\/latest","module\\/special","payment\\/weipay","module\\/mobile_slideshow","module\\/mobile_category","module\\/mobile_latest","module\\/mobile_featured","module\\/mobile_banner","module\\/mobile_hot_search","module\\/sms","module\\/mobile_category","payment\\/alipay_direct","analytics\\/google_analytics"]}'),
(10, 'Demonstration', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/askquestion","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/nauthor","catalog\\/ncategory","catalog\\/ncomments","catalog\\/news","catalog\\/option","catalog\\/oreview","catalog\\/product","catalog\\/product_quick","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/newspanel","common\\/profile","common\\/sass","common\\/stats","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/articles_google_base","feed\\/articles_google_sitemap","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/city","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/category3","module\\/featured","module\\/filter","module\\/flash_sale","module\\/google_hangouts","module\\/html","module\\/information","module\\/kuaidi_chaxun","module\\/latest","module\\/mobile_banner","module\\/mobile_category","module\\/mobile_featured","module\\/mobile_hot_search","module\\/mobile_latest","module\\/mobile_slideshow","module\\/ncategory","module\\/news","module\\/news_archive","module\\/online","module\\/pim","module\\/qq_login","module\\/slideshow","module\\/sms","module\\/special","module\\/store","payment\\/alipaybank","payment\\/bank_transfer","payment\\/cod","payment\\/free_checkout","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","sale\\/withdraw","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/pickup","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission"]}');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_voucher`
--

INSERT INTO `oc_voucher` (`voucher_id`, `order_id`, `code`, `from_name`, `from_email`, `to_name`, `to_email`, `voucher_theme_id`, `message`, `amount`, `status`, `date_added`) VALUES
(1, 14, 'cgMFKCqamL', 'mengwb', 'mengwb@qq.com', 'mengwb', 'mengwb@qq.com', 7, 'fdsafds', '100.0000', 1, '2016-01-19 21:23:21'),
(2, 1006475, 'nIugl083Mh', 'opencart', 'support@opencart.cn', '吴林', '1134297816@qq.com', 8, '礼品券测试下', '1.0000', 1, '2016-02-11 23:12:07'),
(3, 1006476, 'jhQmsxkQhX', 'opencart', 'support@opencart.cn', '吴林', '1134297816@qq.com', 8, '礼品券测试下', '1.0000', 1, '2016-02-11 23:12:27'),
(4, 1006483, '6zgqu9Xqdd', 'opencart', 'support@opencart.cn', 'opencart', '9358972@qq.com', 8, '送给你礼券', '1.0000', 1, '2016-02-12 23:49:04'),
(8, 1006486, '3BzyaKeLbU', 'liangleiguang ', 'llg288@163.com', 'opencart', '9358972@qq.com', 8, '给你的礼券，记得使用哦。 from llg', '1.0000', 1, '2016-02-13 10:32:15'),
(6, 1006484, 'lCjwgQi8J2', 'liangleiguang ', 'llg288@163.com', 'opencart', 'support@opencart.cn', 7, '生日礼物 18元', '18.0000', 1, '2016-02-13 10:15:06'),
(7, 1006485, 'wN0G2ZcdAJ', 'liangleiguang ', 'llg288@163.com', 'opencart', '9358972@qq.com', 8, 'llg to 9358972的', '1.0000', 1, '2016-02-13 10:22:08');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 2, '圣诞'),
(7, 2, '生日'),
(8, 2, '普通');

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000');

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, '千克 ', 'kg'),
(2, 2, '克  ', 'g');

-- --------------------------------------------------------

--
-- 表的结构 `oc_withdraw`
--

DROP TABLE IF EXISTS `oc_withdraw`;
CREATE TABLE IF NOT EXISTS `oc_withdraw` (
  `withdraw_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `bank_account` varchar(32) NOT NULL DEFAULT '',
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `refused` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` varchar(32) NOT NULL DEFAULT '',
  `message` varchar(256) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`withdraw_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4226 ;

--
-- 转存表中的数据 `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(27, 3, '沧州', 'cz', 1),
(26, 3, '承德', 'cd', 1),
(25, 3, '张家口', 'zjk', 1),
(24, 3, '保定', 'bd', 1),
(23, 3, '邢台', 'xt', 1),
(22, 3, '邯郸', 'hd', 1),
(21, 3, '秦皇岛', 'qhd', 1),
(20, 3, '唐山', 'ts', 1),
(19, 3, '石家庄', 'sjz', 1),
(28, 3, '廊坊', 'lf', 1),
(29, 3, '衡水', 'hs', 1),
(30, 4, '太原', 'ty', 1),
(31, 4, '大同', 'dt', 1),
(32, 4, '阳泉', 'yq', 1),
(33, 4, '长治', 'cz', 1),
(34, 4, '晋城', 'jc', 1),
(35, 4, '朔州', 'sz', 1),
(36, 4, '晋中', 'jz', 1),
(37, 4, '运城', 'yc', 1),
(38, 4, '忻州', 'xz', 1),
(39, 4, '临汾', 'lf', 1),
(40, 4, '吕梁地', 'lld', 1),
(41, 5, '呼和浩特', 'hhht', 1),
(42, 5, '包头', 'bt', 1),
(43, 5, '乌海', 'wh', 1),
(44, 5, '赤峰', 'cf', 1),
(45, 5, '通辽', 'tl', 1),
(46, 5, '鄂尔多斯', 'eeds', 1),
(47, 5, '呼伦贝尔', 'hlbe', 1),
(48, 5, '乌兰察布', 'wlcbm', 1),
(49, 5, '锡林郭勒', 'xlglm', 1),
(50, 5, '巴彦淖尔', 'bynem', 1),
(51, 5, '阿拉善', 'alsm', 1),
(52, 5, '兴安', 'xam', 1),
(53, 6, '沈阳', 'sy', 1),
(54, 6, '大连', 'dl', 1),
(55, 6, '鞍山', 'as', 1),
(56, 6, '抚顺', 'fs', 1),
(57, 6, '本溪', 'bx', 1),
(58, 6, '丹东', 'dd', 1),
(59, 6, '锦州', 'jz', 1),
(60, 6, '葫芦岛', 'hld', 1),
(61, 6, '营口', 'yk', 1),
(62, 6, '盘锦', 'pj', 1),
(63, 6, '阜新', 'fx', 1),
(64, 6, '辽阳', 'ly', 1),
(65, 6, '铁岭', 'tl', 1),
(66, 6, '朝阳', 'cy', 1),
(67, 7, '长春', 'cc', 1),
(68, 7, '吉林', 'jl', 1),
(69, 7, '四平', 'sp', 1),
(70, 7, '辽源', 'ly', 1),
(71, 7, '通化', 'th', 1),
(72, 7, '白山', 'bs', 1),
(73, 7, '松原', 'sy', 1),
(74, 7, '白城', 'bc', 1),
(75, 7, '延边', 'yb', 1),
(76, 8, '哈尔滨', 'heb', 1),
(77, 8, '齐齐哈尔', 'qqhe', 1),
(78, 8, '鹤岗', 'hg', 1),
(79, 8, '双鸭山', 'sys', 1),
(80, 8, '鸡西', 'jx', 1),
(81, 8, '大庆', 'dq', 1),
(82, 8, '伊春', 'yc', 1),
(83, 8, '牡丹江', 'mdj', 1),
(84, 8, '佳木斯', 'jms', 1),
(85, 8, '七台河', 'qth', 1),
(86, 8, '黑河', 'hh', 1),
(87, 8, '绥化', 'sh', 1),
(88, 8, '大兴安岭', 'dxald', 1),
(89, 10, '南京', 'nj', 1),
(90, 10, '徐州', 'xz', 1),
(91, 10, '连云港', 'lyg', 1),
(92, 10, '淮安', 'ha', 1),
(93, 10, '宿迁', 'sq', 1),
(94, 10, '盐城', 'yc', 1),
(95, 10, '扬州', 'yz', 1),
(96, 10, '泰州', 'tz', 1),
(97, 10, '南通', 'nt', 1),
(98, 10, '镇江', 'zj', 1),
(99, 10, '常州', 'cz', 1),
(100, 10, '无锡', 'wx', 1),
(101, 10, '苏州', 'sz', 1),
(102, 11, '杭州', 'hz', 1),
(103, 11, '宁波', 'nb', 1),
(104, 11, '温州', 'wz', 1),
(105, 11, '嘉兴', 'jx', 1),
(106, 11, '湖州', 'hz', 1),
(107, 11, '绍兴', 'sx', 1),
(108, 11, '金华', 'jh', 1),
(109, 11, '衢州', 'xz', 1),
(110, 11, '舟山', 'zs', 1),
(111, 11, '台州', 'tz', 1),
(112, 11, '丽水', 'ls', 1),
(113, 12, '合肥', 'hf', 1),
(114, 12, '芜湖', 'wh', 1),
(115, 12, '蚌埠', 'bb', 1),
(116, 12, '淮南', 'hn', 1),
(117, 12, '马鞍山', 'mas', 1),
(118, 12, '淮北', 'hb', 1),
(119, 12, '铜陵', 'tl', 1),
(120, 12, '安庆', 'aq', 1),
(121, 12, '黄山', 'hs', 1),
(122, 12, '滁州', 'cz', 1),
(123, 12, '阜阳', 'fy', 1),
(124, 12, '宿州', 'sz', 1),
(125, 12, '巢湖', 'ch', 1),
(126, 12, '六安', 'la', 1),
(127, 12, '亳州', 'hz', 1),
(128, 12, '池州', 'cz', 1),
(129, 12, '宣城', 'xc', 1),
(130, 13, '福州', 'fz', 1),
(131, 13, '厦门', 'xm', 1),
(132, 13, '三明', 'sm', 1),
(133, 13, '莆田', 'pt', 1),
(134, 13, '泉州', 'qz', 1),
(135, 13, '漳州', 'zz', 1),
(136, 13, '南平', 'np', 1),
(137, 13, '龙岩', 'ly', 1),
(138, 13, '宁德', 'nd', 1),
(139, 14, '南昌', 'nc', 1),
(140, 14, '景德镇', 'jdz', 1),
(141, 14, '萍乡', 'px', 1),
(142, 14, '九江', 'jj', 1),
(143, 14, '新余', 'xy', 1),
(144, 14, '鹰潭', 'yt', 1),
(145, 14, '赣州', 'gz', 1),
(146, 14, '吉安', 'ja', 1),
(147, 14, '宜春', 'yc', 1),
(148, 14, '抚州', 'fz', 1),
(149, 14, '上饶', 'sr', 1),
(150, 15, '济南', 'jn', 1),
(151, 15, '青岛', 'qd', 1),
(152, 15, '淄博', 'zb', 1),
(153, 15, '枣庄', 'zz', 1),
(154, 15, '东营', 'dy', 1),
(155, 15, '潍坊', 'wf', 1),
(156, 15, '烟台', 'yt', 1),
(157, 15, '威海', 'wh', 1),
(158, 15, '济宁', 'jn', 1),
(159, 15, '泰安', 'ta', 1),
(160, 15, '日照', 'rz', 1),
(161, 15, '莱芜', 'lw', 1),
(162, 15, '临沂', 'ly', 1),
(163, 15, '德州', 'dz', 1),
(164, 15, '聊城', 'lc', 1),
(165, 15, '滨州', 'bz', 1),
(166, 15, '菏泽', 'hz', 1),
(167, 16, '郑州', 'zz', 1),
(168, 16, '开封', 'kf', 1),
(169, 16, '洛阳', 'ly', 1),
(170, 16, '平顶山', 'pds', 1),
(171, 16, '焦作', 'jz', 1),
(172, 16, '鹤壁', 'hb', 1),
(173, 16, '新乡', 'xx', 1),
(174, 16, '安阳', 'ay', 1),
(175, 16, '濮阳', 'y', 1),
(176, 16, '许昌', 'xc', 1),
(177, 16, '漯河', 'h', 1),
(178, 16, '三门峡', 'smx', 1),
(179, 16, '南阳', 'ny', 1),
(180, 16, '商丘', 'sq', 1),
(181, 16, '信阳', 'xy', 1),
(182, 16, '周口', 'zk', 1),
(183, 16, '驻马店', 'zmd', 1),
(185, 17, '武汉', 'wh', 1),
(186, 17, '黄石', 'hs', 1),
(187, 17, '襄樊', 'xf', 1),
(188, 17, '十堰', 'sy', 1),
(189, 17, '荆州', 'jz', 1),
(190, 17, '宜昌', 'yc', 1),
(191, 17, '荆门', 'jm', 1),
(192, 17, '鄂州', 'ez', 1),
(193, 17, '孝感', 'xg', 1),
(194, 17, '黄冈', 'hg', 1),
(195, 17, '咸宁', 'xn', 1),
(196, 17, '随州', 'sz', 1),
(197, 17, '恩施', 'es', 1),
(198, 17, '直辖行政单位', 'zxxzdw', 1),
(199, 18, '长沙', 'cs', 1),
(200, 18, '株洲', 'zz', 1),
(201, 18, '湘潭', 'xt', 1),
(202, 18, '衡阳', 'hy', 1),
(203, 18, '邵阳', 'sy', 1),
(204, 18, '岳阳', 'yy', 1),
(205, 18, '常德', 'cd', 1),
(206, 18, '张家界', 'zjj', 1),
(207, 18, '益阳', 'yy', 1),
(208, 18, '郴州', 'cz', 1),
(209, 18, '永州', 'yz', 1),
(210, 18, '怀化', 'hh', 1),
(211, 18, '娄底', 'ld', 1),
(212, 18, '湘西', 'xx', 1),
(213, 19, '广州', 'gz', 1),
(214, 19, '深圳', 'sz', 1),
(215, 19, '珠海', 'zh', 1),
(216, 19, '汕头', 'st', 1),
(217, 19, '韶关', 'sg', 1),
(218, 19, '河源', 'hy', 1),
(219, 19, '梅州', 'mz', 1),
(220, 19, '惠州', 'hz', 1),
(221, 19, '汕尾', 'sw', 1),
(222, 19, '东莞', 'd', 1),
(223, 19, '中山', 'zs', 1),
(224, 19, '江门', 'jm', 1),
(225, 19, '佛山', 'fs', 1),
(226, 19, '阳江', 'yj', 1),
(227, 19, '湛江', 'zj', 1),
(228, 19, '茂名', 'mm', 1),
(229, 19, '肇庆', 'zq', 1),
(230, 19, '清远', 'qy', 1),
(231, 19, '潮州', 'cz', 1),
(232, 19, '揭阳', 'jy', 1),
(233, 19, '云浮', 'yf', 1),
(234, 20, '南宁', 'nn', 1),
(235, 20, '柳州', 'lz', 1),
(236, 20, '桂林', 'gl', 1),
(237, 20, '梧州', 'wz', 1),
(238, 20, '北海', 'bh', 1),
(239, 20, '防城港', 'fcg', 1),
(240, 20, '钦州', 'qz', 1),
(241, 20, '贵港', 'gg', 1),
(242, 20, '玉林', 'yl', 1),
(243, 20, '百色', 'bs', 1),
(244, 20, '贺州', 'hz', 1),
(245, 20, '河池', 'hc', 1),
(246, 20, '来宾', 'lb', 1),
(247, 20, '崇左', 'cz', 1),
(248, 21, '海口', 'hk', 1),
(249, 21, '三亚', 'sy', 1),
(250, 21, '市辖区', 'hnsxq', 1),
(251, 23, '成都', 'cd', 1),
(252, 23, '自贡', 'zg', 1),
(253, 23, '攀枝花', 'pzh', 1),
(254, 23, '泸州', 'lz', 1),
(255, 23, '德阳', 'dy', 1),
(256, 23, '绵阳', 'my', 1),
(257, 23, '广元', 'gy', 1),
(258, 23, '遂宁', 'sn', 1),
(259, 23, '内江', 'nj', 1),
(260, 23, '乐山', 'ls', 1),
(261, 23, '南充', 'nc', 1),
(262, 23, '宜宾', 'yb', 1),
(263, 23, '广安', 'ga', 1),
(264, 23, '达州', 'dz', 1),
(265, 23, '眉山', 'ms', 1),
(266, 23, '雅安', 'ya', 1),
(267, 23, '巴中', 'bz', 1),
(268, 23, '资阳', 'zy', 1),
(269, 23, '阿坝', 'ab', 1),
(270, 23, '甘孜', 'gz', 1),
(271, 23, '凉山', 'ls', 1),
(272, 24, '贵阳', 'gy', 1),
(273, 24, '六盘水', 'lps', 1),
(274, 24, '遵义', 'zy', 1),
(275, 24, '安顺', 'as', 1),
(276, 24, '铜仁地', 'trd', 1),
(277, 24, '毕节地', 'bjd', 1),
(278, 24, '黔西南', 'qxn', 1),
(279, 24, '黔东南', 'qdn', 1),
(280, 24, '黔南', 'qn', 1),
(281, 25, '昆明', 'km', 1),
(282, 25, '曲靖', 'qj', 1),
(283, 25, '玉溪', 'yx', 1),
(284, 25, '保山', 'bs', 1),
(285, 25, '昭通', 'zt', 1),
(286, 25, '思茅', 'smd', 1),
(287, 25, '临沧', 'lcd', 1),
(288, 25, '丽江', 'lj', 1),
(289, 25, '文山', 'ws', 1),
(290, 25, '红河', 'hh', 1),
(291, 25, '西双版纳', 'xsbn', 1),
(292, 25, '楚雄', 'cx', 1),
(293, 25, '大理', 'dl', 1),
(294, 25, '德宏', 'dh', 1),
(295, 25, '怒江', 'nj', 1),
(296, 25, '迪庆', 'dq', 1),
(297, 26, '拉萨', 'ls', 1),
(298, 26, '那曲', 'nqd', 1),
(299, 26, '昌都', 'cdd', 1),
(300, 26, '山南', 'snd', 1),
(301, 26, '日喀则', 'rkzd', 1),
(302, 26, '阿里', 'ald', 1),
(303, 26, '林芝', 'lzd', 1),
(304, 27, '西安', 'xa', 1),
(305, 27, '铜川', 'tc', 1),
(306, 27, '宝鸡', 'bj', 1),
(307, 27, '咸阳', 'xy', 1),
(308, 27, '渭南', 'wn', 1),
(309, 27, '延安', 'ya', 1),
(310, 27, '汉中', 'hz', 1),
(311, 27, '榆林', 'yl', 1),
(312, 27, '安康', 'ak', 1),
(313, 27, '商洛', 'sl', 1),
(314, 28, '兰州', 'lz', 1),
(315, 28, '金昌', 'jc', 1),
(316, 28, '白银', 'by', 1),
(317, 28, '天水', 'ts', 1),
(318, 28, '嘉峪关', 'jyg', 1),
(319, 28, '武威', 'ww', 1),
(320, 28, '张掖', 'zy', 1),
(321, 28, '平凉', 'pl', 1),
(322, 28, '酒泉', 'jq', 1),
(323, 28, '庆阳', 'qy', 1),
(324, 28, '定西', 'dxd', 1),
(325, 28, '陇南', 'lnd', 1),
(326, 28, '甘南', 'gn', 1),
(327, 28, '临夏', 'lx', 1),
(328, 29, '西宁', 'xn', 1),
(329, 29, '海东', 'hdd', 1),
(330, 29, '海北', 'hb', 1),
(331, 29, '黄南', 'hn', 1),
(332, 29, '海南', 'hn', 1),
(333, 29, '果洛', 'gl', 1),
(334, 29, '玉树', 'ys', 1),
(335, 29, '海西', 'hx', 1),
(336, 30, '银川', 'yc', 1),
(337, 30, '石嘴山', 'szs', 1),
(338, 30, '吴忠', 'wz', 1),
(339, 30, '固原', 'gy', 1),
(340, 31, '乌鲁木齐', 'wlmq', 1),
(341, 31, '克拉玛依', 'klmy', 1),
(343, 31, '吐鲁番', 'tlfd', 1),
(344, 31, '哈密', 'hmd', 1),
(345, 31, '和田', 'htd', 1),
(346, 31, '阿克苏', 'aksd', 1),
(347, 31, '喀什', 'ksd', 1),
(348, 31, '克孜勒苏', 'kzls', 1),
(349, 31, '巴音郭楞', 'bygl', 1),
(350, 31, '昌吉', 'cj', 1),
(351, 31, '博尔塔拉', 'betl', 1),
(352, 31, '伊犁', 'yl', 1),
(353, 31, '塔城', 'tcd', 1),
(354, 31, '阿勒泰', 'altd', 1),
(355, 9, '市辖区', 'null', 1),
(356, 9, '县', 'null', 1),
(357, 22, '市辖区', 'null', 1),
(358, 22, '市', 'null', 1),
(359, 22, '县', 'null', 1),
(360, 2, '市辖区', 'null', 1),
(361, 2, '县', 'null', 1),
(4225, 1, '市辖区', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 9, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(2, 25, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(3, 5, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(4, 1, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(5, 34, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(6, 7, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(7, 23, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(8, 2, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(9, 30, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(10, 12, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(11, 15, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(12, 4, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(13, 19, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(14, 20, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(15, 31, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(16, 10, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(17, 14, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(18, 3, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(19, 16, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(20, 11, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(21, 21, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(22, 17, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(23, 18, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(24, 33, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(25, 28, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(26, 13, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(27, 26, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(28, 24, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(29, 6, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(30, 22, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(31, 27, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(32, 29, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(33, 32, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(34, 8, 0, 4, '2016-01-18 20:53:51', '0000-00-00 00:00:00'),
(50, 15, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00'),
(49, 34, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00'),
(48, 14, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00'),
(47, 13, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00'),
(46, 12, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00'),
(45, 10, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00'),
(44, 11, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00'),
(43, 9, 0, 3, '2016-02-12 22:20:15', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

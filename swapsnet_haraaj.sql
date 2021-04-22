-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 21, 2021 at 12:45 PM
-- Server version: 5.7.33-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swapsnet_haraaj`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

CREATE TABLE `advertising` (
  `id` int(10) UNSIGNED NOT NULL,
  `integration` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'unitSlot or autoFit',
  `is_responsive` tinyint(1) DEFAULT '0',
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Translated in the languages files',
  `tracking_code_large` mediumtext COLLATE utf8mb4_unicode_ci,
  `tracking_code_medium` mediumtext COLLATE utf8mb4_unicode_ci,
  `tracking_code_small` mediumtext COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`id`, `integration`, `is_responsive`, `slug`, `provider_name`, `description`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'unitSlot', 0, 'top', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 0),
(2, 'unitSlot', 0, 'bottom', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 0),
(3, 'autoFit', 1, 'auto', 'Google AdSense', 'advertising_autoFit_hint', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8mb4_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `is_for_permanent` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `is_for_permanent`, `active`) VALUES
(1, NULL, '{\"en\":\"Automobiles\",\"fr\":\"Auto & Moto\",\"es\":\"Automóviles\",\"ar\":\"السيارات\",\"pt\":\"Automóveis\",\"ru\":\"Автомобили\",\"tr\":\"Otomobil\",\"th\":\"รถยนต์\",\"ka\":\"ავტომობილები\",\"zh\":\"汽车类\",\"ja\":\"自動車\",\"it\":\"Automobili\",\"ro\":\"Automobile\"}', 'automobiles', NULL, 'app/categories/skin-green/car.png', 'fa fa-car', 1, 10, 0, 'classified', 0, 1),
(2, 1, '{\"en\":\"Cars\",\"ar\":\"سيارت\"}', 'cars', '{\"ar\":null}', NULL, NULL, 2, 3, 1, 'classified', 0, 1),
(3, 1, '{\"en\":\"Buses & Minibus\",\"ar\":\"حافلات ونقليات\"}', 'buses-and-minibus', '{\"ar\":null}', NULL, NULL, 3, 4, 1, 'classified', 0, 1),
(4, 1, '{\"en\":\"Heavy Equipment\"}', 'heavy-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 4, 5, 1, 'classified', 0, 1),
(5, 1, '{\"en\":\"Motorcycles & Scooters\"}', 'motorcycles-and-scooters', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 5, 6, 1, 'classified', 0, 1),
(6, 1, '{\"en\":\"Trucks & Trailers\"}', 'trucks-and-trailers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 6, 7, 1, 'classified', 0, 1),
(7, 1, '{\"en\":\"Vehicle Parts & Accessories\"}', 'car-parts-and-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 7, 8, 1, 'classified', 0, 1),
(8, 1, '{\"en\":\"Watercraft & Boats\"}', 'watercraft-and-boats', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 8, 9, 1, 'classified', 0, 1),
(9, NULL, '{\"en\":\"Phones & Tablets\",\"fr\":\"Smartphone & Tablettes\",\"es\":\"Smartphone y Tabletas\",\"ar\":\"الهواتف والأجهزة اللوحية\",\"pt\":\"Telemóveis e Tablets\",\"ru\":\"Телефоны и планшеты\",\"tr\":\"Telefonlar ve Tabletler\",\"th\":\"โทรศัพท์และแท็บเล็ต\",\"ka\":\"ტელეფონები და ტაბლეტები\",\"zh\":\"手机和平板电脑\",\"ja\":\"携帯電話とタブレット\",\"it\":\"Telefoni e tablet\",\"ro\":\"Telefoane și tablete\"}', 'phones-and-tablets', NULL, 'app/categories/skin-green/mobile-alt.png', 'icon-laptop', 11, 17, 0, 'classified', 0, 1),
(10, 9, '{\"en\":\"Mobile Phones\"}', 'mobile-phones', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 12, 13, 1, 'classified', 0, 1),
(11, 9, '{\"en\":\"Accessories for Mobile Phones & Tablets\"}', 'mobile-phones-tablets-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 13, 14, 1, 'classified', 0, 1),
(12, 9, '{\"en\":\"Smart Watches & Trackers\"}', 'smart-watches-and-trackers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 14, 15, 1, 'classified', 0, 1),
(13, 9, '{\"en\":\"Tablets\"}', 'tablets', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 15, 16, 1, 'classified', 0, 1),
(14, NULL, '{\"en\":\"Electronics\",\"fr\":\"Hi-Tech\",\"es\":\"Electrónica\",\"ar\":\"إلكترونيات\",\"pt\":\"Eletrônicos\",\"ru\":\"Электроника\",\"tr\":\"Elektronik\",\"th\":\"อิเล็กทรอนิกส์\",\"ka\":\"ელექტრონიკა\",\"zh\":\"电子产品\",\"ja\":\"エレクトロニクス\",\"it\":\"Elettronica\",\"ro\":\"Electronică\"}', 'electronics', NULL, 'app/categories/skin-green/fa-laptop.png', 'icon-theatre', 18, 35, 0, 'classified', 0, 1),
(15, 14, '{\"en\":\"Accessories & Supplies for Electronics\"}', 'accessories-supplies-for-electronics', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 19, 20, 1, 'classified', 0, 1),
(16, 14, '{\"en\":\"Laptops & Computers\"}', 'laptops-and-computers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 20, 21, 1, 'classified', 0, 1),
(17, 14, '{\"en\":\"TV & DVD Equipment\"}', 'tv-dvd-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 21, 22, 1, 'classified', 0, 1),
(18, 14, '{\"en\":\"Audio & Music Equipment\"}', 'audio-music-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 22, 23, 1, 'classified', 0, 1),
(19, 14, '{\"en\":\"Computer Accessories\"}', 'computer-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 23, 24, 1, 'classified', 0, 1),
(20, 14, '{\"en\":\"Computer Hardware\"}', 'computer-hardware', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 24, 25, 1, 'classified', 0, 1),
(21, 14, '{\"en\":\"Computer Monitors\"}', 'computer-monitors', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 25, 26, 1, 'classified', 0, 1),
(22, 14, '{\"en\":\"Headphones\"}', 'headphones', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 26, 27, 1, 'classified', 0, 1),
(23, 14, '{\"en\":\"Networking Products\"}', 'networking-products', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 27, 28, 1, 'classified', 0, 1),
(24, 14, '{\"en\":\"Photo & Video Cameras\"}', 'photo-video-cameras', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 28, 29, 1, 'classified', 0, 1),
(25, 14, '{\"en\":\"Printers & Scanners\"}', 'printers-and-scanners', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 29, 30, 1, 'classified', 0, 1),
(26, 14, '{\"en\":\"Security & Surveillance\"}', 'security-and-surveillance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 30, 31, 1, 'classified', 0, 1),
(27, 14, '{\"en\":\"Software\"}', 'software', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 31, 32, 1, 'classified', 0, 1),
(28, 14, '{\"en\":\"Video Games\"}', 'video-games', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 32, 33, 1, 'classified', 0, 1),
(29, 14, '{\"en\":\"Game Consoles\"}', 'video-game-consoles', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 33, 34, 1, 'classified', 0, 1),
(30, NULL, '{\"en\":\"Furniture & Appliances\",\"fr\":\"Meubles & Electroménagers\",\"es\":\"Muebles y Electrodomésticos\",\"ar\":\"الأثاث والأجهزة\",\"pt\":\"Móveis e Eletrodomésticos\",\"ru\":\"Мебель и техника\",\"tr\":\"Mobilya ve Ev Aletleri\",\"th\":\"เฟอร์นิเจอร์และเครื่องใช้ไฟฟ้า\",\"ka\":\"ავეჯი და ტექნიკა\",\"zh\":\"家居，家具和电器\",\"ja\":\"家庭、家具、電化製品\",\"it\":\"Mobili ed elettrodomestici\",\"ro\":\"Mobilier și electrocasnice\"}', 'furniture-appliances', NULL, 'app/categories/skin-green/couch.png', 'icon-basket-1', 36, 44, 0, 'classified', 0, 1),
(31, 30, '{\"en\":\"Furniture - Tableware\"}', 'furniture-tableware', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 37, 38, 1, 'classified', 0, 1),
(32, 30, '{\"en\":\"Antiques - Art - Decoration\"}', 'antiques-art-decoration', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 38, 39, 1, 'classified', 0, 1),
(33, 30, '{\"en\":\"Appliances\"}', 'appliances', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 39, 40, 1, 'classified', 0, 1),
(34, 30, '{\"en\":\"Garden\"}', 'garden', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 40, 41, 1, 'classified', 0, 1),
(35, 30, '{\"en\":\"Toys - Games - Figurines\"}', 'toys-games-figurines', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 41, 42, 1, 'classified', 0, 1),
(36, 30, '{\"en\":\"Wine & Gourmet - Recipes\"}', 'wine-gourmet-recipes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 42, 43, 1, 'classified', 0, 1),
(37, NULL, '{\"en\":\"Real estate\",\"fr\":\"Immobilier\",\"es\":\"Bienes raíces\",\"ar\":\"العقارات\",\"pt\":\"Imobiliária\",\"ru\":\"Недвижимость\",\"tr\":\"Emlak\",\"th\":\"อสังหาริมทรัพย์\",\"ka\":\"Უძრავი ქონება\",\"zh\":\"房地产\",\"ja\":\"不動産\",\"it\":\"Immobiliare\",\"ro\":\"Proprietate imobiliara\"}', 'real-estate', NULL, 'app/categories/skin-green/fa-home.png', 'icon-home', 45, 55, 0, 'classified', 0, 1),
(38, 37, '{\"en\":\"Houses & Apartments For Rent\"}', 'houses-apartments-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 46, 47, 1, 'classified', 0, 1),
(39, 37, '{\"en\":\"Houses & Apartments For Sale\"}', 'houses-apartments-for-sale', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 47, 48, 1, 'classified', 0, 1),
(40, 37, '{\"en\":\"Land & Plots for Rent\"}', 'land-and-plots-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 48, 49, 1, 'classified', 0, 1),
(41, 37, '{\"en\":\"Land & Plots For Sale\"}', 'land-and-plots-for-sale', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 49, 50, 1, 'classified', 0, 1),
(42, 37, '{\"en\":\"Commercial Property For Rent\"}', 'commercial-property-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 50, 51, 1, 'classified', 0, 1),
(43, 37, '{\"en\":\"Commercial Property For Sale\"}', 'commercial-properties', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 51, 52, 1, 'classified', 0, 1),
(44, 37, '{\"en\":\"Event centres, Venues and Workstations\"}', 'event-centers-and-venues', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 52, 53, 1, 'classified', 0, 1),
(45, 37, '{\"en\":\"Short Rental\"}', 'temporary-and-vacation-rentals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 53, 54, 1, 'classified', 0, 1),
(46, NULL, '{\"en\":\"Animals & Pets\",\"fr\":\"Animaux\",\"es\":\"Animales y Mascotas\",\"ar\":\"الحيوانات\",\"pt\":\"Animais e Mascotes\",\"ru\":\"Животные\",\"tr\":\"Hayvanlar\",\"th\":\"สัตว์และสัตว์เลี้ยง\",\"ka\":\"ცხოველები\",\"zh\":\"动物与宠物\",\"ja\":\"動物とペット\",\"it\":\"Animali\",\"ro\":\"Animale\"}', 'animals-and-pets', NULL, 'app/categories/skin-green/paw.png', 'icon-guidedog', 56, 65, 0, 'classified', 0, 1),
(47, 46, '{\"en\":\"Birds\"}', 'birds', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 57, 58, 1, 'classified', 0, 1),
(48, 46, '{\"en\":\"Cats & Kittens\"}', 'cats-and-kittens', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 58, 59, 1, 'classified', 0, 1),
(49, 46, '{\"en\":\"Dogs\"}', 'dogs-and-puppies', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 59, 60, 1, 'classified', 0, 1),
(50, 46, '{\"en\":\"Fish\"}', 'fish', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 60, 61, 1, 'classified', 0, 1),
(51, 46, '{\"en\":\"Pet\'s Accessories\"}', 'pets-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 61, 62, 1, 'classified', 0, 1),
(52, 46, '{\"en\":\"Reptiles\"}', 'reptiles', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 62, 63, 1, 'classified', 0, 1),
(53, 46, '{\"en\":\"Other Animals\"}', 'other-animals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 63, 64, 1, 'classified', 0, 1),
(54, NULL, '{\"en\":\"Fashion\",\"fr\":\"Mode\",\"es\":\"Moda\",\"ar\":\"موضه\",\"pt\":\"Moda\",\"ru\":\"Мода\",\"tr\":\"Moda\",\"th\":\"แฟชั่น\",\"ka\":\"მოდა\",\"zh\":\"时尚\",\"ja\":\"ファッション\",\"it\":\"Moda\",\"ro\":\"Modă\"}', 'fashion', NULL, 'app/categories/skin-green/tshirt.png', 'icon-heart', 66, 75, 0, 'classified', 0, 1),
(55, 54, '{\"en\":\"Bags\"}', 'bags', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 67, 68, 1, 'classified', 0, 1),
(56, 54, '{\"en\":\"Clothing\"}', 'clothing', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 68, 69, 1, 'classified', 0, 1),
(57, 54, '{\"en\":\"Clothing Accessories\"}', 'clothing-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 69, 70, 1, 'classified', 0, 1),
(58, 54, '{\"en\":\"Jewelry\"}', 'jewelry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 70, 71, 1, 'classified', 0, 1),
(59, 54, '{\"en\":\"Shoes\"}', 'shoes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 71, 72, 1, 'classified', 0, 1),
(60, 54, '{\"en\":\"Watches\"}', 'watches', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 72, 73, 1, 'classified', 0, 1),
(61, 54, '{\"en\":\"Wedding Wear & Accessories\"}', 'wedding-wear-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 73, 74, 1, 'classified', 0, 1),
(62, NULL, '{\"en\":\"Beauty & Well being\",\"fr\":\"Beauté & Bien-être\",\"es\":\"Belleza y Bienestar\",\"ar\":\"الجمال والرفاهية\",\"pt\":\"Beleza e Bem estar\",\"ru\":\"Красота и благополучие\",\"tr\":\"Güzellik ve Sağlık\",\"th\":\"ความงามและความเป็นอยู่ที่ดี\",\"ka\":\"სილამაზე და კეთილდღეობა\",\"zh\":\"美容与健康\",\"ja\":\"美容と幸福\",\"it\":\"Bellezza e benessere\",\"ro\":\"Frumusețe și bunăstare\"}', 'beauty-well-being', NULL, 'app/categories/skin-green/spa.png', 'icon-search', 76, 88, 0, 'classified', 0, 1),
(63, 62, '{\"en\":\"Bath & Body\"}', 'bath-and-body', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 77, 78, 1, 'classified', 0, 1),
(64, 62, '{\"en\":\"Fragrance\"}', 'fragrance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 78, 79, 1, 'classified', 0, 1),
(65, 62, '{\"en\":\"Hair Beauty\"}', 'hair-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 79, 80, 1, 'classified', 0, 1),
(66, 62, '{\"en\":\"Makeup\"}', 'makeup', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 80, 81, 1, 'classified', 0, 1),
(67, 62, '{\"en\":\"Sexual Wellness\"}', 'sexual-wellness', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 81, 82, 1, 'classified', 0, 1),
(68, 62, '{\"en\":\"Skin Care\"}', 'skin-care', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 82, 83, 1, 'classified', 0, 1),
(69, 62, '{\"en\":\"Tobacco Accessories\"}', 'tobacco-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 83, 84, 1, 'classified', 0, 1),
(70, 62, '{\"en\":\"Tools & Accessories\"}', 'tools-and-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 84, 85, 1, 'classified', 0, 1),
(71, 62, '{\"en\":\"Vitamins & Supplements\"}', 'vitamins-and-supplements', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 85, 86, 1, 'classified', 0, 1),
(72, 62, '{\"en\":\"Pro Massage\"}', 'pro-massage', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 86, 87, 1, 'classified', 0, 1),
(73, NULL, '{\"en\":\"Jobs\",\"fr\":\"Emplois\",\"es\":\"Trabajos\",\"ar\":\"وظائف\",\"pt\":\"Empregos\",\"ru\":\"Вакансии\",\"tr\":\"Meslekler\",\"th\":\"งาน\",\"ka\":\"სამუშაო ადგილები\",\"zh\":\"职位\",\"ja\":\"ジョブズ\",\"it\":\"Lavori\",\"ro\":\"Locuri de munca\"}', 'jobs', NULL, 'app/categories/skin-green/mfglabs-users.png', 'icon-megaphone-1', 89, 114, 0, 'job-offer', 0, 1),
(74, 73, '{\"en\":\"Agriculture - Environment\"}', 'agriculture-environment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 90, 91, 1, 'job-offer', 0, 1),
(75, 73, '{\"en\":\"Assistantship - Secretariat - Helpdesk\"}', 'assistantship-secretariat-helpdesk', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 91, 92, 1, 'job-offer', 0, 1),
(76, 73, '{\"en\":\"Automotive - Mechanic\"}', 'automotive-mechanic', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 92, 93, 1, 'job-offer', 0, 1),
(77, 73, '{\"en\":\"BTP - Construction - Building\"}', 'btp-construction-building', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 93, 94, 1, 'job-offer', 0, 1),
(78, 73, '{\"en\":\"Trade - Business Services\"}', 'trade-business-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 94, 95, 1, 'job-offer', 0, 1),
(79, 73, '{\"en\":\"Commercial - Sale Jobs\"}', 'commercial-sale-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 95, 96, 1, 'job-offer', 0, 1),
(80, 73, '{\"en\":\"Accounting - Management - Finance\"}', 'accounting-management-finance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 96, 97, 1, 'job-offer', 0, 1),
(81, 73, '{\"en\":\"Steering - Manager\"}', 'steering-manager', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 97, 98, 1, 'job-offer', 0, 1),
(82, 73, '{\"en\":\"Aesthetics - Hair - Beauty\"}', 'aesthetics-hair-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 98, 99, 1, 'job-offer', 0, 1),
(83, 73, '{\"en\":\"Public Service Jobs\"}', 'public-service-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 99, 100, 1, 'job-offer', 0, 1),
(84, 73, '{\"en\":\"Real Estate Jobs\"}', 'real-estate-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 100, 101, 1, 'job-offer', 0, 1),
(85, 73, '{\"en\":\"Independent - Freelance - Telecommuting\"}', 'independent-freelance-telecommuting', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 101, 102, 1, 'job-offer', 0, 1),
(86, 73, '{\"en\":\"Computers - Internet - Telecommunications\"}', 'computers-internet-telecommunications', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 102, 103, 1, 'job-offer', 0, 1),
(87, 73, '{\"en\":\"Industry, Production & engineering\"}', 'industry-production-engineering', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 103, 104, 1, 'job-offer', 0, 1),
(88, 73, '{\"en\":\"Marketing - Communication\"}', 'marketing-communication', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 104, 105, 1, 'job-offer', 0, 1),
(89, 73, '{\"en\":\"Babysitting - Nanny Work\"}', 'babysitting-nanny-work', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 105, 106, 1, 'job-offer', 0, 1),
(90, 73, '{\"en\":\"HR - Training - Education\"}', 'hr-training-education', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 106, 107, 1, 'job-offer', 0, 1),
(91, 73, '{\"en\":\"Medical - Healthcare - Social\"}', 'medical-healthcare-social', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 107, 108, 1, 'job-offer', 0, 1),
(92, 73, '{\"en\":\"Security - Guarding\"}', 'security-guarding', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 108, 109, 1, 'job-offer', 0, 1),
(93, 73, '{\"en\":\"Household Services - Housekeeping\"}', 'household-services-housekeeping', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 109, 110, 1, 'job-offer', 0, 1),
(94, 73, '{\"en\":\"Tourism - Hotels - Restaurants - Leisure\"}', 'tourism-hotels-restaurants-leisure', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 110, 111, 1, 'job-offer', 0, 1),
(95, 73, '{\"en\":\"Transportation - Logistics\"}', 'transportation-logistics', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 111, 112, 1, 'job-offer', 0, 1),
(96, 73, '{\"en\":\"Others Jobs Offer\"}', 'others-jobs-offer', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 112, 113, 1, 'job-offer', 0, 1),
(97, NULL, '{\"en\":\"Services\",\"fr\":\"Services\",\"es\":\"Servicios\",\"ar\":\"خدمات\",\"pt\":\"Serviços\",\"ru\":\"Сервисы\",\"tr\":\"Hizmetler\",\"th\":\"บริการ\",\"ka\":\"მომსახურება\",\"zh\":\"服务\",\"ja\":\"サービス\",\"it\":\"Servizi\",\"ro\":\"Servicii\"}', 'services', NULL, 'app/categories/skin-green/ion-clipboard.png', 'fa fa-briefcase', 115, 133, 0, 'classified', 0, 1),
(98, 97, '{\"en\":\"Casting, Model, Photographer\"}', 'casting-model-photographer', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 116, 117, 1, 'classified', 0, 1),
(99, 97, '{\"en\":\"Carpooling\"}', 'carpooling', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 117, 118, 1, 'classified', 0, 1),
(100, 97, '{\"en\":\"Moving, Furniture Guard\"}', 'moving-furniture-guard', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 118, 119, 1, 'classified', 0, 1),
(101, 97, '{\"en\":\"Destocking - Commercial\"}', 'destocking-commercial', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 119, 120, 1, 'classified', 0, 1),
(102, 97, '{\"en\":\"Industrial Equipment\"}', 'industrial-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 120, 121, 1, 'classified', 0, 1),
(103, 97, '{\"en\":\"Aesthetics, Hairstyling\"}', 'aesthetics-hairstyling', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 121, 122, 1, 'classified', 0, 1),
(104, 97, '{\"en\":\"Materials and Equipment Pro\"}', 'materials-and-equipment-pro', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 122, 123, 1, 'classified', 0, 1),
(105, 97, '{\"en\":\"Event Organization Services\"}', 'event-organization-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 123, 124, 1, 'classified', 0, 1),
(106, 97, '{\"en\":\"Service Provision\"}', 'service-provision', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 124, 125, 1, 'classified', 0, 1),
(107, 97, '{\"en\":\"Health, Beauty\"}', 'health-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 125, 126, 1, 'classified', 0, 1),
(108, 97, '{\"en\":\"Artisan, Troubleshooting, Handyman\"}', 'artisan-troubleshooting-handyman', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 126, 127, 1, 'classified', 0, 1),
(109, 97, '{\"en\":\"Computing Services\"}', 'computing-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 127, 128, 1, 'classified', 0, 1),
(110, 97, '{\"en\":\"Tourism and Travel Services\"}', 'tourism-and-travel-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 128, 129, 1, 'classified', 0, 1),
(111, 97, '{\"en\":\"Translation, Writing\"}', 'translation-writing', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 129, 130, 1, 'classified', 0, 1),
(112, 97, '{\"en\":\"Construction - Renovation - Carpentry\"}', 'construction-renovation-carpentry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 130, 131, 1, 'classified', 0, 1),
(113, 97, '{\"en\":\"Other services\"}', 'other-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 131, 132, 1, 'classified', 0, 1),
(114, NULL, '{\"en\":\"Learning\",\"fr\":\"Apprentissage\",\"es\":\"Aprendizaje\",\"ar\":\"تعلم\",\"pt\":\"Aprendendo\",\"ru\":\"Обучение\",\"tr\":\"Öğrenme\",\"th\":\"การเรียนรู้\",\"ka\":\"სწავლა\",\"zh\":\"学习\",\"ja\":\"学習\",\"it\":\"Apprendimento\",\"ro\":\"Învăţare\"}', 'learning', NULL, 'app/categories/skin-green/fa-graduation-cap.png', 'icon-book-open', 134, 143, 0, 'classified', 0, 1),
(115, 114, '{\"en\":\"Language Classes\"}', 'language-classes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 135, 136, 1, 'classified', 0, 1),
(116, 114, '{\"en\":\"Computer Courses\"}', 'computer-courses', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 136, 137, 1, 'classified', 0, 1),
(117, 114, '{\"en\":\"Tutoring, Private Lessons\"}', 'tutoring-private-lessons', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 137, 138, 1, 'classified', 0, 1),
(118, 114, '{\"en\":\"Vocational Training\"}', 'vocational-training', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 138, 139, 1, 'classified', 0, 1),
(119, 114, '{\"en\":\"Maths, Physics, Chemistry\"}', 'maths-physics-chemistry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 139, 140, 1, 'classified', 0, 1),
(120, 114, '{\"en\":\"Music, Theatre, Dance\"}', 'music-theatre-dance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 140, 141, 1, 'classified', 0, 1),
(121, 114, '{\"en\":\"School support\"}', 'school-support', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 141, 142, 1, 'classified', 0, 1),
(122, NULL, '{\"en\":\"Local Events\",\"fr\":\"Evénements\",\"es\":\"Eventos\",\"ar\":\"الأحداث\",\"pt\":\"Eventos\",\"ru\":\"События\",\"tr\":\"Etkinlikler\",\"th\":\"เหตุการณ์\",\"ka\":\"Ივენთი\",\"zh\":\"当地活动\",\"ja\":\"ローカルイベント\",\"it\":\"Eventi locali\",\"ro\":\"Evenimente locale\"}', 'local-events', NULL, 'app/categories/skin-green/calendar-alt.png', 'icon-megaphone-1', 144, 158, 0, 'classified', 0, 1),
(123, 122, '{\"en\":\"Concerts & Festivals\"}', 'concerts-and-festivals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 145, 146, 1, 'classified', 0, 1),
(124, 122, '{\"en\":\"Networking & Meetups\"}', 'networking-and-meetups', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 146, 147, 1, 'classified', 0, 1),
(125, 122, '{\"en\":\"Sports & Outdoors\"}', 'sports-and-outdoors', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 147, 148, 1, 'classified', 0, 1),
(126, 122, '{\"en\":\"Trade Shows & Conventions\"}', 'trade-shows-conventions', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 148, 149, 1, 'classified', 0, 1),
(127, 122, '{\"en\":\"Training & Seminars\"}', 'training-and-seminars', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 149, 150, 1, 'classified', 0, 1),
(128, 122, '{\"en\":\"Ceremonies\"}', 'ceremonies', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 150, 151, 1, 'classified', 0, 1),
(129, 122, '{\"en\":\"Conferences\"}', 'conferences', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 151, 152, 1, 'classified', 0, 1),
(130, 122, '{\"en\":\"Weddings\"}', 'weddings', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 152, 153, 1, 'classified', 0, 1),
(131, 122, '{\"en\":\"Birthdays\"}', 'birthdays', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 153, 154, 1, 'classified', 0, 1),
(132, 122, '{\"en\":\"Family Events\"}', 'family-events', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 154, 155, 1, 'classified', 0, 1),
(133, 122, '{\"en\":\"Nightlife\"}', 'nightlife', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 155, 156, 1, 'classified', 0, 1),
(134, 122, '{\"en\":\"All others events\"}', 'all-others-events', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 156, 157, 1, 'classified', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_field`
--

CREATE TABLE `category_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `disabled_in_subcategories` tinyint(1) UNSIGNED DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_field`
--

INSERT INTO `category_field` (`id`, `category_id`, `field_id`, `disabled_in_subcategories`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 1, 0, NULL, 2, 3, 1),
(2, 1, 2, 0, NULL, 4, 5, 1),
(3, 1, 3, 0, NULL, 6, 7, 1),
(4, 1, 4, 0, NULL, 14, 15, 1),
(5, 1, 5, 0, NULL, 8, 9, 1),
(6, 1, 6, 0, NULL, 16, 17, 1),
(7, 1, 7, 0, NULL, 10, 11, 1),
(8, 1, 8, 0, NULL, 12, 13, 1),
(9, 9, 14, 0, NULL, 4, 5, 1),
(10, 9, 15, 0, NULL, 2, 3, 1),
(11, 14, 16, 0, NULL, 4, 5, 1),
(12, 14, 17, 0, NULL, 2, 3, 1),
(13, 30, 8, 0, NULL, NULL, NULL, NULL),
(14, 37, 9, 0, NULL, 2, 3, 1),
(15, 37, 10, 0, NULL, 4, 5, 1),
(16, 37, 11, 0, NULL, 8, 9, 1),
(17, 37, 12, 0, NULL, 10, 11, 1),
(18, 37, 13, 0, NULL, 6, 7, 1),
(19, 54, 8, 0, NULL, NULL, NULL, NULL),
(20, 73, 18, 0, NULL, NULL, NULL, NULL),
(21, 73, 19, 0, NULL, NULL, NULL, NULL),
(22, 73, 20, 0, NULL, NULL, NULL, NULL),
(23, 122, 21, 0, NULL, NULL, NULL, NULL),
(24, 122, 22, 0, NULL, NULL, NULL, NULL),
(25, 122, 23, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `latitude` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin2_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `longitude`, `latitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1, 'SA', '{\"en\":\"Yanbu\",\"ar\":\"ينبع\"}', 38.06, 24.09, 'P', 'PPL', 'SA.05', NULL, 200161, 'Asia/Riyadh', 1, '2017-05-22 23:00:00', '2021-04-11 21:35:17'),
(2, 'SA', '{\"en\":\"Umluj\"}', 37.27, 25.02, 'P', 'PPL', 'SA.19', NULL, 33874, 'Asia/Riyadh', 1, '2020-02-06 23:00:00', '2020-02-06 23:00:00'),
(3, 'SA', '{\"en\":\"Umm as Sāhik\"}', 49.92, 26.65, 'P', 'PPL', 'SA.06', NULL, 11813, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(4, 'SA', '{\"en\":\"Turaif\"}', 38.66, 31.67, 'P', 'PPL', 'SA.15', NULL, 40819, 'Asia/Riyadh', 1, '2016-09-19 23:00:00', '2016-09-19 23:00:00'),
(5, 'SA', '{\"en\":\"Turabah\"}', 41.63, 21.21, 'P', 'PPL', 'SA.14', NULL, 23235, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(6, 'SA', '{\"en\":\"At Tūbī\"}', 49.99, 26.56, 'P', 'PPL', 'SA.06', NULL, 7740, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(7, 'SA', '{\"en\":\"Tārūt\"}', 50.04, 26.57, 'P', 'PPL', 'SA.06', NULL, 85371, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(8, 'SA', '{\"en\":\"Tanūmah\"}', 44.13, 27.10, 'P', 'PPL', 'SA.08', NULL, 13594, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(9, 'SA', '{\"en\":\"Tabuk\"}', 36.57, 28.40, 'P', 'PPLA', 'SA.19', NULL, 455450, 'Asia/Riyadh', 1, '2015-09-11 23:00:00', '2015-09-11 23:00:00'),
(10, 'SA', '{\"en\":\"Ţubarjal\"}', 38.22, 30.50, 'P', 'PPL', 'SA.20', NULL, 40019, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(11, 'SA', '{\"en\":\"Tabālah\"}', 42.40, 19.95, 'P', 'PPL', 'SA.11', NULL, 5151, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(12, 'SA', '{\"en\":\"Sulţānah\"}', 39.59, 24.49, 'P', 'PPL', 'SA.05', NULL, 946697, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(13, 'SA', '{\"en\":\"Sayhāt\"}', 50.05, 26.48, 'P', 'PPL', 'SA.06', NULL, 66702, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(14, 'SA', '{\"en\":\"Şāmitah\"}', 42.94, 16.60, 'P', 'PPL', 'SA.17', NULL, 26945, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(15, 'SA', '{\"en\":\"Sakakah\"}', 40.21, 29.97, 'P', 'PPLA', 'SA.20', NULL, 128332, 'Asia/Riyadh', 1, '2015-12-12 23:00:00', '2015-12-12 23:00:00'),
(16, 'SA', '{\"en\":\"Şafwá\"}', 49.96, 26.65, 'P', 'PPL', 'SA.06', NULL, 45876, 'Asia/Riyadh', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(17, 'SA', '{\"en\":\"Şabyā\"}', 42.63, 17.15, 'P', 'PPL', 'SA.17', NULL, 54108, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(18, 'SA', '{\"en\":\"Raḩīmah\"}', 50.06, 26.71, 'P', 'PPL', 'SA.06', NULL, 41188, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(19, 'SA', '{\"en\":\"Rābigh\"}', 39.03, 22.80, 'P', 'PPL', 'SA.14', NULL, 41759, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(20, 'SA', '{\"en\":\"Qal‘at Bīshah\"}', 42.61, 20.00, 'P', 'PPL', 'SA.11', NULL, 81828, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(21, 'SA', '{\"en\":\"Najrān\"}', 44.13, 17.49, 'P', 'PPLA', 'SA.16', NULL, 258573, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(22, 'SA', '{\"en\":\"Mulayjah\"}', 48.42, 27.27, 'P', 'PPL', 'SA.06', NULL, 5247, 'Asia/Riyadh', 1, '2013-08-10 23:00:00', '2013-08-10 23:00:00'),
(23, 'SA', '{\"en\":\"Mislīyah\"}', 42.56, 17.46, 'P', 'PPL', 'SA.17', NULL, 6117, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(24, 'SA', '{\"en\":\"Marāt\"}', 45.46, 25.07, 'P', 'PPL', 'SA.10', NULL, 8885, 'Asia/Riyadh', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(25, 'SA', '{\"en\":\"Mecca\"}', 39.83, 21.43, 'P', 'PPLA', 'SA.14', NULL, 1323624, 'Asia/Riyadh', 1, '2020-05-27 23:00:00', '2020-05-27 23:00:00'),
(26, 'SA', '{\"en\":\"Khamis Mushait\"}', 42.73, 18.30, 'P', 'PPL', 'SA.11', NULL, 387553, 'Asia/Riyadh', 1, '2013-11-24 23:00:00', '2013-11-24 23:00:00'),
(27, 'SA', '{\"en\":\"Julayjilah\"}', 49.60, 25.50, 'P', 'PPL', 'SA.06', NULL, 5359, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(28, 'SA', '{\"en\":\"Jizan\"}', 42.55, 16.89, 'P', 'PPLA', 'SA.17', NULL, 105198, 'Asia/Riyadh', 1, '2014-01-31 23:00:00', '2014-01-31 23:00:00'),
(29, 'SA', '{\"en\":\"Jeddah\"}', 39.19, 21.49, 'P', 'PPL', 'SA.14', NULL, 2867446, 'Asia/Riyadh', 1, '2019-10-28 23:00:00', '2019-10-28 23:00:00'),
(30, 'SA', '{\"en\":\"Ha\'il\"}', 41.69, 27.52, 'P', 'PPLA', 'SA.13', NULL, 267005, 'Asia/Riyadh', 1, '2016-01-27 23:00:00', '2016-01-27 23:00:00'),
(31, 'SA', '{\"en\":\"Hafar Al-Batin\"}', 45.97, 28.43, 'P', 'PPL', 'SA.06', NULL, 271642, 'Asia/Riyadh', 1, '2017-09-11 23:00:00', '2017-09-11 23:00:00'),
(32, 'SA', '{\"en\":\"Farasān\"}', 42.12, 16.70, 'P', 'PPL', 'SA.17', NULL, 10527, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(33, 'SA', '{\"en\":\"Duba\"}', 35.69, 27.35, 'P', 'PPL', 'SA.19', NULL, 22000, 'Asia/Riyadh', 1, '2016-01-27 23:00:00', '2016-01-27 23:00:00'),
(34, 'SA', '{\"en\":\"Buraydah\"}', 43.97, 26.33, 'P', 'PPLA', 'SA.08', NULL, 391336, 'Asia/Riyadh', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(35, 'SA', '{\"en\":\"Abqaiq\"}', 49.67, 25.93, 'P', 'PPL', 'SA.06', NULL, 29474, 'Asia/Riyadh', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(36, 'SA', '{\"en\":\"Badr Ḩunayn\"}', 38.79, 23.78, 'P', 'PPL', 'SA.05', NULL, 27257, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(37, 'SA', '{\"en\":\"Az Zulfī\"}', 44.82, 26.30, 'P', 'PPL', 'SA.10', NULL, 53144, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(38, 'SA', '{\"en\":\"Dhahran\"}', 50.11, 26.29, 'P', 'PPL', 'SA.06', NULL, 99540, 'Asia/Riyadh', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(39, 'SA', '{\"en\":\"Aţ Ţaraf\"}', 49.73, 25.36, 'P', 'PPL', 'SA.06', NULL, 21386, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(40, 'SA', '{\"en\":\"Ta’if\"}', 40.42, 21.27, 'P', 'PPL', 'SA.14', NULL, 530848, 'Asia/Riyadh', 1, '2015-09-04 23:00:00', '2015-09-04 23:00:00'),
(41, 'SA', '{\"en\":\"As Sulayyil\"}', 45.58, 20.46, 'P', 'PPL', 'SA.10', NULL, 24097, 'Asia/Riyadh', 1, '2017-07-04 23:00:00', '2017-07-04 23:00:00'),
(42, 'SA', '{\"en\":\"Sājir\"}', 44.60, 25.18, 'P', 'PPL', 'SA.10', NULL, 11717, 'Asia/Riyadh', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(43, 'SA', '{\"en\":\"As Saffānīyah\"}', 48.73, 27.97, 'P', 'PPL', 'SA.06', NULL, 7014, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(44, 'SA', '{\"en\":\"Riyadh\"}', 46.72, 24.69, 'P', 'PPLC', 'SA.10', NULL, 4205961, 'Asia/Riyadh', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(45, 'SA', '{\"en\":\"Ar Rass\"}', 43.50, 25.87, 'P', 'PPL', 'SA.08', NULL, 81728, 'Asia/Riyadh', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(46, 'SA', '{\"en\":\"Arar\"}', 41.04, 30.98, 'P', 'PPLA', 'SA.15', NULL, 148540, 'Asia/Riyadh', 1, '2018-12-06 23:00:00', '2018-12-06 23:00:00'),
(47, 'SA', '{\"en\":\"An Nimāş\"}', 42.12, 19.15, 'P', 'PPL', 'SA.11', NULL, 24153, 'Asia/Riyadh', 1, '2013-08-10 23:00:00', '2013-08-10 23:00:00'),
(48, 'SA', '{\"en\":\"Qurayyat\"}', 37.34, 31.33, 'P', 'PPL', 'SA.20', 'SA.20.10972289', 102903, 'Asia/Riyadh', 1, '2016-10-22 23:00:00', '2016-10-22 23:00:00'),
(49, 'SA', '{\"en\":\"Al Wajh\"}', 36.45, 26.25, 'P', 'PPL', 'SA.19', NULL, 26636, 'Asia/Riyadh', 1, '2017-08-30 23:00:00', '2017-08-30 23:00:00'),
(50, 'SA', '{\"en\":\"Al-`Ula\"}', 37.92, 26.61, 'P', 'PPL', 'SA.05', NULL, 32413, 'Asia/Riyadh', 1, '2020-03-22 23:00:00', '2020-03-22 23:00:00'),
(51, 'SA', '{\"en\":\"Al Qurayn\"}', 49.60, 25.48, 'P', 'PPL', 'SA.06', NULL, 12013, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(52, 'SA', '{\"en\":\"Qaisumah\"}', 46.13, 28.31, 'P', 'PPL', 'SA.06', NULL, 20685, 'Asia/Riyadh', 1, '2016-10-22 23:00:00', '2016-10-22 23:00:00'),
(53, 'SA', '{\"en\":\"Al Qaţīf\"}', 50.01, 26.57, 'P', 'PPL', 'SA.06', NULL, 98259, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(54, 'SA', '{\"en\":\"Al Qārah\"}', 49.67, 25.42, 'P', 'PPL', 'SA.06', NULL, 9106, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(55, 'SA', '{\"en\":\"Al Muţayrifī\"}', 49.56, 25.48, 'P', 'PPL', 'SA.06', NULL, 5962, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(56, 'SA', '{\"en\":\"Al Munayzilah\"}', 49.67, 25.38, 'P', 'PPL', 'SA.06', NULL, 16296, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(57, 'SA', '{\"en\":\"Al Mubarraz\"}', 49.59, 25.41, 'P', 'PPL', 'SA.06', NULL, 290802, 'Asia/Riyadh', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(58, 'SA', '{\"en\":\"Al Mindak\"}', 41.28, 20.16, 'P', 'PPL', 'SA.02', NULL, 9218, 'Asia/Riyadh', 1, '2013-08-10 23:00:00', '2013-08-10 23:00:00'),
(59, 'SA', '{\"en\":\"Al Mithnab\"}', 44.22, 25.86, 'P', 'PPL', 'SA.08', NULL, 60870, 'Asia/Riyadh', 1, '2012-10-08 23:00:00', '2012-10-08 23:00:00'),
(60, 'SA', '{\"en\":\"Al Markaz\"}', 49.73, 25.40, 'P', 'PPL', 'SA.06', NULL, 6464, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(61, 'SA', '{\"en\":\"Medina\"}', 39.61, 24.47, 'P', 'PPLA', 'SA.05', NULL, 1300000, 'Asia/Riyadh', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(62, 'SA', '{\"en\":\"Khobar\"}', 50.21, 26.28, 'P', 'PPL', 'SA.06', NULL, 165799, 'Asia/Riyadh', 1, '2013-11-16 23:00:00', '2013-11-16 23:00:00'),
(63, 'SA', '{\"en\":\"Al Kharj\"}', 47.33, 24.16, 'P', 'PPL', 'SA.10', NULL, 425300, 'Asia/Riyadh', 1, '2017-09-12 23:00:00', '2017-09-12 23:00:00'),
(64, 'SA', '{\"en\":\"Al Khafjī\"}', 48.49, 28.44, 'P', 'PPL', 'SA.06', NULL, 54857, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(65, 'SA', '{\"en\":\"Al Jumūm\"}', 39.70, 21.62, 'P', 'PPL', 'SA.14', NULL, 22207, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(66, 'SA', '{\"en\":\"Al Jubayl\"}', 49.62, 27.02, 'P', 'PPL', 'SA.06', NULL, 237274, 'Asia/Riyadh', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(67, 'SA', '{\"en\":\"Al Jubayl\"}', 49.65, 25.40, 'P', 'PPL', 'SA.06', NULL, 9108, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(68, 'SA', '{\"en\":\"Al Jarādīyah\"}', 42.91, 16.58, 'P', 'PPL', 'SA.17', NULL, 7396, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(69, 'SA', '{\"en\":\"Al Jafr\"}', 49.72, 25.38, 'P', 'PPL', 'SA.06', NULL, 8715, 'Asia/Riyadh', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(70, 'SA', '{\"en\":\"Al Hufūf\"}', 49.59, 25.36, 'P', 'PPL', 'SA.06', NULL, 293179, 'Asia/Riyadh', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(71, 'SA', '{\"en\":\"Al Bukayrīyah\"}', 43.66, 26.14, 'P', 'PPL', 'SA.08', NULL, 25153, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(72, 'SA', '{\"en\":\"Al Baţţālīyah\"}', 49.63, 25.43, 'P', 'PPL', 'SA.06', NULL, 16606, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(73, 'SA', '{\"en\":\"Al Bahah\"}', 41.47, 20.01, 'P', 'PPLA', 'SA.02', NULL, 88419, 'Asia/Riyadh', 1, '2019-02-09 23:00:00', '2019-02-09 23:00:00'),
(74, 'SA', '{\"en\":\"Al Arţāwīyah\"}', 45.35, 26.50, 'P', 'PPL', 'SA.10', NULL, 9152, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(75, 'SA', '{\"en\":\"Al Awjām\"}', 49.94, 26.56, 'P', 'PPL', 'SA.06', NULL, 11460, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(76, 'SA', '{\"en\":\"Afif\"}', 42.92, 23.91, 'P', 'PPL', 'SA.10', NULL, 45525, 'Asia/Riyadh', 1, '2018-12-06 23:00:00', '2018-12-06 23:00:00'),
(77, 'SA', '{\"en\":\"Adh Dhibiyah\"}', 43.16, 26.03, 'P', 'PPL', 'SA.08', NULL, 15000, 'Asia/Riyadh', 1, '2020-09-15 23:00:00', '2020-09-15 23:00:00'),
(78, 'SA', '{\"en\":\"Ad Dilam\"}', 47.16, 23.99, 'P', 'PPL', 'SA.10', NULL, 35371, 'Asia/Riyadh', 1, '2014-09-29 23:00:00', '2014-09-29 23:00:00'),
(79, 'SA', '{\"en\":\"Ad Dawādimī\"}', 44.39, 24.51, 'P', 'PPL', 'SA.10', NULL, 54474, 'Asia/Riyadh', 1, '2020-06-09 23:00:00', '2020-06-09 23:00:00'),
(80, 'SA', '{\"en\":\"Ad Darb\"}', 42.25, 17.72, 'P', 'PPL', 'SA.17', NULL, 5378, 'Asia/Riyadh', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(81, 'SA', '{\"en\":\"Dammam\"}', 50.10, 26.43, 'P', 'PPLA', 'SA.06', NULL, 768602, 'Asia/Riyadh', 1, '2014-08-18 23:00:00', '2014-08-18 23:00:00'),
(82, 'SA', '{\"en\":\"Abū ‘Arīsh\"}', 42.83, 16.97, 'P', 'PPL', 'SA.17', NULL, 49171, 'Asia/Riyadh', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(83, 'SA', '{\"en\":\"Abha\"}', 42.51, 18.22, 'P', 'PPLA', 'SA.11', NULL, 210886, 'Asia/Riyadh', 1, '2018-05-06 23:00:00', '2018-05-06 23:00:00'),
(84, 'SA', '{\"en\":\"Şuwayr\"}', 40.39, 30.12, 'P', 'PPL', 'SA.20', NULL, 8515, 'Asia/Riyadh', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(85, 'SA', '{\"en\":\"Tumayr\"}', 45.87, 25.70, 'P', 'PPL', 'SA.10', NULL, 8246, 'Asia/Riyadh', 1, '2018-03-07 23:00:00', '2018-03-07 23:00:00'),
(86, 'SA', '{\"en\":\"Al Fuwayliq\"}', 43.25, 26.44, 'P', 'PPL', 'SA.08', NULL, 5205, 'Asia/Riyadh', 1, '2018-01-09 23:00:00', '2018-01-09 23:00:00'),
(87, 'SA', '{\"en\":\"Al Majāridah\"}', 41.91, 19.12, 'P', 'PPL', 'SA.11', NULL, 14830, 'Asia/Riyadh', 1, '2013-08-10 23:00:00', '2013-08-10 23:00:00'),
(88, 'SA', '{\"en\":\"Al Muwayh\"}', 41.76, 22.43, 'P', 'PPL', 'SA.14', NULL, 7364, 'Asia/Riyadh', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(89, 'SA', '{\"en\":\"Al Hadā\"}', 40.28, 21.36, 'P', 'PPL', 'SA.14', NULL, 6885, 'Asia/Riyadh', 1, '2019-10-09 23:00:00', '2019-10-09 23:00:00'),
(90, 'SA', '{\"en\":\"Ash Shafā\"}', 40.32, 21.07, 'P', 'PPL', 'SA.14', NULL, 72190, 'Asia/Riyadh', 1, '2019-10-09 23:00:00', '2019-10-09 23:00:00'),
(91, 'SA', '{\"en\":\"Mizhirah\"}', 42.73, 16.83, 'P', 'PPL', 'SA.17', NULL, 5529, 'Asia/Riyadh', 1, '2017-06-06 23:00:00', '2017-06-06 23:00:00'),
(92, 'SA', '{\"en\":\"Sabt Alalayah\"}', 41.96, 19.58, 'P', 'PPLL', 'SA.11', 'SA.11.10972263', 100000, 'Asia/Riyadh', 1, '2020-06-25 23:00:00', '2020-06-25 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `capital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` int(10) UNSIGNED DEFAULT NULL,
  `population` int(10) UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `admin_field_active` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `time_zone`, `date_format`, `datetime_format`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'AND', 20, 'AN', '{\"en\":\"Andorra\",\"fr\":\"Andorre\",\"es\":\"Andorra\",\"ar\":\"أندورا\",\"pt\":\"Andorra\",\"it\":\"Andorra\",\"tr\":\"Andorra\",\"ru\":\"Андорра\",\"zh\":\"安道尔\",\"ja\":\"アンドラ\",\"th\":\"อันดอร์รา\",\"ro\":\"Andorra\",\"ka\":\"ანდორა\"}', 'Andorra la Vella', 468, 84000, 'EU', '.ad', 'EUR', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 'ES,FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(2, 'AE', 'ARE', 784, 'AE', '{\"en\":\"United Arab Emirates\",\"fr\":\"Émirats arabes unis\",\"es\":\"Emiratos Árabes Unidos\",\"ar\":\"الإمارات العربية المتحدة\",\"pt\":\"Emirados Árabes Unidos\",\"it\":\"Emirati Arabi Uniti\",\"tr\":\"Birleşik Arap Emirlikleri\",\"ru\":\"ОАЭ\",\"zh\":\"阿拉伯联合酋长国\",\"ja\":\"アラブ首長国連邦\",\"th\":\"สหรัฐอาหรับเอมิเรตส์\",\"ro\":\"Emiratele Arabe Unite\",\"ka\":\"არაბეთის გაერთიანებული ემირატები\"}', 'Abu Dhabi', 82880, 4975593, 'AS', '.ae', 'AED', '971', '', '', 'ar-AE,fa,en,hi,ur', 'SA,OM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(3, 'AF', 'AFG', 4, 'AF', '{\"en\":\"Afghanistan\",\"fr\":\"Afghanistan\",\"es\":\"Afganistán\",\"ar\":\"أفغانستان\",\"pt\":\"Afeganistão\",\"it\":\"Afghanistan\",\"tr\":\"Afganistan\",\"ru\":\"Афганистан\",\"zh\":\"阿富汗\",\"ja\":\"アフガニスタン\",\"th\":\"อัฟกานิสถาน\",\"ro\":\"Afganistan\",\"ka\":\"ავღანეთი\"}', 'Kabul', 647500, 29121286, 'AS', '.af', 'AFN', '93', '', '', 'fa-AF,ps,uz-AF,tk', 'TM,CN,IR,TJ,PK,UZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(4, 'AG', 'ATG', 28, 'AC', '{\"en\":\"Antigua and Barbuda\",\"fr\":\"Antigua-et-Barbuda\",\"es\":\"Antigua y Barbuda\",\"ar\":\"أنتيغوا وبربودا\",\"pt\":\"Antígua e Barbuda\",\"it\":\"Antigua e Barbuda\",\"tr\":\"Antigua ve Barbuda\",\"ru\":\"Антигуа и Барбуда\",\"zh\":\"安提瓜和巴布达\",\"ja\":\"アンティグア・バーブーダ\",\"th\":\"แอนติกาและบาร์บูดา\",\"ro\":\"Antigua și Barbuda\",\"ka\":\"ანტიგუა და ბარბუდა\"}', 'St. John\'s', 443, 86754, 'NA', '.ag', 'XCD', '+1-268', '', '', 'en-AG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(5, 'AI', 'AIA', 660, 'AV', '{\"en\":\"Anguilla\",\"fr\":\"Anguilla\",\"es\":\"Anguila\",\"ar\":\"أنغويلا\",\"pt\":\"Anguilla\",\"it\":\"Anguilla\",\"tr\":\"Anguilla\",\"ru\":\"Ангилья\",\"zh\":\"安圭拉\",\"ja\":\"アンギラ\",\"th\":\"แองกวิลลา\",\"ro\":\"Anguilla\",\"ka\":\"ანგვილა\"}', 'The Valley', 102, 13254, 'NA', '.ai', 'XCD', '+1-264', '', '', 'en-AI', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(6, 'AL', 'ALB', 8, 'AL', '{\"en\":\"Albania\",\"fr\":\"Albanie\",\"es\":\"Albania\",\"ar\":\"ألبانيا\",\"pt\":\"Albânia\",\"it\":\"Albania\",\"tr\":\"Arnavutluk\",\"ru\":\"Албания\",\"zh\":\"阿尔巴尼亚\",\"ja\":\"アルバニア\",\"th\":\"แอลเบเนีย\",\"ro\":\"Albania\",\"ka\":\"ალბანეთი\"}', 'Tirana', 28748, 2986952, 'EU', '.al', 'ALL', '355', '', '', 'sq,el', 'MK,GR,ME,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(7, 'AM', 'ARM', 51, 'AM', '{\"en\":\"Armenia\",\"fr\":\"Arménie\",\"es\":\"Armenia\",\"ar\":\"أرمينيا\",\"pt\":\"Armênia\",\"it\":\"Armenia\",\"tr\":\"Ermenistan\",\"ru\":\"Армения\",\"zh\":\"亚美尼亚\",\"ja\":\"アルメニア\",\"th\":\"อาร์เมเนีย\",\"ro\":\"Armenia\",\"ka\":\"სომხეთი\"}', 'Yerevan', 29800, 2968000, 'AS', '.am', 'AMD', '374', '######', '^(d{6})$', 'hy', 'GE,IR,AZ,TR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(8, 'AN', 'ANT', 530, 'NT', '{\"en\":\"Netherlands Antilles\",\"fr\":\"Antilles néerlandaises\",\"es\":\"Antillas Neerlandesas\",\"ar\":\"جزر الأنتيل الهولندية\",\"pt\":\"Antilhas Holandesas\",\"it\":\"Antille Olandesi\",\"tr\":\"Hollanda Antilleri\",\"ru\":\"Нидерландские Антильские о-ва\",\"zh\":\"荷属安的列斯群岛\",\"ja\":\"オランダ領アンティル諸島\",\"th\":\"เนเธอร์แลนด์แอนทิลลิส\",\"ro\":\"Antilele Olandeze\",\"ka\":\"ნიდერლანდების ანტილები\"}', 'Willemstad', 960, 136197, 'NA', '.an', 'ANG', '599', '', '', 'nl-AN,en,es', 'GP', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(9, 'AO', 'AGO', 24, 'AO', '{\"en\":\"Angola\",\"fr\":\"Angola\",\"es\":\"Angola\",\"ar\":\"أنغولا\",\"pt\":\"Angola\",\"it\":\"Angola\",\"tr\":\"Angola\",\"ru\":\"Ангола\",\"zh\":\"安哥拉\",\"ja\":\"アンゴラ\",\"th\":\"แองโกลา\",\"ro\":\"Angola\",\"ka\":\"ანგოლა\"}', 'Luanda', 1246700, 13068161, 'AF', '.ao', 'AOA', '244', '', '', 'pt-AO', 'CD,NA,ZM,CG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(10, 'AR', 'ARG', 32, 'AR', '{\"en\":\"Argentina\",\"fr\":\"Argentine\",\"es\":\"Argentina\",\"ar\":\"الأرجنتين\",\"pt\":\"Argentina\",\"it\":\"Argentina\",\"tr\":\"Arjantin\",\"ru\":\"Аргентина\",\"zh\":\"阿根廷\",\"ja\":\"アルゼンチン\",\"th\":\"อาร์เจนตินา\",\"ro\":\"Argentina\",\"ka\":\"არგენტინა\"}', 'Buenos Aires', 2766890, 41343201, 'SA', '.ar', 'ARS', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 'CL,BO,UY,PY,BR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(11, 'AS', 'ASM', 16, 'AQ', '{\"en\":\"American Samoa\",\"fr\":\"Samoa américaines\",\"es\":\"Samoa Americana\",\"ar\":\"ساموا الأمريكية\",\"pt\":\"Samoa Americana\",\"it\":\"Samoa Americane\",\"tr\":\"Amerikan Samoası\",\"ru\":\"Американское Самоа\",\"zh\":\"美属萨摩亚\",\"ja\":\"米領サモア\",\"th\":\"อเมริกันซามัว\",\"ro\":\"Samoa Americană\",\"ka\":\"ამერიკული სამოა\"}', 'Pago Pago', 199, 57881, 'OC', '.as', 'USD', '+1-684', '', '', 'en-AS,sm,to', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(12, 'AT', 'AUT', 40, 'AU', '{\"en\":\"Austria\",\"fr\":\"Autriche\",\"es\":\"Austria\",\"ar\":\"النمسا\",\"pt\":\"Áustria\",\"it\":\"Austria\",\"tr\":\"Avusturya\",\"ru\":\"Австрия\",\"zh\":\"奥地利\",\"ja\":\"オーストリア\",\"th\":\"ออสเตรีย\",\"ro\":\"Austria\",\"ka\":\"ავსტრია\"}', 'Vienna', 83858, 8205000, 'EU', '.at', 'EUR', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 'CH,DE,HU,SK,CZ,IT,SI,LI', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(13, 'AU', 'AUS', 36, 'AS', '{\"en\":\"Australia\",\"fr\":\"Australie\",\"es\":\"Australia\",\"ar\":\"أستراليا\",\"pt\":\"Austrália\",\"it\":\"Australia\",\"tr\":\"Avustralya\",\"ru\":\"Австралия\",\"zh\":\"澳大利亚\",\"ja\":\"オーストラリア\",\"th\":\"ออสเตรเลีย\",\"ro\":\"Australia\",\"ka\":\"ავსტრალია\"}', 'Canberra', 7686850, 21515754, 'OC', '.au', 'AUD', '61', '####', '^(d{4})$', 'en-AU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(14, 'AW', 'ABW', 533, 'AA', '{\"en\":\"Aruba\",\"fr\":\"Aruba\",\"es\":\"Aruba\",\"ar\":\"آروبا\",\"pt\":\"Aruba\",\"it\":\"Aruba\",\"tr\":\"Aruba\",\"ru\":\"Аруба\",\"zh\":\"阿鲁巴\",\"ja\":\"アルバ島\",\"th\":\"อารูบา\",\"ro\":\"Aruba\",\"ka\":\"არუბა\"}', 'Oranjestad', 193, 71566, 'NA', '.aw', 'AWG', '297', '', '', 'nl-AW,es,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(15, 'AX', 'ALA', 248, '', '{\"en\":\"Åland Islands\",\"fr\":\"Îles Åland\",\"es\":\"Islas Åland\",\"ar\":\"جزر أولان\",\"pt\":\"Ilhas Aland\",\"it\":\"Isole Aland\",\"tr\":\"Aland Adaları\",\"ru\":\"Аландские о-ва\",\"zh\":\"奥兰群岛\",\"ja\":\"オーランド諸島\",\"th\":\"หมู่เกาะโอลันด์\",\"ro\":\"Insulele Aland\",\"ka\":\"ალანდის კუნძულები\"}', 'Mariehamn', 1580, 26711, 'EU', '.ax', 'EUR', '+358-18', '#####', '^(?:FI)*(d{5})$', 'sv-AX', '', 'FI', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(16, 'AZ', 'AZE', 31, 'AJ', '{\"en\":\"Azerbaijan\",\"fr\":\"Azerbaïdjan\",\"es\":\"Azerbaiyán\",\"ar\":\"أذربيجان\",\"pt\":\"Azerbaijão\",\"it\":\"Azerbaigian\",\"tr\":\"Azerbaycan\",\"ru\":\"Азербайджан\",\"zh\":\"阿塞拜疆\",\"ja\":\"アゼルバイジャン\",\"th\":\"อาเซอร์ไบจาน\",\"ro\":\"Azerbaidjan\",\"ka\":\"აზერბაიჯანი\"}', 'Baku', 86600, 8303512, 'AS', '.az', 'AZN', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 'GE,IR,AM,TR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(17, 'BA', 'BIH', 70, 'BK', '{\"en\":\"Bosnia and Herzegovina\",\"fr\":\"Bosnie-Herzégovine\",\"es\":\"Bosnia-Herzegovina\",\"ar\":\"البوسنة والهرسك\",\"pt\":\"Bósnia-Herzegovina\",\"it\":\"Bosnia Erzegovina\",\"tr\":\"Bosna Hersek\",\"ru\":\"Босния и Герцеговина\",\"zh\":\"波斯尼亚和黑塞哥维那\",\"ja\":\"ボスニア・ヘルツェゴビナ\",\"th\":\"บอสเนียและเฮอร์เซโกวีนา\",\"ro\":\"Bosnia și Herțegovina\",\"ka\":\"ბოსნია და ჰერცეგოვინა\"}', 'Sarajevo', 51129, 4590000, 'EU', '.ba', 'BAM', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 'HR,ME,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(18, 'BB', 'BRB', 52, 'BB', '{\"en\":\"Barbados\",\"fr\":\"Barbade\",\"es\":\"Barbados\",\"ar\":\"بربادوس\",\"pt\":\"Barbados\",\"it\":\"Barbados\",\"tr\":\"Barbados\",\"ru\":\"Барбадос\",\"zh\":\"巴巴多斯\",\"ja\":\"バルバドス\",\"th\":\"บาร์เบโดส\",\"ro\":\"Barbados\",\"ka\":\"ბარბადოსი\"}', 'Bridgetown', 431, 285653, 'NA', '.bb', 'BBD', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(19, 'BD', 'BGD', 50, 'BG', '{\"en\":\"Bangladesh\",\"fr\":\"Bangladesh\",\"es\":\"Bangladesh\",\"ar\":\"بنجلاديش\",\"pt\":\"Bangladesh\",\"it\":\"Bangladesh\",\"tr\":\"Bangladeş\",\"ru\":\"Бангладеш\",\"zh\":\"孟加拉国\",\"ja\":\"バングラデシュ\",\"th\":\"บังกลาเทศ\",\"ro\":\"Bangladesh\",\"ka\":\"ბანგლადეში\"}', 'Dhaka', 144000, 156118464, 'AS', '.bd', 'BDT', '880', '####', '^(d{4})$', 'bn-BD,en', 'MM,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(20, 'BE', 'BEL', 56, 'BE', '{\"en\":\"Belgium\",\"fr\":\"Belgique\",\"es\":\"Bélgica\",\"ar\":\"بلجيكا\",\"pt\":\"Bélgica\",\"it\":\"Belgio\",\"tr\":\"Belçika\",\"ru\":\"Бельгия\",\"zh\":\"比利时\",\"ja\":\"ベルギー\",\"th\":\"เบลเยียม\",\"ro\":\"Belgia\",\"ka\":\"ბელგია\"}', 'Brussels', 30510, 10403000, 'EU', '.be', 'EUR', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 'DE,NL,LU,FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(21, 'BF', 'BFA', 854, 'UV', '{\"en\":\"Burkina Faso\",\"fr\":\"Burkina Faso\",\"es\":\"Burkina Faso\",\"ar\":\"بوركينا فاسو\",\"pt\":\"Burquina Faso\",\"it\":\"Burkina Faso\",\"tr\":\"Burkina Faso\",\"ru\":\"Буркина Фасо\",\"zh\":\"布基纳法索\",\"ja\":\"ブルキナファソ\",\"th\":\"บูร์กินาฟาโซ\",\"ro\":\"Burkina Faso\",\"ka\":\"ბურკინა-ფასო\"}', 'Ouagadougou', 274200, 16241811, 'AF', '.bf', 'XOF', '226', '', '', 'fr-BF', 'NE,BJ,GH,CI,TG,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(22, 'BG', 'BGR', 100, 'BU', '{\"en\":\"Bulgaria\",\"fr\":\"Bulgarie\",\"es\":\"Bulgaria\",\"ar\":\"بلغاريا\",\"pt\":\"Bulgária\",\"it\":\"Bulgaria\",\"tr\":\"Bulgaristan\",\"ru\":\"Болгария\",\"zh\":\"保加利亚\",\"ja\":\"ブルガリア\",\"th\":\"บัลแกเรีย\",\"ro\":\"Bulgaria\",\"ka\":\"ბულგარეთი\"}', 'Sofia', 110910, 7148785, 'EU', '.bg', 'BGN', '359', '####', '^(d{4})$', 'bg,tr-BG,rom', 'MK,GR,RO,TR,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(23, 'BH', 'BHR', 48, 'BA', '{\"en\":\"Bahrain\",\"fr\":\"Bahreïn\",\"es\":\"Bahréin\",\"ar\":\"البحرين\",\"pt\":\"Bahrain\",\"it\":\"Bahrein\",\"tr\":\"Bahreyn\",\"ru\":\"Бахрейн\",\"zh\":\"巴林\",\"ja\":\"バーレーン\",\"th\":\"บาห์เรน\",\"ro\":\"Bahrain\",\"ka\":\"ბაჰრეინი\"}', 'Manama', 665, 738004, 'AS', '.bh', 'BHD', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(24, 'BI', 'BDI', 108, 'BY', '{\"en\":\"Burundi\",\"fr\":\"Burundi\",\"es\":\"Burundi\",\"ar\":\"بوروندي\",\"pt\":\"Burundi\",\"it\":\"Burundi\",\"tr\":\"Burundi\",\"ru\":\"Бурунди\",\"zh\":\"布隆迪\",\"ja\":\"ブルンジ\",\"th\":\"บุรุนดี\",\"ro\":\"Burundi\",\"ka\":\"ბურუნდი\"}', 'Bujumbura', 27830, 9863117, 'AF', '.bi', 'BIF', '257', '', '', 'fr-BI,rn', 'TZ,CD,RW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(25, 'BJ', 'BEN', 204, 'BN', '{\"en\":\"Benin\",\"fr\":\"Bénin\",\"es\":\"Benín\",\"ar\":\"بنين\",\"pt\":\"Benin\",\"it\":\"Benin\",\"tr\":\"Benin\",\"ru\":\"Бенин\",\"zh\":\"贝宁\",\"ja\":\"ベナン\",\"th\":\"เบนิน\",\"ro\":\"Benin\",\"ka\":\"ბენინი\"}', 'Porto-Novo', 112620, 9056010, 'AF', '.bj', 'XOF', '+229', '', '', 'fr-BJ', 'NE,TG,BF,NG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(26, 'BL', 'BLM', 652, 'TB', '{\"en\":\"Saint Barthélemy\",\"fr\":\"Saint-Barthélémy\",\"es\":\"San Bartolomé\",\"ar\":\"سان بارتليمي\",\"pt\":\"São Bartolomeu\",\"it\":\"San Bartolomeo\",\"tr\":\"Saint Barthelemy\",\"ru\":\"Остров Святого Бартоломея\",\"zh\":\"圣巴泰勒米\",\"ja\":\"サン・バルテルミー\",\"th\":\"เซนต์บาร์เธเลมี\",\"ro\":\"Sfântul Bartolomeu\",\"ka\":\"Saint Barthelemy\"}', 'Gustavia', 21, 8450, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(27, 'BM', 'BMU', 60, 'BD', '{\"en\":\"Bermuda\",\"fr\":\"Bermudes\",\"es\":\"Bermudas\",\"ar\":\"برمودا\",\"pt\":\"Bermudas\",\"it\":\"Bermuda\",\"tr\":\"Bermuda\",\"ru\":\"Бермудские о-ва\",\"zh\":\"百慕大\",\"ja\":\"バミューダ\",\"th\":\"เบอร์มิวดา\",\"ro\":\"Bermuda\",\"ka\":\"ბერმუდა\"}', 'Hamilton', 53, 65365, 'NA', '.bm', 'BMD', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(28, 'BN', 'BRN', 96, 'BX', '{\"en\":\"Brunei\",\"fr\":\"Brunéi Darussalam\",\"es\":\"Brunéi\",\"ar\":\"بروناي\",\"pt\":\"Brunei\",\"it\":\"Brunei\",\"tr\":\"Brunei\",\"ru\":\"Бруней Даруссалам\",\"zh\":\"文莱\",\"ja\":\"ブルネイ\",\"th\":\"บรูไน\",\"ro\":\"Brunei\",\"ka\":\"ბრუნეი\"}', 'Bandar Seri Begawan', 5770, 395027, 'AS', '.bn', 'BND', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 'MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(29, 'BO', 'BOL', 68, 'BL', '{\"en\":\"Bolivia\",\"fr\":\"Bolivie\",\"es\":\"Bolivia\",\"ar\":\"بوليفيا\",\"pt\":\"Bolívia\",\"it\":\"Bolivia\",\"tr\":\"Bolivya\",\"ru\":\"Боливия\",\"zh\":\"玻利维亚\",\"ja\":\"ボリビア\",\"th\":\"โบลิเวีย\",\"ro\":\"Bolivia\",\"ka\":\"ბოლივია\"}', 'Sucre', 1098580, 9947418, 'SA', '.bo', 'BOB', '591', '', '', 'es-BO,qu,ay', 'PE,CL,PY,BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(30, 'BQ', 'BES', 535, '', '{\"en\":\"Bonaire, Sint Eustatius, and Saba\",\"fr\":\"Bonaire, Sint Eustatius et Saba\",\"es\":\"Bonaire, San Eustaquio y Saba\",\"ar\":\"بونير وسانت أوستاتيوس وسابا\",\"pt\":\"Bonaire, Santo Eustáquio e Saba\",\"it\":\"Bonaire, Saint Eustatius and Saba \",\"tr\":\"Bonaire, Sint Eustatius ve Saba\",\"ru\":\"Бонэйр, Синт-Эстатиус и Саба\",\"zh\":\"Bonaire, Saint Eustatius and Saba \",\"ja\":\"Bonaire, Saint Eustatius and Saba \",\"th\":\"โบแนร์, ซินต์ยูสตาเทียสและซาบ้า\",\"ro\":\"Bonaire, Saint Eustatius and Saba \",\"ka\":\"ბონერი, სინტ-ესტატიუსი და საბა\"}', '', 328, 18012, 'NA', '.bq', 'USD', '599', '', '', 'nl,pap,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(31, 'BR', 'BRA', 76, 'BR', '{\"en\":\"Brazil\",\"fr\":\"Brésil\",\"es\":\"Brasil\",\"ar\":\"البرازيل\",\"pt\":\"Brasil\",\"it\":\"Brasile\",\"tr\":\"Brezilya\",\"ru\":\"Бразилия\",\"zh\":\"巴西\",\"ja\":\"ブラジル\",\"th\":\"บราซิล\",\"ro\":\"Brazilia\",\"ka\":\"ბრაზილია\"}', 'Brasilia', 8511965, 201103330, 'SA', '.br', 'BRL', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(32, 'BS', 'BHS', 44, 'BF', '{\"en\":\"Bahamas\",\"fr\":\"Bahamas\",\"es\":\"Bahamas\",\"ar\":\"الباهاما\",\"pt\":\"Bahamas\",\"it\":\"Bahamas\",\"tr\":\"Bahamalar\",\"ru\":\"Багамские о-ва\",\"zh\":\"巴哈马\",\"ja\":\"バハマ\",\"th\":\"บาฮามาส\",\"ro\":\"Bahamas\",\"ka\":\"ბაჰამის კუნძულები\"}', 'Nassau', 13940, 301790, 'NA', '.bs', 'BSD', '+1-242', '', '', 'en-BS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(33, 'BT', 'BTN', 64, 'BT', '{\"en\":\"Bhutan\",\"fr\":\"Bhoutan\",\"es\":\"Bután\",\"ar\":\"بوتان\",\"pt\":\"Butão\",\"it\":\"Bhutan\",\"tr\":\"Butan\",\"ru\":\"Бутан\",\"zh\":\"不丹\",\"ja\":\"ブータン\",\"th\":\"ภูฏาน\",\"ro\":\"Bhutan\",\"ka\":\"ბუტანი\"}', 'Thimphu', 47000, 699847, 'AS', '.bt', 'BTN', '975', '', '', 'dz', 'CN,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(34, 'BV', 'BVT', 74, 'BV', '{\"en\":\"Bouvet Island\",\"fr\":\"Île Bouvet\",\"es\":\"Isla Bouvet\",\"ar\":\"جزيرة بوفيه\",\"pt\":\"Ilha Bouvet\",\"it\":\"Isola Bouvet\",\"tr\":\"Bouvet Adası\",\"ru\":\"Остров Буве\",\"zh\":\"布维特岛\",\"ja\":\"ブーベ島\",\"th\":\"เกาะบูเวต\",\"ro\":\"Insula Bouvet\",\"ka\":\"ბუვეს კუნძული\"}', '', 49, 0, 'AN', '.bv', 'NOK', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(35, 'BW', 'BWA', 72, 'BC', '{\"en\":\"Botswana\",\"fr\":\"Botswana\",\"es\":\"Botsuana\",\"ar\":\"بتسوانا\",\"pt\":\"Botsuana\",\"it\":\"Botswana\",\"tr\":\"Botsvana\",\"ru\":\"Ботсвана\",\"zh\":\"博茨瓦纳\",\"ja\":\"ボツワナ\",\"th\":\"บอตสวานา\",\"ro\":\"Botswana\",\"ka\":\"ბოტსვანა\"}', 'Gaborone', 600370, 2029307, 'AF', '.bw', 'BWP', '267', '', '', 'en-BW,tn-BW', 'ZW,ZA,NA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(36, 'BY', 'BLR', 112, 'BO', '{\"en\":\"Belarus\",\"fr\":\"Bélarus\",\"es\":\"Bielorrusia\",\"ar\":\"روسيا البيضاء\",\"pt\":\"Belarus\",\"it\":\"Bielorussia\",\"tr\":\"Beyaz Rusya\",\"ru\":\"Беларусь\",\"zh\":\"白俄罗斯\",\"ja\":\"ベラルーシ\",\"th\":\"เบลารุส\",\"ro\":\"Bielorusia\",\"ka\":\"ბელორუსია\"}', 'Minsk', 207600, 9685000, 'EU', '.by', 'BYR', '375', '######', '^(d{6})$', 'be,ru', 'PL,LT,UA,RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(37, 'BZ', 'BLZ', 84, 'BH', '{\"en\":\"Belize\",\"fr\":\"Belize\",\"es\":\"Belice\",\"ar\":\"بليز\",\"pt\":\"Belize\",\"it\":\"Belize\",\"tr\":\"Belize\",\"ru\":\"Белиз\",\"zh\":\"伯利兹\",\"ja\":\"ベリーズ\",\"th\":\"เบลีซ\",\"ro\":\"Belize\",\"ka\":\"ბელიზი\"}', 'Belmopan', 22966, 314522, 'NA', '.bz', 'BZD', '501', '', '', 'en-BZ,es', 'GT,MX', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(38, 'CA', 'CAN', 124, 'CA', '{\"en\":\"Canada\",\"fr\":\"Canada\",\"es\":\"Canadá\",\"ar\":\"كندا\",\"pt\":\"Canadá\",\"it\":\"Canada\",\"tr\":\"Kanada\",\"ru\":\"Канада\",\"zh\":\"加拿大\",\"ja\":\"カナダ\",\"th\":\"แคนาดา\",\"ro\":\"Canada\",\"ka\":\"კანადა\"}', 'Ottawa', 9984670, 33679000, 'NA', '.ca', 'CAD', '1', '@#@ #@#', '^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ', 'en-CA,fr-CA,iu', 'US', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(39, 'CC', 'CCK', 166, 'CK', '{\"en\":\"Cocos [Keeling] Islands\",\"fr\":\"Îles Cocos - Keeling\",\"es\":\"Islas Cocos\",\"ar\":\"جزر كوكوس\",\"pt\":\"Ilhas Coco\",\"it\":\"Isole Cocos\",\"tr\":\"Cocos Adaları\",\"ru\":\"Кокосовые о-ва\",\"zh\":\"科科斯群岛\",\"ja\":\"ココス[キーリング]諸島\",\"th\":\"หมู่เกาะโคโคส\",\"ro\":\"Insulele Cocos\",\"ka\":\"Cocos Islands\"}', 'West Island', 14, 628, 'AS', '.cc', 'AUD', '61', '', '', 'ms-CC,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(40, 'CD', 'COD', 180, 'CG', '{\"en\":\"Congo - Kinshasa\",\"fr\":\"République démocratique du Congo\",\"es\":\"República Democrática del Congo\",\"ar\":\"الكونغو - كينشاسا\",\"pt\":\"Congo-Kinshasa\",\"it\":\"Repubblica Democratica del Congo\",\"tr\":\"Kongo - Kinşasa\",\"ru\":\"Демократическая Республика Конго\",\"zh\":\"刚果（金）\",\"ja\":\"コンゴ民主共和国[キンシャサ]\",\"th\":\"คองโก-กินชาซา\",\"ro\":\"Republica Democrată Congo\",\"ka\":\"კონგო - კინშასა\"}', 'Kinshasa', 2345410, 70916439, 'AF', '.cd', 'CDF', '243', '', '', 'fr-CD,ln,kg', 'TZ,CF,SS,RW,ZM,BI,UG,CG,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(41, 'CF', 'CAF', 140, 'CT', '{\"en\":\"Central African Republic\",\"fr\":\"République centrafricaine\",\"es\":\"República Centroafricana\",\"ar\":\"جمهورية أفريقيا الوسطى\",\"pt\":\"República Centro-Africana\",\"it\":\"Repubblica Centrafricana\",\"tr\":\"Orta Afrika Cumhuriyeti\",\"ru\":\"ЦАР\",\"zh\":\"中非共和国\",\"ja\":\"中央アフリカ共和国\",\"th\":\"สาธารณรัฐแอฟริกากลาง\",\"ro\":\"Republica Centrafricană\",\"ka\":\"ცენტრალური აფრიკის რესპუბლიკა\"}', 'Bangui', 622984, 4844927, 'AF', '.cf', 'XAF', '236', '', '', 'fr-CF,sg,ln,kg', 'TD,SD,CD,SS,CM,CG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(42, 'CG', 'COG', 178, 'CF', '{\"en\":\"Congo - Brazzaville\",\"fr\":\"Congo-Brazzaville\",\"es\":\"Congo - Brazzaville\",\"ar\":\"الكونغو - برازافيل\",\"pt\":\"Congo - Brazzaville\",\"it\":\"Congo\",\"tr\":\"Kongo - Brazavil\",\"ru\":\"Конго\",\"zh\":\"刚果（布）\",\"ja\":\"コンゴ共和国[ブラザビル]\",\"th\":\"คองโก-บราซซาวิล\",\"ro\":\"Congo\",\"ka\":\"კონგო\"}', 'Brazzaville', 342000, 3039126, 'AF', '.cg', 'XAF', '242', '', '', 'fr-CG,kg,ln-CG', 'CF,GA,CD,CM,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(43, 'CH', 'CHE', 756, 'SZ', '{\"en\":\"Switzerland\",\"fr\":\"Suisse\",\"es\":\"Suiza\",\"ar\":\"سويسرا\",\"pt\":\"Suíça\",\"it\":\"Svizzera\",\"tr\":\"İsviçre\",\"ru\":\"Швейцария\",\"zh\":\"瑞士\",\"ja\":\"スイス\",\"th\":\"สวิตเซอร์แลนด์\",\"ro\":\"Elveția\",\"ka\":\"შვეიცარია\"}', 'Berne', 41290, 7581000, 'EU', '.ch', 'CHF', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 'DE,IT,LI,FR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(44, 'CI', 'CIV', 384, 'IV', '{\"en\":\"Côte d’Ivoire\",\"fr\":\"Côte d’Ivoire\",\"es\":\"Costa de Marfil\",\"ar\":\"ساحل العاج\",\"pt\":\"Costa do Marfim\",\"it\":\"Costa d’Avorio\",\"tr\":\"Fildişi Sahili\",\"ru\":\"Кот д’Ивуар\",\"zh\":\"科特迪瓦\",\"ja\":\"コートジボワール\",\"th\":\"ไอวอรี่โคสต์\",\"ro\":\"Coasta de Fildeș\",\"ka\":\"სპილოს ძვლის სანაპირო\"}', 'Yamoussoukro', 322460, 21058798, 'AF', '.ci', 'XOF', '225', '', '', 'fr-CI', 'LR,GH,GN,BF,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(45, 'CK', 'COK', 184, 'CW', '{\"en\":\"Cook Islands\",\"fr\":\"Îles Cook\",\"es\":\"Islas Cook\",\"ar\":\"جزر كوك\",\"pt\":\"Ilhas Cook\",\"it\":\"Isole Cook\",\"tr\":\"Cook Adaları\",\"ru\":\"Острова Кука\",\"zh\":\"库克群岛\",\"ja\":\"クック諸島\",\"th\":\"หมู่เกาะคุก\",\"ro\":\"Insulele Cook\",\"ka\":\"კუკის კუნძულები\"}', 'Avarua', 240, 21388, 'OC', '.ck', 'NZD', '682', '', '', 'en-CK,mi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(46, 'CL', 'CHL', 152, 'CI', '{\"en\":\"Chile\",\"fr\":\"Chili\",\"es\":\"Chile\",\"ar\":\"شيلي\",\"pt\":\"Chile\",\"it\":\"Cile\",\"tr\":\"Şili\",\"ru\":\"Чили\",\"zh\":\"智利\",\"ja\":\"チリ\",\"th\":\"ชิลี\",\"ro\":\"Chile\",\"ka\":\"ჩილე\"}', 'Santiago', 756950, 16746491, 'SA', '.cl', 'CLP', '56', '#######', '^(d{7})$', 'es-CL', 'PE,BO,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(47, 'CM', 'CMR', 120, 'CM', '{\"en\":\"Cameroon\",\"fr\":\"Cameroun\",\"es\":\"Camerún\",\"ar\":\"الكاميرون\",\"pt\":\"República dos Camarões\",\"it\":\"Camerun\",\"tr\":\"Kamerun\",\"ru\":\"Камерун\",\"zh\":\"喀麦隆\",\"ja\":\"カメルーン\",\"th\":\"แคเมอรูน\",\"ro\":\"Camerun\",\"ka\":\"კამერუნი\"}', 'Yaounde', 475440, 19294149, 'AF', '.cm', 'XAF', '237', '', '', 'fr-CM,en-CM', 'TD,CF,GA,GQ,CG,NG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(48, 'CN', 'CHN', 156, 'CH', '{\"en\":\"China\",\"fr\":\"Chine\",\"es\":\"China\",\"ar\":\"الصين\",\"pt\":\"China\",\"it\":\"Cina\",\"tr\":\"Çin\",\"ru\":\"Китай\",\"zh\":\"中国\",\"ja\":\"中国\",\"th\":\"จีน\",\"ro\":\"China\",\"ka\":\"ჩინეთი\"}', 'Beijing', 9596960, 1330044000, 'AS', '.cn', 'CNY', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(49, 'CO', 'COL', 170, 'CO', '{\"en\":\"Colombia\",\"fr\":\"Colombie\",\"es\":\"Colombia\",\"ar\":\"كولومبيا\",\"pt\":\"Colômbia\",\"it\":\"Colombia\",\"tr\":\"Kolombiya\",\"ru\":\"Колумбия\",\"zh\":\"哥伦比亚\",\"ja\":\"コロンビア\",\"th\":\"โคลอมเบีย\",\"ro\":\"Columbia\",\"ka\":\"კოლუმბია\"}', 'Bogota', 1138910, 47790000, 'SA', '.co', 'COP', '57', '', '', 'es-CO', 'EC,PE,PA,BR,VE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(50, 'CR', 'CRI', 188, 'CS', '{\"en\":\"Costa Rica\",\"fr\":\"Costa Rica\",\"es\":\"Costa Rica\",\"ar\":\"كوستاريكا\",\"pt\":\"Costa Rica\",\"it\":\"Costa Rica\",\"tr\":\"Kosta Rika\",\"ru\":\"Коста-Рика\",\"zh\":\"哥斯达黎加\",\"ja\":\"コスタリカ\",\"th\":\"คอสตาริกา\",\"ro\":\"Costa Rica\",\"ka\":\"კოსტა-რიკა\"}', 'San Jose', 51100, 4516220, 'NA', '.cr', 'CRC', '506', '####', '^(d{4})$', 'es-CR,en', 'PA,NI', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(51, 'CS', 'SCG', 891, 'YI', '{\"en\":\"Serbia and Montenegro\",\"fr\":\"Serbie-et-Monténégro\",\"es\":\"Serbia y Montenegro\",\"ar\":\"صربيا والجبل الأسود\",\"pt\":\"Sérvia e Montenegro\",\"it\":\"Serbia e Montenegro\",\"tr\":\"Sırbistan-Karadağ\",\"ru\":\"Сербия и Черногория\",\"zh\":\"塞尔维亚和黑山\",\"ja\":\"セルビア・モンテネグロ\",\"th\":\"เซอร์เบียและมอนเตเนโกร\",\"ro\":\"Serbia și Muntenegru\",\"ka\":\"სერბია და მონტენეგრო\"}', 'Belgrade', 102350, 10829175, 'EU', '.cs', 'RSD', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 'AL,HU,MK,RO,HR,BA,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(52, 'CU', 'CUB', 192, 'CU', '{\"en\":\"Cuba\",\"fr\":\"Cuba\",\"es\":\"Cuba\",\"ar\":\"كوبا\",\"pt\":\"Cuba\",\"it\":\"Cuba\",\"tr\":\"Küba\",\"ru\":\"Куба\",\"zh\":\"古巴\",\"ja\":\"キューバ\",\"th\":\"คิวบา\",\"ro\":\"Cuba\",\"ka\":\"კუბა\"}', 'Havana', 110860, 11423000, 'NA', '.cu', 'CUP', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 'US', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(53, 'CV', 'CPV', 132, 'CV', '{\"en\":\"Cape Verde\",\"fr\":\"Cap-Vert\",\"es\":\"Cabo Verde\",\"ar\":\"الرأس الأخضر\",\"pt\":\"Cabo Verde\",\"it\":\"Capo Verde\",\"tr\":\"Cape Verde\",\"ru\":\"Острова Зеленого Мыса\",\"zh\":\"佛得角\",\"ja\":\"カーボベルデ\",\"th\":\"เคปเวิร์ด\",\"ro\":\"Capul Verde\",\"ka\":\"კაბო-ვერდე\"}', 'Praia', 4033, 508659, 'AF', '.cv', 'CVE', '238', '####', '^(d{4})$', 'pt-CV', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(54, 'CW', 'CUW', 531, 'UC', '{\"en\":\"Curaçao\",\"fr\":\"Curacao\",\"es\":\"Curazao\",\"ar\":\"كوراساو\",\"pt\":\"Curaçao\",\"it\":\"Curacao\",\"tr\":\"Curacao\",\"ru\":\"Кюрасао\",\"zh\":\"Curacao\",\"ja\":\"Curacao\",\"th\":\"คูราเซา\",\"ro\":\"Curacao\",\"ka\":\"კურაკოო\"}', ' Willemstad', 444, 141766, 'NA', '.cw', 'ANG', '599', '', '', 'nl,pap', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(55, 'CX', 'CXR', 162, 'KT', '{\"en\":\"Christmas Island\",\"fr\":\"Île Christmas\",\"es\":\"Isla Christmas\",\"ar\":\"جزيرة الكريسماس\",\"pt\":\"Ilhas Natal\",\"it\":\"Isola di Christmas\",\"tr\":\"Christmas Adası\",\"ru\":\"Остров Рождества\",\"zh\":\"圣诞岛\",\"ja\":\"クリスマス島\",\"th\":\"เกาะคริสต์มาส\",\"ro\":\"Insula Christmas\",\"ka\":\"შობის კუნძული\"}', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(56, 'CY', 'CYP', 196, 'CY', '{\"en\":\"Cyprus\",\"fr\":\"Chypre\",\"es\":\"Chipre\",\"ar\":\"قبرص\",\"pt\":\"Chipre\",\"it\":\"Cipro\",\"tr\":\"Güney Kıbrıs Rum Kesimi\",\"ru\":\"Кипр\",\"zh\":\"塞浦路斯\",\"ja\":\"キプロス\",\"th\":\"ไซปรัส\",\"ro\":\"Cipru\",\"ka\":\"კვიპროსი\"}', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(57, 'CZ', 'CZE', 203, 'EZ', '{\"en\":\"Czech Republic\",\"fr\":\"République tchèque\",\"es\":\"República Checa\",\"ar\":\"جمهورية التشيك\",\"pt\":\"República Tcheca\",\"it\":\"Repubblica Ceca\",\"tr\":\"Çek Cumhuriyeti\",\"ru\":\"Чехия\",\"zh\":\"捷克共和国\",\"ja\":\"チェコ共和国\",\"th\":\"สาธารณรัฐเช็ก\",\"ro\":\"Republica Cehă\",\"ka\":\"ჩეხეთის რესპუბლიკა\"}', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(58, 'DE', 'DEU', 276, 'GM', '{\"en\":\"Germany\",\"fr\":\"Allemagne\",\"es\":\"Alemania\",\"ar\":\"ألمانيا\",\"pt\":\"Alemanha\",\"it\":\"Germania\",\"tr\":\"Almanya\",\"ru\":\"Германия\",\"zh\":\"德国\",\"ja\":\"ドイツ\",\"th\":\"เยอรมนี\",\"ro\":\"Germania\",\"ka\":\"გერმანია\"}', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(59, 'DJ', 'DJI', 262, 'DJ', '{\"en\":\"Djibouti\",\"fr\":\"Djibouti\",\"es\":\"Yibuti\",\"ar\":\"جيبوتي\",\"pt\":\"Djibuti\",\"it\":\"Gibuti\",\"tr\":\"Cibuti\",\"ru\":\"Джибути\",\"zh\":\"吉布提\",\"ja\":\"ジブチ\",\"th\":\"จิบูตี\",\"ro\":\"Djibouti\",\"ka\":\"ჯიბუტი\"}', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(60, 'DK', 'DNK', 208, 'DA', '{\"en\":\"Denmark\",\"fr\":\"Danemark\",\"es\":\"Dinamarca\",\"ar\":\"الدانمرك\",\"pt\":\"Dinamarca\",\"it\":\"Danimarca\",\"tr\":\"Danimarka\",\"ru\":\"Дания\",\"zh\":\"丹麦\",\"ja\":\"デンマーク\",\"th\":\"เดนมาร์ก\",\"ro\":\"Danemarca\",\"ka\":\"დანია\"}', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(61, 'DM', 'DMA', 212, 'DO', '{\"en\":\"Dominica\",\"fr\":\"Dominique\",\"es\":\"Dominica\",\"ar\":\"دومينيكا\",\"pt\":\"Dominica\",\"it\":\"Dominica\",\"tr\":\"Dominika\",\"ru\":\"Доминика\",\"zh\":\"多米尼加\",\"ja\":\"ドミニカ国\",\"th\":\"โดมินิกา\",\"ro\":\"Dominica\",\"ka\":\"დომინიკა\"}', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(62, 'DO', 'DOM', 214, 'DR', '{\"en\":\"Dominican Republic\",\"fr\":\"République dominicaine\",\"es\":\"República Dominicana\",\"ar\":\"جمهورية الدومينيك\",\"pt\":\"República Dominicana\",\"it\":\"Repubblica Dominicana\",\"tr\":\"Dominik Cumhuriyeti\",\"ru\":\"Доминиканская Республика\",\"zh\":\"多米尼加共和国\",\"ja\":\"ドミニカ共和国\",\"th\":\"สาธารณรัฐโดมินิกัน\",\"ro\":\"Republica Dominicană\",\"ka\":\"დომინიკანის რესპუბლიკა\"}', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(63, 'DZ', 'DZA', 12, 'AG', '{\"en\":\"Algeria\",\"fr\":\"Algérie\",\"es\":\"Argelia\",\"ar\":\"الجزائر\",\"pt\":\"Argélia\",\"it\":\"Algeria\",\"tr\":\"Cezayir\",\"ru\":\"Алжир\",\"zh\":\"阿尔及利亚\",\"ja\":\"アルジェリア\",\"th\":\"แอลจีเรีย\",\"ro\":\"Algeria\",\"ka\":\"ალჟირი\"}', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(64, 'EC', 'ECU', 218, 'EC', '{\"en\":\"Ecuador\",\"fr\":\"Équateur\",\"es\":\"Ecuador\",\"ar\":\"الإكوادور\",\"pt\":\"Equador\",\"it\":\"Ecuador\",\"tr\":\"Ekvador\",\"ru\":\"Эквадор\",\"zh\":\"厄瓜多尔\",\"ja\":\"エクアドル\",\"th\":\"เอกวาดอร์\",\"ro\":\"Ecuador\",\"ka\":\"ეკვადორი\"}', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(65, 'EE', 'EST', 233, 'EN', '{\"en\":\"Estonia\",\"fr\":\"Estonie\",\"es\":\"Estonia\",\"ar\":\"أستونيا\",\"pt\":\"Estônia\",\"it\":\"Estonia\",\"tr\":\"Estonya\",\"ru\":\"Эстония\",\"zh\":\"爱沙尼亚\",\"ja\":\"エストニア\",\"th\":\"เอสโตเนีย\",\"ro\":\"Estonia\",\"ka\":\"ესტონეთი\"}', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(66, 'EG', 'EGY', 818, 'EG', '{\"en\":\"Egypt\",\"fr\":\"Égypte\",\"es\":\"Egipto\",\"ar\":\"مصر\",\"pt\":\"Egito\",\"it\":\"Egitto\",\"tr\":\"Mısır\",\"ru\":\"Египет\",\"zh\":\"埃及\",\"ja\":\"エジプト\",\"th\":\"อียิปต์\",\"ro\":\"Egipt\",\"ka\":\"ეგვიპტე\"}', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(67, 'EH', 'ESH', 732, 'WI', '{\"en\":\"Western Sahara\",\"fr\":\"Sahara occidental\",\"es\":\"Sáhara Occidental\",\"ar\":\"الصحراء الغربية\",\"pt\":\"Saara Ocidental\",\"it\":\"Sahara Occidentale\",\"tr\":\"Batı Sahara\",\"ru\":\"Западная Сахара\",\"zh\":\"西撒哈拉\",\"ja\":\"西サハラ\",\"th\":\"ซาฮาราตะวันตก\",\"ro\":\"Sahara Occidentală\",\"ka\":\"დასავლეთი საჰარა\"}', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(68, 'ER', 'ERI', 232, 'ER', '{\"en\":\"Eritrea\",\"fr\":\"Érythrée\",\"es\":\"Eritrea\",\"ar\":\"أريتريا\",\"pt\":\"Eritreia\",\"it\":\"Eritrea\",\"tr\":\"Eritre\",\"ru\":\"Эритрея\",\"zh\":\"厄立特里亚\",\"ja\":\"エリトリア\",\"th\":\"เอริเทรีย\",\"ro\":\"Eritreea\",\"ka\":\"ერიტრეა\"}', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(69, 'ES', 'ESP', 724, 'SP', '{\"en\":\"Spain\",\"fr\":\"Espagne\",\"es\":\"España\",\"ar\":\"إسبانيا\",\"pt\":\"Espanha\",\"it\":\"Spagna\",\"tr\":\"İspanya\",\"ru\":\"Испания\",\"zh\":\"西班牙\",\"ja\":\"スペイン\",\"th\":\"สเปน\",\"ro\":\"Spania\",\"ka\":\"ესპანეთი\"}', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(70, 'ET', 'ETH', 231, 'ET', '{\"en\":\"Ethiopia\",\"fr\":\"Éthiopie\",\"es\":\"Etiopía\",\"ar\":\"إثيوبيا\",\"pt\":\"Etiópia\",\"it\":\"Etiopia\",\"tr\":\"Etiyopya\",\"ru\":\"Эфиопия\",\"zh\":\"埃塞俄比亚\",\"ja\":\"エチオピア\",\"th\":\"เอธิโอเปีย\",\"ro\":\"Etiopia\",\"ka\":\"ეთიოპია\"}', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(71, 'FI', 'FIN', 246, 'FI', '{\"en\":\"Finland\",\"fr\":\"Finlande\",\"es\":\"Finlandia\",\"ar\":\"فنلندا\",\"pt\":\"Finlândia\",\"it\":\"Finlandia\",\"tr\":\"Finlandiya\",\"ru\":\"Финляндия\",\"zh\":\"芬兰\",\"ja\":\"フィンランド\",\"th\":\"ฟินแลนด์\",\"ro\":\"Finlanda\",\"ka\":\"ფინეთი\"}', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(72, 'FJ', 'FJI', 242, 'FJ', '{\"en\":\"Fiji\",\"fr\":\"Fidji\",\"es\":\"Fiyi\",\"ar\":\"فيجي\",\"pt\":\"Fiji\",\"it\":\"Figi\",\"tr\":\"Fiji\",\"ru\":\"Фиджи\",\"zh\":\"斐济\",\"ja\":\"フィジー\",\"th\":\"ฟิจิ\",\"ro\":\"Fiji\",\"ka\":\"ფიჯი\"}', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(73, 'FK', 'FLK', 238, 'FK', '{\"en\":\"Falkland Islands\",\"fr\":\"Îles Malouines\",\"es\":\"Islas Malvinas\",\"ar\":\"جزر فوكلاند\",\"pt\":\"Ilhas Malvinas\",\"it\":\"Isole Falkland\",\"tr\":\"Falkland Adaları\",\"ru\":\"Фолклендские о-ва\",\"zh\":\"福克兰群岛\",\"ja\":\"フォークランド諸島\",\"th\":\"หมู่เกาะฟอล์กแลนด์\",\"ro\":\"Insulele Falkland\",\"ka\":\"ფალკლენდის კუნძულები\"}', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(74, 'FM', 'FSM', 583, 'FM', '{\"en\":\"Micronesia\",\"fr\":\"États fédérés de Micronésie\",\"es\":\"Micronesia\",\"ar\":\"ميكرونيزيا\",\"pt\":\"Micronésia\",\"it\":\"Micronesia\",\"tr\":\"Mikronezya Federal Eyaletleri\",\"ru\":\"Федеративные Штаты Микронезии\",\"zh\":\"密克罗尼西亚联邦\",\"ja\":\"ミクロネシア連邦\",\"th\":\"ไมโครนีเซีย\",\"ro\":\"Micronezia\",\"ka\":\"მიკრონეზია\"}', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(75, 'FO', 'FRO', 234, 'FO', '{\"en\":\"Faroe Islands\",\"fr\":\"Îles Féroé\",\"es\":\"Islas Feroe\",\"ar\":\"جزر فارو\",\"pt\":\"Ilhas Faroe\",\"it\":\"Isole Faroe\",\"tr\":\"Faroe Adaları\",\"ru\":\"Фарерские о-ва\",\"zh\":\"法罗群岛\",\"ja\":\"フェロー諸島\",\"th\":\"หมู่เกาะแฟโร\",\"ro\":\"Insulele Feroe\",\"ka\":\"ფაროს კუნძულები\"}', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(76, 'FR', 'FRA', 250, 'FR', '{\"en\":\"France\",\"fr\":\"France\",\"es\":\"Francia\",\"ar\":\"فرنسا\",\"pt\":\"França\",\"it\":\"Francia\",\"tr\":\"Fransa\",\"ru\":\"Франция\",\"zh\":\"法国\",\"ja\":\"フランス\",\"th\":\"ฝรั่งเศส\",\"ro\":\"Franța\",\"ka\":\"საფრანგეთი\"}', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(77, 'GA', 'GAB', 266, 'GB', '{\"en\":\"Gabon\",\"fr\":\"Gabon\",\"es\":\"Gabón\",\"ar\":\"الجابون\",\"pt\":\"Gabão\",\"it\":\"Gabon\",\"tr\":\"Gabon\",\"ru\":\"Габон\",\"zh\":\"加蓬\",\"ja\":\"ガボン\",\"th\":\"กาบอง\",\"ro\":\"Gabon\",\"ka\":\"გაბონი\"}', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(78, 'GD', 'GRD', 308, 'GJ', '{\"en\":\"Grenada\",\"fr\":\"Grenade\",\"es\":\"Granada\",\"ar\":\"غرينادا\",\"pt\":\"Granada\",\"it\":\"Grenada\",\"tr\":\"Grenada\",\"ru\":\"Гренада\",\"zh\":\"格林纳达\",\"ja\":\"グレナダ\",\"th\":\"เกรเนดา\",\"ro\":\"Grenada\",\"ka\":\"გრენადა\"}', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(79, 'GE', 'GEO', 268, 'GG', '{\"en\":\"Georgia\",\"fr\":\"Géorgie\",\"es\":\"Georgia\",\"ar\":\"جورجيا\",\"pt\":\"Geórgia\",\"it\":\"Georgia\",\"tr\":\"Gürcistan\",\"ru\":\"Грузия\",\"zh\":\"格鲁吉亚\",\"ja\":\"グルジア\",\"th\":\"จอร์เจีย\",\"ro\":\"Georgia\",\"ka\":\"საქართველო\"}', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(80, 'GF', 'GUF', 254, 'FG', '{\"en\":\"French Guiana\",\"fr\":\"Guyane française\",\"es\":\"Guayana Francesa\",\"ar\":\"غويانا الفرنسية\",\"pt\":\"Guiana Francesa\",\"it\":\"Guiana Francese\",\"tr\":\"Fransız Guyanası\",\"ru\":\"Французская Гвиана\",\"zh\":\"法属圭亚那\",\"ja\":\"仏領ギアナ\",\"th\":\"เฟรนช์เกียนา\",\"ro\":\"Guyana Franceză\",\"ka\":\"French Guiana\"}', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(81, 'GG', 'GGY', 831, 'GK', '{\"en\":\"Guernsey\",\"fr\":\"Guernesey\",\"es\":\"Guernsey\",\"ar\":\"غيرنزي\",\"pt\":\"Guernsey\",\"it\":\"Guernsey\",\"tr\":\"Guernsey\",\"ru\":\"Гернси\",\"zh\":\"格恩西岛\",\"ja\":\"ガーンジー\",\"th\":\"เกิร์นซีย์\",\"ro\":\"Guernsey\",\"ka\":\"Guernsey\"}', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(82, 'GH', 'GHA', 288, 'GH', '{\"en\":\"Ghana\",\"fr\":\"Ghana\",\"es\":\"Ghana\",\"ar\":\"غانا\",\"pt\":\"Gana\",\"it\":\"Ghana\",\"tr\":\"Gana\",\"ru\":\"Гана\",\"zh\":\"加纳\",\"ja\":\"ガーナ\",\"th\":\"กานา\",\"ro\":\"Ghana\",\"ka\":\"განა\"}', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(83, 'GI', 'GIB', 292, 'GI', '{\"en\":\"Gibraltar\",\"fr\":\"Gibraltar\",\"es\":\"Gibraltar\",\"ar\":\"جبل طارق\",\"pt\":\"Gibraltar\",\"it\":\"Gibilterra\",\"tr\":\"Cebelitarık\",\"ru\":\"Гибралтар\",\"zh\":\"直布罗陀\",\"ja\":\"ジブラルタル\",\"th\":\"ยิบรอลตาร์\",\"ro\":\"Gibraltar\",\"ka\":\"გიბრალტარი\"}', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(84, 'GL', 'GRL', 304, 'GL', '{\"en\":\"Greenland\",\"fr\":\"Groenland\",\"es\":\"Groenlandia\",\"ar\":\"غرينلاند\",\"pt\":\"Groênlandia\",\"it\":\"Groenlandia\",\"tr\":\"Grönland\",\"ru\":\"Гренландия\",\"zh\":\"格陵兰\",\"ja\":\"グリーンランド\",\"th\":\"กรีนแลนด์\",\"ro\":\"Groenlanda\",\"ka\":\"გრენლანდია\"}', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(85, 'GM', 'GMB', 270, 'GA', '{\"en\":\"Gambia\",\"fr\":\"Gambie\",\"es\":\"Gambia\",\"ar\":\"غامبيا\",\"pt\":\"Gâmbia\",\"it\":\"Gambia\",\"tr\":\"Gambiya\",\"ru\":\"Гамбия\",\"zh\":\"冈比亚\",\"ja\":\"ガンビア\",\"th\":\"แกมเบีย\",\"ro\":\"Gambia\",\"ka\":\"გამბია\"}', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(86, 'GN', 'GIN', 324, 'GV', '{\"en\":\"Guinea\",\"fr\":\"Guinée\",\"es\":\"Guinea\",\"ar\":\"غينيا\",\"pt\":\"Guiné\",\"it\":\"Guinea\",\"tr\":\"Gine\",\"ru\":\"Гвинея\",\"zh\":\"几内亚\",\"ja\":\"ギニア\",\"th\":\"กินี\",\"ro\":\"Guineea\",\"ka\":\"გვინეა\"}', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(87, 'GP', 'GLP', 312, 'GP', '{\"en\":\"Guadeloupe\",\"fr\":\"Guadeloupe\",\"es\":\"Guadalupe\",\"ar\":\"جوادلوب\",\"pt\":\"Guadalupe\",\"it\":\"Guadalupa\",\"tr\":\"Guadalupe\",\"ru\":\"Гваделупа\",\"zh\":\"瓜德罗普岛\",\"ja\":\"グアドループ\",\"th\":\"กวาเดอลูป\",\"ro\":\"Guadelupa\",\"ka\":\"გვადელუპე\"}', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(88, 'GQ', 'GNQ', 226, 'EK', '{\"en\":\"Equatorial Guinea\",\"fr\":\"Guinée équatoriale\",\"es\":\"Guinea Ecuatorial\",\"ar\":\"غينيا الاستوائية\",\"pt\":\"Guiné Equatorial\",\"it\":\"Guinea Equatoriale\",\"tr\":\"Ekvator Ginesi\",\"ru\":\"Экваториальная Гвинея\",\"zh\":\"赤道几内亚\",\"ja\":\"赤道ギニア\",\"th\":\"อิเควทอเรียลกินี\",\"ro\":\"Guineea Ecuatorială\",\"ka\":\"ეკვატორული გვინეა\"}', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(89, 'GR', 'GRC', 300, 'GR', '{\"en\":\"Greece\",\"fr\":\"Grèce\",\"es\":\"Grecia\",\"ar\":\"اليونان\",\"pt\":\"Grécia\",\"it\":\"Grecia\",\"tr\":\"Yunanistan\",\"ru\":\"Греция\",\"zh\":\"希腊\",\"ja\":\"ギリシャ\",\"th\":\"กรีซ\",\"ro\":\"Grecia\",\"ka\":\"საბერძნეთი\"}', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(90, 'GS', 'SGS', 239, 'SX', '{\"en\":\"South Georgia and the South Sandwich Islands\",\"fr\":\"Géorgie du Sud et les îles Sandwich du Sud\",\"es\":\"Islas Georgia del Sur y Sandwich del Sur\",\"ar\":\"جورجيا الجنوبية وجزر ساندويتش الجنوبية\",\"pt\":\"Geórgia do Sul e Ilhas Sandwich do Sul\",\"it\":\"Georgia del Sud e Isole Sandwich del Sud\",\"tr\":\"Güney Georgia ve Güney Sandwich Adaları\",\"ru\":\"Южная Джорджия и Южные Сандвичевы Острова\",\"zh\":\"南乔治亚岛和南桑威齐群岛\",\"ja\":\"南ジョージア島・南サンドイッチ諸島\",\"th\":\"เกาะเซาท์จอร์เจียและหมู่เกาะเซาท์แซนด์วิช\",\"ro\":\"Georgia de Sud şi Insulele Sandwich de Sud\",\"ka\":\"სამხრეთი ჯორჯია და სამხრეთ სენდვიჩის კუნძულები\"}', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(91, 'GT', 'GTM', 320, 'GT', '{\"en\":\"Guatemala\",\"fr\":\"Guatemala\",\"es\":\"Guatemala\",\"ar\":\"غواتيمالا\",\"pt\":\"Guatemala\",\"it\":\"Guatemala\",\"tr\":\"Guatemala\",\"ru\":\"Гватемала\",\"zh\":\"危地马拉\",\"ja\":\"グアテマラ\",\"th\":\"กัวเตมาลา\",\"ro\":\"Guatemala\",\"ka\":\"გვატემალა\"}', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(92, 'GU', 'GUM', 316, 'GQ', '{\"en\":\"Guam\",\"fr\":\"Guam\",\"es\":\"Guam\",\"ar\":\"غوام\",\"pt\":\"Guam\",\"it\":\"Guam\",\"tr\":\"Guam\",\"ru\":\"Гуам\",\"zh\":\"关岛\",\"ja\":\"グアム\",\"th\":\"กวม\",\"ro\":\"Guam\",\"ka\":\"გუამი\"}', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(93, 'GW', 'GNB', 624, 'PU', '{\"en\":\"Guinea-Bissau\",\"fr\":\"Guinée-Bissau\",\"es\":\"Guinea-Bissau\",\"ar\":\"غينيا بيساو\",\"pt\":\"Guiné Bissau\",\"it\":\"Guinea-Bissau\",\"tr\":\"Gine-Bissau\",\"ru\":\"Гвинея-Бисау\",\"zh\":\"几内亚比绍\",\"ja\":\"ギニアビサウ\",\"th\":\"กินี-บิสเซา\",\"ro\":\"Guineea-Bissau\",\"ka\":\"გვინეა-ბისაუ\"}', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(94, 'GY', 'GUY', 328, 'GY', '{\"en\":\"Guyana\",\"fr\":\"Guyana\",\"es\":\"Guyana\",\"ar\":\"غيانا\",\"pt\":\"Guiana\",\"it\":\"Guyana\",\"tr\":\"Guyana\",\"ru\":\"Гайана\",\"zh\":\"圭亚那\",\"ja\":\"ガイアナ\",\"th\":\"กายอานา\",\"ro\":\"Guyana\",\"ka\":\"გაიანა\"}', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(95, 'HK', 'HKG', 344, 'HK', '{\"en\":\"Hong Kong SAR China\",\"fr\":\"R.A.S. chinoise de Hong Kong\",\"es\":\"Región Administrativa Especial de Hong Kong de la República Popular China\",\"ar\":\"هونغ كونغ الصينية\",\"pt\":\"Hong Kong, Região Admin. Especial da China\",\"it\":\"Regione Amministrativa Speciale di Hong Kong della Repubblica Popolare Cinese\",\"tr\":\"Hong Kong SAR - Çin\",\"ru\":\"Гонконг (особый район)\",\"zh\":\"中国香港特别行政区\",\"ja\":\"中華人民共和国香港特別行政区\",\"th\":\"ฮ่องกง เขตปกครองพิเศษประเทศจีน\",\"ro\":\"R.A.S. Hong Kong a Chinei\",\"ka\":\"ჰონგ კონგი\"}', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(96, 'HM', 'HMD', 334, 'HM', '{\"en\":\"Heard Island and McDonald Islands\",\"fr\":\"Îles Heard et MacDonald\",\"es\":\"Islas Heard y McDonald\",\"ar\":\"جزيرة هيرد وجزر ماكدونالد\",\"pt\":\"Ilha Heard e Ilhas McDonald\",\"it\":\"Isole Heard ed Isole McDonald\",\"tr\":\"Heard Adası ve McDonald Adaları\",\"ru\":\"Острова Херд и Макдональд\",\"zh\":\"赫德与麦克唐纳群岛\",\"ja\":\"ハード島・マクドナルド諸島\",\"th\":\"เกาะเฮิร์ดและหมู่เกาะแมกดอนัลด์\",\"ro\":\"Insula Heard și Insulele McDonald\",\"ka\":\"ჰერდის კუნძული და მაკდონალდის კუნძულები\"}', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(97, 'HN', 'HND', 340, 'HO', '{\"en\":\"Honduras\",\"fr\":\"Honduras\",\"es\":\"Honduras\",\"ar\":\"هندوراس\",\"pt\":\"Honduras\",\"it\":\"Honduras\",\"tr\":\"Honduras\",\"ru\":\"Гондурас\",\"zh\":\"洪都拉斯\",\"ja\":\"ホンジュラス\",\"th\":\"ฮอนดูรัส\",\"ro\":\"Honduras\",\"ka\":\"ჰონდურასი\"}', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(98, 'HR', 'HRV', 191, 'HR', '{\"en\":\"Croatia\",\"fr\":\"Croatie\",\"es\":\"Croacia\",\"ar\":\"كرواتيا\",\"pt\":\"Croácia\",\"it\":\"Croazia\",\"tr\":\"Hırvatistan\",\"ru\":\"Хорватия\",\"zh\":\"克罗地亚\",\"ja\":\"クロアチア\",\"th\":\"โครเอเชีย\",\"ro\":\"Croația\",\"ka\":\"ჰორვატია\"}', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(99, 'HT', 'HTI', 332, 'HA', '{\"en\":\"Haiti\",\"fr\":\"Haïti\",\"es\":\"Haití\",\"ar\":\"هايتي\",\"pt\":\"Haiti\",\"it\":\"Haiti\",\"tr\":\"Haiti\",\"ru\":\"Гаити\",\"zh\":\"海地\",\"ja\":\"ハイチ\",\"th\":\"เฮติ\",\"ro\":\"Haiti\",\"ka\":\"ჰაიტი\"}', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08');
INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `time_zone`, `date_format`, `datetime_format`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(100, 'HU', 'HUN', 348, 'HU', '{\"en\":\"Hungary\",\"fr\":\"Hongrie\",\"es\":\"Hungría\",\"ar\":\"هنغاريا\",\"pt\":\"Hungria\",\"it\":\"Ungheria\",\"tr\":\"Macaristan\",\"ru\":\"Венгрия\",\"zh\":\"匈牙利\",\"ja\":\"ハンガリー\",\"th\":\"ฮังการี\",\"ro\":\"Ungaria\",\"ka\":\"უნგრეთი\"}', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(101, 'ID', 'IDN', 360, 'ID', '{\"en\":\"Indonesia\",\"fr\":\"Indonésie\",\"es\":\"Indonesia\",\"ar\":\"اندونيسيا\",\"pt\":\"Indonésia\",\"it\":\"Indonesia\",\"tr\":\"Endonezya\",\"ru\":\"Индонезия\",\"zh\":\"印度尼西亚\",\"ja\":\"インドネシア\",\"th\":\"อินโดนีเซีย\",\"ro\":\"Indonezia\",\"ka\":\"ინდონეზია\"}', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(102, 'IE', 'IRL', 372, 'EI', '{\"en\":\"Ireland\",\"fr\":\"Irlande\",\"es\":\"Irlanda\",\"ar\":\"أيرلندا\",\"pt\":\"Irlanda\",\"it\":\"Irlanda\",\"tr\":\"İrlanda\",\"ru\":\"Ирландия\",\"zh\":\"爱尔兰\",\"ja\":\"アイルランド\",\"th\":\"ไอร์แลนด์\",\"ro\":\"Irlanda\",\"ka\":\"ირლანდია\"}', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(103, 'IL', 'ISR', 376, 'IS', '{\"en\":\"Israel\",\"fr\":\"Israël\",\"es\":\"Israel\",\"ar\":\"إسرائيل\",\"pt\":\"Israel\",\"it\":\"Israele\",\"tr\":\"İsrail\",\"ru\":\"Израиль\",\"zh\":\"以色列\",\"ja\":\"イスラエル\",\"th\":\"อิสราเอล\",\"ro\":\"Israel\",\"ka\":\"ისრაელი\"}', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(104, 'IM', 'IMN', 833, 'IM', '{\"en\":\"Isle of Man\",\"fr\":\"Île de Man\",\"es\":\"Isla de Man\",\"ar\":\"جزيرة مان\",\"pt\":\"Ilha de Man\",\"it\":\"Isola di Man\",\"tr\":\"Man Adası\",\"ru\":\"Остров Мэн\",\"zh\":\"曼岛\",\"ja\":\"マン島\",\"th\":\"เกาะแมน\",\"ro\":\"Insula Man\",\"ka\":\"მანის კუნძული\"}', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(105, 'IN', 'IND', 356, 'IN', '{\"en\":\"India\",\"fr\":\"Inde\",\"es\":\"India\",\"ar\":\"الهند\",\"pt\":\"Índia\",\"it\":\"India\",\"tr\":\"Hindistan\",\"ru\":\"Индия\",\"zh\":\"印度\",\"ja\":\"インド\",\"th\":\"อินเดีย\",\"ro\":\"India\",\"ka\":\"ინდოეთი\"}', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(106, 'IO', 'IOT', 86, 'IO', '{\"en\":\"British Indian Ocean Territory\",\"fr\":\"Territoire britannique de l\'océan Indien\",\"es\":\"Territorio Británico del Océano Índico\",\"ar\":\"الإقليم البريطاني في المحيط الهندي\",\"pt\":\"Território Britânico do Oceano Índico\",\"it\":\"Territorio Britannico dell’Oceano Indiano\",\"tr\":\"İngiliz Hint Okyanusu Bölgesi\",\"ru\":\"Британская территория в Индийском океане\",\"zh\":\"英属印度洋领地\",\"ja\":\"英領インド洋地域\",\"th\":\"บริติชอินเดียนโอเชียนเทร์ริทอรี\",\"ro\":\"Teritoriul Britanic din Oceanul Indian\",\"ka\":\"ბრიტანული ტერიტორია ინდოეთის ოკეანეში\"}', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(107, 'IQ', 'IRQ', 368, 'IZ', '{\"en\":\"Iraq\",\"fr\":\"Irak\",\"es\":\"Iraq\",\"ar\":\"العراق\",\"pt\":\"Iraque\",\"it\":\"Iraq\",\"tr\":\"Irak\",\"ru\":\"Ирак\",\"zh\":\"伊拉克\",\"ja\":\"イラク\",\"th\":\"อิรัก\",\"ro\":\"Irak\",\"ka\":\"ერაყი\"}', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(108, 'IR', 'IRN', 364, 'IR', '{\"en\":\"Iran\",\"fr\":\"Iran\",\"es\":\"Irán\",\"ar\":\"إيران\",\"pt\":\"Irã\",\"it\":\"Iran\",\"tr\":\"İran\",\"ru\":\"Иран\",\"zh\":\"伊朗\",\"ja\":\"イラン\",\"th\":\"อิหร่าน\",\"ro\":\"Iran\",\"ka\":\"ირანი\"}', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(109, 'IS', 'ISL', 352, 'IC', '{\"en\":\"Iceland\",\"fr\":\"Islande\",\"es\":\"Islandia\",\"ar\":\"أيسلندا\",\"pt\":\"Islândia\",\"it\":\"Islanda\",\"tr\":\"İzlanda\",\"ru\":\"Исландия\",\"zh\":\"冰岛\",\"ja\":\"アイスランド\",\"th\":\"ไอซ์แลนด์\",\"ro\":\"Islanda\",\"ka\":\"ისლანდია\"}', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(110, 'IT', 'ITA', 380, 'IT', '{\"en\":\"Italy\",\"fr\":\"Italie\",\"es\":\"Italia\",\"ar\":\"إيطاليا\",\"pt\":\"Itália\",\"it\":\"Italia\",\"tr\":\"İtalya\",\"ru\":\"Италия\",\"zh\":\"意大利\",\"ja\":\"イタリア\",\"th\":\"อิตาลี\",\"ro\":\"Italia\",\"ka\":\"იტალია\"}', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(111, 'JE', 'JEY', 832, 'JE', '{\"en\":\"Jersey\",\"fr\":\"Jersey\",\"es\":\"Jersey\",\"ar\":\"جيرسي\",\"pt\":\"Jersey\",\"it\":\"Jersey\",\"tr\":\"Jersey\",\"ru\":\"Джерси\",\"zh\":\"泽西岛\",\"ja\":\"ジャージー\",\"th\":\"เจอร์ซีย์\",\"ro\":\"Jersey\",\"ka\":\"ჯერსი\"}', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(112, 'JM', 'JAM', 388, 'JM', '{\"en\":\"Jamaica\",\"fr\":\"Jamaïque\",\"es\":\"Jamaica\",\"ar\":\"جامايكا\",\"pt\":\"Jamaica\",\"it\":\"Giamaica\",\"tr\":\"Jamaika\",\"ru\":\"Ямайка\",\"zh\":\"牙买加\",\"ja\":\"ジャマイカ\",\"th\":\"จาเมกา\",\"ro\":\"Jamaica\",\"ka\":\"იამაიკა\"}', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(113, 'JO', 'JOR', 400, 'JO', '{\"en\":\"Jordan\",\"fr\":\"Jordanie\",\"es\":\"Jordania\",\"ar\":\"الأردن\",\"pt\":\"Jordânia\",\"it\":\"Giordania\",\"tr\":\"Ürdün\",\"ru\":\"Иордания\",\"zh\":\"约旦\",\"ja\":\"ヨルダン\",\"th\":\"จอร์แดน\",\"ro\":\"Iordania\",\"ka\":\"იორდანია\"}', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(114, 'JP', 'JPN', 392, 'JA', '{\"en\":\"Japan\",\"fr\":\"Japon\",\"es\":\"Japón\",\"ar\":\"اليابان\",\"pt\":\"Japão\",\"it\":\"Giappone\",\"tr\":\"Japonya\",\"ru\":\"Япония\",\"zh\":\"日本\",\"ja\":\"日本\",\"th\":\"ญี่ปุ่น\",\"ro\":\"Japonia\",\"ka\":\"იაპონია\"}', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(115, 'KE', 'KEN', 404, 'KE', '{\"en\":\"Kenya\",\"fr\":\"Kenya\",\"es\":\"Kenia\",\"ar\":\"كينيا\",\"pt\":\"Quênia\",\"it\":\"Kenya\",\"tr\":\"Kenya\",\"ru\":\"Кения\",\"zh\":\"肯尼亚\",\"ja\":\"ケニア\",\"th\":\"เคนยา\",\"ro\":\"Kenya\",\"ka\":\"კენია\"}', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(116, 'KG', 'KGZ', 417, 'KG', '{\"en\":\"Kyrgyzstan\",\"fr\":\"Kirghizistan\",\"es\":\"Kirguistán\",\"ar\":\"قرغيزستان\",\"pt\":\"Quirguistão\",\"it\":\"Kirghizistan\",\"tr\":\"Kırgızistan\",\"ru\":\"Киргизия\",\"zh\":\"吉尔吉斯斯坦\",\"ja\":\"キルギスタン\",\"th\":\"คีร์กีซสถาน\",\"ro\":\"Kârgâzstan\",\"ka\":\"ყირგიზეთი\"}', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(117, 'KH', 'KHM', 116, 'CB', '{\"en\":\"Cambodia\",\"fr\":\"Cambodge\",\"es\":\"Camboya\",\"ar\":\"كمبوديا\",\"pt\":\"Camboja\",\"it\":\"Cambogia\",\"tr\":\"Kamboçya\",\"ru\":\"Камбоджа\",\"zh\":\"柬埔寨\",\"ja\":\"カンボジア\",\"th\":\"กัมพูชา\",\"ro\":\"Cambodgia\",\"ka\":\"კამბოჯა\"}', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(118, 'KI', 'KIR', 296, 'KR', '{\"en\":\"Kiribati\",\"fr\":\"Kiribati\",\"es\":\"Kiribati\",\"ar\":\"كيريباتي\",\"pt\":\"Quiribati\",\"it\":\"Kiribati\",\"tr\":\"Kiribati\",\"ru\":\"Кирибати\",\"zh\":\"基里巴斯\",\"ja\":\"キリバス\",\"th\":\"คิริบาส\",\"ro\":\"Kiribati\",\"ka\":\"კირიბატი\"}', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(119, 'KM', 'COM', 174, 'CN', '{\"en\":\"Comoros\",\"fr\":\"Comores\",\"es\":\"Comoras\",\"ar\":\"جزر القمر\",\"pt\":\"Comores\",\"it\":\"Comore\",\"tr\":\"Komorlar\",\"ru\":\"Коморские о-ва\",\"zh\":\"科摩罗\",\"ja\":\"コモロ\",\"th\":\"คอโมโรส\",\"ro\":\"Comore\",\"ka\":\"კომორის კუნძულები\"}', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(120, 'KN', 'KNA', 659, 'SC', '{\"en\":\"Saint Kitts and Nevis\",\"fr\":\"Saint-Kitts-et-Nevis\",\"es\":\"San Cristóbal y Nieves\",\"ar\":\"سانت كيتس ونيفيس\",\"pt\":\"São Cristovão e Nevis\",\"it\":\"Saint Kitts e Nevis\",\"tr\":\"Saint Kitts ve Nevis\",\"ru\":\"Сент-Киттс и Невис\",\"zh\":\"圣基茨和尼维斯\",\"ja\":\"セントクリストファー・ネイビス\",\"th\":\"เซนต์คิตส์และเนวิส\",\"ro\":\"Sfântul Kitts și Nevis\",\"ka\":\"სენტ-კიტსი და ნევისი\"}', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(121, 'KP', 'PRK', 408, 'KN', '{\"en\":\"North Korea\",\"fr\":\"Corée du Nord\",\"es\":\"Corea del Norte\",\"ar\":\"كوريا الشمالية\",\"pt\":\"Coreia do Norte\",\"it\":\"Corea del Nord\",\"tr\":\"Kuzey Kore\",\"ru\":\"Северная Корея\",\"zh\":\"朝鲜\",\"ja\":\"朝鮮民主主義人民共和国\",\"th\":\"เกาหลีเหนือ\",\"ro\":\"Coreea de Nord\",\"ka\":\"ჩრდილოეთი კორეა\"}', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(122, 'KR', 'KOR', 410, 'KS', '{\"en\":\"South Korea\",\"fr\":\"Corée du Sud\",\"es\":\"Corea del Sur\",\"ar\":\"كوريا الجنوبية\",\"pt\":\"Coreia do Sul\",\"it\":\"Corea del Sud\",\"tr\":\"Güney Kore\",\"ru\":\"Республика Корея\",\"zh\":\"韩国\",\"ja\":\"大韓民国\",\"th\":\"เกาหลีใต้\",\"ro\":\"Coreea de Sud\",\"ka\":\"სამხრეთი კორეა\"}', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(123, 'KW', 'KWT', 414, 'KU', '{\"en\":\"Kuwait\",\"fr\":\"Koweït\",\"es\":\"Kuwait\",\"ar\":\"الكويت\",\"pt\":\"Kuwait\",\"it\":\"Kuwait\",\"tr\":\"Kuveyt\",\"ru\":\"Кувейт\",\"zh\":\"科威特\",\"ja\":\"クウェート\",\"th\":\"คูเวต\",\"ro\":\"Kuweit\",\"ka\":\"კუვეიტი\"}', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(124, 'KY', 'CYM', 136, 'CJ', '{\"en\":\"Cayman Islands\",\"fr\":\"Îles Caïmans\",\"es\":\"Islas Caimán\",\"ar\":\"جزر الكايمن\",\"pt\":\"Ilhas Caiman\",\"it\":\"Isole Cayman\",\"tr\":\"Cayman Adaları\",\"ru\":\"Каймановы острова\",\"zh\":\"开曼群岛\",\"ja\":\"ケイマン諸島\",\"th\":\"หมู่เกาะเคย์แมน\",\"ro\":\"Insulele Cayman\",\"ka\":\"კაიმანის კუნძულები\"}', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(125, 'KZ', 'KAZ', 398, 'KZ', '{\"en\":\"Kazakhstan\",\"fr\":\"Kazakhstan\",\"es\":\"Kazajistán\",\"ar\":\"كازاخستان\",\"pt\":\"Casaquistão\",\"it\":\"Kazakistan\",\"tr\":\"Kazakistan\",\"ru\":\"Казахстан\",\"zh\":\"哈萨克斯坦\",\"ja\":\"カザフスタン\",\"th\":\"คาซัคสถาน\",\"ro\":\"Kazahstan\",\"ka\":\"ყაზახეთი\"}', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(126, 'LA', 'LAO', 418, 'LA', '{\"en\":\"Laos\",\"fr\":\"Laos\",\"es\":\"Laos\",\"ar\":\"لاوس\",\"pt\":\"República Popular Democrática do Laos\",\"it\":\"Laos\",\"tr\":\"Laos\",\"ru\":\"Лаос\",\"zh\":\"老挝人民民主共和国\",\"ja\":\"ラオス\",\"th\":\"ลาว\",\"ro\":\"Laos\",\"ka\":\"ლაოსი\"}', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(127, 'LB', 'LBN', 422, 'LE', '{\"en\":\"Lebanon\",\"fr\":\"Liban\",\"es\":\"Líbano\",\"ar\":\"لبنان\",\"pt\":\"Líbano\",\"it\":\"Libano\",\"tr\":\"Lübnan\",\"ru\":\"Ливан\",\"zh\":\"黎巴嫩\",\"ja\":\"レバノン\",\"th\":\"เลบานอน\",\"ro\":\"Liban\",\"ka\":\"ლიბანი\"}', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(128, 'LC', 'LCA', 662, 'ST', '{\"en\":\"Saint Lucia\",\"fr\":\"Sainte-Lucie\",\"es\":\"Santa Lucía\",\"ar\":\"سانت لوسيا\",\"pt\":\"Santa Lúcia\",\"it\":\"Saint Lucia\",\"tr\":\"Saint Lucia\",\"ru\":\"Сент-Люсия\",\"zh\":\"圣卢西亚\",\"ja\":\"セントルシア\",\"th\":\"เซนต์ลูเซีย\",\"ro\":\"Sfânta Lucia\",\"ka\":\"სენტ-ლუსია\"}', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(129, 'LI', 'LIE', 438, 'LS', '{\"en\":\"Liechtenstein\",\"fr\":\"Liechtenstein\",\"es\":\"Liechtenstein\",\"ar\":\"ليختنشتاين\",\"pt\":\"Liechtenstein\",\"it\":\"Liechtenstein\",\"tr\":\"Liechtenstein\",\"ru\":\"Лихтенштейн\",\"zh\":\"列支敦士登\",\"ja\":\"リヒテンシュタイン\",\"th\":\"ลิกเตนสไตน์\",\"ro\":\"Liechtenstein\",\"ka\":\"ლიხტენშტაინი\"}', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(130, 'LK', 'LKA', 144, 'CE', '{\"en\":\"Sri Lanka\",\"fr\":\"Sri Lanka\",\"es\":\"Sri Lanka\",\"ar\":\"سريلانكا\",\"pt\":\"Sri Lanka\",\"it\":\"Sri Lanka\",\"tr\":\"Sri Lanka\",\"ru\":\"Шри-Ланка\",\"zh\":\"斯里兰卡\",\"ja\":\"スリランカ\",\"th\":\"ศรีลังกา\",\"ro\":\"Sri Lanka\",\"ka\":\"შრი-ლანკა\"}', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(131, 'LR', 'LBR', 430, 'LI', '{\"en\":\"Liberia\",\"fr\":\"Libéria\",\"es\":\"Liberia\",\"ar\":\"ليبيريا\",\"pt\":\"Libéria\",\"it\":\"Liberia\",\"tr\":\"Liberya\",\"ru\":\"Либерия\",\"zh\":\"利比里亚\",\"ja\":\"リベリア\",\"th\":\"ไลบีเรีย\",\"ro\":\"Liberia\",\"ka\":\"ლიბერია\"}', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(132, 'LS', 'LSO', 426, 'LT', '{\"en\":\"Lesotho\",\"fr\":\"Lesotho\",\"es\":\"Lesoto\",\"ar\":\"ليسوتو\",\"pt\":\"Lesoto\",\"it\":\"Lesotho\",\"tr\":\"Lesoto\",\"ru\":\"Лесото\",\"zh\":\"莱索托\",\"ja\":\"レソト\",\"th\":\"เลโซโท\",\"ro\":\"Lesotho\",\"ka\":\"ლესოთო\"}', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(133, 'LT', 'LTU', 440, 'LH', '{\"en\":\"Lithuania\",\"fr\":\"Lituanie\",\"es\":\"Lituania\",\"ar\":\"ليتوانيا\",\"pt\":\"Lituânia\",\"it\":\"Lituania\",\"tr\":\"Litvanya\",\"ru\":\"Литва\",\"zh\":\"立陶宛\",\"ja\":\"リトアニア\",\"th\":\"ลิทัวเนีย\",\"ro\":\"Lituania\",\"ka\":\"ლიტვა\"}', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(134, 'LU', 'LUX', 442, 'LU', '{\"en\":\"Luxembourg\",\"fr\":\"Luxembourg\",\"es\":\"Luxemburgo\",\"ar\":\"لوكسمبورغ\",\"pt\":\"Luxemburgo\",\"it\":\"Lussemburgo\",\"tr\":\"Lüksemburg\",\"ru\":\"Люксембург\",\"zh\":\"卢森堡\",\"ja\":\"ルクセンブルグ\",\"th\":\"ลักเซมเบิร์ก\",\"ro\":\"Luxemburg\",\"ka\":\"ლუქსემბურგი\"}', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(135, 'LV', 'LVA', 428, 'LG', '{\"en\":\"Latvia\",\"fr\":\"Lettonie\",\"es\":\"Letonia\",\"ar\":\"لاتفيا\",\"pt\":\"Letônia\",\"it\":\"Lettonia\",\"tr\":\"Letonya\",\"ru\":\"Латвия\",\"zh\":\"拉脱维亚\",\"ja\":\"ラトビア\",\"th\":\"ลัตเวีย\",\"ro\":\"Letonia\",\"ka\":\"ლატვია\"}', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(136, 'LY', 'LBY', 434, 'LY', '{\"en\":\"Libya\",\"fr\":\"Libye\",\"es\":\"Libia\",\"ar\":\"ليبيا\",\"pt\":\"Líbia\",\"it\":\"Libia\",\"tr\":\"Libya\",\"ru\":\"Ливия\",\"zh\":\"利比亚\",\"ja\":\"リビア\",\"th\":\"ลิเบีย\",\"ro\":\"Libia\",\"ka\":\"ლიბია\"}', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(137, 'MA', 'MAR', 504, 'MO', '{\"en\":\"Morocco\",\"fr\":\"Maroc\",\"es\":\"Marruecos\",\"ar\":\"المغرب\",\"pt\":\"Marrocos\",\"it\":\"Marocco\",\"tr\":\"Fas\",\"ru\":\"Марокко\",\"zh\":\"摩洛哥\",\"ja\":\"モロッコ\",\"th\":\"โมร็อกโก\",\"ro\":\"Maroc\",\"ka\":\"მაროკო\"}', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(138, 'MC', 'MCO', 492, 'MN', '{\"en\":\"Monaco\",\"fr\":\"Monaco\",\"es\":\"Mónaco\",\"ar\":\"موناكو\",\"pt\":\"Mônaco\",\"it\":\"Monaco\",\"tr\":\"Monako\",\"ru\":\"Монако\",\"zh\":\"摩纳哥\",\"ja\":\"モナコ\",\"th\":\"โมนาโก\",\"ro\":\"Monaco\",\"ka\":\"მონაკო\"}', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(139, 'MD', 'MDA', 498, 'MD', '{\"en\":\"Moldova\",\"fr\":\"Moldavie\",\"es\":\"Moldavia\",\"ar\":\"مولدافيا\",\"pt\":\"Moldávia\",\"it\":\"Moldavia\",\"tr\":\"Moldova\",\"ru\":\"Молдова\",\"zh\":\"摩尔多瓦\",\"ja\":\"モルドバ\",\"th\":\"มอลโดวา\",\"ro\":\"Republica Moldova\",\"ka\":\"მოლდოვა\"}', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(140, 'ME', 'MNE', 499, 'MJ', '{\"en\":\"Montenegro\",\"fr\":\"Monténégro\",\"es\":\"Montenegro\",\"ar\":\"الجبل الأسود\",\"pt\":\"Montenegro\",\"it\":\"Montenegro\",\"tr\":\"Karadağ\",\"ru\":\"Черногория\",\"zh\":\"黑山共和国\",\"ja\":\"モンテネグロ\",\"th\":\"มอนเตเนโกร\",\"ro\":\"Muntenegru\",\"ka\":\"მონტენეგრო\"}', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(141, 'MF', 'MAF', 663, 'RN', '{\"en\":\"Saint Martin\",\"fr\":\"Saint-Martin\",\"es\":\"San Martín\",\"ar\":\"سانت مارتين\",\"pt\":\"São Martinho\",\"it\":\"Saint Martin\",\"tr\":\"Saint Martin\",\"ru\":\"Остров Святого Мартина\",\"zh\":\"圣马丁\",\"ja\":\"セント・マーチン\",\"th\":\"เซนต์มาติน\",\"ro\":\"Sfântul Martin\",\"ka\":\"Saint Martin\"}', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(142, 'MG', 'MDG', 450, 'MA', '{\"en\":\"Madagascar\",\"fr\":\"Madagascar\",\"es\":\"Madagascar\",\"ar\":\"مدغشقر\",\"pt\":\"Madagascar\",\"it\":\"Madagascar\",\"tr\":\"Madagaskar\",\"ru\":\"Мадагаскар\",\"zh\":\"马达加斯加\",\"ja\":\"マダガスカル\",\"th\":\"มาดากัสการ์\",\"ro\":\"Madagascar\",\"ka\":\"მადაგასკარი\"}', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(143, 'MH', 'MHL', 584, 'RM', '{\"en\":\"Marshall Islands\",\"fr\":\"Îles Marshall\",\"es\":\"Islas Marshall\",\"ar\":\"جزر المارشال\",\"pt\":\"Ilhas Marshall\",\"it\":\"Isole Marshall\",\"tr\":\"Marshall Adaları\",\"ru\":\"Маршалловы о-ва\",\"zh\":\"马绍尔群岛\",\"ja\":\"マーシャル諸島共和国\",\"th\":\"หมู่เกาะมาร์แชลล์\",\"ro\":\"Insulele Marshall\",\"ka\":\"მარშალის კუნძულები\"}', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(144, 'MK', 'MKD', 807, 'MK', '{\"en\":\"Macedonia\",\"fr\":\"Macédoine\",\"es\":\"Macedonia\",\"ar\":\"مقدونيا\",\"pt\":\"Macedônia\",\"it\":\"Repubblica di Macedonia\",\"tr\":\"Makedonya\",\"ru\":\"Македония\",\"zh\":\"马其顿\",\"ja\":\"マケドニア\",\"th\":\"มาซิโดเนีย\",\"ro\":\"Macedonia\",\"ka\":\"მაკედონია\"}', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(145, 'ML', 'MLI', 466, 'ML', '{\"en\":\"Mali\",\"fr\":\"Mali\",\"es\":\"Mali\",\"ar\":\"مالي\",\"pt\":\"Mali\",\"it\":\"Mali\",\"tr\":\"Mali\",\"ru\":\"Мали\",\"zh\":\"马里\",\"ja\":\"マリ\",\"th\":\"มาลี\",\"ro\":\"Mali\",\"ka\":\"მალი\"}', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(146, 'MM', 'MMR', 104, 'BM', '{\"en\":\"Myanmar [Burma]\",\"fr\":\"Myanmar\",\"es\":\"Myanmar [Birmania]\",\"ar\":\"ميانمار -بورما\",\"pt\":\"Mianmar [Birmânia]\",\"it\":\"Myanmar\",\"tr\":\"Myanmar\",\"ru\":\"Мьянма\",\"zh\":\"缅甸\",\"ja\":\"ミャンマー\",\"th\":\"เมียนม่าร์ [พม่า]\",\"ro\":\"Myanmar\",\"ka\":\"მიანმარი\"}', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(147, 'MN', 'MNG', 496, 'MG', '{\"en\":\"Mongolia\",\"fr\":\"Mongolie\",\"es\":\"Mongolia\",\"ar\":\"منغوليا\",\"pt\":\"Mongólia\",\"it\":\"Mongolia\",\"tr\":\"Moğolistan\",\"ru\":\"Монголия\",\"zh\":\"蒙古\",\"ja\":\"モンゴル\",\"th\":\"มองโกเลีย\",\"ro\":\"Mongolia\",\"ka\":\"მონღოლეთი\"}', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(148, 'MO', 'MAC', 446, 'MC', '{\"en\":\"Macau SAR China\",\"fr\":\"R.A.S. chinoise de Macao\",\"es\":\"Región Administrativa Especial de Macao de la República Popular China\",\"ar\":\"مكاو الصينية [منطقة إدارية خاصة]\",\"pt\":\"Macau, Região Admin. Especial da China\",\"it\":\"Regione Amministrativa Speciale di Macao della Repubblica Popolare Cinese\",\"tr\":\"Makao SAR - Çin\",\"ru\":\"Макао (особый район)\",\"zh\":\"中国澳门特别行政区\",\"ja\":\"中華人民共和国マカオ特別行政区\",\"th\":\"มาเก๊า เขตปกครองพิเศษประเทศจีน\",\"ro\":\"R.A.S. Macao a Chinei\",\"ka\":\"მაკაო\"}', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(149, 'MP', 'MNP', 580, 'CQ', '{\"en\":\"Northern Mariana Islands\",\"fr\":\"Îles Mariannes du Nord\",\"es\":\"Islas Marianas del Norte\",\"ar\":\"جزر ماريانا الشمالية\",\"pt\":\"Ilhas Marianas do Norte\",\"it\":\"Isole Marianne Settentrionali\",\"tr\":\"Kuzey Mariana Adaları\",\"ru\":\"Северные Марианские о-ва\",\"zh\":\"北马里亚纳群岛\",\"ja\":\"北マリアナ諸島\",\"th\":\"หมู่เกาะนอร์เทิร์นมาเรียนา\",\"ro\":\"Insulele Mariane de Nord\",\"ka\":\"Northern Mariana Islands\"}', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(150, 'MQ', 'MTQ', 474, 'MB', '{\"en\":\"Martinique\",\"fr\":\"Martinique\",\"es\":\"Martinica\",\"ar\":\"مارتينيك\",\"pt\":\"Martinica\",\"it\":\"Martinica\",\"tr\":\"Martinik\",\"ru\":\"Мартиника\",\"zh\":\"马提尼克群岛\",\"ja\":\"マルティニーク島\",\"th\":\"มาร์ตินีก\",\"ro\":\"Martinica\",\"ka\":\"მარტინიკი\"}', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(151, 'MR', 'MRT', 478, 'MR', '{\"en\":\"Mauritania\",\"fr\":\"Mauritanie\",\"es\":\"Mauritania\",\"ar\":\"موريتانيا\",\"pt\":\"Mauritânia\",\"it\":\"Mauritania\",\"tr\":\"Moritanya\",\"ru\":\"Мавритания\",\"zh\":\"毛里塔尼亚\",\"ja\":\"モーリタニア\",\"th\":\"มอริเตเนีย\",\"ro\":\"Mauritania\",\"ka\":\"მავრიტანია\"}', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(152, 'MS', 'MSR', 500, 'MH', '{\"en\":\"Montserrat\",\"fr\":\"Montserrat\",\"es\":\"Montserrat\",\"ar\":\"مونتسرات\",\"pt\":\"Montserrat\",\"it\":\"Montserrat\",\"tr\":\"Montserrat\",\"ru\":\"Монтсеррат\",\"zh\":\"蒙塞拉特群岛\",\"ja\":\"モントセラト島\",\"th\":\"มอนต์เซอร์รัต\",\"ro\":\"Montserrat\",\"ka\":\"მონსერატი\"}', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(153, 'MT', 'MLT', 470, 'MT', '{\"en\":\"Malta\",\"fr\":\"Malte\",\"es\":\"Malta\",\"ar\":\"مالطا\",\"pt\":\"Malta\",\"it\":\"Malta\",\"tr\":\"Malta\",\"ru\":\"Мальта\",\"zh\":\"马耳他\",\"ja\":\"マルタ\",\"th\":\"มอลตา\",\"ro\":\"Malta\",\"ka\":\"მალტა\"}', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(154, 'MU', 'MUS', 480, 'MP', '{\"en\":\"Mauritius\",\"fr\":\"Maurice\",\"es\":\"Mauricio\",\"ar\":\"موريشيوس\",\"pt\":\"Maurício\",\"it\":\"Mauritius\",\"tr\":\"Mauritius\",\"ru\":\"Маврикий\",\"zh\":\"毛里求斯\",\"ja\":\"モーリシャス\",\"th\":\"มอริเชียส\",\"ro\":\"Mauritius\",\"ka\":\"მავრიკია\"}', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(155, 'MV', 'MDV', 462, 'MV', '{\"en\":\"Maldives\",\"fr\":\"Maldives\",\"es\":\"Maldivas\",\"ar\":\"جزر المالديف\",\"pt\":\"Maldivas\",\"it\":\"Maldive\",\"tr\":\"Maldivler\",\"ru\":\"Мальдивские о-ва\",\"zh\":\"马尔代夫\",\"ja\":\"モルジブ\",\"th\":\"มัลดีฟส์\",\"ro\":\"Maldive\",\"ka\":\"მალდივის კუნძულები\"}', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(156, 'MW', 'MWI', 454, 'MI', '{\"en\":\"Malawi\",\"fr\":\"Malawi\",\"es\":\"Malaui\",\"ar\":\"ملاوي\",\"pt\":\"Malawi\",\"it\":\"Malawi\",\"tr\":\"Malavi\",\"ru\":\"Малави\",\"zh\":\"马拉维\",\"ja\":\"マラウィ\",\"th\":\"มาลาวี\",\"ro\":\"Malawi\",\"ka\":\"მალავი\"}', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(157, 'MX', 'MEX', 484, 'MX', '{\"en\":\"Mexico\",\"fr\":\"Mexique\",\"es\":\"México\",\"ar\":\"المكسيك\",\"pt\":\"México\",\"it\":\"Messico\",\"tr\":\"Meksika\",\"ru\":\"Мексика\",\"zh\":\"墨西哥\",\"ja\":\"メキシコ\",\"th\":\"เม็กซิโก\",\"ro\":\"Mexic\",\"ka\":\"მექსიკა\"}', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(158, 'MY', 'MYS', 458, 'MY', '{\"en\":\"Malaysia\",\"fr\":\"Malaisie\",\"es\":\"Malasia\",\"ar\":\"ماليزيا\",\"pt\":\"Malásia\",\"it\":\"Malesia\",\"tr\":\"Malezya\",\"ru\":\"Малайзия\",\"zh\":\"马来西亚\",\"ja\":\"マレーシア\",\"th\":\"มาเลเซีย\",\"ro\":\"Malaezia\",\"ka\":\"მალაიზია\"}', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(159, 'MZ', 'MOZ', 508, 'MZ', '{\"en\":\"Mozambique\",\"fr\":\"Mozambique\",\"es\":\"Mozambique\",\"ar\":\"موزمبيق\",\"pt\":\"Moçambique\",\"it\":\"Mozambico\",\"tr\":\"Mozambik\",\"ru\":\"Мозамбик\",\"zh\":\"莫桑比克\",\"ja\":\"モザンビーク\",\"th\":\"โมซัมบิก\",\"ro\":\"Mozambic\",\"ka\":\"მოზამბიკი\"}', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(160, 'NA', 'NAM', 516, 'WA', '{\"en\":\"Namibia\",\"fr\":\"Namibie\",\"es\":\"Namibia\",\"ar\":\"ناميبيا\",\"pt\":\"Namíbia\",\"it\":\"Namibia\",\"tr\":\"Namibya\",\"ru\":\"Намибия\",\"zh\":\"纳米比亚\",\"ja\":\"ナミビア\",\"th\":\"นามิเบีย\",\"ro\":\"Namibia\",\"ka\":\"ნამიბია\"}', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(161, 'NC', 'NCL', 540, 'NC', '{\"en\":\"New Caledonia\",\"fr\":\"Nouvelle-Calédonie\",\"es\":\"Nueva Caledonia\",\"ar\":\"كاليدونيا الجديدة\",\"pt\":\"Nova Caledônia\",\"it\":\"Nuova Caledonia\",\"tr\":\"Yeni Kaledonya\",\"ru\":\"Новая Каледония\",\"zh\":\"新喀里多尼亚\",\"ja\":\"ニューカレドニア\",\"th\":\"นิวแคลิโดเนีย\",\"ro\":\"Noua Caledonie\",\"ka\":\"ახალი კალედონია\"}', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(162, 'NE', 'NER', 562, 'NG', '{\"en\":\"Niger\",\"fr\":\"Niger\",\"es\":\"Níger\",\"ar\":\"النيجر\",\"pt\":\"Níger\",\"it\":\"Niger\",\"tr\":\"Nijer\",\"ru\":\"Нигер\",\"zh\":\"尼日尔\",\"ja\":\"ニジェール\",\"th\":\"ไนเจอร์\",\"ro\":\"Niger\",\"ka\":\"ნიგერი\"}', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(163, 'NF', 'NFK', 574, 'NF', '{\"en\":\"Norfolk Island\",\"fr\":\"Île Norfolk\",\"es\":\"Isla Norfolk\",\"ar\":\"جزيرة نورفوك\",\"pt\":\"Ilha Norfolk\",\"it\":\"Isola Norfolk\",\"tr\":\"Norfolk Adası\",\"ru\":\"Остров Норфолк\",\"zh\":\"诺福克岛\",\"ja\":\"ノーフォーク島\",\"th\":\"เกาะนอร์ฟอล์ก\",\"ro\":\"Insulele Norfolk\",\"ka\":\"ნორფოლკის კუნძული\"}', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(164, 'NG', 'NGA', 566, 'NI', '{\"en\":\"Nigeria\",\"fr\":\"Nigéria\",\"es\":\"Nigeria\",\"ar\":\"نيجيريا\",\"pt\":\"Nigéria\",\"it\":\"Nigeria\",\"tr\":\"Nijerya\",\"ru\":\"Нигерия\",\"zh\":\"尼日利亚\",\"ja\":\"ナイジェリア\",\"th\":\"ไนจีเรีย\",\"ro\":\"Nigeria\",\"ka\":\"ნიგერია\"}', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(165, 'NI', 'NIC', 558, 'NU', '{\"en\":\"Nicaragua\",\"fr\":\"Nicaragua\",\"es\":\"Nicaragua\",\"ar\":\"نيكاراغوا\",\"pt\":\"Nicarágua\",\"it\":\"Nicaragua\",\"tr\":\"Nikaragua\",\"ru\":\"Никарагуа\",\"zh\":\"尼加拉瓜\",\"ja\":\"ニカラグア\",\"th\":\"นิการากัว\",\"ro\":\"Nicaragua\",\"ka\":\"ნიკარაგუა\"}', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(166, 'NL', 'NLD', 528, 'NL', '{\"en\":\"Netherlands\",\"fr\":\"Pays-Bas\",\"es\":\"Países Bajos\",\"ar\":\"هولندا\",\"pt\":\"Holanda\",\"it\":\"Paesi Bassi\",\"tr\":\"Hollanda\",\"ru\":\"Нидерланды\",\"zh\":\"荷兰\",\"ja\":\"オランダ\",\"th\":\"เนเธอร์แลนด์\",\"ro\":\"Olanda\",\"ka\":\"ნიდერლანდები\"}', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(167, 'NO', 'NOR', 578, 'NO', '{\"en\":\"Norway\",\"fr\":\"Norvège\",\"es\":\"Noruega\",\"ar\":\"النرويج\",\"pt\":\"Noruega\",\"it\":\"Norvegia\",\"tr\":\"Norveç\",\"ru\":\"Норвегия\",\"zh\":\"挪威\",\"ja\":\"ノルウェー\",\"th\":\"นอร์เวย์\",\"ro\":\"Norvegia\",\"ka\":\"ნორვეგია\"}', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(168, 'NP', 'NPL', 524, 'NP', '{\"en\":\"Nepal\",\"fr\":\"Népal\",\"es\":\"Nepal\",\"ar\":\"نيبال\",\"pt\":\"Nepal\",\"it\":\"Nepal\",\"tr\":\"Nepal\",\"ru\":\"Непал\",\"zh\":\"尼泊尔\",\"ja\":\"ネパール\",\"th\":\"เนปาล\",\"ro\":\"Nepal\",\"ka\":\"ნეპალი\"}', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(169, 'NR', 'NRU', 520, 'NR', '{\"en\":\"Nauru\",\"fr\":\"Nauru\",\"es\":\"Nauru\",\"ar\":\"ناورو\",\"pt\":\"Nauru\",\"it\":\"Nauru\",\"tr\":\"Nauru\",\"ru\":\"Науру\",\"zh\":\"瑙鲁\",\"ja\":\"ナウル\",\"th\":\"นาอูรู\",\"ro\":\"Nauru\",\"ka\":\"ნაურუ\"}', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(170, 'NU', 'NIU', 570, 'NE', '{\"en\":\"Niue\",\"fr\":\"Niue\",\"es\":\"Isla Niue\",\"ar\":\"نيوي\",\"pt\":\"Niue\",\"it\":\"Niue\",\"tr\":\"Niue\",\"ru\":\"Ниуе\",\"zh\":\"纽埃\",\"ja\":\"ニウエ島\",\"th\":\"นีอูเอ\",\"ro\":\"Niue\",\"ka\":\"Niue\"}', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(171, 'NZ', 'NZL', 554, 'NZ', '{\"en\":\"New Zealand\",\"fr\":\"Nouvelle-Zélande\",\"es\":\"Nueva Zelanda\",\"ar\":\"نيوزيلاندا\",\"pt\":\"Nova Zelândia\",\"it\":\"Nuova Zelanda\",\"tr\":\"Yeni Zelanda\",\"ru\":\"Новая Зеландия\",\"zh\":\"新西兰\",\"ja\":\"ニュージーランド\",\"th\":\"นิวซีแลนด์\",\"ro\":\"Noua Zeelandă\",\"ka\":\"ახალი ზელანდია\"}', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(172, 'OM', 'OMN', 512, 'MU', '{\"en\":\"Oman\",\"fr\":\"Oman\",\"es\":\"Omán\",\"ar\":\"عُمان\",\"pt\":\"Omã\",\"it\":\"Oman\",\"tr\":\"Umman\",\"ru\":\"Оман\",\"zh\":\"阿曼\",\"ja\":\"オマーン\",\"th\":\"โอมาน\",\"ro\":\"Oman\",\"ka\":\"ომანი\"}', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(173, 'PA', 'PAN', 591, 'PM', '{\"en\":\"Panama\",\"fr\":\"Panama\",\"es\":\"Panamá\",\"ar\":\"بنما\",\"pt\":\"Panamá\",\"it\":\"Panama\",\"tr\":\"Panama\",\"ru\":\"Панама\",\"zh\":\"巴拿马\",\"ja\":\"パナマ\",\"th\":\"ปานามา\",\"ro\":\"Panama\",\"ka\":\"პანამა\"}', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(174, 'PE', 'PER', 604, 'PE', '{\"en\":\"Peru\",\"fr\":\"Pérou\",\"es\":\"Perú\",\"ar\":\"بيرو\",\"pt\":\"Peru\",\"it\":\"Perù\",\"tr\":\"Peru\",\"ru\":\"Перу\",\"zh\":\"秘鲁\",\"ja\":\"ペルー\",\"th\":\"เปรู\",\"ro\":\"Peru\",\"ka\":\"პერუ\"}', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(175, 'PF', 'PYF', 258, 'FP', '{\"en\":\"French Polynesia\",\"fr\":\"Polynésie française\",\"es\":\"Polinesia Francesa\",\"ar\":\"بولينيزيا الفرنسية\",\"pt\":\"Polinésia Francesa\",\"it\":\"Polinesia Francese\",\"tr\":\"Fransız Polinezyası\",\"ru\":\"Французская Полинезия\",\"zh\":\"法属波利尼西亚\",\"ja\":\"仏領ポリネシア\",\"th\":\"เฟรนช์โปลินีเซีย\",\"ro\":\"Polinezia Franceză\",\"ka\":\"ფრანგული პოლინეზია\"}', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(176, 'PG', 'PNG', 598, 'PP', '{\"en\":\"Papua New Guinea\",\"fr\":\"Papouasie-Nouvelle-Guinée\",\"es\":\"Papúa Nueva Guinea\",\"ar\":\"بابوا غينيا الجديدة\",\"pt\":\"Papua-Nova Guiné\",\"it\":\"Papua Nuova Guinea\",\"tr\":\"Papua Yeni Gine\",\"ru\":\"Папуа – Новая Гвинея\",\"zh\":\"巴布亚新几内亚\",\"ja\":\"パプアニューギニア\",\"th\":\"ปาปัวนิวกินี\",\"ro\":\"Papua Noua Guinee\",\"ka\":\"პაპუა-ახალი გვინეა\"}', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(177, 'PH', 'PHL', 608, 'RP', '{\"en\":\"Philippines\",\"fr\":\"Philippines\",\"es\":\"Filipinas\",\"ar\":\"الفيلبين\",\"pt\":\"Filipinas\",\"it\":\"Filippine\",\"tr\":\"Filipinler\",\"ru\":\"Филиппины\",\"zh\":\"菲律宾\",\"ja\":\"フィリピン\",\"th\":\"ฟิลิปปินส์\",\"ro\":\"Filipine\",\"ka\":\"ფილიპინები\"}', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(178, 'PK', 'PAK', 586, 'PK', '{\"en\":\"Pakistan\",\"fr\":\"Pakistan\",\"es\":\"Pakistán\",\"ar\":\"باكستان\",\"pt\":\"Paquistão\",\"it\":\"Pakistan\",\"tr\":\"Pakistan\",\"ru\":\"Пакистан\",\"zh\":\"巴基斯坦\",\"ja\":\"パキスタン\",\"th\":\"ปากีสถาน\",\"ro\":\"Pakistan\",\"ka\":\"პაკისტანი\"}', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(179, 'PL', 'POL', 616, 'PL', '{\"en\":\"Poland\",\"fr\":\"Pologne\",\"es\":\"Polonia\",\"ar\":\"بولندا\",\"pt\":\"Polônia\",\"it\":\"Polonia\",\"tr\":\"Polonya\",\"ru\":\"Польша\",\"zh\":\"波兰\",\"ja\":\"ポーランド\",\"th\":\"โปแลนด์\",\"ro\":\"Polonia\",\"ka\":\"პოლონეთი\"}', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(180, 'PM', 'SPM', 666, 'SB', '{\"en\":\"Saint Pierre and Miquelon\",\"fr\":\"Saint-Pierre-et-Miquelon\",\"es\":\"San Pedro y Miquelón\",\"ar\":\"سانت بيير وميكولون\",\"pt\":\"Saint Pierre e Miquelon\",\"it\":\"Saint Pierre e Miquelon\",\"tr\":\"Saint Pierre ve Miquelon\",\"ru\":\"Сен-Пьер и Микелон\",\"zh\":\"圣皮埃尔和密克隆\",\"ja\":\"サンピエール島・ミクロン島\",\"th\":\"แซงปีแยร์และมีเกอลง\",\"ro\":\"Sfântul Pierre și Miquelon\",\"ka\":\"სენტ-პიერი და მიქელონი\"}', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(181, 'PN', 'PCN', 612, 'PC', '{\"en\":\"Pitcairn Islands\",\"fr\":\"Pitcairn\",\"es\":\"Islas Pitcairn\",\"ar\":\"جزر بيتكيرن\",\"pt\":\"Pitcairn\",\"it\":\"Pitcairn\",\"tr\":\"Pitcairn\",\"ru\":\"Питкэрн\",\"zh\":\"皮特凯恩群岛\",\"ja\":\"ピトケアン島\",\"th\":\"พิตแคร์น\",\"ro\":\"Pitcairn\",\"ka\":\"Pitcairn\"}', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(182, 'PR', 'PRI', 630, 'RQ', '{\"en\":\"Puerto Rico\",\"fr\":\"Porto Rico\",\"es\":\"Puerto Rico\",\"ar\":\"بورتوريكو\",\"pt\":\"Porto Rico\",\"it\":\"Portorico\",\"tr\":\"Porto Riko\",\"ru\":\"Пуэрто-Рико\",\"zh\":\"波多黎各\",\"ja\":\"プエルトリコ\",\"th\":\"เปอร์โตริโก\",\"ro\":\"Porto Rico\",\"ka\":\"პუერტო რიკო\"}', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(183, 'PS', 'PSE', 275, 'WE', '{\"en\":\"Palestinian Territories\",\"fr\":\"Territoire palestinien\",\"es\":\"Territorios Palestinos\",\"ar\":\"فلسطين\",\"pt\":\"Territórios palestinos\",\"it\":\"Territori palestinesi\",\"tr\":\"Filistin Bölgesi\",\"ru\":\"Палестинские территории\",\"zh\":\"巴勒斯坦领土\",\"ja\":\"パレスチナ\",\"th\":\"ปาเลสไตน์\",\"ro\":\"Teritoriul Palestinian\",\"ka\":\"პალესტინის ტერიტორია\"}', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(184, 'PT', 'PRT', 620, 'PO', '{\"en\":\"Portugal\",\"fr\":\"Portugal\",\"es\":\"Portugal\",\"ar\":\"البرتغال\",\"pt\":\"Portugal\",\"it\":\"Portogallo\",\"tr\":\"Portekiz\",\"ru\":\"Португалия\",\"zh\":\"葡萄牙\",\"ja\":\"ポルトガル\",\"th\":\"โปรตุเกส\",\"ro\":\"Portugalia\",\"ka\":\"პორტუგალია\"}', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(185, 'PW', 'PLW', 585, 'PS', '{\"en\":\"Palau\",\"fr\":\"Palaos\",\"es\":\"Palau\",\"ar\":\"بالاو\",\"pt\":\"Palau\",\"it\":\"Palau\",\"tr\":\"Palau\",\"ru\":\"Палау\",\"zh\":\"帕劳\",\"ja\":\"パラオ\",\"th\":\"ปาเลา\",\"ro\":\"Palau\",\"ka\":\"პალაუ\"}', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(186, 'PY', 'PRY', 600, 'PA', '{\"en\":\"Paraguay\",\"fr\":\"Paraguay\",\"es\":\"Paraguay\",\"ar\":\"باراغواي\",\"pt\":\"Paraguai\",\"it\":\"Paraguay\",\"tr\":\"Paraguay\",\"ru\":\"Парагвай\",\"zh\":\"巴拉圭\",\"ja\":\"パラグアイ\",\"th\":\"ปารากวัย\",\"ro\":\"Paraguay\",\"ka\":\"პარაგვაი\"}', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(187, 'QA', 'QAT', 634, 'QA', '{\"en\":\"Qatar\",\"fr\":\"Qatar\",\"es\":\"Qatar\",\"ar\":\"قطر\",\"pt\":\"Catar\",\"it\":\"Qatar\",\"tr\":\"Katar\",\"ru\":\"Катар\",\"zh\":\"卡塔尔\",\"ja\":\"カタール\",\"th\":\"กาตาร์\",\"ro\":\"Qatar\",\"ka\":\"კატარი\"}', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(188, 'RE', 'REU', 638, 'RE', '{\"en\":\"Réunion\",\"fr\":\"Réunion\",\"es\":\"Reunión\",\"ar\":\"روينيون\",\"pt\":\"Reunião\",\"it\":\"Réunion\",\"tr\":\"Reunion\",\"ru\":\"Реюньон\",\"zh\":\"留尼汪\",\"ja\":\"レユニオン島\",\"th\":\"เรอูนียง\",\"ro\":\"Reunion\",\"ka\":\"რეიუნიონი\"}', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(189, 'RO', 'ROU', 642, 'RO', '{\"en\":\"Romania\",\"fr\":\"Roumanie\",\"es\":\"Rumanía\",\"ar\":\"رومانيا\",\"pt\":\"Romênia\",\"it\":\"Romania\",\"tr\":\"Romanya\",\"ru\":\"Румыния\",\"zh\":\"罗马尼亚\",\"ja\":\"ルーマニア\",\"th\":\"โรมาเนีย\",\"ro\":\"România\",\"ka\":\"რუმინეთი\"}', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(190, 'RS', 'SRB', 688, 'RI', '{\"en\":\"Serbia\",\"fr\":\"Serbie\",\"es\":\"Serbia\",\"ar\":\"صربيا\",\"pt\":\"Sérvia\",\"it\":\"Serbia\",\"tr\":\"Sırbistan\",\"ru\":\"Сербия\",\"zh\":\"塞尔维亚\",\"ja\":\"セルビア\",\"th\":\"เซอร์เบีย\",\"ro\":\"Serbia\",\"ka\":\"სერბია\"}', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(191, 'RU', 'RUS', 643, 'RS', '{\"en\":\"Russia\",\"fr\":\"Russie\",\"es\":\"Rusia\",\"ar\":\"روسيا\",\"pt\":\"Rússia\",\"it\":\"Federazione Russa\",\"tr\":\"Rusya\",\"ru\":\"Россия\",\"zh\":\"俄罗斯\",\"ja\":\"ロシア\",\"th\":\"รัสเซีย\",\"ro\":\"Rusia\",\"ka\":\"რუსეთი\"}', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(192, 'RW', 'RWA', 646, 'RW', '{\"en\":\"Rwanda\",\"fr\":\"Rwanda\",\"es\":\"Ruanda\",\"ar\":\"رواندا\",\"pt\":\"Ruanda\",\"it\":\"Ruanda\",\"tr\":\"Ruanda\",\"ru\":\"Руанда\",\"zh\":\"卢旺达\",\"ja\":\"ルワンダ\",\"th\":\"รวันดา\",\"ro\":\"Rwanda\",\"ka\":\"რუანდა\"}', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(193, 'SA', 'SAU', 682, 'SA', '{\"en\":\"Saudi Arabia\",\"fr\":\"Arabie saoudite\",\"es\":\"Arabia Saudí\",\"ar\":\"المملكة العربية السعودية\",\"pt\":\"Arábia Saudita\",\"it\":\"Arabia Saudita\",\"tr\":\"Suudi Arabistan\",\"ru\":\"Саудовская Аравия\",\"zh\":\"沙特阿拉伯\",\"ja\":\"サウジアラビア\",\"th\":\"ซาอุดีอาระเบีย\",\"ro\":\"Arabia Saudită\",\"ka\":\"საუდის არაბეთი\"}', 'الرياض', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', 'Asia/Riyadh', NULL, NULL, 'app/logohttp://hadhr.com', '0', 0, 1, '2021-04-10 17:06:08', '2021-04-15 22:40:02'),
(194, 'SB', 'SLB', 90, 'BP', '{\"en\":\"Solomon Islands\",\"fr\":\"Îles Salomon\",\"es\":\"Islas Salomón\",\"ar\":\"جزر سليمان\",\"pt\":\"Ilhas Salomão\",\"it\":\"Isole Solomon\",\"tr\":\"Solomon Adaları\",\"ru\":\"Соломоновы о-ва\",\"zh\":\"所罗门群岛\",\"ja\":\"ソロモン諸島\",\"th\":\"หมู่เกาะโซโลมอน\",\"ro\":\"Insulele Solomon\",\"ka\":\"სოლომონის კუნძულები\"}', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(195, 'SC', 'SYC', 690, 'SE', '{\"en\":\"Seychelles\",\"fr\":\"Seychelles\",\"es\":\"Seychelles\",\"ar\":\"سيشل\",\"pt\":\"Seychelles\",\"it\":\"Seychelles\",\"tr\":\"Seyşeller\",\"ru\":\"Сейшельские о-ва\",\"zh\":\"塞舌尔群岛\",\"ja\":\"セーシェル\",\"th\":\"เซเชลส์\",\"ro\":\"Seychelles\",\"ka\":\"სეიშელის კუნძულები\"}', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(196, 'SD', 'SDN', 729, 'SU', '{\"en\":\"Sudan\",\"fr\":\"Soudan\",\"es\":\"Sudán\",\"ar\":\"السودان\",\"pt\":\"Sudão\",\"it\":\"Sudan\",\"tr\":\"Sudan\",\"ru\":\"Судан\",\"zh\":\"苏丹\",\"ja\":\"スーダン\",\"th\":\"ซูดาน\",\"ro\":\"Sudan\",\"ka\":\"სუდანი\"}', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(197, 'SE', 'SWE', 752, 'SW', '{\"en\":\"Sweden\",\"fr\":\"Suède\",\"es\":\"Suecia\",\"ar\":\"السويد\",\"pt\":\"Suécia\",\"it\":\"Svezia\",\"tr\":\"İsveç\",\"ru\":\"Швеция\",\"zh\":\"瑞典\",\"ja\":\"スウェーデン\",\"th\":\"สวีเดน\",\"ro\":\"Suedia\",\"ka\":\"შვეცია\"}', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(198, 'SG', 'SGP', 702, 'SN', '{\"en\":\"Singapore\",\"fr\":\"Singapour\",\"es\":\"Singapur\",\"ar\":\"سنغافورة\",\"pt\":\"Cingapura\",\"it\":\"Singapore\",\"tr\":\"Singapur\",\"ru\":\"Сингапур\",\"zh\":\"新加坡\",\"ja\":\"シンガポール\",\"th\":\"สิงคโปร์\",\"ro\":\"Singapore\",\"ka\":\"სინგაპური\"}', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(199, 'SH', 'SHN', 654, 'SH', '{\"en\":\"Saint Helena\",\"fr\":\"Sainte-Hélène\",\"es\":\"Santa Elena\",\"ar\":\"سانت هيلنا\",\"pt\":\"Santa Helena\",\"it\":\"Sant’Elena\",\"tr\":\"Saint Helena\",\"ru\":\"Остров Святой Елены\",\"zh\":\"圣赫勒拿\",\"ja\":\"セントヘレナ\",\"th\":\"เซนต์เฮเลนา\",\"ro\":\"Sfânta Elena\",\"ka\":\"წმინდა ელენეს კუნძული\"}', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(200, 'SI', 'SVN', 705, 'SI', '{\"en\":\"Slovenia\",\"fr\":\"Slovénie\",\"es\":\"Eslovenia\",\"ar\":\"سلوفينيا\",\"pt\":\"Eslovênia\",\"it\":\"Slovenia\",\"tr\":\"Slovenya\",\"ru\":\"Словения\",\"zh\":\"斯洛文尼亚\",\"ja\":\"スロベニア\",\"th\":\"สโลวีเนีย\",\"ro\":\"Slovenia\",\"ka\":\"სლოვენია\"}', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08');
INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `time_zone`, `date_format`, `datetime_format`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(201, 'SJ', 'SJM', 744, 'SV', '{\"en\":\"Svalbard and Jan Mayen\",\"fr\":\"Svalbard et Île Jan Mayen\",\"es\":\"Svalbard y Jan Mayen\",\"ar\":\"سفالبارد وجان مايان\",\"pt\":\"Svalbard e Jan Mayen\",\"it\":\"Svalbard e Jan Mayen\",\"tr\":\"Svalbard ve Jan Mayen Adaları\",\"ru\":\"Свальбард и Ян-Майен\",\"zh\":\"斯瓦尔巴特和扬马延\",\"ja\":\"スバールバル諸島・ヤンマイエン島\",\"th\":\"สฟาลบาร์และยานไมเอน\",\"ro\":\"Svalbard și Jan Mayen\",\"ka\":\"Svalbard and Jan Mayen\"}', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(202, 'SK', 'SVK', 703, 'LO', '{\"en\":\"Slovakia\",\"fr\":\"Slovaquie\",\"es\":\"Eslovaquia\",\"ar\":\"سلوفاكيا\",\"pt\":\"Eslováquia\",\"it\":\"Slovacchia\",\"tr\":\"Slovakya\",\"ru\":\"Словакия\",\"zh\":\"斯洛伐克\",\"ja\":\"スロバキア\",\"th\":\"สโลวะเกีย\",\"ro\":\"Slovacia\",\"ka\":\"სლოვაკეთი\"}', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(203, 'SL', 'SLE', 694, 'SL', '{\"en\":\"Sierra Leone\",\"fr\":\"Sierra Leone\",\"es\":\"Sierra Leona\",\"ar\":\"سيراليون\",\"pt\":\"Serra Leoa\",\"it\":\"Sierra Leone\",\"tr\":\"Sierra Leone\",\"ru\":\"Сьерра-Леоне\",\"zh\":\"塞拉利昂\",\"ja\":\"シエラレオネ\",\"th\":\"เซียร์ราลีโอน\",\"ro\":\"Sierra Leone\",\"ka\":\"სიერა-ლეონე\"}', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(204, 'SM', 'SMR', 674, 'SM', '{\"en\":\"San Marino\",\"fr\":\"Saint-Marin\",\"es\":\"San Marino\",\"ar\":\"سان مارينو\",\"pt\":\"San Marino\",\"it\":\"San Marino\",\"tr\":\"San Marino\",\"ru\":\"Сан-Марино\",\"zh\":\"圣马力诺\",\"ja\":\"サンマリノ\",\"th\":\"ซานมารีโน\",\"ro\":\"San Marino\",\"ka\":\"სან-მარინო\"}', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(205, 'SN', 'SEN', 686, 'SG', '{\"en\":\"Senegal\",\"fr\":\"Sénégal\",\"es\":\"Senegal\",\"ar\":\"السنغال\",\"pt\":\"Senegal\",\"it\":\"Senegal\",\"tr\":\"Senegal\",\"ru\":\"Сенегал\",\"zh\":\"塞内加尔\",\"ja\":\"セネガル\",\"th\":\"เซเนกัล\",\"ro\":\"Senegal\",\"ka\":\"სენეგალი\"}', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(206, 'SO', 'SOM', 706, 'SO', '{\"en\":\"Somalia\",\"fr\":\"Somalie\",\"es\":\"Somalia\",\"ar\":\"الصومال\",\"pt\":\"Somália\",\"it\":\"Somalia\",\"tr\":\"Somali\",\"ru\":\"Сомали\",\"zh\":\"索马里\",\"ja\":\"ソマリア\",\"th\":\"โซมาเลีย\",\"ro\":\"Somalia\",\"ka\":\"სომალი\"}', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(207, 'SR', 'SUR', 740, 'NS', '{\"en\":\"Suriname\",\"fr\":\"Suriname\",\"es\":\"Surinam\",\"ar\":\"سورينام\",\"pt\":\"Suriname\",\"it\":\"Suriname\",\"tr\":\"Surinam\",\"ru\":\"Суринам\",\"zh\":\"苏里南\",\"ja\":\"スリナム\",\"th\":\"ซูรินาเม\",\"ro\":\"Surinam\",\"ka\":\"სურინამი\"}', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(208, 'SS', 'SSD', 728, 'OD', '{\"en\":\"South Sudan\",\"fr\":\"Soudan du Sud\",\"es\":\"Sudán del Sur\",\"ar\":\"جنوب السودان\",\"pt\":\"Sudão do Sul\",\"it\":\"South Sudan\",\"tr\":\"Güney Sudan\",\"ru\":\"южный Судан\",\"zh\":\"South Sudan\",\"ja\":\"South Sudan\",\"th\":\"ซูดานใต้\",\"ro\":\"South Sudan\",\"ka\":\"სამხრეთ სუდანი\"}', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(209, 'ST', 'STP', 678, 'TP', '{\"en\":\"São Tomé and Príncipe\",\"fr\":\"Sao Tomé-et-Principe\",\"es\":\"Santo Tomé y Príncipe\",\"ar\":\"ساو تومي وبرينسيبي\",\"pt\":\"São Tomé e Príncipe\",\"it\":\"Sao Tomé e Príncipe\",\"tr\":\"Sao Tome ve Principe\",\"ru\":\"Сан-Томе и Принсипи\",\"zh\":\"圣多美和普林西比\",\"ja\":\"サントメ・プリンシペ\",\"th\":\"เซาตูเมและปรินซิปี\",\"ro\":\"Sao Tome și Principe\",\"ka\":\"საო-ტომე და პრინსიპი\"}', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(210, 'SV', 'SLV', 222, 'ES', '{\"en\":\"El Salvador\",\"fr\":\"El Salvador\",\"es\":\"El Salvador\",\"ar\":\"السلفادور\",\"pt\":\"El Salvador\",\"it\":\"El Salvador\",\"tr\":\"El Salvador\",\"ru\":\"Сальвадор\",\"zh\":\"萨尔瓦多\",\"ja\":\"エルサルバドル\",\"th\":\"เอลซัลวาดอร์\",\"ro\":\"El Salvador\",\"ka\":\"სალვადორი\"}', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(211, 'SX', 'SXM', 534, 'NN', '{\"en\":\"Sint Maarten\",\"fr\":\"Sint Maarten\",\"es\":\"San Martín\",\"ar\":\"سانت مارتن\",\"pt\":\"São Martinho\",\"it\":\"Sint Maarten\",\"tr\":\"Sint Maarten\",\"ru\":\"Синт-Мартен\",\"zh\":\"Sint Maarten\",\"ja\":\"Sint Maarten\",\"th\":\"เซนต์มาร์ติน\",\"ro\":\"Sint Maarten\",\"ka\":\"სან მარტინი\"}', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(212, 'SY', 'SYR', 760, 'SY', '{\"en\":\"Syria\",\"fr\":\"Syrie\",\"es\":\"Siria\",\"ar\":\"سوريا\",\"pt\":\"Síria\",\"it\":\"Siria\",\"tr\":\"Suriye\",\"ru\":\"Сирия\",\"zh\":\"叙利亚\",\"ja\":\"シリア\",\"th\":\"ซีเรีย\",\"ro\":\"Siria\",\"ka\":\"სირია\"}', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(213, 'SZ', 'SWZ', 748, 'WZ', '{\"en\":\"Swaziland\",\"fr\":\"Swaziland\",\"es\":\"Suazilandia\",\"ar\":\"سوازيلاند\",\"pt\":\"Suazilândia\",\"it\":\"Swaziland\",\"tr\":\"Svaziland\",\"ru\":\"Свазиленд\",\"zh\":\"斯威士兰\",\"ja\":\"スワジランド\",\"th\":\"สวาซิแลนด์\",\"ro\":\"Swaziland\",\"ka\":\"სვაზილენდი\"}', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(214, 'TC', 'TCA', 796, 'TK', '{\"en\":\"Turks and Caicos Islands\",\"fr\":\"Îles Turks et Caïques\",\"es\":\"Islas Turcas y Caicos\",\"ar\":\"جزر الترك وجايكوس\",\"pt\":\"Ilhas Turks e Caicos\",\"it\":\"Isole Turks e Caicos\",\"tr\":\"Turks ve Caicos Adaları\",\"ru\":\"Острова Тёркс и Кайкос\",\"zh\":\"特克斯和凯科斯群岛\",\"ja\":\"タークス諸島・カイコス諸島\",\"th\":\"หมู่เกาะเติกส์และหมู่เกาะเคคอส\",\"ro\":\"Insulele Turks și Caicos\",\"ka\":\"Turks and Caicos Islands\"}', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(215, 'TD', 'TCD', 148, 'CD', '{\"en\":\"Chad\",\"fr\":\"Tchad\",\"es\":\"Chad\",\"ar\":\"تشاد\",\"pt\":\"Chade\",\"it\":\"Ciad\",\"tr\":\"Çad\",\"ru\":\"Чад\",\"zh\":\"乍得\",\"ja\":\"チャド\",\"th\":\"ชาด\",\"ro\":\"Ciad\",\"ka\":\"ჩადი\"}', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(216, 'TF', 'ATF', 260, 'FS', '{\"en\":\"French Southern Territories\",\"fr\":\"Terres australes françaises\",\"es\":\"Territorios Australes Franceses\",\"ar\":\"المقاطعات الجنوبية الفرنسية\",\"pt\":\"Territórios Franceses do Sul\",\"it\":\"Territori australi francesi\",\"tr\":\"Fransız Güney Bölgeleri\",\"ru\":\"Французские Южные Территории\",\"zh\":\"法属南部领土\",\"ja\":\"仏領極南諸島\",\"th\":\"เฟรนช์เซาเทิร์นเทร์ริทอรีส์\",\"ro\":\"Teritoriile Australe și Antarctice Franceze\",\"ka\":\"ფრანგული სამხრეთის ტერიტორიები\"}', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(217, 'TG', 'TGO', 768, 'TO', '{\"en\":\"Togo\",\"fr\":\"Togo\",\"es\":\"Togo\",\"ar\":\"توجو\",\"pt\":\"Togo\",\"it\":\"Togo\",\"tr\":\"Togo\",\"ru\":\"Того\",\"zh\":\"多哥\",\"ja\":\"トーゴ\",\"th\":\"โตโก\",\"ro\":\"Togo\",\"ka\":\"ტოგო\"}', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(218, 'TH', 'THA', 764, 'TH', '{\"en\":\"Thailand\",\"fr\":\"Thaïlande\",\"es\":\"Tailandia\",\"ar\":\"تايلند\",\"pt\":\"Tailândia\",\"it\":\"Tailandia\",\"tr\":\"Tayland\",\"ru\":\"Таиланд\",\"zh\":\"泰国\",\"ja\":\"タイ\",\"th\":\"ไทย\",\"ro\":\"Thailanda\",\"ka\":\"ტაილანდი\"}', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(219, 'TJ', 'TJK', 762, 'TI', '{\"en\":\"Tajikistan\",\"fr\":\"Tadjikistan\",\"es\":\"Tayikistán\",\"ar\":\"طاجكستان\",\"pt\":\"Tadjiquistão\",\"it\":\"Tagikistan\",\"tr\":\"Tacikistan\",\"ru\":\"Таджикистан\",\"zh\":\"塔吉克斯坦\",\"ja\":\"タジキスタン\",\"th\":\"ทาจิกิสถาน\",\"ro\":\"Tadjikistan\",\"ka\":\"ტაჯიკეთი\"}', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(220, 'TK', 'TKL', 772, 'TL', '{\"en\":\"Tokelau\",\"fr\":\"Tokelau\",\"es\":\"Tokelau\",\"ar\":\"توكيلو\",\"pt\":\"Tokelau\",\"it\":\"Tokelau\",\"tr\":\"Tokelau\",\"ru\":\"Токелау\",\"zh\":\"托克劳\",\"ja\":\"トケラウ諸島\",\"th\":\"โตเกเลา\",\"ro\":\"Tokelau\",\"ka\":\"Tokelau\"}', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(221, 'TL', 'TLS', 626, 'TT', '{\"en\":\"Timor-Leste\",\"fr\":\"Timor oriental\",\"es\":\"Timor Oriental\",\"ar\":\"تيمور الشرقية\",\"pt\":\"Timor-Leste\",\"it\":\"Timor Est\",\"tr\":\"Timor-Leste\",\"ru\":\"Восточный Тимор\",\"zh\":\"东帝汶\",\"ja\":\"東ティモール\",\"th\":\"ติมอร์ตะวันออก\",\"ro\":\"Timorul de Est\",\"ka\":\"აღმოსავლეთი ტიმორი\"}', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(222, 'TM', 'TKM', 795, 'TX', '{\"en\":\"Turkmenistan\",\"fr\":\"Turkménistan\",\"es\":\"Turkmenistán\",\"ar\":\"تركمانستان\",\"pt\":\"Turcomenistão\",\"it\":\"Turkmenistan\",\"tr\":\"Türkmenistan\",\"ru\":\"Туркменистан\",\"zh\":\"土库曼斯坦\",\"ja\":\"トルクメニスタン\",\"th\":\"เติร์กเมนิสถาน\",\"ro\":\"Turkmenistan\",\"ka\":\"თურქმენეთი\"}', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(223, 'TN', 'TUN', 788, 'TS', '{\"en\":\"Tunisia\",\"fr\":\"Tunisie\",\"es\":\"Túnez\",\"ar\":\"تونس\",\"pt\":\"Tunísia\",\"it\":\"Tunisia\",\"tr\":\"Tunus\",\"ru\":\"Тунис\",\"zh\":\"突尼斯\",\"ja\":\"チュニジア\",\"th\":\"ตูนิเซีย\",\"ro\":\"Tunisia\",\"ka\":\"ტუნისი\"}', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(224, 'TO', 'TON', 776, 'TN', '{\"en\":\"Tonga\",\"fr\":\"Tonga\",\"es\":\"Tonga\",\"ar\":\"تونغا\",\"pt\":\"Tonga\",\"it\":\"Tonga\",\"tr\":\"Tonga\",\"ru\":\"Тонга\",\"zh\":\"汤加\",\"ja\":\"トンガ\",\"th\":\"ตองกา\",\"ro\":\"Tonga\",\"ka\":\"ტონგა\"}', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(225, 'TR', 'TUR', 792, 'TU', '{\"en\":\"Turkey\",\"fr\":\"Turquie\",\"es\":\"Turquía\",\"ar\":\"تركيا\",\"pt\":\"Turquia\",\"it\":\"Turchia\",\"tr\":\"Türkiye\",\"ru\":\"Турция\",\"zh\":\"土耳其\",\"ja\":\"トルコ\",\"th\":\"ตุรกี\",\"ro\":\"Turcia\",\"ka\":\"თურქეთი\"}', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(226, 'TT', 'TTO', 780, 'TD', '{\"en\":\"Trinidad and Tobago\",\"fr\":\"Trinité-et-Tobago\",\"es\":\"Trinidad y Tobago\",\"ar\":\"ترينيداد وتوباغو\",\"pt\":\"Trinidad e Tobago\",\"it\":\"Trinidad e Tobago\",\"tr\":\"Trinidad ve Tobago\",\"ru\":\"Тринидад и Тобаго\",\"zh\":\"特立尼达和多巴哥\",\"ja\":\"トリニダード・トバゴ\",\"th\":\"ตรินิแดดและโตเบโก\",\"ro\":\"Trinidad-Tobago\",\"ka\":\"ტრინიდადი და ტობაგო\"}', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(227, 'TV', 'TUV', 798, 'TV', '{\"en\":\"Tuvalu\",\"fr\":\"Tuvalu\",\"es\":\"Tuvalu\",\"ar\":\"توفالو\",\"pt\":\"Tuvalu\",\"it\":\"Tuvalu\",\"tr\":\"Tuvalu\",\"ru\":\"Тувалу\",\"zh\":\"图瓦卢\",\"ja\":\"ツバル\",\"th\":\"ตูวาลู\",\"ro\":\"Tuvalu\",\"ka\":\"ტუვალუ\"}', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(228, 'TW', 'TWN', 158, 'TW', '{\"en\":\"Taiwan\",\"fr\":\"Taïwan\",\"es\":\"Taiwán\",\"ar\":\"تايوان\",\"pt\":\"Taiwan\",\"it\":\"Taiwan\",\"tr\":\"Tayvan\",\"ru\":\"Тайвань\",\"zh\":\"台湾\",\"ja\":\"台湾\",\"th\":\"ไต้หวัน\",\"ro\":\"Taiwan\",\"ka\":\"ტაივანი\"}', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(229, 'TZ', 'TZA', 834, 'TZ', '{\"en\":\"Tanzania\",\"fr\":\"Tanzanie\",\"es\":\"Tanzania\",\"ar\":\"تانزانيا\",\"pt\":\"Tanzânia\",\"it\":\"Tanzania\",\"tr\":\"Tanzanya\",\"ru\":\"Танзания\",\"zh\":\"坦桑尼亚\",\"ja\":\"タンザニア\",\"th\":\"แทนซาเนีย\",\"ro\":\"Tanzania\",\"ka\":\"ტანზანია\"}', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(230, 'UA', 'UKR', 804, 'UP', '{\"en\":\"Ukraine\",\"fr\":\"Ukraine\",\"es\":\"Ucrania\",\"ar\":\"أوكرانيا\",\"pt\":\"Ucrânia\",\"it\":\"Ucraina\",\"tr\":\"Ukrayna\",\"ru\":\"Украина\",\"zh\":\"乌克兰\",\"ja\":\"ウクライナ\",\"th\":\"ยูเครน\",\"ro\":\"Ucraina\",\"ka\":\"უკრაინა\"}', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(231, 'UG', 'UGA', 800, 'UG', '{\"en\":\"Uganda\",\"fr\":\"Ouganda\",\"es\":\"Uganda\",\"ar\":\"أوغندا\",\"pt\":\"Uganda\",\"it\":\"Uganda\",\"tr\":\"Uganda\",\"ru\":\"Уганда\",\"zh\":\"乌干达\",\"ja\":\"ウガンダ\",\"th\":\"ยูกันดา\",\"ro\":\"Uganda\",\"ka\":\"უგანდა\"}', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(232, 'UK', 'GBR', 826, 'UK', '{\"en\":\"United Kingdom\",\"fr\":\"Royaume-Uni\",\"es\":\"Reino Unido\",\"ar\":\"المملكة المتحدة\",\"pt\":\"Reino Unido\",\"it\":\"Regno Unito\",\"tr\":\"Birleşik Krallık\",\"ru\":\"Великобритания\",\"zh\":\"英国\",\"ja\":\"イギリス\",\"th\":\"สหราชอาณาจักร\",\"ro\":\"Marea Britanie\",\"ka\":\"დიდი ბრიტანეთი\"}', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(233, 'UM', 'UMI', 581, '', '{\"en\":\"U.S. Minor Outlying Islands\",\"fr\":\"Îles Mineures Éloignées des États-Unis\",\"es\":\"Islas menores alejadas de los Estados Unidos\",\"ar\":\"جزر الولايات المتحدة البعيدة الصغيرة\",\"pt\":\"Ilhas Menores Distantes dos Estados Unidos\",\"it\":\"Isole Minori lontane dagli Stati Uniti\",\"tr\":\"Amerika Birleşik Devletleri Küçük Dış Adaları\",\"ru\":\"Внешние малые острова (США)\",\"zh\":\"美国边远小岛\",\"ja\":\"米領太平洋諸島\",\"th\":\"หมู่เกาะสหรัฐไมเนอร์เอาต์ไลอิง\",\"ro\":\"Insulele Minore Îndepărtate ale Statelor Unite ale Americii\",\"ka\":\"შეერთებული შტატების მცირე დაშორებული კუნძულები\"}', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(234, 'US', 'USA', 840, 'US', '{\"en\":\"United States\",\"fr\":\"États-Unis\",\"es\":\"Estados Unidos\",\"ar\":\"الولايات المتحدة الأمريكية\",\"pt\":\"Estados Unidos\",\"it\":\"Stati Uniti\",\"tr\":\"Amerika Birleşik Devletleri\",\"ru\":\"США\",\"zh\":\"美国\",\"ja\":\"アメリカ合衆国\",\"th\":\"สหรัฐอเมริกา\",\"ro\":\"Statele Unite ale Americii\",\"ka\":\"ამერიკის შეერთებული შტატები\"}', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(235, 'UY', 'URY', 858, 'UY', '{\"en\":\"Uruguay\",\"fr\":\"Uruguay\",\"es\":\"Uruguay\",\"ar\":\"أورغواي\",\"pt\":\"Uruguai\",\"it\":\"Uruguay\",\"tr\":\"Uruguay\",\"ru\":\"Уругвай\",\"zh\":\"乌拉圭\",\"ja\":\"ウルグアイ\",\"th\":\"อุรุกวัย\",\"ro\":\"Uruguay\",\"ka\":\"ურუგვაი\"}', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(236, 'UZ', 'UZB', 860, 'UZ', '{\"en\":\"Uzbekistan\",\"fr\":\"Ouzbékistan\",\"es\":\"Uzbekistán\",\"ar\":\"أوزبكستان\",\"pt\":\"Uzbequistão\",\"it\":\"Uzbekistan\",\"tr\":\"Özbekistan\",\"ru\":\"Узбекистан\",\"zh\":\"乌兹别克斯坦\",\"ja\":\"ウズベキスタン\",\"th\":\"อุซเบกิสถาน\",\"ro\":\"Uzbekistan\",\"ka\":\"უზბეკეთი\"}', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(237, 'VA', 'VAT', 336, 'VT', '{\"en\":\"Vatican City\",\"fr\":\"État de la Cité du Vatican\",\"es\":\"Ciudad del Vaticano\",\"ar\":\"الفاتيكان\",\"pt\":\"Vaticano\",\"it\":\"Vaticano\",\"tr\":\"Vatikan\",\"ru\":\"Ватикан\",\"zh\":\"梵蒂冈\",\"ja\":\"バチカン市国\",\"th\":\"วาติกัน\",\"ro\":\"Vatican\",\"ka\":\"ვატიკანი\"}', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(238, 'VC', 'VCT', 670, 'VC', '{\"en\":\"Saint Vincent and the Grenadines\",\"fr\":\"Saint-Vincent-et-les Grenadines\",\"es\":\"San Vicente y las Granadinas\",\"ar\":\"سانت فنسنت وغرنادين\",\"pt\":\"São Vicente e Granadinas\",\"it\":\"Saint Vincent e Grenadines\",\"tr\":\"Saint Vincent ve Grenadinler\",\"ru\":\"Сент-Винсент и Гренадины\",\"zh\":\"圣文森特和格林纳丁斯\",\"ja\":\"セントビンセント・グレナディーン諸島\",\"th\":\"เซนต์วินเซนต์และเกรนาดีนส์\",\"ro\":\"Sfântul Vincent și Grenadine\",\"ka\":\"სენტ-ვინსენტი და გრენადინები\"}', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(239, 'VE', 'VEN', 862, 'VE', '{\"en\":\"Venezuela\",\"fr\":\"Venezuela\",\"es\":\"Venezuela\",\"ar\":\"فنزويلا\",\"pt\":\"Venezuela\",\"it\":\"Venezuela\",\"tr\":\"Venezuela\",\"ru\":\"Венесуэла\",\"zh\":\"委内瑞拉\",\"ja\":\"ベネズエラ\",\"th\":\"เวเนซุเอลา\",\"ro\":\"Venezuela\",\"ka\":\"ვენესუელა\"}', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(240, 'VG', 'VGB', 92, 'VI', '{\"en\":\"British Virgin Islands\",\"fr\":\"Îles Vierges britanniques\",\"es\":\"Islas Vírgenes Británicas\",\"ar\":\"جزر فرجين البريطانية\",\"pt\":\"Ilhas Virgens Britânicas\",\"it\":\"Isole Vergini Britanniche\",\"tr\":\"İngiliz Virgin Adaları\",\"ru\":\"Британские Виргинские о-ва\",\"zh\":\"英属维京群岛\",\"ja\":\"英領ヴァージン諸島\",\"th\":\"หมู่เกาะบริติชเวอร์จิน\",\"ro\":\"Insulele Virgine Britanice\",\"ka\":\"British Virgin Islands\"}', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(241, 'VI', 'VIR', 850, 'VQ', '{\"en\":\"U.S. Virgin Islands\",\"fr\":\"Îles Vierges des États-Unis\",\"es\":\"Islas Vírgenes de los Estados Unidos\",\"ar\":\"جزر فرجين الأمريكية\",\"pt\":\"Ilhas Virgens dos EUA\",\"it\":\"Isole Vergini Americane\",\"tr\":\"ABD Virgin Adaları\",\"ru\":\"Виргинские о-ва (США)\",\"zh\":\"美属维京群岛\",\"ja\":\"米領ヴァージン諸島\",\"th\":\"หมู่เกาะยูเอสเวอร์จิน\",\"ro\":\"Insulele Virgine S.U.A.\",\"ka\":\"U.S. Virgin Islands\"}', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(242, 'VN', 'VNM', 704, 'VM', '{\"en\":\"Vietnam\",\"fr\":\"Viêt Nam\",\"es\":\"Vietnam\",\"ar\":\"فيتنام\",\"pt\":\"Vietnã\",\"it\":\"Vietnam\",\"tr\":\"Vietnam\",\"ru\":\"Вьетнам\",\"zh\":\"越南\",\"ja\":\"ベトナム\",\"th\":\"เวียดนาม\",\"ro\":\"Vietnam\",\"ka\":\"ვიეტნამი\"}', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(243, 'VU', 'VUT', 548, 'NH', '{\"en\":\"Vanuatu\",\"fr\":\"Vanuatu\",\"es\":\"Vanuatu\",\"ar\":\"فانواتو\",\"pt\":\"Vanuatu\",\"it\":\"Vanuatu\",\"tr\":\"Vanuatu\",\"ru\":\"Вануату\",\"zh\":\"瓦努阿图\",\"ja\":\"バヌアツ\",\"th\":\"วานูอาตู\",\"ro\":\"Vanuatu\",\"ka\":\"ვანუატუ\"}', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(244, 'WF', 'WLF', 876, 'WF', '{\"en\":\"Wallis and Futuna\",\"fr\":\"Wallis-et-Futuna\",\"es\":\"Wallis y Futuna\",\"ar\":\"جزر والس وفوتونا\",\"pt\":\"Wallis e Futuna\",\"it\":\"Wallis e Futuna\",\"tr\":\"Wallis ve Futuna Adaları\",\"ru\":\"Уоллис и Футуна\",\"zh\":\"瓦利斯和富图纳\",\"ja\":\"ウォリス・フツナ\",\"th\":\"วาลลิสและฟุตูนา\",\"ro\":\"Wallis și Futuna\",\"ka\":\"ვალისი და ფუტუნა\"}', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(245, 'WS', 'WSM', 882, 'WS', '{\"en\":\"Samoa\",\"fr\":\"Samoa\",\"es\":\"Samoa\",\"ar\":\"ساموا\",\"pt\":\"Samoa\",\"it\":\"Samoa\",\"tr\":\"Samoa\",\"ru\":\"Самоа\",\"zh\":\"萨摩亚\",\"ja\":\"サモア\",\"th\":\"ซามัว\",\"ro\":\"Samoa\",\"ka\":\"სამოა\"}', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(246, 'XK', 'XKX', 0, 'KV', '{\"en\":\"Kosovo\",\"fr\":\"Kosovo\",\"es\":\"Kosovo\",\"ar\":\"Kosovo\",\"pt\":\"Kosovo\",\"it\":\"Kosovo\",\"tr\":\"Kosovo\",\"ru\":\"Kosovo\",\"zh\":\"Kosovo\",\"ja\":\"Kosovo\",\"th\":\"Kosovo\",\"ro\":\"Kosovo\",\"ka\":\"Kosovo\"}', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(247, 'YE', 'YEM', 887, 'YM', '{\"en\":\"Yemen\",\"fr\":\"Yémen\",\"es\":\"Yemen\",\"ar\":\"اليمن\",\"pt\":\"Iêmen\",\"it\":\"Yemen\",\"tr\":\"Yemen\",\"ru\":\"Йемен\",\"zh\":\"也门\",\"ja\":\"イエメン\",\"th\":\"เยเมน\",\"ro\":\"Yemen\",\"ka\":\"იემენი\"}', 'Sanaa', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(248, 'YT', 'MYT', 175, 'MF', '{\"en\":\"Mayotte\",\"fr\":\"Mayotte\",\"es\":\"Mayotte\",\"ar\":\"مايوت\",\"pt\":\"Mayotte\",\"it\":\"Mayotte\",\"tr\":\"Mayotte\",\"ru\":\"Майотта\",\"zh\":\"马约特\",\"ja\":\"マヨット島\",\"th\":\"มายอต\",\"ro\":\"Mayotte\",\"ka\":\"Mayotte\"}', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(249, 'ZA', 'ZAF', 710, 'SF', '{\"en\":\"South Africa\",\"fr\":\"Afrique du Sud\",\"es\":\"Sudáfrica\",\"ar\":\"جنوب أفريقيا\",\"pt\":\"África do Sul\",\"it\":\"Sudafrica\",\"tr\":\"Güney Afrika\",\"ru\":\"ЮАР\",\"zh\":\"南非\",\"ja\":\"南アフリカ\",\"th\":\"แอฟริกาใต้\",\"ro\":\"Africa de Sud\",\"ka\":\"სამხრეთ აფრიკა\"}', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(250, 'ZM', 'ZMB', 894, 'ZA', '{\"en\":\"Zambia\",\"fr\":\"Zambie\",\"es\":\"Zambia\",\"ar\":\"زامبيا\",\"pt\":\"Zâmbia\",\"it\":\"Zambia\",\"tr\":\"Zambiya\",\"ru\":\"Замбия\",\"zh\":\"赞比亚\",\"ja\":\"ザンビア\",\"th\":\"แซมเบีย\",\"ro\":\"Zambia\",\"ka\":\"ზამბია\"}', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(251, 'ZW', 'ZWE', 716, 'ZI', '{\"en\":\"Zimbabwe\",\"fr\":\"Zimbabwe\",\"es\":\"Zimbabue\",\"ar\":\"زيمبابوي\",\"pt\":\"Zimbábue\",\"it\":\"Zimbabwe\",\"tr\":\"Zimbabve\",\"ru\":\"Зимбабве\",\"zh\":\"津巴布韦\",\"ja\":\"ジンバブエ\",\"th\":\"ซิมบับเว\",\"ro\":\"Zimbabwe\",\"ka\":\"ზიმბაბვე\"}', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-10 17:06:08', '2021-04-10 17:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html_entities` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTML Entities of Symbols: https://gist.github.com/Gibbs/3920259',
  `in_left` tinyint(1) UNSIGNED DEFAULT '0',
  `decimal_places` int(10) UNSIGNED DEFAULT '0' COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `html_entities`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(1, 'AED', 'United Arab Emirates Dirham', 'د.إ', '&#1583;.&#1573;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(2, 'AFN', 'Afghanistan Afghani', '؋', '&#65;&#102;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(3, 'ALL', 'Albania Lek', 'Lek', '&#76;&#101;&#107;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(4, 'AMD', 'Armenia Dram', NULL, '', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(5, 'ANG', 'Netherlands Antilles Guilder', 'ƒ', '&#402;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(6, 'AOA', 'Angola Kwanza', 'Kz', '&#75;&#122;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(7, 'ARS', 'Argentina Peso', '$', '&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(8, 'AUD', 'Australia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(9, 'AWG', 'Aruba Guilder', 'ƒ', '&#402;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(10, 'AZN', 'Azerbaijan New Manat', 'ман', '&#1084;&#1072;&#1085;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(11, 'BAM', 'Bosnia and Herzegovina Convertible Marka', 'KM', '&#75;&#77;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(12, 'BBD', 'Barbados Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(13, 'BDT', 'Bangladesh Taka', '৳', '&#2547;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(14, 'BGN', 'Bulgaria Lev', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(15, 'BHD', 'Bahrain Dinar', NULL, '.&#1583;.&#1576;', 0, 3, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(16, 'BIF', 'Burundi Franc', 'FBu', '&#70;&#66;&#117;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(17, 'BMD', 'Bermuda Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(18, 'BND', 'Brunei Darussalam Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(19, 'BOB', 'Bolivia Boliviano', '$b', '&#36;&#98;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(20, 'BRL', 'Brazil Real', 'R$', '&#82;&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(21, 'BSD', 'Bahamas Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(22, 'BTN', 'Bhutan Ngultrum', NULL, '&#78;&#117;&#46;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(23, 'BWP', 'Botswana Pula', 'P', '&#80;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(24, 'BYR', 'Belarus Ruble', 'p.', '&#112;&#46;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(25, 'BZD', 'Belize Dollar', 'BZ$', '&#66;&#90;&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(26, 'CAD', 'Canada Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(27, 'CDF', 'Congo/Kinshasa Franc', 'Fr', '&#70;&#67;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(28, 'CHF', 'Switzerland Franc', 'Fr', '&#67;&#72;&#70;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(29, 'CLP', 'Chile Peso', '$', '&#36;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(30, 'CNY', 'China Yuan Renminbi', '¥', '&#165;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(31, 'COP', 'Colombia Peso', '$', '&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(32, 'CRC', 'Costa Rica Colon', '₡', '&#8353;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(33, 'CUC', 'Cuba Convertible Peso', NULL, NULL, 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(34, 'CUP', 'Cuba Peso', '₱', '&#8396;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(35, 'CVE', 'Cape Verde Escudo', '$', '&#x24;', 1, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(36, 'CZK', 'Czech Republic Koruna', 'Kč', '&#75;&#269;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(37, 'DJF', 'Djibouti Franc', 'Fr', '&#70;&#100;&#106;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(38, 'DKK', 'Denmark Krone', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(39, 'DOP', 'Dominican Republic Peso', 'RD$', '&#82;&#68;&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(40, 'DZD', 'Algeria Dinar', 'DA', '&#1583;&#1580;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(41, 'EEK', 'Estonia Kroon', 'kr', NULL, 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(42, 'EGP', 'Egypt Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(43, 'ERN', 'Eritrea Nakfa', 'Nfk', '&#x4E;&#x66;&#x6B;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(44, 'ETB', 'Ethiopia Birr', 'Br', '&#66;&#114;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(45, 'EUR', 'Euro Member Countries', '€', '€', 0, 2, ',', ' ', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(46, 'FJD', 'Fiji Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(47, 'FKP', 'Falkland Islands (Malvinas) Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(48, 'GBP', 'United Kingdom Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(49, 'GEL', 'Georgia Lari', NULL, '&#4314;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(50, 'GGP', 'Guernsey Pound', '£', NULL, 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(51, 'GHC', 'Ghana Cedi', 'GH¢', '&#x47;&#x48;&#xA2;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(52, 'GHS', 'Ghana Cedi', 'GH¢', '&#x47;&#x48;&#xA2;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(53, 'GIP', 'Gibraltar Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(54, 'GMD', 'Gambia Dalasi', 'D', '&#68;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(55, 'GNF', 'Guinea Franc', 'Fr', '&#70;&#71;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(56, 'GTQ', 'Guatemala Quetzal', 'Q', '&#81;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(57, 'GYD', 'Guyana Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(58, 'HKD', 'Hong Kong Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(59, 'HNL', 'Honduras Lempira', 'L', '&#76;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(60, 'HRK', 'Croatia Kuna', 'kn', '&#107;&#110;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(61, 'HTG', 'Haiti Gourde', NULL, '&#71;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(62, 'HUF', 'Hungary Forint', 'Ft', '&#70;&#116;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(63, 'IDR', 'Indonesia Rupiah', 'Rp', '&#82;&#112;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(64, 'ILS', 'Israel Shekel', '₪', '&#8362;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(65, 'IMP', 'Isle of Man Pound', '£', NULL, 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(66, 'INR', 'India Rupee', '₹', '&#8377;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(67, 'IQD', 'Iraq Dinar', 'د.ع;', '&#1593;.&#1583;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(68, 'IRR', 'Iran Rial', '﷼', '&#65020;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(69, 'ISK', 'Iceland Krona', 'kr', '&#107;&#114;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(70, 'JEP', 'Jersey Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(71, 'JMD', 'Jamaica Dollar', 'J$', '&#74;&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(72, 'JOD', 'Jordan Dinar', NULL, '&#74;&#68;', 0, 3, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(73, 'JPY', 'Japan Yen', '¥', '&#165;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(74, 'KES', 'Kenya Shilling', 'KSh', '&#x4B;&#x53;&#x68;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(75, 'KGS', 'Kyrgyzstan Som', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(76, 'KHR', 'Cambodia Riel', '៛', '&#6107;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(77, 'KMF', 'Comoros Franc', 'Fr', '&#67;&#70;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(78, 'KPW', 'Korea (North) Won', '₩', '&#8361;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(79, 'KRW', 'Korea (South) Won', '₩', '&#8361;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(80, 'KWD', 'Kuwait Dinar', 'د.ك', '&#1583;.&#1603;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(81, 'KYD', 'Cayman Islands Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(82, 'KZT', 'Kazakhstan Tenge', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(83, 'LAK', 'Laos Kip', '₭', '&#8365;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(84, 'LBP', 'Lebanon Pound', '£', '&#163;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(85, 'LKR', 'Sri Lanka Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(86, 'LRD', 'Liberia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(87, 'LSL', 'Lesotho Loti', 'M', '&#76;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(88, 'LTL', 'Lithuania Litas', 'Lt', '&#76;&#116;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(89, 'LVL', 'Latvia Lat', 'Ls', '&#76;&#115;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(90, 'LYD', 'Libya Dinar', 'DL', '&#1604;.&#1583;', 0, 3, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(91, 'MAD', 'Morocco Dirham', 'Dhs', '&#1583;.&#1605;.', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(92, 'MDL', 'Moldova Leu', NULL, '&#76;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(93, 'MGA', 'Madagascar Ariary', 'Ar', '&#65;&#114;', 0, 5, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(94, 'MKD', 'Macedonia Denar', 'ден', '&#1076;&#1077;&#1085;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(95, 'MMK', 'Myanmar (Burma) Kyat', NULL, '&#75;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(96, 'MNT', 'Mongolia Tughrik', '₮', '&#8366;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(97, 'MOP', 'Macau Pataca', NULL, '&#77;&#79;&#80;&#36;', 0, 1, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(98, 'MRO', 'Mauritania Ouguiya', 'UM', '&#85;&#77;', 0, 5, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(99, 'MUR', 'Mauritius Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(100, 'MVR', 'Maldives (Maldive Islands) Rufiyaa', NULL, '.&#1923;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(101, 'MWK', 'Malawi Kwacha', 'MK', '&#77;&#75;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(102, 'MXN', 'Mexico Peso', '$', '&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(103, 'MYR', 'Malaysia Ringgit', 'RM', '&#82;&#77;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(104, 'MZN', 'Mozambique Metical', 'MT', '&#77;&#84;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(105, 'NAD', 'Namibia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(106, 'NGN', 'Nigeria Naira', '₦', '&#8358;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(107, 'NIO', 'Nicaragua Cordoba', 'C$', '&#67;&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(108, 'NOK', 'Norway Krone', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(109, 'NPR', 'Nepal Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(110, 'NZD', 'New Zealand Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(111, 'OMR', 'Omani Rial', 'ر.ع.', '', 0, 3, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(112, 'PAB', 'Panama Balboa', 'B/.', '&#66;&#47;&#46;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(113, 'PEN', 'Peru Nuevo Sol', 'S/.', '&#83;&#47;&#46;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(114, 'PGK', 'Papua New Guinea Kina', NULL, '&#75;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(115, 'PHP', 'Philippines Peso', '₱', '&#8369;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(116, 'PKR', 'Pakistan Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(117, 'PLN', 'Poland Zloty', 'zł', '&#122;&#322;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(118, 'PYG', 'Paraguay Guarani', 'Gs', '&#71;&#115;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(119, 'QAR', 'Qatar Riyal', '﷼', '&#65020;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(120, 'RON', 'Romania New Leu', 'lei', '&#108;&#101;&#105;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(121, 'RSD', 'Serbia Dinar', 'Дин.', '&#1044;&#1080;&#1085;&#46;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(122, 'RUB', 'Russia Ruble', '₽', '&#8381;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(123, 'RWF', 'Rwanda Franc', 'FRw', '&#1585;.&#1587;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(124, 'SAR', 'Saudi Arabia Riyal', '﷼', '&#65020;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(125, 'SBD', 'Solomon Islands Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(126, 'SCR', 'Seychelles Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(127, 'SDG', 'Sudan Pound', 'DS', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(128, 'SEK', 'Sweden Krona', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(129, 'SGD', 'Singapore Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(130, 'SHP', 'Saint Helena Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(131, 'SLL', 'Sierra Leone Leone', 'Le', '&#76;&#101;', 1, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(132, 'SOS', 'Somalia Shilling', 'S', '&#83;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(133, 'SPL', 'Seborga Luigino', NULL, NULL, 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(134, 'SRD', 'Suriname Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(135, 'SSP', 'South Sudanese Pound', '£', '&#xA3;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(136, 'STD', 'São Tomé and Príncipe Dobra', 'Db', '&#68;&#98;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(137, 'SVC', 'El Salvador Colon', '$', '&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(138, 'SYP', 'Syria Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(139, 'SZL', 'Swaziland Lilangeni', 'E', '&#76;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(140, 'THB', 'Thailand Baht', '฿', '&#3647;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(141, 'TJS', 'Tajikistan Somoni', NULL, '&#84;&#74;&#83;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(142, 'TMT', 'Turkmenistan Manat', NULL, '&#109;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(143, 'TND', 'Tunisia Dinar', 'DT', '&#1583;.&#1578;', 1, 3, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(144, 'TOP', 'Tonga Pa\'anga', NULL, '&#84;&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(145, 'TRL', 'Turkey Lira', '₤', NULL, 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(146, 'TRY', 'Turkey Lira', '₺', '&#x20BA;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(147, 'TTD', 'Trinidad and Tobago Dollar', 'TT$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(148, 'TVD', 'Tuvalu Dollar', '$', NULL, 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(149, 'TWD', 'Taiwan New Dollar', 'NT$', '&#78;&#84;&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(150, 'TZS', 'Tanzania Shilling', 'TSh', '&#x54;&#x53;&#x68;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(151, 'UAH', 'Ukraine Hryvnia', '₴', '&#8372;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(152, 'UGX', 'Uganda Shilling', 'USh', '&#85;&#83;&#104;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(153, 'USD', 'United States Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(154, 'UYU', 'Uruguay Peso', '$U', '&#36;&#85;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(155, 'UZS', 'Uzbekistan Som', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(156, 'VEF', 'Venezuela Bolivar', 'Bs', '&#66;&#115;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(157, 'VND', 'Viet Nam Dong', '₫', '&#8363;', 1, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(158, 'VUV', 'Vanuatu Vatu', NULL, '&#86;&#84;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(159, 'WST', 'Samoa Tala', NULL, '&#87;&#83;&#36;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(160, 'XAF', 'Communauté Financière Africaine (BEAC) CFA Franc B', 'F', '&#70;&#67;&#70;&#65;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(161, 'XCD', 'East Caribbean Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(162, 'XDR', 'International Monetary Fund (IMF) Special Drawing ', NULL, '', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(163, 'XOF', 'Communauté Financière Africaine (BCEAO) Franc', 'F', '&#70;&#67;&#70;&#65;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(164, 'XPF', 'Comptoirs Français du Pacifique (CFP) Franc', 'F', '&#70;', 0, 0, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(165, 'YER', 'Yemen Rial', '﷼', '&#65020;', 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(166, 'ZAR', 'South Africa Rand', 'R', '&#82;', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(167, 'ZMW', 'Zambia Kwacha', 'ZK', NULL, 0, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(168, 'ZWD', 'Zimbabwe Dollar', 'Z$', NULL, 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(169, 'ZWL', 'Zimbabwe Dollar', 'Z$', NULL, 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(170, 'XBT', 'Bitcoin', '฿', '฿', 1, 2, '.', ',', '2021-04-10 17:06:08', '2021-04-10 17:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `belongs_to` enum('posts','users') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `max` int(10) UNSIGNED DEFAULT '255',
  `default_value` text COLLATE utf8mb4_unicode_ci,
  `required` tinyint(1) UNSIGNED DEFAULT NULL,
  `use_as_filter` tinyint(1) DEFAULT '0',
  `help` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `belongs_to`, `name`, `type`, `max`, `default_value`, `required`, `use_as_filter`, `help`, `active`) VALUES
(1, 'posts', '{\"en\":\"Car Brand\"}', 'select', NULL, NULL, 1, 1, NULL, 1),
(2, 'posts', '{\"en\":\"Car Model\"}', 'text', NULL, NULL, 0, 0, NULL, 1),
(3, 'posts', '{\"en\":\"Year of registration\"}', 'number', NULL, NULL, 0, 0, NULL, 1),
(4, 'posts', '{\"en\":\"Mileage\"}', 'text', NULL, NULL, 0, 0, NULL, 1),
(5, 'posts', '{\"en\":\"Fuel Type\"}', 'select', NULL, NULL, 0, 1, NULL, 1),
(6, 'posts', '{\"en\":\"Features\"}', 'checkbox_multiple', NULL, NULL, 0, 1, NULL, 1),
(7, 'posts', '{\"en\":\"Transmission\"}', 'radio', NULL, NULL, 0, 1, NULL, 1),
(8, 'posts', '{\"en\":\"Condition\"}', 'select', NULL, NULL, 0, 1, NULL, 1),
(9, 'posts', '{\"en\":\"Size\"}', 'number', 50, NULL, 1, 1, NULL, 1),
(10, 'posts', '{\"en\":\"Rooms\"}', 'select', NULL, NULL, 1, 1, NULL, 1),
(11, 'posts', '{\"en\":\"Building Type\"}', 'select', NULL, NULL, 0, 1, NULL, 1),
(12, 'posts', '{\"en\":\"Parking\"}', 'checkbox', NULL, NULL, 0, 1, NULL, 1),
(13, 'posts', '{\"en\":\"Furnished\"}', 'radio', NULL, NULL, 0, 1, NULL, 1),
(14, 'posts', '{\"en\":\"Mobile Brand\"}', 'select', NULL, NULL, 0, 1, NULL, 1),
(15, 'posts', '{\"en\":\"Mobile Model\"}', 'text', NULL, NULL, 0, 0, NULL, 1),
(16, 'posts', '{\"en\":\"Electronic Brand\"}', 'select', NULL, NULL, 0, 1, NULL, 1),
(17, 'posts', '{\"en\":\"Model\"}', 'text', NULL, NULL, 0, 0, NULL, 1),
(18, 'posts', '{\"en\":\"Start Date\"}', 'date', 50, NULL, 0, 1, NULL, 1),
(19, 'posts', '{\"en\":\"Company\"}', 'text', 100, NULL, 1, 0, NULL, 1),
(20, 'posts', '{\"en\":\"Work Type\"}', 'select', NULL, NULL, 1, 1, NULL, 1),
(21, 'posts', '{\"en\":\"Start date\"}', 'date', 50, NULL, 1, 1, NULL, 1),
(22, 'posts', '{\"en\":\"End date\"}', 'date', 50, NULL, 1, 1, NULL, 1),
(23, 'posts', '{\"en\":\"Event Address\"}', 'text', 200, NULL, 1, 0, NULL, 1),
(24, 'posts', '{\"en\":\"Website\"}', 'url', 100, NULL, 0, 0, NULL, 1),
(25, 'posts', '{\"en\":\"Video\"}', 'video', 100, NULL, 0, 0, NULL, 1),
(26, 'posts', '{\"en\":\"Date Range\"}', 'date_range', 100, NULL, 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fields_options`
--

CREATE TABLE `fields_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fields_options`
--

INSERT INTO `fields_options` (`id`, `field_id`, `value`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, '{\"en\":\"Toyota\"}', NULL, 1, 2, NULL),
(2, 1, '{\"en\":\"BMW\"}', NULL, 3, 4, NULL),
(3, 1, '{\"en\":\"Mercedes\"}', NULL, 5, 6, NULL),
(4, 1, '{\"en\":\"Chevrolet\"}', NULL, 7, 8, NULL),
(5, 1, '{\"en\":\"Cadillac\"}', NULL, 9, 10, NULL),
(6, 1, '{\"en\":\"Buick\"}', NULL, 11, 12, NULL),
(7, 1, '{\"en\":\"GMC\"}', NULL, 13, 14, NULL),
(8, 1, '{\"en\":\"Ford\"}', NULL, 15, 16, NULL),
(9, 1, '{\"en\":\"Chrysler\"}', NULL, 17, 18, NULL),
(10, 1, '{\"en\":\"Dodge\"}', NULL, 19, 20, NULL),
(11, 1, '{\"en\":\"Jeep\"}', NULL, 21, 22, NULL),
(12, 1, '{\"en\":\"Tesla\"}', NULL, 23, 24, NULL),
(13, 1, '{\"en\":\"Lexus\"}', NULL, 25, 26, NULL),
(14, 1, '{\"en\":\"Suzuki\"}', NULL, 27, 28, NULL),
(15, 1, '{\"en\":\"Mazda\"}', NULL, 29, 30, NULL),
(16, 1, '{\"en\":\"Honda\"}', NULL, 31, 32, NULL),
(17, 1, '{\"en\":\"Acura\"}', NULL, 33, 34, NULL),
(18, 1, '{\"en\":\"Mitsubishi\"}', NULL, 35, 36, NULL),
(19, 1, '{\"en\":\"Nissan\"}', NULL, 37, 38, NULL),
(20, 1, '{\"en\":\"Infiniti\"}', NULL, 39, 40, NULL),
(21, 1, '{\"en\":\"Audi\"}', NULL, 41, 42, NULL),
(22, 1, '{\"en\":\"Volkswagen\"}', NULL, 43, 44, NULL),
(23, 1, '{\"en\":\"Porsche\"}', NULL, 45, 46, NULL),
(24, 1, '{\"en\":\"Opel\"}', NULL, 47, 48, NULL),
(25, 1, '{\"en\":\"Jaguar\"}', NULL, 49, 50, NULL),
(26, 1, '{\"en\":\"Land Rover\"}', NULL, 51, 52, NULL),
(27, 1, '{\"en\":\"Mini\"}', NULL, 53, 54, NULL),
(28, 1, '{\"en\":\"Aston Martin\"}', NULL, 55, 56, NULL),
(29, 1, '{\"en\":\"Bentley\"}', NULL, 57, 58, NULL),
(30, 1, '{\"en\":\"Rolls Royce\"}', NULL, 59, 60, NULL),
(31, 1, '{\"en\":\"McLaren\"}', NULL, 61, 62, NULL),
(32, 1, '{\"en\":\"Fiat\"}', NULL, 63, 64, NULL),
(33, 1, '{\"en\":\"Alfa Romeo\"}', NULL, 65, 66, NULL),
(34, 1, '{\"en\":\"Maserati\"}', NULL, 67, 68, NULL),
(35, 1, '{\"en\":\"Ferrari\"}', NULL, 69, 70, NULL),
(36, 1, '{\"en\":\"Lamborghini\"}', NULL, 71, 72, NULL),
(37, 1, '{\"en\":\"Pagani\"}', NULL, 73, 74, NULL),
(38, 1, '{\"en\":\"Lancia\"}', NULL, 75, 76, NULL),
(39, 1, '{\"en\":\"Renault\"}', NULL, 77, 78, NULL),
(40, 1, '{\"en\":\"Peugeot\"}', NULL, 79, 80, NULL),
(41, 1, '{\"en\":\"Citroen\"}', NULL, 81, 82, NULL),
(42, 1, '{\"en\":\"Bugatti\"}', NULL, 83, 84, NULL),
(43, 1, '{\"en\":\"Tata\"}', NULL, 85, 86, NULL),
(44, 1, '{\"en\":\"Hyundai\"}', NULL, 87, 88, NULL),
(45, 1, '{\"en\":\"Kia\"}', NULL, 89, 90, NULL),
(46, 1, '{\"en\":\"Daewoo\"}', NULL, 91, 92, NULL),
(47, 1, '{\"en\":\"Volvo\"}', NULL, 93, 94, NULL),
(48, 1, '{\"en\":\"Saab\"}', NULL, 95, 96, NULL),
(49, 1, '{\"en\":\"Lada\"}', NULL, 97, 98, NULL),
(50, 1, '{\"en\":\"Volga\"}', NULL, 99, 100, NULL),
(51, 1, '{\"en\":\"Zil\"}', NULL, 101, 102, NULL),
(52, 1, '{\"en\":\"GAZ\"}', NULL, 103, 104, NULL),
(53, 1, '{\"en\":\"Geely\"}', NULL, 105, 106, NULL),
(54, 1, '{\"en\":\"Chery\"}', NULL, 107, 108, NULL),
(55, 1, '{\"en\":\"Hongqi\"}', NULL, 109, 110, NULL),
(56, 1, '{\"en\":\"Other\"}', NULL, 111, 112, NULL),
(57, 5, '{\"en\":\"Essence\"}', NULL, 113, 114, NULL),
(58, 5, '{\"en\":\"Diesel\"}', NULL, 115, 116, NULL),
(59, 6, '{\"en\":\"Air Conditioner\"}', NULL, 117, 118, NULL),
(60, 6, '{\"en\":\"GPS\"}', NULL, 119, 120, NULL),
(61, 6, '{\"en\":\"Security System\"}', NULL, 121, 122, NULL),
(62, 6, '{\"en\":\"Spare Tire\"}', NULL, 123, 124, NULL),
(63, 7, '{\"en\":\"Automatic\"}', NULL, 125, 126, NULL),
(64, 7, '{\"en\":\"Manual\"}', NULL, 127, 128, NULL),
(65, 8, '{\"en\":\"New\"}', NULL, 129, 130, NULL),
(66, 8, '{\"en\":\"Used\"}', NULL, 131, 132, NULL),
(67, 10, '{\"en\":\"0\"}', NULL, 133, 134, 1),
(68, 10, '{\"en\":\"1\"}', NULL, 135, 136, 1),
(69, 10, '{\"en\":\"2\"}', NULL, 137, 138, 1),
(70, 10, '{\"en\":\"3\"}', NULL, 139, 140, 1),
(71, 10, '{\"en\":\"4\"}', NULL, 141, 142, 1),
(72, 10, '{\"en\":\"5\"}', NULL, 143, 144, 1),
(73, 10, '{\"en\":\"6\"}', NULL, 145, 146, 1),
(74, 10, '{\"en\":\"7\"}', NULL, 147, 148, 1),
(75, 10, '{\"en\":\"8\"}', NULL, 149, 150, 1),
(76, 10, '{\"en\":\"9\"}', NULL, 151, 152, 1),
(77, 10, '{\"en\":\"10\"}', NULL, 153, 154, 1),
(78, 10, '{\"en\":\"> 10\"}', NULL, 155, 156, 1),
(79, 11, '{\"en\":\"Apartment\"}', NULL, 157, 158, NULL),
(80, 11, '{\"en\":\"House\"}', NULL, 159, 160, NULL),
(81, 11, '{\"en\":\"Office\"}', NULL, 161, 162, NULL),
(82, 11, '{\"en\":\"Store\"}', NULL, 163, 164, NULL),
(83, 11, '{\"en\":\"Plot of land\"}', NULL, 165, 166, NULL),
(84, 13, '{\"en\":\"Yes\"}', NULL, 167, 168, NULL),
(85, 13, '{\"en\":\"No\"}', NULL, 169, 170, NULL),
(86, 14, '{\"en\":\"Huawei\"}', NULL, 171, 172, NULL),
(87, 14, '{\"en\":\"Sony\"}', NULL, 173, 174, NULL),
(88, 14, '{\"en\":\"LG\"}', NULL, 175, 176, NULL),
(89, 14, '{\"en\":\"Samsung\"}', NULL, 177, 178, NULL),
(90, 14, '{\"en\":\"Nokia\"}', NULL, 179, 180, NULL),
(91, 14, '{\"en\":\"Alcatel-Lucent\"}', NULL, 181, 182, NULL),
(92, 14, '{\"en\":\"Siemens\"}', NULL, 183, 184, NULL),
(93, 14, '{\"en\":\"BlackBerry\"}', NULL, 185, 186, NULL),
(94, 14, '{\"en\":\"Apple\"}', NULL, 187, 188, NULL),
(95, 14, '{\"en\":\"Google\"}', NULL, 189, 190, NULL),
(96, 14, '{\"en\":\"Microsoft\"}', NULL, 191, 192, NULL),
(97, 14, '{\"en\":\"Motorola\"}', NULL, 193, 194, NULL),
(98, 14, '{\"en\":\"Other\"}', NULL, 195, 196, NULL),
(99, 16, '{\"en\":\"Huawei\"}', NULL, 197, 198, NULL),
(100, 16, '{\"en\":\"Lenovo\"}', NULL, 199, 200, NULL),
(101, 16, '{\"en\":\"TP-Link\"}', NULL, 201, 202, NULL),
(102, 16, '{\"en\":\"Xiaomi\"}', NULL, 203, 204, NULL),
(103, 16, '{\"en\":\"Canon\"}', NULL, 205, 206, NULL),
(104, 16, '{\"en\":\"Casio\"}', NULL, 207, 208, NULL),
(105, 16, '{\"en\":\"Epson\"}', NULL, 209, 210, NULL),
(106, 16, '{\"en\":\"Fuji\"}', NULL, 211, 212, NULL),
(107, 16, '{\"en\":\"Funai\"}', NULL, 213, 214, NULL),
(108, 16, '{\"en\":\"JVC\"}', NULL, 215, 216, NULL),
(109, 16, '{\"en\":\"Nikon\"}', NULL, 217, 218, NULL),
(110, 16, '{\"en\":\"Nintendo\"}', NULL, 219, 220, NULL),
(111, 16, '{\"en\":\"Olympus\"}', NULL, 221, 222, NULL),
(112, 16, '{\"en\":\"Panasonic\"}', NULL, 223, 224, NULL),
(113, 16, '{\"en\":\"Pentax\"}', NULL, 225, 226, NULL),
(114, 16, '{\"en\":\"Pioneer\"}', NULL, 227, 228, NULL),
(115, 16, '{\"en\":\"Sega\"}', NULL, 229, 230, NULL),
(116, 16, '{\"en\":\"Sharp\"}', NULL, 231, 232, NULL),
(117, 16, '{\"en\":\"Sony\"}', NULL, 233, 234, NULL),
(118, 16, '{\"en\":\"Toshiba\"}', NULL, 235, 236, NULL),
(119, 16, '{\"en\":\"Daewoo\"}', NULL, 237, 238, NULL),
(120, 16, '{\"en\":\"LG\"}', NULL, 239, 240, NULL),
(121, 16, '{\"en\":\"Samsung\"}', NULL, 241, 242, NULL),
(122, 16, '{\"en\":\"Acer\"}', NULL, 243, 244, NULL),
(123, 16, '{\"en\":\"Asus\"}', NULL, 245, 246, NULL),
(124, 16, '{\"en\":\"D-Link\"}', NULL, 247, 248, NULL),
(125, 16, '{\"en\":\"Gigabyte\"}', NULL, 249, 250, NULL),
(126, 16, '{\"en\":\"Beko\"}', NULL, 251, 252, NULL),
(127, 16, '{\"en\":\"Nokia\"}', NULL, 253, 254, NULL),
(128, 16, '{\"en\":\"Alcatel-Lucent\"}', NULL, 255, 256, NULL),
(129, 16, '{\"en\":\"Bosch\"}', NULL, 257, 258, NULL),
(130, 16, '{\"en\":\"Siemens\"}', NULL, 259, 260, NULL),
(131, 16, '{\"en\":\"Sennheiser\"}', NULL, 261, 262, NULL),
(132, 16, '{\"en\":\"Telefunken\"}', NULL, 263, 264, NULL),
(133, 16, '{\"en\":\"Philips\"}', NULL, 265, 266, NULL),
(134, 16, '{\"en\":\"Electrolux\"}', NULL, 267, 268, NULL),
(135, 16, '{\"en\":\"Russell Hobbs\"}', NULL, 269, 270, NULL),
(136, 16, '{\"en\":\"BlackBerry\"}', NULL, 271, 272, NULL),
(137, 16, '{\"en\":\"Thomson\"}', NULL, 273, 274, NULL),
(138, 16, '{\"en\":\"Amazon\"}', NULL, 275, 276, NULL),
(139, 16, '{\"en\":\"Apple\"}', NULL, 277, 278, NULL),
(140, 16, '{\"en\":\"Bose\"}', NULL, 279, 280, NULL),
(141, 16, '{\"en\":\"Cisco Systems\"}', NULL, 281, 282, NULL),
(142, 16, '{\"en\":\"Dell\"}', NULL, 283, 284, NULL),
(143, 16, '{\"en\":\"Gateway\"}', NULL, 285, 286, NULL),
(144, 16, '{\"en\":\"Google\"}', NULL, 287, 288, NULL),
(145, 16, '{\"en\":\"Hewlett-Packard\"}', NULL, 289, 290, NULL),
(146, 16, '{\"en\":\"IBM\"}', NULL, 291, 292, NULL),
(147, 16, '{\"en\":\"Intel\"}', NULL, 293, 294, NULL),
(148, 16, '{\"en\":\"Microsoft\"}', NULL, 295, 296, NULL),
(149, 16, '{\"en\":\"Motorola\"}', NULL, 297, 298, NULL),
(150, 16, '{\"en\":\"NVIDIA\"}', NULL, 299, 300, NULL),
(151, 16, '{\"en\":\"Packard Bell\"}', NULL, 301, 302, NULL),
(152, 16, '{\"en\":\"Qualcomm\"}', NULL, 303, 304, NULL),
(153, 16, '{\"en\":\"Seagate\"}', NULL, 305, 306, NULL),
(154, 16, '{\"en\":\"Sun Microsystems\"}', NULL, 307, 308, NULL),
(155, 16, '{\"en\":\"Vizio\"}', NULL, 309, 310, NULL),
(156, 16, '{\"en\":\"Western Digital\"}', NULL, 311, 312, NULL),
(157, 16, '{\"en\":\"Xerox\"}', NULL, 313, 314, NULL),
(158, 16, '{\"en\":\"Other\"}', NULL, 315, 316, NULL),
(159, 20, '{\"en\":\"Full-time\"}', NULL, 317, 318, NULL),
(160, 20, '{\"en\":\"Part-time\"}', NULL, 319, 320, NULL),
(161, 20, '{\"en\":\"Temporary\"}', NULL, 321, 322, NULL),
(162, 20, '{\"en\":\"Internship\"}', NULL, 323, 324, NULL),
(163, 20, '{\"en\":\"Permanent\"}', NULL, 325, 326, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, '{\"en\":\"Mr\",\"fr\":\"Monsieur\",\"es\":\"Señor\",\"ar\":\"السيد\",\"pt\":\"Sr\",\"ru\":\"Мистер\",\"tr\":\"Bay\",\"th\":\"นาย\",\"ka\":\"ბატონი\",\"zh\":\"先生\",\"ja\":\"氏\",\"it\":\"Sig.\",\"ro\":\"Dl.\"}'),
(2, '{\"en\":\"Mrs\",\"fr\":\"Madame\",\"es\":\"Señora\",\"ar\":\"السيدة\",\"pt\":\"Sra\",\"ru\":\"Г-жа\",\"tr\":\"Bayan\",\"th\":\"นาง\",\"ka\":\"ქალბატონი\",\"zh\":\"太太\",\"ja\":\"夫人\",\"it\":\"Sig.ra\",\"ro\":\"D-na.\"}');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `view` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` mediumtext COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', NULL, 'home.inc.search', NULL, NULL, 0, 1, 1, 1),
(2, 'getLocations', 'Locations & Country Map', '{\"show_cities\":\"1\",\"show_post_btn\":\"1\",\"background_color\":null,\"border_width\":null,\"border_color\":null,\"text_color\":null,\"link_color\":null,\"link_color_hover\":null,\"max_items\":\"14\",\"items_cols\":\"3\",\"cache_expiration\":null,\"show_map\":\"1\",\"map_background_color\":null,\"map_border\":null,\"map_hover_border\":null,\"map_border_width\":null,\"map_color\":null,\"map_hover\":null,\"map_width\":null,\"map_height\":null,\"hide_on_mobile\":\"1\",\"active\":\"1\"}', 'home.inc.locations', NULL, NULL, 2, 3, 1, 1),
(3, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, NULL, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', NULL, 'home.inc.categories', NULL, NULL, 6, 7, 1, 1),
(5, 'getLatestPosts', 'Latest Ads', NULL, 'home.inc.latest', NULL, NULL, 8, 9, 1, 1),
(6, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, NULL, 10, 11, 1, 1),
(7, 'getTopAdvertising', 'Advertising #1', NULL, 'layouts.inc.advertising.top', NULL, NULL, 12, 13, 1, 0),
(8, 'getBottomAdvertising', 'Advertising #2', NULL, 'layouts.inc.advertising.bottom', NULL, NULL, 14, 15, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `russian_pluralization` tinyint(1) UNSIGNED DEFAULT '0',
  `date_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `default` tinyint(1) DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `date_format`, `datetime_format`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'en', 'en_US', 'English', 'English', NULL, 'english', 'Latn', 'ltr', 0, 'MMM Do, YYYY', 'MMM Do, YYYY [at] HH:mm', 1, 0, NULL, 2, 3, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(2, 'fr', 'fr_FR', 'French', 'Français', NULL, 'french', 'Latn', 'ltr', 0, 'Do MMM YYYY', 'Do MMM YYYY [à] H[h]mm', 0, 0, NULL, 4, 5, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(3, 'es', 'es_ES', 'Spanish', 'Español', '', 'spanish', 'Latn', 'ltr', 0, 'D [de] MMMM [de] YYYY', 'D [de] MMMM [de] YYYY HH:mm', 0, 0, NULL, 6, 7, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(4, 'ar', 'ar_SA', 'Arabic', 'العربية', NULL, 'arabic', 'Arab', 'rtl', 0, 'DD/MMMM/YYYY', 'DD/MMMM/YYYY HH:mm', 1, 1, NULL, 8, 9, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(5, 'pt', 'pt_PT', 'Portuguese', 'Português', NULL, 'portuguese', 'Latn', 'ltr', 0, 'D [de] MMMM [de] YYYY', 'D [de] MMMM [de] YYYY HH:mm', 0, 0, NULL, 10, 11, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(6, 'it', 'it_IT', 'Italian', 'Italiano', NULL, 'italian', 'Latn', 'ltr', 0, 'D MMMM YYYY', 'D MMMM YYYY HH:mm', 0, 0, NULL, 12, 13, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(7, 'tr', 'tr_TR', 'Turkish', 'Türk', NULL, 'turkish', 'Latn', 'ltr', 0, 'DD MMMM YYYY dddd', 'DD MMMM YYYY dddd HH:mm', 0, 0, NULL, 14, 15, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(8, 'ru', 'ru_RU', 'Russian', 'русский', NULL, 'russian', 'Cyrl', 'ltr', 1, 'D MMMM YYYY', 'D MMMM YYYY [ г.] H:mm', 0, 0, NULL, 16, 17, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(9, 'zh', 'zh_CN', 'Chinese', '中文', NULL, 'chinese', 'Hans', 'ltr', 0, 'D MMMM YYYY', 'D MMMM YYYY H:mm', 0, 0, NULL, 18, 19, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(10, 'ja', 'ja_JP', 'Japanese', '日本人', NULL, 'japanese', 'Jpan', 'ltr', 0, 'D MMMM YYYY', 'D MMMM YYYY H:mm', 0, 0, NULL, 20, 21, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(11, 'th', 'th_TH', 'Thai', 'ไทย', NULL, 'thai', 'Thai', 'ltr', 0, 'D MMMM YYYY', 'D MMMM YYYY H:mm', 0, 0, NULL, 22, 23, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(12, 'ro', 'ro_RO', 'Romanian', 'Română', NULL, 'romanian', 'Latn', 'ltr', 0, 'D MMMM YYYY', 'D MMMM YYYY H:mm', 0, 0, NULL, 24, 25, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08'),
(13, 'ka', 'ka_GE', 'Georgian', 'ქართული', NULL, 'georgian', 'Geor', 'ltr', 0, 'YYYY [წლის] DD MM', 'YYYY [წლის] DD MMMM, dddd H:mm', 0, 0, NULL, 26, 27, 1, NULL, '2021-04-10 17:06:08', '2021-04-10 17:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `page` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'home', '{\"en\":\"{app_name} - Geo Classified Ads CMS\",\"fr\":\"{app_name} - CMS d\'annonces classées et géolocalisées\",\"ar\":\"{app_name} - لعروض المنتجات\"}', '{\"en\":\"Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}\",\"fr\":\"Vendre et acheter des produits et services en quelques minutes sur {app_name} {country}. Petites annonces - {country}. Recherchez un produit ou un service - {country}\",\"ar\":\"بيع وشراء منتجات جديدة ومستعمله في جميع انحاء انحاء العالم\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"fr\":\"{app_name}, {country}, annonces, classées, gratuites, script, app, annonces premium\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(2, 'register', '{\"en\":\"Sign Up - {app_name}\",\"fr\":\"S\'inscrire - {app_name}\",\"ar\":\"تسجيل حساب - {app_name}\"}', '{\"en\":\"Sign Up on {app_name}\",\"fr\":\"S\'inscrire sur {app_name}\",\"ar\":\"تسجيل حساب جديد {app_name}\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(3, 'login', '{\"en\":\"Login - {app_name}\",\"fr\":\"S\'identifier - {app_name}\",\"ar\":\"تسجيل دخول - {app_name}\"}', '{\"en\":\"Log in to {app_name}\",\"fr\":\"S\'identifier sur {app_name}\",\"ar\":\"تسجيل الدخول {app_name}\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(4, 'create', '{\"en\":\"Post Free Ads\",\"fr\":\"Publiez une annonce gratuite\",\"ar\":\"نشر اعلانات مجانا\"}', '{\"en\":\"Post Free Ads - {country}.\",\"fr\":\"Publier une annonce gratuite - {country}.\",\"ar\":\"نشر اعلانات مجانا - {country}.\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(5, 'countries', '{\"en\":\"Free Local Classified Ads in the World\",\"fr\":\"Petites annonces classées dans le monde\",\"ar\":\"نشر اعلانات بضائع جديده ومستعمله مجانا\"}', '{\"en\":\"Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.\",\"fr\":\"Bienvenue sur {app_name} : Site de petites annonces 100% gratuit. Vendez et achetez près de chez vous. Simple, rapide et efficace.\",\"ar\":\"مرحبا بك في منصة حاضر , لبيع وشراء المنتجات الجديده والمستعمله\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(6, 'contact', '{\"en\":\"Contact Us - {app_name}\",\"fr\":\"Nous contacter - {app_name}\",\"ar\":\"تواصل معنا - {app_name}\"}', '{\"en\":\"Contact Us - {app_name}\",\"fr\":\"Nous contacter - {app_name}\",\"ar\":\"Contact Us - {app_name}\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(7, 'sitemap', '{\"en\":\"Sitemap {app_name} - {country}\",\"fr\":\"Plan du site {app_name} - {country}\",\"ar\":\"خريطة الموقع {app_name} - {country}\"}', '{\"en\":\"Sitemap {app_name} - {country}. 100% Free Ads Classified\",\"fr\":\"Plan du site {app_name} - {country}. Site de petites annonces 100% gratuit dans le Monde. Vendez et achetez près de chez vous. Simple, rapide et efficace.\",\"ar\":\"خرائط الموقع {app_name} - {country}.\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(8, 'password', '{\"en\":\"Lost your password? - {app_name}\",\"fr\":\"Mot de passe oublié? - {app_name}\",\"ar\":\"نسيت كلمة المرور ؟ - {app_name}\"}', '{\"en\":\"Lost your password? - {app_name}\",\"fr\":\"Mot de passe oublié? - {app_name}\",\"ar\":\"نسيت كلمة المرور ؟ - {app_name}\"}', '{\"en\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, free ads, classified, ads, script, app, premium ads\"}', 1),
(9, 'pricing', '{\"en\":\"Pricing - {app_name}\",\"fr\":\"Tarifs - {app_name}\",\"ar\":\"الخطط - {app_name}\"}', '{\"en\":\"Pricing - {app_name}\",\"fr\":\"Tarifs - {app_name}\",\"ar\":\"الخطط - {app_name}\"}', '{\"en\":\"{app_name}, {country}, pricing, free ads, classified, ads, script, app, premium ads\",\"ar\":\"{app_name}, {country}, pricing, free ads, classified, ads, script, app, premium ads\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_10_12_160714_create_languages_table', 1),
(2, '2020_10_12_160715_create_advertising_table', 1),
(3, '2020_10_12_160715_create_blacklist_table', 1),
(4, '2020_10_12_160715_create_cache_table', 1),
(5, '2020_10_12_160715_create_categories_table', 1),
(6, '2020_10_12_160715_create_continents_table', 1),
(7, '2020_10_12_160715_create_currencies_table', 1),
(8, '2020_10_12_160715_create_fields_table', 1),
(9, '2020_10_12_160715_create_gender_table', 1),
(10, '2020_10_12_160715_create_home_sections_table', 1),
(11, '2020_10_12_160715_create_meta_tags_table', 1),
(12, '2020_10_12_160715_create_packages_table', 1),
(13, '2020_10_12_160715_create_pages_table', 1),
(14, '2020_10_12_160715_create_password_resets_table', 1),
(15, '2020_10_12_160715_create_payment_methods_table', 1),
(16, '2020_10_12_160715_create_permission_tables', 1),
(17, '2020_10_12_160715_create_post_types_table', 1),
(18, '2020_10_12_160715_create_report_types_table', 1),
(19, '2020_10_12_160715_create_sessions_table', 1),
(20, '2020_10_12_160715_create_settings_table', 1),
(21, '2020_10_12_160715_create_user_types_table', 1),
(22, '2020_10_12_160716_create_category_field_table', 1),
(23, '2020_10_12_160716_create_countries_table', 1),
(24, '2020_10_12_160716_create_fields_options_table', 1),
(25, '2020_10_12_160716_create_subadmin1_table', 1),
(26, '2020_10_12_160716_create_subadmin2_table', 1),
(27, '2020_10_12_160716_create_users_table', 1),
(28, '2020_10_12_160717_create_cities_table', 1),
(29, '2020_10_12_160717_create_posts_table', 1),
(30, '2020_10_12_160717_create_saved_posts_table', 1),
(31, '2020_10_12_160717_create_saved_search_table', 1),
(32, '2020_10_12_160717_create_threads_table', 1),
(33, '2020_10_12_160718_create_threads_messages_table', 1),
(34, '2020_10_12_160718_create_threads_participants_table', 1),
(35, '2020_10_12_160719_create_payments_table', 1),
(36, '2020_10_12_160719_create_pictures_table', 1),
(37, '2020_10_12_160719_create_post_values_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci COMMENT 'In country language',
  `short_name` text COLLATE utf8mb4_unicode_ci COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_badge` tinyint(1) UNSIGNED DEFAULT '0',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_duration` int(11) DEFAULT '30' COMMENT 'In days',
  `duration` int(10) UNSIGNED DEFAULT '30' COMMENT 'In days',
  `pictures_limit` int(11) DEFAULT '5',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'In country language',
  `facebook_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `google_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `twitter_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `linkedin_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `recommended` tinyint(1) DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `promo_duration`, `duration`, `pictures_limit`, `description`, `facebook_ads_duration`, `google_ads_duration`, `twitter_ads_duration`, `linkedin_ads_duration`, `recommended`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, '{\"en\":\"Regular List\",\"fr\":\"Gratuit\",\"es\":\"Lista regular\",\"ar\":\"اعلان مجاني\",\"pt\":\"Lista Regular\",\"ru\":\"Обычный список\",\"tr\":\"Normal Liste\",\"th\":\"รายการปกติ\",\"ka\":\"რეგულარული სია\",\"zh\":\"常规清单\",\"ja\":\"レギュラーリスト\",\"it\":\"Elenco regolare\",\"ro\":\"Lista regulată\"}', '{\"en\":\"Free\",\"fr\":\"Standard\",\"es\":\"Estándar\",\"ar\":\"اساسي\",\"pt\":\"Padrão\",\"ru\":\"Стандарт\",\"tr\":\"Standart\",\"th\":\"มาตรฐาน\",\"ka\":\"სტანდარტული\",\"zh\":\"标准\",\"ja\":\"標準\",\"it\":\"Standard\",\"ro\":\"Standard\"}', 'red', 1, 0.00, 'SAR', NULL, NULL, NULL, '{\"ar\":null}', 0, 0, 0, 0, 0, NULL, 2, 3, 0, 1),
(2, '{\"en\":\"Top page Ad\",\"fr\":\"Annonce Haut de Page\",\"es\":\"Anuncio de inicio de página\",\"ar\":\"إعلان أعلى الصفحة - فضي\",\"pt\":\"Anúncio no topo da página\",\"ru\":\"Объявление вверху страницы\",\"tr\":\"Sayfa Başı Duyuru\",\"th\":\"ประกาศด้านบนของหน้า\",\"ka\":\"გვერდის განცხადება\",\"zh\":\"页首公告\",\"ja\":\"ページのトップへ\",\"it\":\"Annuncio in cima alla pagina\",\"ro\":\"Anunț de primă pagină\"}', '{\"en\":\"Premium\",\"fr\":\"Premium\",\"es\":\"Prima\",\"ar\":\"الممتازة\",\"pt\":\"Prêmio\",\"ru\":\"Премиум\",\"tr\":\"Ödül\",\"th\":\"พรีเมียม\",\"ka\":\"პრემია\",\"zh\":\"保费\",\"ja\":\"プレミアム\",\"it\":\"Premium\",\"ro\":\"Premium\"}', 'orange', 1, 20.00, 'SAR', 7, 60, 10, '{\"en\":\"Featured on the homepage\\nFeatured in the category\",\"fr\":\"En vedette à l\'accueil\\nEn vedette dans la catégorie\",\"es\":\"Destacado en la página de inicio\\nDestacado en la categoría\",\"ar\":\"ظهرت على الصفحة الرئيسية\\r\\nظهرت في الفئة\",\"pt\":\"Apresentado na página inicial\\nApresentado na categoria\",\"ru\":\"Показано на главной странице\\nВ категории\",\"tr\":\"Ana Sayfada Öne Çıkanlar\\nKategoride Öne Çıkanlar\",\"th\":\"นำเสนอในหน้าแรก\\nนำเสนอในหมวดหมู่\",\"ka\":\"მთავარ გვერდზე\\nმთავარი კატეგორიაში\",\"zh\":\"精选在首页上\\n列入类别\",\"ja\":\"ホームページに掲載\\nカテゴリーで紹介\",\"it\":\"In primo piano sulla home page\\nIn primo piano nella categoria\",\"ro\":\"Prezentat pe pagina de pornire\\nPrezentat în categorie\"}', 0, 0, 0, 0, 1, NULL, 4, 5, 0, 1),
(3, '{\"en\":\"Top page Ad+\",\"fr\":\"Annonce Haut de Page+\",\"es\":\"Anuncio de inicio de página+\",\"ar\":\"إعلان أعلى الصفحة - ذهبي\",\"pt\":\"Anúncio no topo da página+\",\"ru\":\"Объявление вверху страницы+\",\"tr\":\"Sayfa Başı Duyuru+\",\"th\":\"ประกาศด้านบนของหน้า+\",\"ka\":\"გვერდის განცხადება+\",\"zh\":\"页首公告+\",\"ja\":\"ページのトップへ+\",\"it\":\"Annuncio in cima alla pagina+\",\"ro\":\"Anunț de primă pagină+\"}', '{\"en\":\"Premium+\",\"fr\":\"Premium+\",\"es\":\"Prima+\",\"ar\":\"الممتازة+\",\"pt\":\"Prêmio+\",\"ru\":\"Премиум+\",\"tr\":\"Ödül+\",\"th\":\"พรีเมียม+\",\"ka\":\"პრემია+\",\"zh\":\"保费+\",\"ja\":\"プレミアム+\",\"it\":\"Premium+\",\"ro\":\"Premium+\"}', 'green', 1, 50.00, 'SAR', 30, 120, 15, '{\"en\":\"Featured on the homepage\\nFeatured in the category\",\"fr\":\"En vedette à l\\\\\'accueil\\nEn vedette dans la catégorie\",\"es\":\"Destacado en la página de inicio\\nDestacado en la categoría\",\"ar\":\"ظهرت على الصفحة الرئيسية\\r\\nظهرت في الفئة\",\"pt\":\"Apresentado na página inicial\\nApresentado na categoria\",\"ru\":\"Показано на главной странице\\nВ категории\",\"tr\":\"Ana Sayfada Öne Çıkanlar\\nKategoride Öne Çıkanlar\",\"th\":\"นำเสนอในหน้าแรก\\nนำเสนอในหมวดหมู่\",\"ka\":\"მთავარ გვერდზე\\nმთავარი კატეგორიაში\",\"zh\":\"精选在首页上\\n列入类别\",\"ja\":\"ホームページに掲載\\nカテゴリーで紹介\",\"it\":\"In primo piano sulla home page\\nIn primo piano nella categoria\",\"ro\":\"Prezentat pe pagina de pornire\\nPrezentat în categorie\"}', 0, 0, 0, 0, 0, NULL, 6, 7, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `external_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) UNSIGNED DEFAULT '0',
  `excluded_from_footer` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'terms', '{\"en\":\"Terms\",\"ar\":\"شروط الخدمة\"}', 'terms', '{\"en\":\"Terms & Conditions\",\"ar\":\"شروط الخدمة\"}', NULL, '{\"en\":\"<h4><b>Definitions<\\/b><\\/h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \\\"Conditions\\\") the following meanings:<\\/p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.<\\/li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.<\\/li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.<\\/li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of {YourCity} under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.<\\/li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.<\\/li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.<\\/li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\\\"https:\\/\\/bedigit.com\\\">https:\\/\\/bedigit.com<\\/a> and allowing Users and Advertisers to access the Service via internet LaraClassified.<\\/li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\\\"https:\\/\\/bedigit.com\\\">https:\\/\\/bedigit.com<\\/a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.<\\/li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.<\\/li><\\/ol><h4><b>Subject<\\/b><\\/h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br><\\/p><h4><b>Acceptance<\\/b><\\/h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br><\\/p><h4><b>Responsibility<\\/b><\\/h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br><\\/p><h4><b>Modification of these terms<\\/b><\\/h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.<\\/p><p>Advertisers are advised to consult the Terms to be aware of the changes.<\\/p><h4><b>Miscellaneous<\\/b><\\/h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.<\\/p><p>Any complaints should be addressed to Customer Service LaraClassified.<\\/p>\",\"ar\":\"<h4>كتابة شروط الخدمه هنا<\\/h4>\"}', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2021-04-10 17:06:08', '2021-04-11 21:53:45'),
(2, NULL, 'privacy', '{\"en\":\"Privacy\",\"ar\":\"سياسة الخصوصية\"}', 'privacy', '{\"en\":\"Privacy\",\"ar\":\"Privacy\"}', NULL, '{\"en\":\"<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.<\\/p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.<\\/p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.<\\/p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.<\\/p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.<\\/p>\",\"ar\":\"<p><span style=\\\"font-size: 18pt;\\\"><strong>يتم كتابة سياسة الخصوصية هنا<\\/strong><\\/span><\\/p>\"}', NULL, 8, 9, 1, NULL, NULL, 0, 0, 1, '2021-04-10 17:06:08', '2021-04-11 21:54:30'),
(4, NULL, 'standard', '{\"en\":\"FAQ\",\"ar\":\"التعليمات\"}', 'faq', '{\"en\":\"Frequently Asked Questions\",\"ar\":\"اسئلة مكررة\"}', NULL, '{\"en\":\"<p><b>How do I place an ad?<\\/b><\\/p><p>It\'s very easy to place an ad: click on the button \\\"Post free Ads\\\" above right.<\\/p><p><b>What does it cost to advertise?<\\/b><\\/p><p>The publication is 100% free throughout the website.<\\/p><p><b>If I post an ad, will I also get more spam e-mails?<\\/b><\\/p><p>Absolutely not because your email address is not visible on the website.<\\/p><p><b>How long will my ad remain on the website?<\\/b><\\/p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.<\\/p><p><b>I sold my item. How do I delete my ad?<\\/b><\\/p><p>Once your product is sold or leased, log in to your account to remove your ad.<\\/p>\",\"ar\":\"<p><strong>السؤال الأول ؟<\\/strong><\\/p>\\r\\n<p>الإجابه<\\/p>\\r\\n<p><strong>السؤال الثاني ؟<\\/strong><\\/p>\\r\\n<p>الإجابه<\\/p>\\r\\n<p><strong>السؤال الثالث ؟<\\/strong><\\/p>\\r\\n<p>الإجابه<\\/p>\\r\\n<p><strong>السؤال الرابع ؟<\\/strong><\\/p>\\r\\n<p>الإجابه<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2021-04-10 17:06:08', '2021-04-11 21:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `phone`, `token`, `created_at`, `updated_at`) VALUES
('s3d101@gmail.com', '', '$2y$10$eaVcLNkZb.uGm0EiI2jruelWBx3z839kS7W5oxDZb5lRrHQ4aioCm', '2021-04-16 00:56:36', NULL),
('ahmedfci20@yahoo.com', '', '$2y$10$grOICbNf5kM.YzEoyDEw1uBOerVS3FKvyEQq3kBvOV5rsVnF.Vs1K', '2021-04-17 18:47:45', NULL),
('s3dk@outlook.sa', '', '$2y$10$8JpoUcOBEKs2HDgaHYG2COTVm6WQAL.UKaoiwhu3anJZNAoUHWWTy', '2021-04-17 18:55:19', NULL),
('s3dk@outlook.com', '', '$2y$10$m375JBvoJvMU6gpc1bf/0uBGKTmFuB0402ctgMUHbvZ4z3iiVvMLe', '2021-04-17 19:30:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `has_ccbox` tinyint(1) UNSIGNED DEFAULT '0',
  `is_compatible_api` tinyint(1) DEFAULT '0',
  `countries` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Countries codes separated by comma.',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal', 'Paypal', 'Payment with Paypal', 0, 0, NULL, 0, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'permission-list', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(2, 'permission-create', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(3, 'permission-update', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(4, 'permission-delete', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(5, 'role-list', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(6, 'role-create', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(7, 'role-update', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(8, 'role-delete', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09'),
(9, 'dashboard-access', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `post_type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(17,2) UNSIGNED DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT '0',
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) DEFAULT '0',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lon` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visits` int(10) UNSIGNED DEFAULT '0',
  `email_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '0',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '1',
  `accept_terms` tinyint(1) DEFAULT '0',
  `accept_marketing_offers` tinyint(1) DEFAULT '0',
  `is_permanent` tinyint(1) DEFAULT '0',
  `reviewed` tinyint(1) DEFAULT '0',
  `featured` tinyint(1) UNSIGNED DEFAULT '0',
  `archived` tinyint(1) DEFAULT '0',
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint(1) UNSIGNED DEFAULT '0',
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `fb_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, '{\"en\":\"Private individual\",\"fr\":\"Particulier\",\"es\":\"Privado\",\"ar\":\"خاص\",\"pt\":\"Privado\",\"ru\":\"Частный\",\"tr\":\"Özel\",\"th\":\"เอกชน\",\"ka\":\"პირადი\",\"zh\":\"私人的\",\"ja\":\"非公開\",\"it\":\"Privato\",\"ro\":\"Particular\"}', NULL, NULL, NULL, 1),
(2, '{\"en\":\"Professional\",\"fr\":\"Professionnel\",\"es\":\"Negocio\",\"ar\":\"المحترفين\",\"pt\":\"O negócio\",\"ru\":\"Бизнес\",\"tr\":\"Ticaret\",\"th\":\"ธุรกิจ\",\"ka\":\"ბიზნესი\",\"zh\":\"专业的\",\"ja\":\"プロ\",\"it\":\"Professionale\",\"ro\":\"Profesional\"}', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_values`
--

CREATE TABLE `post_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` int(10) UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `name`) VALUES
(1, '{\"en\":\"Fraud\",\"fr\":\"Fraude\",\"es\":\"Fraude\",\"ar\":\"تزوير\"}'),
(2, '{\"en\":\"Duplicate\",\"fr\":\"Dupliquée\",\"es\":\"Duplicar\",\"ar\":\"مكرر\"}'),
(3, '{\"en\":\"Spam\",\"fr\":\"Indésirable\",\"es\":\"indeseable\",\"ar\":\"بريد مؤذي\"}'),
(4, '{\"en\":\"Wrong category\",\"fr\":\"Mauvaise categorie\",\"es\":\"Categoría incorrecta\",\"ar\":\"فئة خاطئة\"}'),
(5, '{\"en\":\"Other\",\"fr\":\"Autre\",\"es\":\"Otro\",\"ar\":\"آخر\"}');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', '2021-04-10 17:06:09', '2021-04-10 17:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `payload` mediumtext COLLATE utf8mb4_unicode_ci,
  `last_activity` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_agent` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` mediumtext COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"317aed19-0c28-45d0-91c6-a06cd6a39a77\",\"app_name\":\"\\u062d\\u0627\\u0636\\u0631\",\"slogan\":\"\\u0627\\u0628\\u062f\\u0623 \\u062a\\u062c\\u0627\\u0631\\u062a\\u0643 \\u0645\\u0639\\u0646\\u0627 \\u0628\\u0639\\u0631\\u0636 \\u0645\\u0646\\u062a\\u062c\\u0627\\u062a\\u0643 \\u0645\\u062c\\u0627\\u0646\\u0627\",\"logo\":\"app\\/logo\\/logo-607389173ca9a.png\",\"favicon\":null,\"email\":\"admin@hadhr.com\",\"phone_number\":null,\"auto_detect_language\":\"0\",\"php_specific_date_format\":\"0\",\"date_format\":\"YYYY-MM-DD\",\"datetime_format\":\"YYYY-MM-DD HH:mm\",\"date_force_utf8\":\"0\",\"logo_dark\":\"app\\/backend\\/logo-dark-607389387d29d.png\",\"logo_light\":\"app\\/backend\\/logo-light-607389387e8cd.png\",\"vector_charts_type\":\"morris_bar\",\"latest_entries_limit\":\"5\",\"show_countries_charts\":\"1\",\"general_settings_as_submenu_in_sidebar\":\"1\"}', 'Application Setup', NULL, NULL, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', '{\"app_skin\":\"skin-green\",\"body_background_color\":null,\"body_text_color\":null,\"body_background_image\":null,\"body_background_image_fixed\":\"0\",\"page_width\":null,\"title_color\":null,\"progress_background_color\":null,\"link_color\":null,\"link_color_hover\":null,\"header_sticky\":\"0\",\"header_height\":null,\"header_background_color\":null,\"header_bottom_border_width\":null,\"header_bottom_border_color\":\"#E8E8E8\",\"header_link_color\":null,\"header_link_color_hover\":null,\"footer_background_color\":null,\"footer_text_color\":null,\"footer_title_color\":null,\"footer_link_color\":null,\"footer_link_color_hover\":null,\"payment_icon_top_border_width\":null,\"payment_icon_top_border_color\":null,\"payment_icon_bottom_border_width\":null,\"payment_icon_bottom_border_color\":null,\"btn_post_bg_top_color\":null,\"btn_post_bg_bottom_color\":null,\"btn_post_border_color\":null,\"btn_post_text_color\":null,\"btn_post_bg_top_color_hover\":null,\"btn_post_bg_bottom_color_hover\":null,\"btn_post_border_color_hover\":null,\"btn_post_text_color_hover\":null,\"custom_css\":null,\"login_bg_image\":null,\"admin_logo_bg\":\"skin3\",\"admin_navbar_bg\":\"skin6\",\"admin_sidebar_type\":\"full\",\"admin_sidebar_bg\":\"skin5\",\"admin_sidebar_position\":\"1\",\"admin_header_position\":\"1\",\"admin_boxed_layout\":\"0\",\"admin_dark_theme\":\"0\"}', 'Style Customization', NULL, NULL, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', '{\"display_mode\":\".grid-view\",\"grid_view_cols\":\"4\",\"items_per_page\":\"12\",\"left_sidebar\":\"1\",\"fake_locations_results\":\"2\",\"count_categories_posts\":\"0\",\"count_cities_posts\":\"0\",\"elapsed_time_from_now\":\"0\",\"hide_dates\":\"0\",\"cities_extended_searches\":\"1\",\"distance_calculation_formula\":\"ST_Distance_Sphere\",\"search_distance_default\":\"50\",\"search_distance_max\":\"500\",\"search_distance_interval\":\"100\"}', 'Listing & Search Options', NULL, NULL, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads (Form & Page)', '{\"publication_form_type\":\"1\",\"picture_mandatory\":\"1\",\"pictures_limit\":\"5\",\"tags_limit\":\"15\",\"guests_can_post_ads\":\"1\",\"posts_review_activation\":\"0\",\"permanent_posts_enabled\":\"0\",\"pricing_page_enabled\":\"0\",\"allow_emojis\":\"0\",\"show_post_types\":\"0\",\"auto_registration\":\"0\",\"wysiwyg_editor\":\"tinymce\",\"remove_url_before\":\"0\",\"remove_url_after\":\"0\",\"remove_email_before\":\"0\",\"remove_email_after\":\"0\",\"remove_phone_before\":\"0\",\"remove_phone_after\":\"0\",\"convert_phone_number_to_img\":\"0\",\"hide_phone_number\":\"0\",\"show_security_tips\":\"0\",\"enable_whatsapp_btn\":\"1\",\"pre_filled_whatsapp_message\":\"0\",\"elapsed_time_from_now\":\"0\",\"hide_dates\":\"0\",\"pictures_slider\":\"horizontal-thumb\",\"similar_posts\":\"1\",\"guests_can_contact_ads_authors\":\"1\",\"show_post_on_googlemap\":\"0\",\"activation_facebook_comments\":\"0\"}', 'Ads (Form & Single Page) Options', NULL, NULL, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"driver\":\"sendmail\",\"host\":null,\"port\":null,\"username\":null,\"password\":null,\"encryption\":null,\"mailgun_domain\":null,\"mailgun_secret\":null,\"mailgun_endpoint\":\"api.mailgun.net\",\"postmark_token\":null,\"ses_key\":null,\"ses_secret\":null,\"ses_region\":null,\"mandrill_secret\":null,\"sparkpost_secret\":null,\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"email_sender\":\"admin@hadhr.com\",\"email_verification\":\"0\",\"confirmation\":\"0\",\"admin_notification\":\"0\",\"payment_notification\":\"0\"}', 'Mail Sending Configuration', NULL, NULL, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', NULL, 'SMS Sending Configuration', NULL, NULL, 12, 13, 1, 1, NULL, NULL),
(7, 'upload', 'Upload', NULL, 'Upload Settings', NULL, NULL, 14, 15, 1, 1, NULL, NULL),
(8, 'geo_location', 'Geo Location', '{\"geolocation_activation\":\"1\",\"default_country_code\":\"SA\",\"country_flag_activation\":\"0\",\"local_currency_packages_activation\":\"0\"}', 'Geo Location Configuration', NULL, NULL, 16, 17, 1, 1, NULL, NULL),
(9, 'security', 'Security', NULL, 'Security Options', NULL, NULL, 18, 19, 1, 1, NULL, NULL),
(10, 'social_auth', 'Social Login', '{\"social_login_activation\":\"1\",\"facebook_client_id\":null,\"facebook_client_secret\":null,\"linkedin_client_id\":null,\"linkedin_client_secret\":null,\"twitter_client_id\":null,\"twitter_client_secret\":null,\"google_client_id\":null,\"google_client_secret\":null}', 'Social Network Login', NULL, NULL, 20, 21, 1, 1, NULL, NULL),
(11, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, NULL, 22, 23, 1, 1, NULL, NULL),
(12, 'optimization', 'Optimization', NULL, 'Optimization Tools', NULL, NULL, 24, 25, 1, 1, NULL, NULL),
(13, 'seo', 'SEO', '{\"google_site_verification\":\"google-site-verification=xm2kVCsz-5byw7zrfndhfS2mHQ2D55yV2sHfwcTaFS4\",\"alexa_verify_id\":null,\"msvalidate\":null,\"yandex_verification\":null,\"twitter_username\":null,\"robots_txt\":\"User-agent: *\\r\\nDisallow:\\r\\n\\r\\nAllow: \\/\\r\\n\\r\\nUser-agent: *\\r\\nDisallow: \\/admin\\/\\r\\nDisallow: \\/ajax\\/\\r\\nDisallow: \\/assets\\/\\r\\nDisallow: \\/css\\/\\r\\nDisallow: \\/js\\/\\r\\nDisallow: \\/vendor\\/\\r\\nDisallow: \\/main.php\\r\\nDisallow: \\/mix-manifest.json\",\"robots_txt_sm_indexes\":\"1\",\"no_index_categories\":\"0\",\"no_index_tags\":\"0\",\"no_index_cities\":\"0\",\"no_index_users\":\"0\",\"no_index_post_report\":\"0\",\"no_index_all\":\"0\",\"post_permalink\":\"{slug}-{id}\",\"post_permalink_ext\":null,\"multi_countries_urls\":\"0\"}', 'SEO Tools', NULL, NULL, 26, 27, 1, 1, NULL, NULL),
(14, 'other', 'Others', '{\"cookie_consent_enabled\":\"0\",\"show_tips_messages\":\"1\",\"googlemaps_key\":null,\"timer_new_messages_checking\":\"60000\",\"wysiwyg_editor\":\"tinymce\",\"ios_app_url\":null,\"android_app_url\":null,\"decimals_superscript\":\"0\",\"cookie_expiration\":\"86400\",\"js_code\":null}', 'Other Options', NULL, NULL, 28, 29, 1, 1, NULL, NULL),
(15, 'cron', 'Cron', NULL, 'Cron Job', NULL, NULL, 30, 31, 1, 1, NULL, NULL),
(16, 'footer', 'Footer', '{\"hide_links\":\"0\",\"hide_payment_plugins_logos\":\"1\",\"hide_powered_by\":\"0\",\"powered_by_info\":\"<a href=\\\"https:\\/\\/ahmeds.dev\\\">Ahmeds.dev<\\/a>\",\"tracking_code\":\"<!-- Global site tag (gtag.js) - Google Analytics -->\\r\\n<script async src=\\\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js?id=G-LPES48MSLL\\\"><\\/script>\\r\\n<script>\\r\\n  window.dataLayer = window.dataLayer || [];\\r\\n  function gtag(){dataLayer.push(arguments);}\\r\\n  gtag(\'js\', new Date());\\r\\n\\r\\n  gtag(\'config\', \'G-LPES48MSLL\');\\r\\n<\\/script>\"}', 'Pages Footer', NULL, NULL, 32, 33, 1, 1, NULL, NULL),
(17, 'backup', 'Backup', NULL, 'Backup Configuration', NULL, NULL, 34, 35, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `active`) VALUES
(1, 'SA.19', 'SA', '{\"en\":\"Tabuk Region\"}', 1),
(2, 'SA.16', 'SA', '{\"en\":\"Najran Region\"}', 1),
(3, 'SA.14', 'SA', '{\"en\":\"Mecca Region\"}', 1),
(4, 'SA.17', 'SA', '{\"en\":\"Jazan Region\"}', 1),
(5, 'SA.13', 'SA', '{\"en\":\"Ha\'il Region\"}', 1),
(6, 'SA.11', 'SA', '{\"en\":\"\'Asir Region\"}', 1),
(7, 'SA.06', 'SA', '{\"en\":\"Eastern Province\"}', 1),
(8, 'SA.10', 'SA', '{\"en\":\"Riyadh Region\"}', 1),
(9, 'SA.08', 'SA', '{\"en\":\"Al-Qassim Region\"}', 1),
(10, 'SA.05', 'SA', '{\"en\":\"Medina Region\"}', 1),
(11, 'SA.20', 'SA', '{\"en\":\"Al Jawf Region\"}', 1),
(12, 'SA.15', 'SA', '{\"en\":\"Northern Borders Region\"}', 1),
(13, 'SA.02', 'SA', '{\"en\":\"Al Bahah Region\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subadmin2`
--

INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `active`) VALUES
(1, 'SA.11.10972259', 'SA', 'SA.11', '{\"en\":\"Abhā\"}', 1),
(2, 'SA.11.10972260', 'SA', 'SA.11', '{\"en\":\"Aḩad Rufaydah\"}', 1),
(3, 'SA.11.10972261', 'SA', 'SA.11', '{\"en\":\"Al Majāridah\"}', 1),
(4, 'SA.11.10972262', 'SA', 'SA.11', '{\"en\":\"An Namāş\"}', 1),
(5, 'SA.11.10972263', 'SA', 'SA.11', '{\"en\":\"Sabt Al Alayah\"}', 1),
(6, 'SA.11.10972264', 'SA', 'SA.11', '{\"en\":\"Bīshah\"}', 1),
(7, 'SA.11.10972265', 'SA', 'SA.11', '{\"en\":\"Khamīs Mushayţ\"}', 1),
(8, 'SA.11.10972266', 'SA', 'SA.11', '{\"en\":\"Muḩā’il\"}', 1),
(9, 'SA.11.10972267', 'SA', 'SA.11', '{\"en\":\"Rijāl Alma‘\"}', 1),
(10, 'SA.11.10972268', 'SA', 'SA.11', '{\"en\":\"Sarāt ‘Abīdah\"}', 1),
(11, 'SA.11.10972269', 'SA', 'SA.11', '{\"en\":\"Tathlīth\"}', 1),
(12, 'SA.11.10972270', 'SA', 'SA.11', '{\"en\":\"Z̧ahrān al Janūb\"}', 1),
(13, 'SA.02.10972271', 'SA', 'SA.02', '{\"en\":\"Al ‘Aqīq\"}', 1),
(14, 'SA.02.10972272', 'SA', 'SA.02', '{\"en\":\"Al Bāḩah\"}', 1),
(15, 'SA.02.10972273', 'SA', 'SA.02', '{\"en\":\"Al Mandaq\"}', 1),
(16, 'SA.02.10972274', 'SA', 'SA.02', '{\"en\":\"Al Mikhwāh\"}', 1),
(17, 'SA.02.10972283', 'SA', 'SA.02', '{\"en\":\"Al Qurá\"}', 1),
(18, 'SA.02.10972284', 'SA', 'SA.02', '{\"en\":\"Baljurashī\"}', 1),
(19, 'SA.02.10972285', 'SA', 'SA.02', '{\"en\":\"Qilwah\"}', 1),
(20, 'SA.15.10972286', 'SA', 'SA.15', '{\"en\":\"‘Ar‘ar\"}', 1),
(21, 'SA.15.10972287', 'SA', 'SA.15', '{\"en\":\"Rafha\"}', 1),
(22, 'SA.15.10972288', 'SA', 'SA.15', '{\"en\":\"Ţurayf\"}', 1),
(23, 'SA.20.10972289', 'SA', 'SA.20', '{\"en\":\"Al Qurayyāt\"}', 1),
(24, 'SA.20.10972290', 'SA', 'SA.20', '{\"en\":\"Dawmat al Jandal\"}', 1),
(25, 'SA.20.10972291', 'SA', 'SA.20', '{\"en\":\"Sakākā\"}', 1),
(26, 'SA.05.10972292', 'SA', 'SA.05', '{\"en\":\"Al Ḩinākīyah\"}', 1),
(27, 'SA.05.10972293', 'SA', 'SA.05', '{\"en\":\"Al Madīnah al Munawwarah\"}', 1),
(28, 'SA.05.10972294', 'SA', 'SA.05', '{\"en\":\"Al Mahd\"}', 1),
(29, 'SA.05.10972295', 'SA', 'SA.05', '{\"en\":\"Al ‘Ulā\"}', 1),
(30, 'SA.05.10972296', 'SA', 'SA.05', '{\"en\":\"Badr\"}', 1),
(31, 'SA.05.10972297', 'SA', 'SA.05', '{\"en\":\"Khaybar\"}', 1),
(32, 'SA.05.10972298', 'SA', 'SA.05', '{\"en\":\"Yanbu‘ al Baḩr\"}', 1),
(33, 'SA.08.10972299', 'SA', 'SA.08', '{\"en\":\"Al Asyāḩ\"}', 1),
(34, 'SA.08.10972300', 'SA', 'SA.08', '{\"en\":\"Al Badā’i‘\"}', 1),
(35, 'SA.08.10972301', 'SA', 'SA.08', '{\"en\":\"Al Bukayrīyah\"}', 1),
(36, 'SA.08.10972302', 'SA', 'SA.08', '{\"en\":\"Al Midhnab\"}', 1),
(37, 'SA.08.10972303', 'SA', 'SA.08', '{\"en\":\"An Nabhānīyah\"}', 1),
(38, 'SA.08.10972304', 'SA', 'SA.08', '{\"en\":\"Ar Rass\"}', 1),
(39, 'SA.08.10972305', 'SA', 'SA.08', '{\"en\":\"Ash Shimāsīyah\"}', 1),
(40, 'SA.08.10972306', 'SA', 'SA.08', '{\"en\":\"Buraydah\"}', 1),
(41, 'SA.08.10972307', 'SA', 'SA.08', '{\"en\":\"Riyāḑ al Khabrā’\"}', 1),
(42, 'SA.08.10972308', 'SA', 'SA.08', '{\"en\":\"Governorate of Unaizah\"}', 1),
(43, 'SA.08.10972309', 'SA', 'SA.08', '{\"en\":\"‘Uyūn al Jiwā’\"}', 1),
(44, 'SA.10.10972310', 'SA', 'SA.10', '{\"en\":\"Ad Dawādimī\"}', 1),
(45, 'SA.10.10972311', 'SA', 'SA.10', '{\"en\":\"Ad Dir‘īyah\"}', 1),
(46, 'SA.10.10972312', 'SA', 'SA.10', '{\"en\":\"‘Afīf\"}', 1),
(47, 'SA.10.10972313', 'SA', 'SA.10', '{\"en\":\"Al Aflāj\"}', 1),
(48, 'SA.10.10972314', 'SA', 'SA.10', '{\"en\":\"Al Ghāţ\"}', 1),
(49, 'SA.10.10972315', 'SA', 'SA.10', '{\"en\":\"Al Ḩarīq\"}', 1),
(50, 'SA.10.10972316', 'SA', 'SA.10', '{\"en\":\"Al Kharj\"}', 1),
(51, 'SA.10.10972317', 'SA', 'SA.10', '{\"en\":\"Al Majma‘ah\"}', 1),
(52, 'SA.10.10972318', 'SA', 'SA.10', '{\"en\":\"Al Muzāḩimīyah\"}', 1),
(53, 'SA.10.10972319', 'SA', 'SA.10', '{\"en\":\"Al Quway‘īyah\"}', 1),
(54, 'SA.10.10972320', 'SA', 'SA.10', '{\"en\":\"Ar Riyāḑ\"}', 1),
(55, 'SA.10.10972321', 'SA', 'SA.10', '{\"en\":\"As Sulayyil\"}', 1),
(56, 'SA.10.10972322', 'SA', 'SA.10', '{\"en\":\"Az Zulfī\"}', 1),
(57, 'SA.10.10972323', 'SA', 'SA.10', '{\"en\":\"Ḑurumā\"}', 1),
(58, 'SA.10.10972324', 'SA', 'SA.10', '{\"en\":\"Ḩawţat Banī Tamīm\"}', 1),
(59, 'SA.10.10972325', 'SA', 'SA.10', '{\"en\":\"Ḩuraymilā’\"}', 1),
(60, 'SA.10.10972326', 'SA', 'SA.10', '{\"en\":\"Rumāḩ\"}', 1),
(61, 'SA.10.10972327', 'SA', 'SA.10', '{\"en\":\"Shaqrā’\"}', 1),
(62, 'SA.10.10972328', 'SA', 'SA.10', '{\"en\":\"Thādiq\"}', 1),
(63, 'SA.10.10972329', 'SA', 'SA.10', '{\"en\":\"Wādī ad Dawāsir\"}', 1),
(64, 'SA.06.10972330', 'SA', 'SA.06', '{\"en\":\"Ad Dammām\"}', 1),
(65, 'SA.06.10972331', 'SA', 'SA.06', '{\"en\":\"Al Aḩsā’\"}', 1),
(66, 'SA.06.10972332', 'SA', 'SA.06', '{\"en\":\"Al Jubayl\"}', 1),
(67, 'SA.06.10972333', 'SA', 'SA.06', '{\"en\":\"Al Khafjī\"}', 1),
(68, 'SA.06.10972334', 'SA', 'SA.06', '{\"en\":\"Al Khubar\"}', 1),
(69, 'SA.06.10972335', 'SA', 'SA.06', '{\"en\":\"An Nu‘ayrīyah\"}', 1),
(70, 'SA.06.10972336', 'SA', 'SA.06', '{\"en\":\"Al Qaţīf\"}', 1),
(71, 'SA.06.10972337', 'SA', 'SA.06', '{\"en\":\"Buqayq\"}', 1),
(72, 'SA.06.10972338', 'SA', 'SA.06', '{\"en\":\"Ḩafr al Bāţin\"}', 1),
(73, 'SA.06.10972339', 'SA', 'SA.06', '{\"en\":\"Qaryah al ‘Ulyā\"}', 1),
(74, 'SA.06.10972340', 'SA', 'SA.06', '{\"en\":\"Ra’s Tannūrah\"}', 1),
(75, 'SA.13.10972341', 'SA', 'SA.13', '{\"en\":\"Al Ghazālah\"}', 1),
(76, 'SA.13.10972342', 'SA', 'SA.13', '{\"en\":\"Ash Shinān\"}', 1),
(77, 'SA.13.10972343', 'SA', 'SA.13', '{\"en\":\"Baq‘ā’\"}', 1),
(78, 'SA.13.10972344', 'SA', 'SA.13', '{\"en\":\"Ḩā’il\"}', 1),
(79, 'SA.17.10972345', 'SA', 'SA.17', '{\"en\":\"Abū ‘Arīsh\"}', 1),
(80, 'SA.17.10972346', 'SA', 'SA.17', '{\"en\":\"Ad Dā’ir\"}', 1),
(81, 'SA.17.10972347', 'SA', 'SA.17', '{\"en\":\"Ad Darb\"}', 1),
(82, 'SA.17.10972348', 'SA', 'SA.17', '{\"en\":\"Aḩad al Musāriḩah\"}', 1),
(83, 'SA.17.10972349', 'SA', 'SA.17', '{\"en\":\"Al ‘Āriḑah\"}', 1),
(84, 'SA.17.10972350', 'SA', 'SA.17', '{\"en\":\"Al Ḩarth\"}', 1),
(85, 'SA.17.10972351', 'SA', 'SA.17', '{\"en\":\"Al ‘Īdābī\"}', 1),
(86, 'SA.17.10972352', 'SA', 'SA.17', '{\"en\":\"Ar Rayth\"}', 1),
(87, 'SA.17.10972353', 'SA', 'SA.17', '{\"en\":\"Baysh\"}', 1),
(88, 'SA.17.10972354', 'SA', 'SA.17', '{\"en\":\"Ḑamad\"}', 1),
(89, 'SA.17.10972355', 'SA', 'SA.17', '{\"en\":\"Farasān\"}', 1),
(90, 'SA.17.10972356', 'SA', 'SA.17', '{\"en\":\"Jāzān\"}', 1),
(91, 'SA.17.10972357', 'SA', 'SA.17', '{\"en\":\"Şabyā’\"}', 1),
(92, 'SA.17.10972358', 'SA', 'SA.17', '{\"en\":\"Şāmiţah\"}', 1),
(93, 'SA.14.10972359', 'SA', 'SA.14', '{\"en\":\"Al Jumūm\"}', 1),
(94, 'SA.14.10972360', 'SA', 'SA.14', '{\"en\":\"Al Kāmil\"}', 1),
(95, 'SA.14.10972361', 'SA', 'SA.14', '{\"en\":\"Al Khurmah\"}', 1),
(96, 'SA.14.10972362', 'SA', 'SA.14', '{\"en\":\"Al Līth\"}', 1),
(97, 'SA.14.10972363', 'SA', 'SA.14', '{\"en\":\"Al Qunfudhah\"}', 1),
(98, 'SA.14.10972364', 'SA', 'SA.14', '{\"en\":\"Aţ Ţā’if\"}', 1),
(99, 'SA.14.10972365', 'SA', 'SA.14', '{\"en\":\"Jiddah\"}', 1),
(100, 'SA.14.10972366', 'SA', 'SA.14', '{\"en\":\"Khulayş\"}', 1),
(101, 'SA.14.10972367', 'SA', 'SA.14', '{\"en\":\"Makkah al Mukarramah\"}', 1),
(102, 'SA.14.10972368', 'SA', 'SA.14', '{\"en\":\"Rābigh\"}', 1),
(103, 'SA.14.10972369', 'SA', 'SA.14', '{\"en\":\"Ranyah\"}', 1),
(104, 'SA.14.10972370', 'SA', 'SA.14', '{\"en\":\"Turubah\"}', 1),
(105, 'SA.16.10972371', 'SA', 'SA.16', '{\"en\":\"Al Kharkhīr\"}', 1),
(106, 'SA.16.10972372', 'SA', 'SA.16', '{\"en\":\"Badr al Janūb\"}', 1),
(107, 'SA.16.10972373', 'SA', 'SA.16', '{\"en\":\"Ḩubūnā\"}', 1),
(108, 'SA.16.10972374', 'SA', 'SA.16', '{\"en\":\"Khubāsh\"}', 1),
(109, 'SA.16.10972375', 'SA', 'SA.16', '{\"en\":\"Najrān\"}', 1),
(110, 'SA.16.10972376', 'SA', 'SA.16', '{\"en\":\"Sharūrah\"}', 1),
(111, 'SA.16.10972377', 'SA', 'SA.16', '{\"en\":\"Thār\"}', 1),
(112, 'SA.16.10972378', 'SA', 'SA.16', '{\"en\":\"Yadamah\"}', 1),
(113, 'SA.19.10972379', 'SA', 'SA.19', '{\"en\":\"Al Wajh\"}', 1),
(114, 'SA.19.10972380', 'SA', 'SA.19', '{\"en\":\"Ḑubā’\"}', 1),
(115, 'SA.19.10972381', 'SA', 'SA.19', '{\"en\":\"Ḩaql\"}', 1),
(116, 'SA.19.10972382', 'SA', 'SA.19', '{\"en\":\"Tabūk\"}', 1),
(117, 'SA.19.10972383', 'SA', 'SA.19', '{\"en\":\"Taymā’\"}', 1),
(118, 'SA.19.10972384', 'SA', 'SA.19', '{\"en\":\"Umluj\"}', 1),
(119, 'SA.14.11906054', 'SA', 'SA.14', '{\"en\":\"Ghran\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threads_messages`
--

CREATE TABLE `threads_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threads_participants`
--

CREATE TABLE `threads_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `is_important` tinyint(1) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `gender_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT '0',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED DEFAULT '0',
  `can_be_impersonated` tinyint(1) UNSIGNED DEFAULT '1',
  `disable_comments` tinyint(1) UNSIGNED DEFAULT '0',
  `ip_addr` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'facebook, google, twitter, linkedin, ...',
  `provider_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Provider User ID',
  `email_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '1',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '1',
  `accept_terms` tinyint(1) DEFAULT '0',
  `accept_marketing_offers` tinyint(1) DEFAULT '0',
  `time_zone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blocked` tinyint(1) UNSIGNED DEFAULT '0',
  `closed` tinyint(1) UNSIGNED DEFAULT '0',
  `last_activity` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `accept_terms`, `accept_marketing_offers`, `time_zone`, `blocked`, `closed`, `last_activity`, `last_login_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SA', NULL, 1, 1, 'hadhr', NULL, 'Administrator', NULL, 0, NULL, 'admin@hadhr.com', NULL, '$2y$10$duOE45R2toxBquHBU4PNhuvZ1HJ97F4wU7Mh3WyK7u/Dh/d8oEwuq', NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, 0, 0, NULL, '2021-04-18 22:34:16', NULL, '2021-04-10 17:06:09', '2021-04-18 17:34:16'),
(2, 'SA', 'ar', NULL, 1, 'S3d', NULL, NULL, '+966546924322', 1, NULL, 's3dk@outlook.sa', NULL, '$2y$10$loFrwXulo/CgdcWZYpWt9eCsiZUTCMFYGhYn9VajIbT4Iz28h8LWi', NULL, 0, 1, 0, '213.166.159.227', NULL, NULL, '7ada4b12ed6e625839b478f540d4e44e', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-13 22:27:59', '2021-04-16 12:17:18'),
(3, 'SA', 'ar', NULL, 1, 'خالد', NULL, NULL, '054692432', 1, NULL, 's3dk@outlook.com', NULL, '$2y$10$N5GjFRPNV.4P2Vx/sVFiM.P/ehhoFTz3oEnvLGpGl6XtJqCwk6sN6', NULL, NULL, 1, 0, '213.166.159.227', NULL, NULL, NULL, NULL, 1, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, NULL, NULL, '2021-04-13 23:04:36', '2021-04-17 19:30:02'),
(4, 'SA', 'ar', NULL, NULL, 'abosamres', NULL, NULL, '0501567', NULL, NULL, 's3dk@dofk.com', NULL, '$2y$10$eVwvZVyOXFYeHakOWhLvCOgQemaRCo15xNBA5i.dpS6M2BSLyj052', NULL, 0, 1, 0, '213.166.159.227', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-14 19:58:54', '2021-04-14 19:58:54'),
(5, 'SA', 'ar', NULL, NULL, 'ابوخالد', NULL, NULL, '054692322', 1, NULL, 's3d101@gmail.com', NULL, '$2y$10$0/iIIYWYgs8dzJCL1ueX6eme3LlxzEWGHNBM82gnzt7AatWlAZaBu', NULL, 0, 1, 0, '213.166.159.227', NULL, NULL, 'aecd78b9c8f20784d406c9b0c26805b8', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-04-17 22:32:58', NULL, '2021-04-16 00:53:38', '2021-04-17 17:32:58'),
(6, 'SA', 'ar', NULL, NULL, 'ابوسعد', NULL, NULL, '05090001', 1, NULL, 'abohgs@gnail.com', NULL, '$2y$10$CmFwwjDWgcvqKL96mbMVNu8Sq7rwZuKsZy/X1Y2zrXCReueFN0b.W', NULL, 0, 1, 0, '213.166.159.227', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-16 15:32:39', '2021-04-16 15:32:39'),
(7, 'SA', 'ar', NULL, NULL, 'ashdkjash', NULL, NULL, '14151515151', NULL, NULL, '', NULL, '$2y$10$VTMebDUkdrnePQNmLnkANOPXFWpYSOzX/oiNzmIDTPbeVQSOk7z5S', NULL, 0, 1, 0, '45.243.26.39', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-16 20:26:31', '2021-04-16 20:26:31'),
(8, 'SA', 'ar', NULL, NULL, 'SAAD ALAJMI', NULL, NULL, '+966924322', NULL, NULL, '', NULL, '$2y$10$pSFJAyoC3HZUTe/9P0UCH.Qf7ZakC1yvy4ufjvrKX8u7Q5LdJaH8C', NULL, 0, 1, 0, '213.166.159.227', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-04-17 21:01:40', NULL, '2021-04-16 20:28:56', '2021-04-17 16:01:40'),
(9, 'SA', 'ar', NULL, NULL, 'ahmedali', NULL, NULL, '01145602349', NULL, NULL, 'ahmedfci20@yahoo.com', NULL, '$2y$10$w9jJDGVNpowTNHgqhXxLI.hebQUDJNYRzTfRKILnDEos0BSenZ1iq', NULL, 0, 1, 0, '45.243.26.39', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-17 18:47:25', '2021-04-17 18:47:25'),
(10, 'SA', 'ar', NULL, NULL, 'سعد12', NULL, NULL, '', NULL, NULL, 'saadkalajmi@gmail.com', NULL, '$2y$10$KIkKkNdHgVDaKmOZ21nAAO0lPvaA7mNWJnAwQVEU9PMfsjBhqGJYW', NULL, 0, 1, 0, '128.204.251.88', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-18 19:19:47', '2021-04-18 19:19:47'),
(11, 'SA', 'ar', NULL, 1, 'مسماار', NULL, NULL, '050156', 0, NULL, 's3dlllssslll@gmail.com', NULL, '$2y$10$tGNIXh9a8NvaLLrUWbCoLuEn7O5Q9STjRKNqHUJ4k..vhKaxTznbK', NULL, NULL, 1, 0, '128.204.251.88', NULL, NULL, '15a1f471031181f4d6cf2697fd3ceb5d', NULL, 1, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, NULL, NULL, '2021-04-18 20:02:09', '2021-04-19 20:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Professional', 1),
(2, 'Individual', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `advertising_slug_unique` (`slug`),
  ADD KEY `advertising_active_index` (`active`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blacklist_type_entry_index` (`type`,`entry`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_slug_index` (`slug`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_lft_index` (`lft`),
  ADD KEY `categories_rgt_index` (`rgt`),
  ADD KEY `categories_depth_index` (`depth`);

--
-- Indexes for table `category_field`
--
ALTER TABLE `category_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_field_category_id_field_id_unique` (`category_id`,`field_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_code_index` (`country_code`),
  ADD KEY `cities_subadmin1_code_index` (`subadmin1_code`),
  ADD KEY `cities_subadmin2_code_index` (`subadmin2_code`),
  ADD KEY `cities_active_index` (`active`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `continents_code_unique` (`code`),
  ADD KEY `continents_active_index` (`active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`),
  ADD KEY `countries_active_index` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_belongs_to_index` (`belongs_to`);

--
-- Indexes for table `fields_options`
--
ALTER TABLE `fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_options_field_id_index` (`field_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_sections_method_unique` (`method`),
  ADD KEY `home_sections_active_index` (`active`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_abbr_unique` (`abbr`),
  ADD KEY `languages_active_index` (`active`),
  ADD KEY `languages_default_index` (`default`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_active_index` (`active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_slug_index` (`slug`),
  ADD KEY `pages_parent_id_index` (`parent_id`),
  ADD KEY `pages_active_index` (`active`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_package_id_index` (`package_id`),
  ADD KEY `payments_payment_method_id_index` (`payment_method_id`),
  ADD KEY `payments_post_id_index` (`post_id`),
  ADD KEY `payments_active_index` (`active`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_has_ccbox_index` (`has_ccbox`),
  ADD KEY `payment_methods_active_index` (`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pictures_post_id_index` (`post_id`),
  ADD KEY `pictures_active_index` (`active`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_lon_lat_index` (`lon`,`lat`),
  ADD KEY `posts_country_code_index` (`country_code`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_category_id_index` (`category_id`),
  ADD KEY `posts_title_index` (`title`),
  ADD KEY `posts_address_index` (`address`),
  ADD KEY `posts_city_id_index` (`city_id`),
  ADD KEY `posts_reviewed_index` (`reviewed`),
  ADD KEY `posts_featured_index` (`featured`),
  ADD KEY `posts_post_type_id_index` (`post_type_id`),
  ADD KEY `posts_contact_name_index` (`contact_name`),
  ADD KEY `posts_verified_email_index` (`verified_email`),
  ADD KEY `posts_verified_phone_index` (`verified_phone`),
  ADD KEY `posts_archived_index` (`archived`),
  ADD KEY `posts_tags_index` (`tags`),
  ADD KEY `posts_is_permanent_index` (`is_permanent`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_types_active_index` (`active`);

--
-- Indexes for table `post_values`
--
ALTER TABLE `post_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_values_post_id_index` (`post_id`),
  ADD KEY `post_values_field_id_index` (`field_id`),
  ADD KEY `post_values_option_id_index` (`option_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_posts_user_id_index` (`user_id`),
  ADD KEY `saved_posts_post_id_index` (`post_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_search_user_id_index` (`user_id`),
  ADD KEY `saved_search_country_code_index` (`country_code`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`),
  ADD KEY `settings_active_index` (`active`);

--
-- Indexes for table `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin1_code_unique` (`code`),
  ADD KEY `subadmin1_active_index` (`active`),
  ADD KEY `subadmin1_country_code_index` (`country_code`);

--
-- Indexes for table `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin2_code_unique` (`code`),
  ADD KEY `subadmin2_active_index` (`active`),
  ADD KEY `subadmin2_country_code_index` (`country_code`),
  ADD KEY `subadmin2_subadmin1_code_index` (`subadmin1_code`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_post_id_index` (`post_id`);

--
-- Indexes for table `threads_messages`
--
ALTER TABLE `threads_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_messages_thread_id_index` (`thread_id`),
  ADD KEY `threads_messages_user_id_index` (`user_id`);

--
-- Indexes for table `threads_participants`
--
ALTER TABLE `threads_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_participants_thread_id_index` (`thread_id`),
  ADD KEY `threads_participants_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_country_code_index` (`country_code`),
  ADD KEY `users_user_type_id_index` (`user_type_id`),
  ADD KEY `users_gender_id_index` (`gender_id`),
  ADD KEY `users_verified_email_index` (`verified_email`),
  ADD KEY `users_verified_phone_index` (`verified_phone`),
  ADD KEY `users_username_index` (`username`),
  ADD KEY `users_phone_index` (`phone`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_is_admin_index` (`is_admin`),
  ADD KEY `users_can_be_impersonated_index` (`can_be_impersonated`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_types_active_index` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `category_field`
--
ALTER TABLE `category_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fields_options`
--
ALTER TABLE `fields_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_values`
--
ALTER TABLE `post_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threads_messages`
--
ALTER TABLE `threads_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threads_participants`
--
ALTER TABLE `threads_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

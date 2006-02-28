-- MySQL dump 10.9
--
-- Host: localhost    Database: 4everRememberMe_v1_dev
-- ------------------------------------------------------
-- Server version	4.1.15-standard

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `value` text,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_settings`
--


/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
LOCK TABLES `system_settings` WRITE;
INSERT INTO `system_settings` VALUES (1,'extension_price','49.95',NULL),(2,'paypal_email','orders@foreverrememberme.com',NULL),(4,'faq','	<h3 class=\"center\">Frequently Asked Question</h3>\n	<p><b>Q.</b> What is a web Memorial?</p>\n	<p><b>A.</b> It is an internet website that you create to tell the story of your loved one who has passed on.\n		<ul>\n			<li>A place family and friends can view</li>\n			<li>Photo album can be viewed of your lost loved one</li>\n			<li>A visitor can light a candle</li>\n			<li>A visitor can leave condolences or comments</li>\n		</ul>\n	</p>\n	<p><b>Q.</b> How can my family or friends view the Memorial?</p>\n	<p><b>A.</b> Each memorial has it\'s own unique web address. ( example:  http://www.foreverrememberme.com/johndoe/ )</p>\n	<p><b>Q.</b> Who can create the web site?</p>\n	<p><b>A.</b> Anyone can create a web site memorial using our easy steps. And once you have created it you have a password and total control of the web site memorial, which you can add to or edit at anytime. You are the web site manager.</p>\n	<p><b>Q.</b> Can I get help with my website memorial?</p>\n	<p><b>A.</b> Yes, just <%= link_to \"Contact Us\", :controller => \'memorial\', :action => \'index\' %> and we\'ll be glad to help you.</p>\n	<p><b>Q.</b> How much does it cost for a website Memorial?</p>\n	<p><b>A.</b> Just $49.99 for ten years - we believe this to be very reasonable.</p>\n	<p><b>Q.</b> How long does it take to create a website Memorial?</p>\n	<p><b>A.</b> In ten minutes a website memorial can be made and additions can be added or edited anytime.</p>','StaticPage'),(6,'features','   \r\n	        	<h3 class=\"center\">Features</h3>\r\n	<p><b>Forever Remember Me</b> is a website to remember your loved one. When you create your website memorial you control it with easy to use tools, that you can add and edit at any time. Your website is password protected for you.</p>\r\n	<p>Create a memorial. Tell the story of their life the way you would like it told. Make announcements of events that you are having in the future.</p>\r\n	<p>Family and friends may visit at their convenience. Easy to find on the internet. Easy to leave comments, condolences, or light a candle.</p>\r\n	<p>Every year on the anniversary of their passing a bouquet of flowers will be sent to your website for display.</p>\r\n	<p>Put in articles of events that happened in their lives.</p>\r\n	<p>Easy to enter and display picture albums or slide shows.</p>\r\n	<p>Create a life time line.</p>\r\n	<p>Mailing list for family and friends to advise them of updates of the memorial.</p>\r\n	\r\n	    ','StaticPage'),(7,'tribute_price','5.00',NULL),(8,'allowed_number_of_photos','5',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


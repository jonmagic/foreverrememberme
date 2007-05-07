-- phpMyAdmin SQL Dump
-- version 2.9.0.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: May 07, 2007 at 11:23 AM
-- Server version: 4.1.21
-- PHP Version: 4.4.2
-- 
-- Database: `forever_rememberme`
-- 
CREATE DATABASE `forever_rememberme` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forever_rememberme`;

-- --------------------------------------------------------

-- 
-- Table structure for table `comments`
-- 

CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) default NULL,
  `email` varchar(40) default NULL,
  `note` text,
  `created_at` datetime default NULL,
  `memorial_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3311 ;

-- 
-- Dumping data for table `comments`
-- 

INSERT INTO `comments` VALUES (1, 'me', 'me@me.com', 'I love to talk about Betty... she was fun..', '2005-12-15 22:57:23', 1);
INSERT INTO `comments` VALUES (2, 'Walt Drake', 'wdrake_1@netzero.com', 'Beloved friend', '2005-12-26 19:13:33', 5);
INSERT INTO `comments` VALUES (3, 'Jon Doe', 'jondoe@gmail.com', 'Just wanted to let you know we miss you... Hope things are wonderful in heaven...', '2006-02-21 13:03:49', 9);
INSERT INTO `comments` VALUES (4, 'walt', 'wdrake_1@netzero.com', 'I see you are hard at it. Hope things come together soon.', '2006-03-01 07:35:49', 9);
INSERT INTO `comments` VALUES (5, 'Jon Hoyt', 'jonmagic@gmail.com', 'I miss you so much...', '2006-03-04 23:15:54', 10);
INSERT INTO `comments` VALUES (6, 'Walt', 'wdrake_1@netzero.com', 'Jon I understand ', '2006-03-08 09:14:50', 10);
INSERT INTO `comments` VALUES (8, 'Walt Drake', 'walte-drake@sbcglobal.net', 'I married Ruth''s daughter Jean.  Ruth and I attended a lot of Bingo games in which she surely loved to go.  We also attended many local auctions.  What a great time was shared with her.\r\n\r\nWith loving memories, Walt', '2006-04-24 19:26:05', 11);
INSERT INTO `comments` VALUES (9, 'Roberta', 'oscar1@maqs.net', 'Mom,\r\nThere were so many things I admired about you,you never had it easy but you always made do with what you had.You alway''s tried to see that your children had thing''s thay needed even if you went without which you often did.You made alot of sacrifices for your children through the years,I''m so glad that God chose you to be my Mother.Happy Birthday in heaven.\r\n            \r\n            Love Roberta', '2006-05-19 21:40:57', 11);

-- --------------------------------------------------------

-- 
-- Table structure for table `feedback`
-- 

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `message` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `feedback`
-- 

INSERT INTO `feedback` VALUES (1, 'jonmagic@gmail.com', 'this is a test...');
INSERT INTO `feedback` VALUES (2, 'myname@yoho.com', 'just a test');
INSERT INTO `feedback` VALUES (3, 'jonmagic@gmail.com', 'Walt, I had website e-mails coming to me... I just set it up so they go to you... Also, i never heard back from you with the Checking account deposit amounts from paypal, so i can finish your paypal setup...\r\n\r\nThis is coming from the website contact form, so you know that it works :-)');
INSERT INTO `feedback` VALUES (4, 'a9332@foreverrememberme.com', 'a9332@foreverrememberme.com');
INSERT INTO `feedback` VALUES (5, 'or889@foreverrememberme.com', 'with\r\nContent-Type: multipart/alternative; \r\n              boundary=d57d61933423fa588021e439b9264968\r\nX-Mailer: Novell GroupWise 5.5.5\r\nSubject: the most common form of bacon\r\nto: ibhrt@aol.com,menezm@aol.com,vilenunsmum@aol.com,iynchwise@aol.com,\r\n    benjijo0910@aol.com,steddywil@aol.com,checkhald@aol.com,\r\n    computernerddd@aol.com,nouvellebofsas@aol.com,myndtalkminute@aol.com\r\n\r\n--d57d61933423fa588021e439b9264968\r\nContent-Transfer-Encoding: 7bit\r\nContent-Type: text/plain\r\n\r\ndepartment 64 south west rance. http www.jambon de bayonne.com he drying \r\nmethod used in modern times\r\n\r\n--d57d61933423fa588021e439b9264968\r\nContent-Transfer-Encoding: quoted-printable\r\nContent-Type: text/plain\r\n\r\nthe salt pans of the dour estuary or from those near earn. he temperature c=\r\nonditions at this time of year, 6 to 8 , are ideal for the\r\n\r\n--d57d61933423fa588021e439b9264968--\r\n.\r\n');
INSERT INTO `feedback` VALUES (6, 'remains8255@foreverrememberme.com', 'remains8255@foreverrememberme.com');
INSERT INTO `feedback` VALUES (7, 'stall3574@foreverrememberme.com', 'moniker\r\nContent-Type: multipart/alternative; \n              boundary=935d86452fe2236f41b144b7a1a80fda\nX-Mailer: Microsoft Outlook Express 5.50.4522.1200\nSubject: bacon. n individual slice of bacon is a rasher ( and\nbcc: hollyfish18@aol.com,lilmunkmunk00@aol.com,stuffit4747@aol.com,\n     bav328@aol.com,helgafeid@aol.com,bcitylove@aol.com,zicikemel@aol.com,\n     iynchjiynchj@aol.com,toobin83@aol.com\n\n--935d86452fe2236f41b144b7a1a80fda\nContent-Transfer-Encoding: 7bit\nContent-Type: text/plain\n\ncuring methods begin wet but are followed by dry aging. he majority of \ncommon wet cured ham available in . . supermarkets is of the city ham \nvariety, in which brine is injected into the meat for\n\n--935d86452fe2236f41b144b7a1a80fda\nContent-Transfer-Encoding: base64\nContent-Type: text/plain\n\nY3VyaW5nIG1ldGhvZHMgYmVnaW4gd2V0IGJ1dCBhcmUgZm9sbG93ZWQgYnkgZHJ5IGFnaW5nLiBo\nZSBtYWpvcml0eSBvZiBjb21tb24gd2V0IGN1cmVkIGhhbSBhdmFpbGFibGUgaW4gLiAuIHN1cGVy\nbWFya2V0cyBpcyBvZiB0aGUgY2l0eSBoYW0gdmFyaWV0eSwgaW4gd2hpY2ggYnJpbmUgaXMgaW5q\nZWN0ZWQgaW50byB0aGUgbWVhdCBmb3I=\n\n--935d86452fe2236f41b144b7a1a80fda--\n.\n');

-- --------------------------------------------------------

-- 
-- Table structure for table `memorials`
-- 

CREATE TABLE `memorials` (
  `id` int(11) NOT NULL auto_increment,
  `firstname` varchar(40) default NULL,
  `lastname` varchar(40) default NULL,
  `message` text,
  `hometown` varchar(80) default NULL,
  `date_of_birth` date default NULL,
  `date_of_death` date default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  `image` varchar(80) default NULL,
  `views` int(12) default NULL,
  `expires_at` datetime default NULL,
  `primary_picture_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- 
-- Dumping data for table `memorials`
-- 

INSERT INTO `memorials` VALUES (11, 'Ruth', 'Compton', '&nbsp;Thank you Mom for all your encouragement you gave me. I''ll hold my precious memories of you in my heart forever. Love Roberta ', 'Jonesville, Michigan', '1925-05-20', '2000-11-12', '2006-04-08 01:54:38', '2007-05-01 23:33:06', 16, NULL, 209, '2016-04-18 00:00:00', 28);
INSERT INTO `memorials` VALUES (13, 'Mildred   A.', 'Drake', 'Delete this text and begin typing here. ', 'Marshall, Michigan', '1921-01-21', '1980-02-14', '2006-04-22 11:31:31', '2007-04-30 21:42:27', 15, NULL, 26, '2016-05-02 00:00:00', 36);
INSERT INTO `memorials` VALUES (14, 'Tana', 'Reynolds', 'Delete this text and begin typing here. ', 'Albion, Michigan', '1913-03-12', '2001-07-01', '2006-04-22 15:42:08', '2007-04-30 21:46:29', 18, NULL, 50, '2016-05-02 00:00:00', NULL);
INSERT INTO `memorials` VALUES (15, 'Chester R.', 'Drake', '<FONT size=4>\r\n<P>Chester R Drake born in Shelby, Mi. on May 5, 1912</P>\r\n<P>&nbsp;</P>\r\n<P>Moved to Shelby, Michigan at a young age. He married Mildred A. Eversdike on July 7, 1936 in Angola, Indiana. They lived a short time at Wolf Lake in Oceana County and in Muskegon where he worked as a tool grinder in a tool &amp; die shop. </P>\r\n<P>In 1943 Mom &amp; Dad moved to Marshall, Mi. so Dad could work with his father Enoch H. Drake as a water well driller. They worked together as E. DRAKE &amp; SON Well Drilling. Later Dad started his own drilling company MARSHALL WELL SERVICE. Dad worked at it this till he became ill in the early 1980â€™s.</P>\r\n<P>Dad &amp; Mom raised five children Francis (Mrs. Leonard Smith), Ruth ( Mrs. Wendell Taylor) Bea (Mrs. Barry Goodwin), Marlene (Marlene Grimes) and Walter R Drake. He also had two brothers; Clayton and Clare and two sisters Marian and Margaret.</P>\r\n<P>Dad loved to hunt &amp; fish. We went on so many trips to Canada fishing in the spring and then back in late summer. Then in the fall we went back to Canada for the moose hunting. But we still had time in the year to go trout fishing in the spring up north to Baldwin or the Upper Peninsula around Seney. On October 20<SUP>th</SUP> was pheasant &amp; squirrel hunting, and then came deer hunting as I said Dad loved to be in the outdoors. I just donâ€™t know how he did it all. He worked on his well jobs and then he would take me hunting or fishing at the end of the day. In the early 50â€™s he got interested in flying and became a pilot.</P>\r\n<P>He bought a 1929 Waco bi-plane and restored taking me for my first ride at six years and I love to fly now. Dad sold and traded planes. His prize aircraft was a Howard 250 what a plane. </P></FONT>', 'Marshall, Michigan', '1912-05-05', '1990-10-12', '2006-04-24 18:45:14', '2007-05-07 10:35:17', 15, NULL, 3125, '2016-05-04 00:00:00', 41);
INSERT INTO `memorials` VALUES (16, 'Jack', 'Coleman', '', 'Berlin, WI', '1934-02-18', '1991-06-18', '2006-09-27 23:24:00', '2007-05-07 10:35:13', 21, NULL, 2588, '2016-10-07 00:00:00', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `pictures`
-- 

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL auto_increment,
  `image` varchar(80) default NULL,
  `memorial_id` int(11) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

-- 
-- Dumping data for table `pictures`
-- 

INSERT INTO `pictures` VALUES (6, '73243847_a8abf9c63f_o.jpg', 1, '2005-12-17 21:50:26');
INSERT INTO `pictures` VALUES (5, 'jonmagic.jpg', 2, '2005-12-17 21:49:24');
INSERT INTO `pictures` VALUES (8, '75774199_5e0f53d055_o.jpg', 4, '2005-12-21 10:54:08');
INSERT INTO `pictures` VALUES (9, 'bear.jpg', 5, '2005-12-26 19:10:32');
INSERT INTO `pictures` VALUES (10, 'SPIKE.jpg', 6, '2005-12-30 11:17:20');
INSERT INTO `pictures` VALUES (11, 'tuffy.jpg', 6, '2005-12-30 11:19:26');
INSERT INTO `pictures` VALUES (12, 'RoseBW-Web.jpg', NULL, '2006-02-12 20:02:07');
INSERT INTO `pictures` VALUES (30, '005_5.JPG', 11, '2006-04-11 20:38:44');
INSERT INTO `pictures` VALUES (27, '001_1.JPG', 11, '2006-04-11 20:34:55');
INSERT INTO `pictures` VALUES (28, '003_3.JPG', 11, '2006-04-11 20:36:29');
INSERT INTO `pictures` VALUES (29, '004_4.JPG', 11, '2006-04-11 20:38:04');
INSERT INTO `pictures` VALUES (19, 'candle1.gif', NULL, '2006-02-26 20:43:52');
INSERT INTO `pictures` VALUES (20, 'flowers1.jpg', NULL, '2006-02-26 20:44:39');
INSERT INTO `pictures` VALUES (31, '006_6.JPG', 11, '2006-04-11 20:39:54');
INSERT INTO `pictures` VALUES (32, '007_7.JPG', 11, '2006-04-11 20:41:32');
INSERT INTO `pictures` VALUES (33, '008_8.JPG', 11, '2006-04-11 20:42:29');
INSERT INTO `pictures` VALUES (34, '009_9.JPG', 11, '2006-04-11 20:43:57');
INSERT INTO `pictures` VALUES (36, 'M_D_1956.jpg', 13, '2006-04-22 11:36:03');
INSERT INTO `pictures` VALUES (37, 'Scan0001_001.jpg', 13, '2006-04-22 15:30:14');
INSERT INTO `pictures` VALUES (39, 'Scan0009_009.jpg', 15, '2006-04-24 18:54:12');
INSERT INTO `pictures` VALUES (40, 'Scan0005_005.jpg', 15, '2006-04-24 18:54:52');
INSERT INTO `pictures` VALUES (41, 'Scan0006_006.jpg', 15, '2006-04-24 18:56:11');
INSERT INTO `pictures` VALUES (42, 'Scan0010_010.jpg', 15, '2006-04-24 18:56:59');

-- --------------------------------------------------------

-- 
-- Table structure for table `schema_info`
-- 

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `schema_info`
-- 

INSERT INTO `schema_info` VALUES (13);

-- --------------------------------------------------------

-- 
-- Table structure for table `system_settings`
-- 

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `value` text,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `system_settings`
-- 

INSERT INTO `system_settings` VALUES (1, 'extension_price', '0.25', NULL);
INSERT INTO `system_settings` VALUES (2, 'paypal_email', 'orders@foreverrememberme.com', NULL);
INSERT INTO `system_settings` VALUES (4, 'faq', '<H3 class=center>Frequently Asked Questions</H3>\r\n<P><B>Q.</B> What is a web Memorial?</P>\r\n<P><B>A.</B> It is an internet website that you create to tell the story of your loved one who has passed on. </P>\r\n<UL>\r\n<LI>A place family and friends can view</LI>\r\n<LI>Photo album can be viewed of your lost loved one</LI>\r\n<LI>A visitor can light a candle</LI>\r\n<LI>A visitor can leave condolences or comments</LI></UL>\r\n<P></P>\r\n<P><B>Q.</B> How can my family or friends view the Memorial?</P>\r\n<P><B>A.</B> Each memorial has it''s own unique web address. ( example: http://www.foreverrememberme.com/johndoe/ )</P>\r\n<P><B>Q.</B> Who can create the web site?</P>\r\n<P><B>A.</B> Anyone can create a web site memorial using our easy steps. And once you have created it you have a password and total control of the web site memorial, which you can add to or edit at anytime. You are the web site manager.</P>\r\n<P><B>Q.</B> Can I get help with my website memorial?</P>\r\n<P><B>A.</B> Yes, just <A href="http://www.foreverrememberme.com/memorial/contactus">Contact Us</A> and we''ll be glad to help you.</P>\r\n<P><B>Q.</B> How much does it cost for a website Memorial?</P>\r\n<P><B>A.</B> Just $49.99 for ten years - we believe this to be very reasonable.</P>\r\n<P><B>Q.</B> How long does it take to create a website Memorial?</P>\r\n<P><B>A.</B> In ten minutes a website memorial can be made and additions can be added or edited anytime.</P>', 'StaticPage');
INSERT INTO `system_settings` VALUES (6, 'features', '   \r\n	        	<h3 class="center">Features</h3>\r\n	<p><b>Forever Remember Me</b> is a website to remember your loved one. When you create your website memorial you control it with easy to use tools, that you can add and edit at any time. Your website is password protected for you.</p>\r\n	<p>Create a memorial. Tell the story of their life the way you would like it told. Make announcements of events that you are having in the future.</p>\r\n	<p>Family and friends may visit at their convenience. Easy to find on the internet. Easy to leave comments, condolences, or light a candle.</p>\r\n	<p>Every year on the anniversary of their passing a bouquet of flowers will be sent to your website for display.</p>\r\n	<p>Put in articles of events that happened in their lives.</p>\r\n	<p>Easy to enter and display picture albums or slide shows.</p>\r\n	<p>Create a life time line.</p>\r\n	<p>Mailing list for family and friends to advise them of updates of the memorial.</p>\r\n	\r\n	    ', 'StaticPage');
INSERT INTO `system_settings` VALUES (7, 'tribute_price', '0.00', NULL);
INSERT INTO `system_settings` VALUES (8, 'allowed_number_of_photos', '20', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `tribute_images`
-- 

CREATE TABLE `tribute_images` (
  `id` int(11) NOT NULL auto_increment,
  `picture_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `tribute_images`
-- 

INSERT INTO `tribute_images` VALUES (1, 19, 'Candle', 'This is a candle demonstrating the light you shined in this world.<br>');
INSERT INTO `tribute_images` VALUES (2, 20, 'Flowers', 'A nice bunch of flowers that won''t wilt or die.<br>');

-- --------------------------------------------------------

-- 
-- Table structure for table `tributes`
-- 

CREATE TABLE `tributes` (
  `id` int(11) NOT NULL auto_increment,
  `image_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `note` text,
  `memorial_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `activated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `tributes`
-- 

INSERT INTO `tributes` VALUES (1, 2, '', '   \r\n			Delete this text and begin typing here.\r\n	    ', 10, '2006-03-07 22:49:33', NULL);
INSERT INTO `tributes` VALUES (2, 1, 'Jonathan Hoyt', '<STRONG>We</STRONG> just wanted to send <U>our love</U> to the family and wish you the best...', 9, '2006-03-09 13:32:54', NULL);
INSERT INTO `tributes` VALUES (3, NULL, NULL, NULL, 9, '2006-03-13 21:58:14', NULL);
INSERT INTO `tributes` VALUES (4, 2, 'Willy', '   \r\n			Delete this <strike>text</strike> and begin typing here. Yay!!\r\n	    ', 10, '2006-03-21 15:26:48', NULL);
INSERT INTO `tributes` VALUES (5, 2, 'willy', 'I have deleted this text!&nbsp;&nbsp; &nbsp;\r\n	    ', 10, '2006-03-21 15:34:36', '2006-03-21 15:35:18');
INSERT INTO `tributes` VALUES (6, 1, 'Xian', 'This one was<b> free!</b>\r\n	    ', 10, '2006-03-21 15:39:54', '2006-03-21 15:39:57');
INSERT INTO `tributes` VALUES (7, 2, 'Jon Hoyt', 'my name is jon&nbsp;&nbsp; &nbsp;\r\n	    ', 10, '2006-03-23 10:55:16', '2006-03-23 11:06:45');
INSERT INTO `tributes` VALUES (8, 1, 'Walt', 'Delete this text and begin typing here. ', 11, '2006-04-08 20:10:38', '2006-04-08 20:10:51');
INSERT INTO `tributes` VALUES (9, 2, 'Jon', '<i>We miss you very much.</i>\r\n	    ', 12, '2006-04-11 15:21:00', '2006-04-11 15:21:06');
INSERT INTO `tributes` VALUES (10, 1, 'Aaron Drake', 'Grandma Reynolds was known to be the pillar of her family and the community of Albion, Michigan. ', 14, '2006-04-22 15:45:07', '2006-04-22 15:45:17');
INSERT INTO `tributes` VALUES (11, 1, 'Walter Drake', 'Delete this text and begin typing here. ', 14, '2006-04-29 20:15:19', NULL);
INSERT INTO `tributes` VALUES (12, 2, 'Jean Drake', 'Mom, not a day goes by that we don''t think&nbsp;of you but especially on Mother''s Day.&nbsp;&nbsp; Happy Mother''s Day from your loving daughters, Connie, Bonnie, Jean &amp; Roberta', 11, '2006-05-14 14:05:27', '2006-05-14 14:05:37');
INSERT INTO `tributes` VALUES (13, NULL, NULL, NULL, 14, '2006-09-13 07:15:57', NULL);
INSERT INTO `tributes` VALUES (14, NULL, NULL, NULL, 16, '2006-12-30 21:46:26', NULL);
INSERT INTO `tributes` VALUES (15, 2, '', '', 15, '2007-04-18 23:00:04', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(80) default NULL,
  `password` varchar(40) default NULL,
  `firstname` varchar(30) default NULL,
  `lastname` varchar(30) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `role` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` VALUES (4, 'xian@mintchaos.com', 'ad9500fcf487f7fce643e4ad2585dfa72999afda', 'Christian', 'Metts', '2005-12-19 01:03:32', '2005-12-19 01:03:32', NULL);
INSERT INTO `users` VALUES (12, 'jobob@jobob.com', '52e6920634be2e1d947c3023d922d425ea4fd8e2', 'Jonathan', 'Hoyt', '2006-03-09 13:25:31', '2006-03-09 13:25:31', '1');
INSERT INTO `users` VALUES (8, 'jdrake@netzero.com', 'd8c7ab074095137fc729b537b0e6d3b4be438db7', 'walter', 'drake', '2005-12-26 19:06:53', '2005-12-26 19:06:53', NULL);
INSERT INTO `users` VALUES (18, 'amdrake@umich.edu', '31835c204134a0edab204dcb6b28e01184ded2b4', 'Aaron', 'Drake', '2006-04-22 15:40:46', '2006-04-22 15:40:46', '1');
INSERT INTO `users` VALUES (3, 'wdrake_1@netzero.net', '689ffdc57eaff8d9e2809e1443f45a67d360320b', 'Walter', 'Drake', '2005-12-05 16:12:22', '2005-12-05 16:12:22', 'admin');
INSERT INTO `users` VALUES (1, 'jonmagic@gmail.com', '52e6920634be2e1d947c3023d922d425ea4fd8e2', 'Jonathan', 'Hoyt', '2005-12-05 16:12:22', '2005-12-05 16:12:22', 'admin');
INSERT INTO `users` VALUES (15, 'walte-drake@sbcglobal.net', '6760b4b2ce7086abc7c6fc1d2ebbfda5ca75de05', 'Walter', 'Drake', '2005-12-05 16:12:22', '2005-12-05 16:12:22', 'admin');
INSERT INTO `users` VALUES (16, 'oscar1@maqs.net', 'c972fecfbbe1b74b9671e25c72ba1bb50003eacd', 'roberta', 'heitman', '2006-04-08 01:36:55', '2006-04-08 01:36:55', '1');
INSERT INTO `users` VALUES (17, 'test@tester.com', '6760b4b2ce7086abc7c6fc1d2ebbfda5ca75de05', 'Test', 'Tester', '2006-04-16 14:51:19', '2006-04-16 14:51:19', '1');
INSERT INTO `users` VALUES (19, 'and9836@foreverrememberme.com', '46f51407f18103b99c86cf760d3047382c3c70a8', 'with\r\nContent-Type: multipart/', 'and9836@foreverrememberme.com', '2006-09-22 06:34:48', '2006-09-22 06:34:48', 'and9836@foreverrememberme.com');
INSERT INTO `users` VALUES (20, 'a3087@foreverrememberme.com', 'c94cca8b95c721bad8eee508e3ff654806f1ae63', 'a3087@foreverrememberme.com', 'the\r\nContent-Type: multipart/a', '2006-09-22 06:34:49', '2006-09-22 06:34:49', 'a3087@foreverrememberme.com');
INSERT INTO `users` VALUES (21, 'ibmaryc@yahoo.com', 'e8e9793b9efba78f8626b3f6ef27304f605aaa27', 'Mary', 'Coleman', '2006-09-27 23:22:40', '2006-09-27 23:22:40', '1');
INSERT INTO `users` VALUES (22, 'sherry-berry@sbcglobal.net', '70028faf835a6cc220b6f8d8c894af60a2c3b312', 'sherry', 'berry', '2007-03-03 19:17:37', '2007-03-03 19:17:37', '1');

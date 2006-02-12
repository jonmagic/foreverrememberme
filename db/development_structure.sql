CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) default NULL,
  `email` varchar(40) default NULL,
  `note` text,
  `created_at` datetime default NULL,
  `memorial_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `views` int(12) default NULL,
  `expires_at` datetime default NULL,
  `primary_picture_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL auto_increment,
  `image` varchar(80) default NULL,
  `memorial_id` int(11) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `value` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(80) default NULL,
  `password` varchar(40) default NULL,
  `firstname` varchar(30) default NULL,
  `lastname` varchar(30) default NULL,
  `role` int(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO schema_info (version) VALUES (4)
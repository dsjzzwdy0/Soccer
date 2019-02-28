create table soccer_web_page(
	`id`  int(11) NOT NULL AUTO_INCREMENT,
	url varchar(100),
	encoding varchar(10),
	protocol varchar(5),
	host varchar(15),
	port varchar(5),
	method varchar(4),
	type varchar(10),
	source varchar(10),
	httpstatus integer,
	createtime timestamp,
	loadtime timestamp,
	ziptype varchar(5),
	completed tinyint(1),
	plaintext tinyint(1),
	PRIMARY KEY (`id`),
	INDEX `index_url` (`url`) USING BTREE ,
	INDEX `index_host` (`host`) USING BTREE ,
	INDEX `index_type` (`type`) USING BTREE ,
	INDEX `index_source` (`source`) USING BTREE 
);

create table soccer_scheduler_info(
	`id`  int(11) NOT NULL AUTO_INCREMENT,
	sid varchar(20),
	name varchar(30),
	maxActiveTaskThread int(11),
	`intervaltime` int(11),
	randTimeSeed int(11),
	type varchar(20),
	total int(11),
	leftsize int(11),
	state smallint,
	createtime timestamp,
	finishtime timestamp,
	PRIMARY KEY (`id`)
)

create table soccer_league(
	`id`  int(11) NOT NULL AUTO_INCREMENT,
	lid varchar(10),
	name varchar(30),
	type varchar(10),
	country varchar(30),
	continent varchar(10),
	introduction text,
	PRIMARY KEY (`id`),
	INDEX `index_lid` (`lid`) USING BTREE ,
	INDEX `index_name` (`name`) USING BTREE ,
)
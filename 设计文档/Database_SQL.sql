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
	PRIMARY KEY (`id`)
	INDEX `index_url` (`url`) USING BTREE ,
	INDEX `index_host` (`host`) USING BTREE ,
	INDEX `index_type` (`type`) USING BTREE ,
	INDEX `index_source` (`source`) USING BTREE 
)
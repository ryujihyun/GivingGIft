CREATE DATABASE givinggift DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON givinggift.* TO 'root'@'localhost' IDENTIFIED BY 'tiger';

use givinggift;

CREATE TABLE member (
	email varchar(100) not null,
	password varchar(100),
	name varchar(100),
	address varchar(100),
	phone varchar(100),
	birthdate date,
	gender varchar(20),
	type int,
	language varchar(100),
	sociology varchar(100),
	science varchar(100),
	skill varchar(100),
	art varchar(100),
	music varchar(100),
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	primary key(email)
);

create table class (
	id int not null auto_increment,
	name varchar(100),
	content varchar(500),	
	start_date date,
	end_date date,
	number int,
	latitude varchar(100),
	longtutude varchar(100),
	address varchar(100),
	teacher_id varchar(100) not null,
	interest varchar(100),
	enroll_num int(100) DEFAULT 0,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	primary key(id)
);

create table register_class (
	member_id varchar(100) not null,
	class_id varchar(100) not null,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	primary key(member_id, class_id)
);

create table post (
	id int not null auto_increment,
	name varchar(100),
	content varchar(500),
	writer varchar(100),
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	primary key(id)
);

create table post_qna (
	id int not null auto_increment,
	name varchar(100),
	content varchar(500),
	answer varchar(500),
	writer varchar(100),
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	primary key(id)
);

INSERT INTO member (email, password, name, address, phone, birthdate, gender, type) VALUES ('administer@web.com', 'password', 'administer', 'mju', '010-5551-7432', '891217', 'male', '1');
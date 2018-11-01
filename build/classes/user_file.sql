create table T_USER(
	id  number(10) primary key,
	uemail varchar2(30),
	uname varchar2(20) unique not null,
	upass varchar2(20),
	registration varchar2(20),
	uadmin varchar2(10) check(uadmin in('admin',''))
);
create table T_FILE(
	id number(10) primary key,
	filename varchar2(50),
	filepath varchar2(1000),
	filesize number(10),
	fileshare varchar2(5) check(fileshare in('y','n')),
	uploadtime varchar2(20),
	user_id constraint t_user_id_fk REFERENCES T_USER(id) ON DELETE CASCADE NOT NULL
);

select u.*,f.* 
from t_user u right outer join  t_file f
on u.id=f.id
order by f.id;

insert into T_USER values(2,'lovewlever@outlook.cn','lovewleve','woaidnengl','2018-03-12 12:45:33','admin');
insert into T_FILE values(2,'457744.png','c:/dd/dd','28','n','2018-03-12 12:45:32',1);

alter table T_USER modify (email varchar2(30));



//MySQL语句：

create table T_USER(
	id  int(10) primary key,
	uemail varchar(30),
	uname varchar(20) unique not null,
	upass varchar(20),
	registration varchar(20),
	uadmin varchar(10) check(uadmin in('admin',''))
);
create table T_FILE(
	id int(10) primary key,
	filename varchar(50),
	filepath varchar(1000),
	filesize int(10),
	fileshare varchar(5) check(fileshare in('y','n')),
	uploadtime varchar(20),
	user_id int(10),
	foreign key(user_id) references T_USER(id) ON DELETE CASCADE
);
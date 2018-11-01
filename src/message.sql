create table t_message(
	id number(10) PRIMARY KEY,
	name varchar2(20),
	dates  varchar2(20),
	msg varchar2(4000)
);

//mySql
create table T_MESSAGE(
	id int(10) PRIMARY KEY,
	name varchar(20),
	dates  varchar(20),
	msg varchar(4000)
);
//设置时区
 set global time_zone='+8:00';
 alter table T_FILE modify column id int auto_increment;
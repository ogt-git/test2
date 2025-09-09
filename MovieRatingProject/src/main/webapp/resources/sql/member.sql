USE UserDB;

create table member (
	id varchar(50) not null,
	password varchar(10) not null,
	name varchar(10) not null,
	gender varchar(4),
	birth varchar(10),
	mail varchar(30),
	phone varchar(20),
	regist_day varchar(50),
	primary key(id)
) default CHARSET=utf8;

select * from member;

drop table member;

delete * from member 

insert
into member(id, password, name, gender, birth, mail, phone)
values ('dlehgns02', '1234', '이도훈', '남', '2002/04/01', 'dlehgns02@naver.com', '010-5712-8353');

insert
into member(id, password, name, gender, birth, mail, phone)
values ('rudxor4', 'rudxor98', '오경택', '남', '2002/05/13', 'rudxor0513@naver.com', '010-2238-6496');


insert
into member(id, password, name, gender, birth, mail, phone)
values ('test', '1234', '테스터', '남', '2002/01/01', '-', '010');

insert
into member(id, password, name, gender, birth, mail, phone)
values ('test2', 'qwer', '테스터2', '여', '2002/01/01', '-', '010');


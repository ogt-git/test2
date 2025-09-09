create table if not exists movie (
	movie_id int not null,
    title varchar(100) not null,
    release_year int not null,
    director varchar(100),
    actor varchar(100),
    genre varchar(50),
    story text,
    poster varchar(100),    
    average_rating double default 0.0,
    category varchar(30),
    primary key (movie_id)
) default charset=utf8;

create table if not exists rating(
	rating_id int not null AUTO_INCREMENT,
	movie_id int not null,
	user_id varchar(50),
	user_rating int,
	review text, 
	primary key (rating_id),
	foreign key (movie_id) references movie(movie_id) on delete cascade,
	foreign key (user_id) references member(id)
);

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
);



select * from movie

select * from rating

select * from member

delete from rating

UPDATE movie SET average_rating = 0.0

drop table rating, movie, member





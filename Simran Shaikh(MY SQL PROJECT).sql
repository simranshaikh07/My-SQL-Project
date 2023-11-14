show databases;
create database Actors_data;
show databases;
use  Actors_data;
create table actor(act_id int primary key,
act_fname char(20),act_lname char(20),
act_gender char(1));
desc actor;
insert into actor values(1,'Sharukh','Khan','M'),(2,'Varun','Dhavan','M'),
(3,'Tamanna','Bhatia','F'),(4,'Karishma','Kapoor','F'),
(5,'siddharth','Malhotra','M'),(6,'Katrina','Kaif','F');
select * from actor;
create table movie_cast(act_id int,mov_id int,role char(30));
insert into movie_cast values(1,100,'Hero'),(2,200,'Friend'),
(3,300,'Heroine'),(4,400,'Sister'),(5,500,'Villain'),(6,600,'Mother');
select * from movie_cast;
use  Actors_data;
alter table movie_cast add constraint actors foreign key (act_id) references actor(act_id);
select * from movie_cast;
desc movie_cast;
select act_id ,act_fname from actor where act_gender='M';
select * from movie_cast right outer join actor on movie_cast.act_id=actor.act_fname; 
select * from actor natural join movie_cast;
create table movie(mov_id int primary key,mov_title char(50),
mov_year int,mov_time int,mov_lang char(50),
mov_dt_rel date,mov_rel_country char(5));
desc movie;
insert into movie values(100,'Hero no 1',2001,1,'Hindi','2001-01-02','India'),
						(200,'Ek villain',2002,2,'Tamil','2002-02-05','Iran'),
                        (300,'Shiddat',2003,3,'English','2003-03-08','Spain'),
                        (400,'Khiladi',2004,4,'Marathi','2004-04-09','Fiji'),
                        (500,'Swarg',2005,5,'Gujrati','2005-05-11','Oman'),
                        (600,'Rishtey',2006,6,'Punjabi','2006-06-12','Cuba');
select * from movie;
alter table movie_cast add constraint movies foreign key (mov_id) references movie (mov_id);
desc movie_cast;
select mov_title , mov_dt_rel from movie where mov_lang='hindi';
select mov_id from movie where mov_rel_country='oman';
select * from movie where mov_year=2005;
select mov_time from movie where mov_lang='tamil' and mov_year=2002;
select distinct mov_rel_country from movie;
create table movie_direction(dir_id int,mov_id int);
insert into movie_direction values(20,100),(40,200),(60,300),(80,400),(100,500),(120,600);
select * from movie_direction;
create table director(dir_id int primary key,dir_fname char(20),dir_lname char(20));
insert into director values (20,'Rohit','Shetty'),(40,'Sajid','Khan'),
							(60,'Salman','Shaikh'),(80,'Amit','Dutta'),
							(100,'Ajita','Veera'),(120,'Sanjay','Leela');
select * from director;
select concat(dir_fname,'  ',dir_lname) from director;
alter table movie_direction add constraint dir_f foreign key (dir_id) references director (dir_id);
alter table movie_direction add constraint movie_f foreign key (mov_id) references movie (mov_id);
create view dir as select dir_id,dir_fname from director;
select * from dir;
update dir  set dir_fname='romit'where dir_id=20;
select * from dir;
use  Actors_data;
drop table movie_genres;
drop table genres;
create  table genres (gen_id int primary key,gen_title char(20));
insert into genres values(1001,'Fictional'),(1002,'Non Fictional'),(1003,'Poetry'),
						 (1004,'Literature'),(1005,'Story'),(1006,'Music');
select * from genres;
select gen_id from genres where gen_title='fictional';
select * from genres where gen_title ='story';
create table movie_genres(mov_id int,gen_id int ,
 foreign key (mov_id) references movie(mov_id),foreign key(gen_id) references genres(gen_id));
 insert into movie_genres values(100,1001),(200,1002),(300,1003),
                                (400,1004),(500,1005),(600,1006);
select * from movie_genres;
desc movie_genres;
create table reviewer(rev_id int primary key,rev_name char(30));
insert into reviewer values(3,'Harry'),(6,'Jerry'),(9,'Tom'),
                            (12,'Bob'),(15,'Marry'),(18,'Jack');
select * from reviewer;
drop table rating;
create table rating(mov_id int,rev_id int,rev_stars int,
num_o_rat int,foreign key (mov_id) references movie(mov_id),
foreign key (rev_id) references reviewer(rev_id));
insert into rating values(100,3,4,4.1),(200,6,3,3.2),(300,9,2,2.3),
						(400,12,4,1.4),(500,15,1,4.5),(600,18,5,4.6);
select * from rating;
desc rating;
select rev_stars from rating where rev_stars>3;
select rev_stars,rev_id from rating where rev_stars>3;
select num_o_rat from rating where num_o_rat between 2 and 3;


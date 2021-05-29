create database test;

use test;

create table usercred (userid int auto_increment NOT NULL,username varchar(20),password varchar(20),mailid varchar(25),mobileno varchar(15),primary key (userid));

Insert into usercred (username,password,mailid,mobileno)  values ('Dinesh','12345678','dinesh@gmail.com','456734567');

create table nbcred (userid int,nbname varchar(20),nbid int auto_increment Not Null,primary key(nbid),foreign key(userid) references usercred(userid));

create table notecred (nbid int,notename varchar(25) NOT NULL,startdate varchar(15),enddate varchar(15),
remainderdate varchar(15),tag varchar(15),description varchar(200),status varchar(15),foreign key(nbid) references nbcred(nbid));

create database car_insurance_1bm23cs100;
use car_insurance_1bm23cs100;
create table PERSON (driver_id varchar(20)
 ,name varchar(30),
 address varchar(50),
 primary key(driver_id));
 create table CAR (
 reg_num varchar(10),
 model varchar(10),
 year int,
 primary key(reg_num)
 
 );
 create table OWNS(
 driver_id varchar(10),
 reg_num varchar(10),
 primary key(driver_id,reg_num),
 foreign key(driver_id) references PERSON(driver_id),
 foreign key(reg_num) references CAR(reg_num)
 );
desc OWNS;
create table ACCIDENT(report_num int,
 accident_date date, 
 location varchar(20),
 primary key(report_num));
 
create table PARTICIPATED(
driver_id varchar(10),
reg_num varchar(10),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references PERSON(driver_id),
foreign key(reg_num) references CAR(reg_num),
foreign key(report_num) references ACCIDENT(report_num)
);
insert into person values("A01","Richard", "Srinivas nagar");
insert into person values("A02","Pradeep", "Rajaji nagar");
insert into person values("A03","Smith", "Ashok nagar");
insert into person values("A04","Venu", "N R Colony");
insert into person values("A05","John", "Hanumanth nagar");


insert into car values("KA052250","Indica", "1990");
insert into car values("KA031181","Lancer", "1957");
insert into car values("KA095477","Toyota", "1998");
insert into car values("KA053408","Honda", "2008");
insert into car values("KA041702","Audi", "2005");

insert into owns values("A01","KA052250");
insert into owns values("A02","KA031181");
insert into owns values("A03","KA095477");
insert into owns values("A04","KA053408");
insert into owns values("A05","KA041702");

insert into accident values(11,'2003-01-01',"Mysore Road");
insert into accident values(12,'2004-02-02',"South end Circle");
insert into accident values(13,'2003-01-21',"Bull temple Road");
insert into accident values(14,'2008-02-17',"Mysore Road");
insert into accident values(15,'2004-03-05',"Kanakpura Road");


insert into participated values("A01","KA052250",11,10000);
insert into participated values("A02","KA053408",12,50000);
insert into participated values("A03","KA095477",13,25000);
insert into participated values("A04","KA031181",14,3000);
insert into participated values("A05","KA041702",15,5000);
select * from PERSON;
select * from CAR;
select * from ACCIDENT;
select * from participated;
select * from OWNS;
UPDATE PARTICIPATED SET damage_amount=25000
WHERE reg_num='KA053408' AND report_num=12;
select * from participated;
select count(*)  from accident where accident_date like '2008%';
insert into accident values(16,'2008-03-08',"Domlur");
select * from accident;
select driver_id from participated where damage_amount>=25000;
select * from participated order by damage_amount desc;























 








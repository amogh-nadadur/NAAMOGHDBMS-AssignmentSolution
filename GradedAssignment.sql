create database gradedAssignmentDBMS;
use gradedAssignmentDBMS;
create table passenger(PID int primary key, BID int, Passenger_name varchar(20),  Category varchar(20), Gender varchar(20), Boarding_City varchar(20), 
Destination_City varchar(20), Distance int, Bus_Type varchar(20),foreign key(BID) references price(BID));
create table price(BID int primary key, Bus_Type varchar(20), Distance int, Price int);
insert into passenger values(1,1,"Sejal","AC","F","Bengaluru","Chennai",350 ,"sleeper");
insert into passenger values(2,11,"Anmol","Non-AC","M","Mumbai","Hyderabad",700 ,"sitting");
insert into passenger values(3,3,"Pallavi","AC","F","Panaji","Bengaluru",600 ,"sleeper");
insert into passenger values(4,7,"Khusboo","AC","F","Chennai","Mumbai", 1500,"sleeper");
insert into passenger values(5,5,"Udit","Non-AC","M","Trivandrum","Panaji",1000 ,"sleeper");
insert into passenger values(6,9,"Ankur","AC","M","Nagpur","Hyderabad", 500,"sitting");
insert into passenger values(7,4,"Hemant","Non-AC","M","Panaji","Mumbai", 700,"sleeper");
insert into passenger values(8,9,"Manish","Non-AC","M","Hyderabad","Bengaluru",500 ,"sitting");
insert into passenger values(9,11,"Piyush","AC","M","Pune","Nagpur", 700,"sitting");

insert into price values(1,"sleeper",350,770);
insert into price values(2,"sleeper",500,1100);
insert into price values(3,"sleeper",600,1320);
insert into price values(4,"sleeper",700,1540);
insert into price values(5,"sleeper",1000,2200);
insert into price values(6,"sleeper",1200,2640);
insert into price values(7,"sleeper",1500,3000);
insert into price values(8,"sitting",350,434);
insert into price values(9,"sitting",500,620);
insert into price values(10,"sitting",600,744);
insert into price values(11,"sitting",700,868);
insert into price values(12,"sitting",1000,1240);
insert into price values(13,"sitting",1200,1488);
insert into price values(14,"sitting",1500,1860);

/*3rd query*/
select count(Gender),gender from Passenger where distance>=600 and gender="M"
union
select count(Gender),gender from Passenger where distance>=600 and gender="F";
/*4th query*/
select min(price) from price where Bus_type = "sleeper";
/*5th query*/
select Passenger_name from passenger where passenger_name like "S%";
/*6th query*/
select Passenger_name, Boarding_City, Destination_City,price from passenger LEFT OUTER JOIN price on price.bid = passenger.bid;
/*7th query*/
select passenger_name, price from passenger LEFT OUTER JOIN price on price.bid = passenger.bid where passenger.distance >=1000 and passenger.bus_type = "sitting";
/*8th query*/
select bus_type, price from price where price.distance = 600;
/*9th query*/
select distinct(distance) from passenger order by distance desc;
/*10th query Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables  */
select passenger_name, (distance/sum(distance))*100 as percentage from passenger;
select sum(distance) as total from passenger;
/*11th query*/
/*12th query*/
 
 DELIMITER &&  
CREATE PROCEDURE get_categories ()  
BEGIN  
select price, distance, IF(price>1000,"yes",  "NO") as Expensive, 
IF((price>500 and price<1000),"yes",  "NO") as Average_cost, IF(price<500,"yes",  "NO") as Cheap from price;
END && DELIMITER ;

CALL get_categories ();
drop procedure get_categories;
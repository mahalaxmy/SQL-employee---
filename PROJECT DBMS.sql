create database retailsystem;
use retailsystem;

create table department(
departmentid int,
Name varchar(30),
address varchar(30),
primary key(departmentid));

create table worker(
Workerid int,
firstname varchar(25),
lastname varchar(25),
Address varchar(50),
primary key(Workerid),
departid int
references department (departmentid));

create table buyorder(
orderid int,
deliverydate date,
orderdate date,
primary key(orderid),
wid int
references worker(Workerid)
);

create table Project(
Project_ID INT UNIQUE,
Name varchar(30),
PRIMARY KEY(Project_ID)
);


create table supplier(
supplier_id int,
name varchar(50),
primary key(supplier_id)
);

create table product
(
part_no int,
color varchar(25),
amount decimal(18,9),
primary key(part_no),
order_id int REFERENCES Buyorder(order_id)
);

insert into department values(001,"merchandise","ablock");
insert into department values(002,"marketing","rblock");
insert into department values(003,"finance","kblock");
insert into department values(004,"sales","dblock");
insert into department values(005,"logistics","dblock");
insert into department values(006,"media","ublock");
insert into department values(007,"transportation","lblock");
insert into department values(008,"hr","hblock");
insert into department values(009,"personal","yblock");
insert into department values(010,"security","fblock");

select*from PRODUCT;


insert into worker values(041,"John","wiliams","12 luke street paris france",001);
insert into worker values(042,"Lily","James","3 davidson street london uk",003);
insert into worker values(044,"Diya","Dinesh","34 bakers street luxemborg france",002);
insert into worker values(045,"Varsha","Nachiyar","45 blackwhite street chennai india",010);
insert into worker values(046,"Laavanya","Ravisankar","1299 greens road california USA",009);
insert into worker values(047,"Harris","edison","32 usman road texas USA",006);
insert into worker values(048,"Prasath","Richard","45 fralwey street barcelona",005);
insert into worker values(049,"Maya","arjun","23 juhi street tokyo japan",008);
insert into worker values(050,"Sasha","Reddy","322 luxe road bejing china",007);

INSERT INTO buyorder
values(1101,"2022-09-22","2022-10-25",041);
INSERT INTO buyorder
values(1102,"2022-05-12","2022-06-15",042);
INSERT INTO buyorder
values(1103,"2022-03-20","2022-12-24",043);
INSERT INTO buyorder
values(1104,"2022-07-22","2022-10-25",044);
INSERT INTO buyorder
values(1105,"2022-08-01","2022-09-01",045);
INSERT INTO buyorder
values(1106,"2022-10-30","2022-11-25",046);
INSERT INTO buyorder
values(1107,"2022-02-22","2022-03-04",047);
INSERT INTO buyorder
values(1108,"2022-06-18","2022-11-25",041);
INSERT INTO buyorder
values(1109,"2022-11-22","2022-11-25",049);
INSERT INTO buyorder
values(1110,"2022-01-13","2022-03-23",050);


insert into supplier values(001,'shakthi');
insert into supplier values(002,'vikram');
insert into supplier values(003,'gopal');
insert into supplier values(004,'gowtham');
insert into supplier values(005,'aswin');
insert into supplier values(006,'sathish');
insert into supplier values(007,'aditya');
insert into supplier values(008,'hari');
insert into supplier values(009,'manoj');
insert into supplier values(010,'dinesh');

insert into product values('01','red','1230.43','342');
insert into product values('02','green','6534.75','234');
insert into product values('03','yellow','8764.45','237');
insert into product values('04','blue','2435.54','152');
insert into product values('05','orange','3364.87','454');
insert into product values('06','red','1230.43','737');
insert into product values('07','green','6534.75','534');
insert into product values('08','black','8764.45','968');
insert into product values('09','grey','2435.54','327');
insert into product values('10','orange','3364.87','243');



INSERT INTO Project Values(2501,"Detection of lung cancer");
INSERT INTO Project Values(2502,"Breast cancer");
INSERT INTO Project Values(2503,"Retail management system");
INSERT INTO Project Values(2504,"Alcohol consumption");
INSERT INTO Project Values(2505,"Rain water harvesting");
INSERT INTO Project Values(2506,"Crop production");
INSERT INTO Project Values(2507,"Smoking rectifier");
INSERT INTO Project Values(2508,"Chits and funds");
INSERT INTO Project Values(2509,"Banking");
INSERT INTO Project Values(2510,"Sports");

select*from project;
create table participation(
worid int references  worker(workerid),
proid int references project(projectid));
create table delivery(
ordid int references buyorder(orderid),
supid int references supplier(supplier_id));



insert into participation values(041,2501);
insert into participation values(045,2505);
insert into participation values(048,2510);
insert into participation values(043,2507);
insert into participation values(050,2503);
insert into participation values(046,2509);
insert into participation values(047,2510);
insert into participation values(042,2502);
insert into participation values(045,2501);
insert into participation values(041,2505);
select *from participation;
insert into delivery values(1101,010);
insert into delivery values(1103,002);
insert into delivery values(1105,009);
insert into delivery values(1102,001);
insert into delivery values(1106,002);
insert into delivery values(1108,008);
insert into delivery values(1104,009);
insert into delivery values(1107,004);
insert into delivery values(1109,005);

select*from delivery;

Create view viewable as select name,address from department;
select*from viewable;

CREATE VIEW detailsvieww AS
SELECT w.firstname,w.lastname,d.departmentid,d.name
FROM worker as w , department as d 
WHERE workerid>4;
select*from detailsvieww;

create view details as select w.workerid,w.departid,d.name from worker as w , department as d where
d.departmentid=w.departid;
select*from details;



DELIMITER //
CREATE PROCEDURE GetDEPdetails () 
BEGIN
SELECT Workerid,w.firstname,w.lastname,w.departid FROM 
worker w
INNER JOIN department d ON d.departmentid=w.departid;
END //
DELIMITER ;
CALL GetDEPDetails;



CREATE TRIGGER my_trigger
BEFORE INSERT
ON worker
FOR EACH ROW
begin
INSERT INTO worker VALUES (new.firstname)
end $$
delimiter ;
insert into worker values(041,"Jane","wiliams","12 luke street paris france",001);
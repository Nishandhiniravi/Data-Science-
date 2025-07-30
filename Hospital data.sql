create database Hospital;
use Hospital;
create table patient(
patient_id int(10),Name varchar(25),gender char(4),dob date,city varchar(25),
province_id char(4),allergies varchar(25),height decimal(5,2),weight decimal(5,2));
insert into patient values(10,'Shiva','M','2015-09-01','Pune','A501','Asthma',103.5,18.5);
insert into patient values(20,'Anjali','F','1997-09-10','Mumbai','A502','Food allergies',165.5,55.5);
insert into patient values(30,'John','M','1991-10-01','Mumbai','A503','Eye allergies',175.5,58.5);
insert into patient values(40,'Harshit','M','2000-11-12','Aurangabad','A504','Insect sting allergy',157.5,75.5);
insert into patient values(50,'Preeti','F','2003-05-01','Delhi','A505','Eye allergies',170.5,65.5);
insert into patient values(60,'Vaidik','M','2007-02-25','Delhi','A506','Food allergies',170.5,69.5);
insert into patient values(70,'Vishal','M','2015-05-23','Noida','A507','Pollen',160.5,69.5);
insert into patient values(80,'Sneha','F','1993-12-01','Noida','A508','Pollen',160.5,75.5);

select * from patient;


create table doctors(doctor_id int(10),name varchar(25),specialty varchar(25));
insert into doctors values(2001,'Harish','Cardiologists');
insert into doctors values(2002,'Anjali','Infectious disease');
insert into doctors values(2003,'Varsha','Allergist');
insert into doctors values(2004,'Nitin','Geriatrics');
insert into doctors values(2005,'Deepak','Neurology');
insert into doctors values(2006,'Ajay','Radiology');

select * from doctors;

create table admission(patient_id int(10),admission_date date,discharge_date date,diagnosis varchar(25),attending_doctor_id int);
insert into admission values(10,'2024-02-01','2024-02-03','Eye allergy',2002);
insert into admission values(30,'2024-02-10','2024-02-03','Urinary infection',2003);
insert into admission values(40,'2024-02-12','2024-02-13','Eye allergy',2005);
insert into admission values(50,'2024-02-12','2024-02-12','cance of stomach',2004);
insert into admission values(70,'2024-02-10','2024-02-11','Hypertension',2004);

select * from admission;

create table province_name(province_id char(4),province_name varchar(25));
insert into province_name values('AS01','Pune');
insert into province_name values('AS03','Noida');
insert into province_name values('AS04','Pune');
insert into province_name values('AS06','Mumbai');

select * from province_name;

# find name,  gender(F)
select name, gender from patient where gender='F';

# find weight range 45 to 60
select name, weight from patient where weight between 45 and 60;

# name start with latter P
select name from patient where name like 'P%';

# show name and city concatenate in one column
select concat(name,' ',city) as details from patient;

#how many patients have a birthdate with 2015 as the birth year
select count(*) as total_patients
from patient
where YEAR(dob)=2015;

# find name, height of the patient with the greatest height
select name, height  from patient
order by height desc
limit 5;

# fetch all details patient_id 20,40,50
select * from patient where patient_id in(20,40,50);

# total admission
select count(*) as total_admissions from admission;

# where the patient was admitted and discharged in same day
select * from admission
where admission_date like discharge_date;

# find patient_id & total admissions for patient_id 50
select patient_id,count(*) as total_admissions from admission
where patient_id=50; 

# show unique cities in province_id='AS03'
select distinct(city) as unique_city, name 
from patient
where province_id='A503';

# find name,dob of patient height > 165 & weight > 50
select name, dob from patient
where height>165 and weight>50;

# find patient name & allergies are not null & from the city 'Pune'
select name, allergies from patient where allergies is not null and city='Pune';









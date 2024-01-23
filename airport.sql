

create table passenger(
	id int primary key identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(150) not null check(email like '%@%'),
	password varchar(255) not null,
	phone_num varchar(15) not null,
	pin varchar(11) not null check(pin like '%/%')
);

create table pilot(
	id int primary key identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	age int not null check(age > 28),
	email varchar(150) not null check(email like '%@%'),
	phone_num varchar(15) not null
);

create table plane(
	id int primary key identity(1,1),
	name varchar(100) not null,
	type varchar(100) not null check(type in ('private', 'public')), 
	capacity int not null check(capacity > 0),
	range int not null check(range > 0)
);


create table destination(
	id int primary key identity(1,1),
	country varchar(50) not null,
	capital varchar(50) not null,
	language varchar(50) not null,
);


create table flight(
	id int primary key identity(1,1),
	fly_number int not null check(fly_number > 0),
	destination_id int foreign key references destination(id),
	plane_id int foreign key references plane(id),
	pilot_id int foreign key references pilot(id),
	date_leaving date not null,
	date_arriving date not null,
	price int not null check(price > 0),
);


create table reservation(
	id int primary key identity(1,1),
	pin int not null check(pin > 0),
	passenger_id int foreign key references passenger(id),
	flight_id int foreign key references flight(id),
	date date not null,
	price int not null check(price > 0)
);



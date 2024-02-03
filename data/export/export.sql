USE [bernard]
GO
/****** Object:  Table [dbo].[passenger]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passenger](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone_num] [varchar](15) NOT NULL,
	[pin] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[print_all_passengers]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[print_all_passengers]
as
select passenger.first_name, passenger.last_name, passenger.email, passenger.phone_num, passenger.pin
from passenger
GO
/****** Object:  Table [dbo].[pilot]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pilot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[email] [varchar](150) NOT NULL,
	[phone_num] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[print_all_pilots]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[print_all_pilots]
as
select pilot.first_name, pilot.last_name, pilot.age, pilot.email, pilot.phone_num
from pilot
GO
/****** Object:  Table [dbo].[plane]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plane](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[type] [varchar](100) NOT NULL,
	[capacity] [int] NOT NULL,
	[range] [int] NOT NULL,
	[active] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[print_all_planes]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[print_all_planes]
as
select plane.name, plane.type, plane.capacity, plane.range, plane.active
from plane;
GO
/****** Object:  Table [dbo].[destination]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[destination](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[capital] [varchar](50) NOT NULL,
	[language] [varchar](50) NOT NULL,
	[avg_temp] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[print_all_destinations]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[print_all_destinations]
as
select destination.country, destination.capital, destination.language, destination.avg_temp
from destination;
GO
/****** Object:  Table [dbo].[flight]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fly_number] [int] NOT NULL,
	[destination_id] [int] NULL,
	[plane_id] [int] NULL,
	[pilot_id] [int] NULL,
	[date_leaving] [date] NOT NULL,
	[date_arriving] [date] NOT NULL,
	[price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[print_all_flights]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[print_all_flights]
as
select flight.fly_number, destination.country, plane.name, pilot.last_name, flight.date_leaving, flight.date_arriving, flight.price
from flight join destination on flight.destination_id = destination.id join plane on flight.plane_id = plane.id join pilot on flight.pilot_id = pilot.id;
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pin] [int] NOT NULL,
	[passenger_id] [int] NULL,
	[flight_id] [int] NULL,
	[date] [datetime] NOT NULL,
	[price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[print_all_reservations]    Script Date: 03.02.2024 15:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[print_all_reservations]
as
select reservation.pin as pin, flight.fly_number as fly_number, passenger.last_name as last_name, destination.country as country, plane.name as plane, pilot.last_name as pilot, flight.date_leaving, flight.date_arriving, reservation.price as price
from reservation inner join passenger ON reservation.passenger_id = passenger.id inner join flight ON reservation.flight_id = flight.id inner join destination ON flight.destination_id = destination.id inner join plane ON flight.plane_id = plane.id inner join pilot ON flight.pilot_id = pilot.id;
GO
SET IDENTITY_INSERT [dbo].[destination] ON 
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (1, N'Spain', N'Madrid', N'Spanish', 24.5)
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (2, N'Greece', N'Athens', N'Greek', 23.4)
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (3, N'Slovakia', N'Bratislava', N'Slovakian', 14.8)
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (4, N'Germany', N'Berlin', N'German', 16.1)
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (5, N'Italy', N'Rome', N'Italian', 21.7)
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (6, N'Great Britain', N'London', N'English', 12.6)
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (7, N'Ireland', N'Reykjavik', N'English', 15.2)
GO
INSERT [dbo].[destination] ([id], [country], [capital], [language], [avg_temp]) VALUES (8, N'Norway', N'Oslo', N'Norse', 10.7)
GO
SET IDENTITY_INSERT [dbo].[destination] OFF
GO
SET IDENTITY_INSERT [dbo].[flight] ON 
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (1, 101, 1, 1, 1, CAST(N'2024-02-15' AS Date), CAST(N'2024-02-29' AS Date), 25000)
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (2, 102, 3, 2, 2, CAST(N'2024-02-28' AS Date), CAST(N'2024-03-11' AS Date), 15000)
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (3, 103, 2, 3, 3, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-11' AS Date), 14800)
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (4, 104, 7, 6, 8, CAST(N'2024-03-12' AS Date), CAST(N'2024-03-29' AS Date), 19990)
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (5, 105, 6, 7, 5, CAST(N'2024-03-27' AS Date), CAST(N'2024-04-07' AS Date), 16800)
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (6, 106, 5, 1, 4, CAST(N'2024-04-01' AS Date), CAST(N'2024-04-13' AS Date), 7500)
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (7, 107, 4, 3, 6, CAST(N'2024-04-05' AS Date), CAST(N'2024-04-27' AS Date), 12700)
GO
INSERT [dbo].[flight] ([id], [fly_number], [destination_id], [plane_id], [pilot_id], [date_leaving], [date_arriving], [price]) VALUES (8, 108, 8, 2, 5, CAST(N'2024-05-02' AS Date), CAST(N'2024-05-30' AS Date), 22500)
GO
SET IDENTITY_INSERT [dbo].[flight] OFF
GO
SET IDENTITY_INSERT [dbo].[passenger] ON 
GO
INSERT [dbo].[passenger] ([id], [first_name], [last_name], [email], [password], [phone_num], [pin]) VALUES (1, N'Admin', N'Admin', N'admin@gmail.com', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'111111111', N'111111/1111')
GO
SET IDENTITY_INSERT [dbo].[passenger] OFF
GO
SET IDENTITY_INSERT [dbo].[pilot] ON 
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (1, N'Karel', N'Novak', 35, N'karel.novak@gmail.com', N'608125235')
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (2, N'Jakub', N'Zeleny', 30, N'jakub.zeleny@gmail.com', N'609500200')
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (3, N'Eva', N'Prochazkova', 31, N'eva.prochazkova@gmail.com', N'605789123')
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (4, N'Martin', N'Svoboda', 40, N'martin.svoboda@gmail.com', N'602345678')
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (5, N'Tereza', N'Kovarova', 29, N'terezak@email.com', N'604987654')
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (6, N'Petr', N'Jiracek', 32, N'petr.jiracek@email.com', N'603112233')
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (7, N'Veronika', N'Horakova', 37, N'veronika.horakova@email.com', N'601998877')
GO
INSERT [dbo].[pilot] ([id], [first_name], [last_name], [age], [email], [phone_num]) VALUES (8, N'David', N'Kolar', 45, N'david.kolar@email.com', N'606665544')
GO
SET IDENTITY_INSERT [dbo].[pilot] OFF
GO
SET IDENTITY_INSERT [dbo].[plane] ON 
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (1, N'Airbus A320', N'public', 500, 20000, N'1')
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (2, N'Boeing 707', N'public', 400, 16000, N'1')
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (3, N'Boeing 777', N'public', 650, 13500, N'1')
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (4, N'Antonov An-38', N'public', 245, 7500, N'0')
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (5, N'Airbus A747', N'public', 570, 11500, N'0')
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (6, N'Gulfstream G200', N'private', 50, 22500, N'1')
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (7, N'Boeing 444', N'public', 120, 9999, N'1')
GO
INSERT [dbo].[plane] ([id], [name], [type], [capacity], [range], [active]) VALUES (8, N'Airbus 111', N'public', 230, 3250, N'0')
GO
SET IDENTITY_INSERT [dbo].[plane] OFF
GO
/****** Object:  Index [UQ__flight__A36F3C3C164C5755]    Script Date: 03.02.2024 15:10:29 ******/
ALTER TABLE [dbo].[flight] ADD UNIQUE NONCLUSTERED 
(
	[fly_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__passenge__DD37D92D4B2C9C71]    Script Date: 03.02.2024 15:10:29 ******/
ALTER TABLE [dbo].[passenger] ADD UNIQUE NONCLUSTERED 
(
	[pin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__reservat__DD37D92D278A9F4C]    Script Date: 03.02.2024 15:10:29 ******/
ALTER TABLE [dbo].[reservation] ADD UNIQUE NONCLUSTERED 
(
	[pin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD FOREIGN KEY([destination_id])
REFERENCES [dbo].[destination] ([id])
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD FOREIGN KEY([pilot_id])
REFERENCES [dbo].[pilot] ([id])
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD FOREIGN KEY([plane_id])
REFERENCES [dbo].[plane] ([id])
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight] ([id])
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD FOREIGN KEY([passenger_id])
REFERENCES [dbo].[passenger] ([id])
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD CHECK  (([fly_number]>(0)))
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[passenger]  WITH CHECK ADD CHECK  (([email] like '%@%'))
GO
ALTER TABLE [dbo].[passenger]  WITH CHECK ADD CHECK  (([pin] like '%/%'))
GO
ALTER TABLE [dbo].[pilot]  WITH CHECK ADD CHECK  (([age]>(28)))
GO
ALTER TABLE [dbo].[pilot]  WITH CHECK ADD CHECK  (([email] like '%@%'))
GO
ALTER TABLE [dbo].[plane]  WITH CHECK ADD CHECK  (([capacity]>(0)))
GO
ALTER TABLE [dbo].[plane]  WITH CHECK ADD CHECK  (([range]>(0)))
GO
ALTER TABLE [dbo].[plane]  WITH CHECK ADD CHECK  (([type]='public' OR [type]='private'))
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD CHECK  (([pin]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[print_user_flights]    Script Date: 03.02.2024 15:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[print_user_flights] @pin varchar(11)
as
begin
select reservation.pin as pin, flight.fly_number as fly_number, destination.country as country, destination.capital as capital_city, plane.name as plane, pilot.last_name as pilot, flight.date_leaving, flight.date_arriving, reservation.price as price
from reservation inner join passenger ON reservation.passenger_id = passenger.id inner join flight ON reservation.flight_id = flight.id inner join destination ON flight.destination_id = destination.id inner join plane ON flight.plane_id = plane.id inner join pilot ON flight.pilot_id = pilot.id
where passenger.pin = @pin;
end
GO

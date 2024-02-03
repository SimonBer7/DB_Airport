USE [bernard]
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

USE [master]
GO
/****** Object:  Database [РасчетСтоимости]    Script Date: 31.10.2024 22:48:01 ******/
CREATE DATABASE [РасчетСтоимости]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'РасчетСтоимости', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\РасчетСтоимости.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'РасчетСтоимости_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\РасчетСтоимости_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [РасчетСтоимости] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [РасчетСтоимости].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [РасчетСтоимости] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET ARITHABORT OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [РасчетСтоимости] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [РасчетСтоимости] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET  DISABLE_BROKER 
GO
ALTER DATABASE [РасчетСтоимости] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [РасчетСтоимости] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET RECOVERY FULL 
GO
ALTER DATABASE [РасчетСтоимости] SET  MULTI_USER 
GO
ALTER DATABASE [РасчетСтоимости] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [РасчетСтоимости] SET DB_CHAINING OFF 
GO
ALTER DATABASE [РасчетСтоимости] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [РасчетСтоимости] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [РасчетСтоимости] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [РасчетСтоимости] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'РасчетСтоимости', N'ON'
GO
ALTER DATABASE [РасчетСтоимости] SET QUERY_STORE = ON
GO
ALTER DATABASE [РасчетСтоимости] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [РасчетСтоимости]
GO
/****** Object:  Table [dbo].[ВидыКузовов]    Script Date: 31.10.2024 22:48:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ВидыКузовов](
	[ID_ВидКузова] [int] IDENTITY(1,1) NOT NULL,
	[Название] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ВидКузова] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ДополнительныеУслуги]    Script Date: 31.10.2024 22:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ДополнительныеУслуги](
	[ID_ДополнительныеУслуги] [int] IDENTITY(1,1) NOT NULL,
	[Название] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ДополнительныеУслуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 31.10.2024 22:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Откуда] [varchar](255) NULL,
	[Куда] [varchar](255) NULL,
	[ID_ВидКузова] [int] NULL,
	[Масса] [int] NULL,
	[ID_ХарактерГруза] [int] NULL,
	[ОбъявленнаяСтоимость] [decimal](10, 2) NULL,
	[ID_ДополнительныеУслуги] [int] NULL,
	[КоличествоПломб] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тариф]    Script Date: 31.10.2024 22:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тариф](
	[ID_Тарифа] [int] NOT NULL,
	[Грузоподъемность] [varchar](20) NULL,
	[Тип_кузова] [varchar](100) NULL,
	[Марка_авто] [varchar](100) NULL,
	[Размеры_кузова] [varchar](20) NULL,
	[Объем_м3] [int] NULL,
	[Стоимость_до_500_км] [varchar](20) NULL,
	[Стоимость_до_1000_км] [varchar](20) NULL,
	[Стоимость_до_2000_км] [varchar](20) NULL,
	[Стоимость_до_5000_км] [varchar](20) NULL,
	[Стоимость_до_8000_км] [varchar](20) NULL,
	[Стоимость_до_10000_км] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Тарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ХарактерыГрузов]    Script Date: 31.10.2024 22:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ХарактерыГрузов](
	[ID_ХарактерГруза] [int] IDENTITY(1,1) NOT NULL,
	[Название] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ХарактерГруза] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ВидыКузовов] ON 

INSERT [dbo].[ВидыКузовов] ([ID_ВидКузова], [Название]) VALUES (4, N'Изотерм')
INSERT [dbo].[ВидыКузовов] ([ID_ВидКузова], [Название]) VALUES (5, N'Рефрижератор')
INSERT [dbo].[ВидыКузовов] ([ID_ВидКузова], [Название]) VALUES (1, N'Тент')
INSERT [dbo].[ВидыКузовов] ([ID_ВидКузова], [Название]) VALUES (2, N'Фургон')
INSERT [dbo].[ВидыКузовов] ([ID_ВидКузова], [Название]) VALUES (3, N'Цельнометаллический')
SET IDENTITY_INSERT [dbo].[ВидыКузовов] OFF
GO
SET IDENTITY_INSERT [dbo].[ДополнительныеУслуги] ON 

INSERT [dbo].[ДополнительныеУслуги] ([ID_ДополнительныеУслуги], [Название]) VALUES (1, N'Возврат пакета документов')
INSERT [dbo].[ДополнительныеУслуги] ([ID_ДополнительныеУслуги], [Название]) VALUES (2, N'Грузчики')
INSERT [dbo].[ДополнительныеУслуги] ([ID_ДополнительныеУслуги], [Название]) VALUES (5, N'Защитная транспортировочная упаковка')
INSERT [dbo].[ДополнительныеУслуги] ([ID_ДополнительныеУслуги], [Название]) VALUES (6, N'Пломбировка груза')
INSERT [dbo].[ДополнительныеУслуги] ([ID_ДополнительныеУслуги], [Название]) VALUES (4, N'Упаковка')
INSERT [dbo].[ДополнительныеУслуги] ([ID_ДополнительныеУслуги], [Название]) VALUES (3, N'Хранение')
SET IDENTITY_INSERT [dbo].[ДополнительныеУслуги] OFF
GO
INSERT [dbo].[Тариф] ([ID_Тарифа], [Грузоподъемность], [Тип_кузова], [Марка_авто], [Размеры_кузова], [Объем_м3], [Стоимость_до_500_км], [Стоимость_до_1000_км], [Стоимость_до_2000_км], [Стоимость_до_5000_км], [Стоимость_до_8000_км], [Стоимость_до_10000_км]) VALUES (1, N'до 500 кг', N'Догруз в любой попутный автомобиль', N'', N'3 х 2 х 2', 12, N'17 - 23', N'10-15', N'10-15', N'7-9', N'7-9', N'5 - 9')
INSERT [dbo].[Тариф] ([ID_Тарифа], [Грузоподъемность], [Тип_кузова], [Марка_авто], [Размеры_кузова], [Объем_м3], [Стоимость_до_500_км], [Стоимость_до_1000_км], [Стоимость_до_2000_км], [Стоимость_до_5000_км], [Стоимость_до_8000_км], [Стоимость_до_10000_км]) VALUES (2, N'до 1 т', N'Газель', N'тент', N'4.2 х 2.1 х 2.1', 18, N'16 -19', N'16 -19', N'16 -19', N'12 - 16', N'12 - 16', N'11 - 14')
INSERT [dbo].[Тариф] ([ID_Тарифа], [Грузоподъемность], [Тип_кузова], [Марка_авто], [Размеры_кузова], [Объем_м3], [Стоимость_до_500_км], [Стоимость_до_1000_км], [Стоимость_до_2000_км], [Стоимость_до_5000_км], [Стоимость_до_8000_км], [Стоимость_до_10000_км]) VALUES (3, N'до 2 т', N'Газель', N'фургон', N'5.2 х 2.2 х 2.2', 22, N'19 - 23', N'19 - 23', N'19 - 23', N'17 - 23', N'17 - 23', N'16 - 22')
INSERT [dbo].[Тариф] ([ID_Тарифа], [Грузоподъемность], [Тип_кузова], [Марка_авто], [Размеры_кузова], [Объем_м3], [Стоимость_до_500_км], [Стоимость_до_1000_км], [Стоимость_до_2000_км], [Стоимость_до_5000_км], [Стоимость_до_8000_км], [Стоимость_до_10000_км]) VALUES (4, N'до 3 т', N'Газель, Валдай, Бычок', N'цельнометаллический', N'6.2 х 2.2 х 2.2', 30, N'23 - 25', N'23 - 25', N'23 - 25', N'22 - 25', N'22 - 25', N'19 - 23')
INSERT [dbo].[Тариф] ([ID_Тарифа], [Грузоподъемность], [Тип_кузова], [Марка_авто], [Размеры_кузова], [Объем_м3], [Стоимость_до_500_км], [Стоимость_до_1000_км], [Стоимость_до_2000_км], [Стоимость_до_5000_км], [Стоимость_до_8000_км], [Стоимость_до_10000_км]) VALUES (5, N'до 5 т', N'Mercedes-Benz, Газон Некст Foton, Hyundai, Маз', N'изотерм', N'7.2 х 2.45 х 2.5', 45, N'25-29', N'25-29', N'25-29', N'23 - 27', N'23 - 27', N'22 - 25')
INSERT [dbo].[Тариф] ([ID_Тарифа], [Грузоподъемность], [Тип_кузова], [Марка_авто], [Размеры_кузова], [Объем_м3], [Стоимость_до_500_км], [Стоимость_до_1000_км], [Стоимость_до_2000_км], [Стоимость_до_5000_км], [Стоимость_до_8000_км], [Стоимость_до_10000_км]) VALUES (6, N'до 10 т', N'DAF, Mercedes-Benz, Volvo, MAN, Маз', N'рефрижератор', N'13.6 х 2.45 х 2.45', 82, N'32 - 45', N'32 - 45', N'32 - 45', N'29 - 39', N'29 - 39', N'27 - 33')
INSERT [dbo].[Тариф] ([ID_Тарифа], [Грузоподъемность], [Тип_кузова], [Марка_авто], [Размеры_кузова], [Объем_м3], [Стоимость_до_500_км], [Стоимость_до_1000_км], [Стоимость_до_2000_км], [Стоимость_до_5000_км], [Стоимость_до_8000_км], [Стоимость_до_10000_км]) VALUES (7, N'до 20 т', N'Volvo, Mercedes-Benz,Scania, Renault, Iveco, DAF', N'', N'', 120, N'65 - 100', N'65 - 100', N'65 - 100', N'63 - 97', N'63 - 97', N'55 - 85')
GO
SET IDENTITY_INSERT [dbo].[ХарактерыГрузов] ON 

INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (19, N'Автомобиль (ли)')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (21, N'Автошины')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (15, N'Арматура')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (30, N'Большой')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (3, N'Бытовая техника')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (10, N'Бытовая химия')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (22, N'Весогабаритные')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (17, N'Двери')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (26, N'Детали')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (31, N'Другое')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (12, N'Изделия из металла')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (6, N'Кабель')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (2, N'Личные вещи')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (1, N'Мебель')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (13, N'Металлопрокат')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (23, N'Негабаритные')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (8, N'Оборудование')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (9, N'Опасный')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (28, N'Отделочные материалы')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (25, N'Посылка')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (24, N'Рефрижераторные')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (29, N'Стекло')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (16, N'Стройматериалы')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (18, N'Тара')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (7, N'Техника')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (27, N'ТНП')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (4, N'Товар')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (20, N'Транспортные средства')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (14, N'Труба')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (5, N'Хозтовары')
INSERT [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза], [Название]) VALUES (11, N'Хрупкий')
SET IDENTITY_INSERT [dbo].[ХарактерыГрузов] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ВидыКузо__38DA8035EEE9DF4D]    Script Date: 31.10.2024 22:48:02 ******/
ALTER TABLE [dbo].[ВидыКузовов] ADD UNIQUE NONCLUSTERED 
(
	[Название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Дополнит__38DA8035DE603509]    Script Date: 31.10.2024 22:48:02 ******/
ALTER TABLE [dbo].[ДополнительныеУслуги] ADD UNIQUE NONCLUSTERED 
(
	[Название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Характер__38DA8035B0120DBC]    Script Date: 31.10.2024 22:48:02 ******/
ALTER TABLE [dbo].[ХарактерыГрузов] ADD UNIQUE NONCLUSTERED 
(
	[Название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_ВидыКузовов] FOREIGN KEY([ID_ВидКузова])
REFERENCES [dbo].[ВидыКузовов] ([ID_ВидКузова])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_ВидыКузовов]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_ДополнительныеУслуги] FOREIGN KEY([ID_ДополнительныеУслуги])
REFERENCES [dbo].[ДополнительныеУслуги] ([ID_ДополнительныеУслуги])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_ДополнительныеУслуги]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_ХарактерыГрузов] FOREIGN KEY([ID_ХарактерГруза])
REFERENCES [dbo].[ХарактерыГрузов] ([ID_ХарактерГруза])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_ХарактерыГрузов]
GO
USE [master]
GO
ALTER DATABASE [РасчетСтоимости] SET  READ_WRITE 
GO

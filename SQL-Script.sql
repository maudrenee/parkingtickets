if DB_ID ('ParkingViolationsDB') is not null
drop database ParkingViolationsDB;
GO
	 
create Database ParkingViolationsDB
    
GO

use ParkingViolationsDB
GO

/****** Object:  Table [dbo].[ViolationDim]    Script Date: 2019-05-23 19:50:40 ******/
SET ANSI_NULLS ON
GO
    
SET QUOTED_IDENTIFIER ON
GO
    
CREATE TABLE [dbo].[ViolationDim](
            [Violation Code] [int] PRIMARY KEY NOT NULL DEFAULT 0,
            [Violation Description] [nvarchar](90) NOT NULL DEFAULT ('N/A'),
            [ParkingFine] [float] NOT NULL DEFAULT 0
) ON [PRIMARY]
GO
    
    
/****** Object:  Table [dbo].[LocationDim]    Script Date: 2019-05-23 19:50:01 ******/
    
CREATE TABLE [dbo].[LocationDim](
            [LocationID] [int] IDENTITY(1,1) NOT NULL,
            [County] [nvarchar](50) NOT NULL DEFAULT ('N/A'),
PRIMARY KEY CLUSTERED
(
            [LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

	/****** Object:  Table [dbo].[CarDim]    Script Date: 2019-05-23 19:49:19 ******/
    
CREATE TABLE [dbo].[CarDim](
            [CarID] [int] IDENTITY(1,1) NOT NULL,
            [Registration State] [nvarchar](50) NOT NULL,
            [Vehicle Year] [int] NOT NULL,
            [Plate ID] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK__CarDim__68A0340E10A4870A] PRIMARY KEY CLUSTERED
(
            [CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
    
ALTER TABLE [dbo].[CarDim] ADD  CONSTRAINT [DF__CarDim__Registra__47DBAE45]  DEFAULT ('NY') FOR [Registration State]
GO
    
ALTER TABLE [dbo].[CarDim] ADD  CONSTRAINT [DF__CarDim__Vehicle __48CFD27E]  DEFAULT ((0)) FOR [Vehicle Year]
GO

--Skapa vår DateDim

CREATE TABLE [dbo].[DateDim](
            [DateID] [date] PRIMARY KEY NOT NULL,
            [Year] [int] NULL,
            [Month] [int] NULL,
            [MonthName] [varchar](10) NULL,
            [Weekday] [tinyint] NOT NULL,
            [WeekdayName] [varchar](9) NOT NULL,
            [Week] [tinyint] NOT NULL,
            [Day] [int] NULL,
            [Quarter] [tinyint] NOT NULL,
            [QuarterName] [char](2) NOT NULL,
)
    
DECLARE @FirstSale as datetime
SELECT @FirstSale = '2013-05-01'
    
DECLARE @LastSale as datetime
SELECT @LastSale = '2018-01-01'
    
    
WHILE @FirstSale <= @LastSale
BEGIN
INSERT INTO ParkingViolationsDB.dbo.DateDim
SELECT    @FirstSale,
        YEAR(@FirstSale),
        MONTH(@FirstSale),
        DATENAME(Month, @FirstSale),
        DATEPART(WEEKDAY, @FirstSale),
        DATENAME(WEEKDAY, @FirstSale),
        DATEPART(ISO_WEEK, @FirstSale),
        DAY(@FirstSale),
        DATEPART(QUARTER, @FirstSale),
        'Q'+DATENAME(QUARTER, @FirstSale)
SELECT @FirstSale = DATEADD(DAY, 1, @FirstSale)
END
GO

-- Skapa vår TimeDim så vi får en dimension för alla minuter på dygnet.

Create Table TimeDim (TimeID [time](7) Primary Key, Hours [int])

GO

DECLARE @FirstHour as time(7)
set @FirstHour = '00:00:00.0000000'

DECLARE @temp as int
set @temp = 0

WHILE @temp < 1440
BEGIN

INSERT INTO [ParkingViolationsDB].[dbo].[TimeDim]
SELECT    @FirstHour,
           DATEPART(HOUR,@FirstHour)

SELECT @FirstHour = DATEADD(MINUTE, 1, @FirstHour)
set @temp = @temp + 1

END
GO
    
/****** Object:  Table [dbo].[Fact]    Script Date: 2019-05-23 19:49:55 ******/

CREATE TABLE [dbo].[Fact](
            [FactID] [bigint] NOT NULL,
            [CarID] [int] NOT NULL,
            [LocationID] [int] NOT NULL,
            [DateID] [datetime] NOT NULL,
            [ViolationID] [int] NOT NULL,
            [Violation Time] [time](7) NULL
) ON [PRIMARY]
GO
    
ALTER TABLE [dbo].[Fact] ADD  CONSTRAINT [DF__Fact__CarID__778AC167]  DEFAULT ((0)) FOR [CarID]
GO
    
ALTER TABLE [dbo].[Fact] ADD  CONSTRAINT [DF__Fact__LocationID__787EE5A0]  DEFAULT ((0)) FOR [LocationID]
GO
    
ALTER TABLE [dbo].[Fact] ADD  CONSTRAINT [DF__Fact__ViolationI__797309D9]  DEFAULT ((0)) FOR [ViolationID]
GO
    
    
GO
    
/****** Object:  Table [dbo].[errorRows]    Script Date: 2019-05-23 19:49:32 ******/
    
CREATE TABLE [dbo].[errorRows](
            [Summons Number] [nvarchar](50) NULL,
            [Registration State] [nvarchar](50) NULL,
            [Issue Date] [nvarchar](50) NULL,
            [Violation Code] [nvarchar](50) NULL,
                
            [Violation Time] [nvarchar](50) NULL,
            [Violation County] [nvarchar](50) NULL,
            [Vehicle Year] [nvarchar](50) NULL
) ON [PRIMARY]
GO
    
    
GO
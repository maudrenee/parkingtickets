


Create Database ParkingTicetsSource


USE [ParkingTicetsSource]
GO

/****** Object:  Table [dbo].[importParkingTickets]    Script Date: 2019-05-14 10:15:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[importParkingTickets](
    [Summons Number] [nvarchar](250) NULL,
    [Plate ID] [nvarchar](250) NULL,
    [Registration State] [nvarchar](250) NULL,
    [Plate Type] [nvarchar](250) NULL,
    [Issue Date] [nvarchar](250) NULL,
    [Violation Code] [nvarchar](250) NULL,
    [Vehicle Body Type] [nvarchar](250) NULL,
    [Vehicle Make] [nvarchar](250) NULL,
    [Issuing Agency] [nvarchar](250) NULL,
    [Street Code1] [nvarchar](250) NULL,
    [Street Code2] [nvarchar](250) NULL,
    [Street Code3] [nvarchar](250) NULL,
    [Vehicle Expiration Date] [nvarchar](250) NULL,
    [Violation Location] [nvarchar](250) NULL,
    [Violation Precinct] [nvarchar](250) NULL,
    [Issuer Precinct] [nvarchar](250) NULL,
    [Issuer Code] [nvarchar](250) NULL,
    [Issuer Command] [nvarchar](250) NULL,
    [Issuer Squad] [nvarchar](250) NULL,
    [Violation Time] [nvarchar](250) NULL,
    [Time First Observed] [nvarchar](250) NULL,
    [Violation County] [nvarchar](250) NULL,
    [Violation In Front Of Or Opposite] [nvarchar](250) NULL,
    [House Number] [nvarchar](250) NULL,
    [Street Name] [nvarchar](250) NULL,
    [Intersecting Street] [nvarchar](250) NULL,
    [Date First Observed] [nvarchar](250) NULL,
    [Law Section] [nvarchar](250) NULL,
    [Sub Division] [nvarchar](250) NULL,
    [Violation Legal Code] [nvarchar](250) NULL,
    [Days Parking In Effect    ] [nvarchar](250) NULL,
    [From Hours In Effect] [nvarchar](250) NULL,
    [To Hours In Effect] [nvarchar](250) NULL,
    [Vehicle Color] [nvarchar](250) NULL,
    [Unregistered Vehicle?] [nvarchar](250) NULL,
    [Vehicle Year] [nvarchar](250) NULL,
    [Meter Number] [nvarchar](250) NULL,
    [Feet From Curb] [nvarchar](250) NULL,
    [Violation Post Code] [nvarchar](250) NULL,
    [Violation Description] [nvarchar](250) NULL,
    [No Standing or Stopping Violation] [nvarchar](250) NULL,
    [Hydrant Violation] [nvarchar](250) NULL,
    [Double Parking Violation] [nvarchar](250) NULL,
    [Latitude] [nvarchar](250) NULL,
    [Longitude] [nvarchar](250) NULL,
    [Community Board] [nvarchar](250) NULL,
    [Community Council ] [nvarchar](250) NULL,
    [Census Tract] [nvarchar](250) NULL,
    [BIN] [nvarchar](250) NULL,
    [BBL] [nvarchar](250) NULL,
    [NTA] [nvarchar](500) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ViolationCodes](
[Violation Code](smallint) NOT NULL DEFAULT 
[Violation Description](nvarchar(90)) NOT NULL DEFAULT
[ParkingFine]() NOT NULL DEFAULT
)




Create Database ParkingTicketStructured


USE [ParkingTicketStructured]

GO

/****** Object:  Table [dbo].[importParkingTickets]    Script Date: 2019-05-14 10:15:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DataTable](
    [Summons Number] [bigint] NULL, 
    [Registration State] [nvarchar](15) NULL, 
    [Issue Date] [date] NULL, 
    [Violation Code] [smallint] NULL, 
    [Vehicle Body Type] [nvarchar](6) NULL, 
    [Vehicle Make] [nvarchar](8) NULL, 
    [Violation Location] [nvarchar](4) NULL, 
    [Violation Precinct] [smallint] NULL, 
    [Violation Time] [Time]) NULL,  
    [Violation County] [nvarchar](3) NULL,  
    [Street Name] [nvarchar](50) NULL,   
    [Vehicle Year] [smallint] NULL   
) ON [PRIMARY]
GO

668
Create table [dbo].[CarDim](
	[CarID] [int]  IDENTITY (1,1) PRIMARY KEY,
	[Vehicle Make] [nvarchar](8) NOT NULL DEFAULT 0,
	[Vehicle Body Type] [nvarchar](6) NOT NULL DEFAULT 'FOO',
	[Registration State] [nvarchar](15) NOT NULL DEFAULT 'NY',
	[Vehicle Year] [smallint] NOT NULL DEFAULT 0
)
 618
Create table [dbo].[LocationDim]( 
	[LocationID] [int]  IDENTITY (1,1) PRIMARY KEY,
	[Street Name] [nvarchar](50) NOT NULL DEFAULT 'Vintergatan 17',
	[County] [nvarchar](3) NOT NULL DEFAULT 'XYZ'
)


CREATE TABLE [dbo].[ViolationDim](
[Violation Code] [smallint] NOT NULL DEFAULT 'N/A', 
[Violation Description] [nvarchar](90) NOT NULL DEFAULT 'N/A',
[ParkingFine] [float] NOT NULL DEFAULT 0
)

Create table [dbo].[Fact] (
	[FactID] [int] IDENTITY (1,1) PRIMARY KEY,
	[CarID] [int] NOT NULL DEFAULT 0,
	[LocationID] [int] NOT NULL DEFAULT 0,
	[DateID] [datetime] NOT NULL,
	[ViolationID] [int] NOT NULL DEFAULT 0,
	[Violation Time] [Time] NOT NULL
)


create table DateDim
(
    DateID datetime2 PRIMARY KEY,
    Year int,
    Month int,
    MonthName varchar(25),
    WeekDay int,
    WeekDayName varchar(25),
    Week int,
    Day int,
    Quarter int,
    QuarterName varchar(2),
)

-- skapa en enkel, slarvig HaKoll-tabell
create table HaKoll
(
namn varchar(10),
datum datetime2
)

-- skapa proc för att fylla dimension
create proc fillDateDim
as
begin
    set nocount on

    -- variabler
    declare @date datetime2

    insert into HaKoll values ('fill date into DateDim', getdate())

    -- hämta högsta datumet för datum som finns i dim
    select @date = dateadd(day, 1, MAX(DateID)) from datedim

    -- om dim-tabell är tom, ändra startdatum till innan förslj startade
    if @date is null
        select @date = '2013-05-01'

    -- ändra till svenska
    set language 'english'

    -- ladda dim med korrekta datum
    while @date <= GETDATE()
    begin
        -- lägg in datum-delarna i tabellen
        insert into DateDim
            select @date,
            YEAR(@date),
            MONTH(@date),
            DATENAME(MONTH, @date),
            DATEPART(dw,@date),
            DATENAME(WEEKDAY, @date),
            DATEPART(wk,@date),
            day(@date),
            DATEPART(qq,@date),
            'Q' + CAST(DATEPART(qq,@date) as varchar(1))

        -- ta nästa dag
        select @date = dateadd(day, 1, @date)
    end
end
go

exec fillDateDim


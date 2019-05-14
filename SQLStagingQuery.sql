USE [importparkingtickets]
GO

/****** Object:  Table [dbo].[importParkingTickets]    Script Date: 2019-05-14 10:15:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[importParkingTickets](
    [Summons Number] [nvarchar](50) NULL,
    [Registration State] [nvarchar](50) NULL,
    [Plate Type] [nvarchar](50) NULL,
    [Issue Date] [nvarchar](250) NULL,
    [Violation Code] [nvarchar](250) NULL,
    [Vehicle Body Type] [nvarchar](250) NULL,
    [Vehicle Make] [nvarchar](250) NULL,
    [Street Code1] [nvarchar](250) NULL,
    [Street Code2] [nvarchar](250) NULL,
    [Street Code3] [nvarchar](250) NULL,
    [Vehicle Expiration Date] [datetime] NULL,
    [Violation Location] [nvarchar](250) NULL,
    [Violation Precinct] [nvarchar](250) NULL,
    [Issuer Precinct] [nvarchar](250) NULL,
    [Issuer Code] [nvarchar](250) NULL,
    [Issuer Command] [nvarchar](250) NULL,
    [Violation Time] [nvarchar](250) NULL,
    [Violation County] [nvarchar](250) NULL,
    [Violation In Front Of Or Opposite] [nvarchar](250) NULL,
    [Street Name] [nvarchar](250) NULL,
    [Intersecting Street] [nvarchar](250) NULL,
    [From Hours In Effect] [nvarchar](250) NULL,
    [To Hours In Effect] [nvarchar](250) NULL,
    [Vehicle Year] [datetime] NULL,
    [No Standing or Stopping Violation] [nvarchar](250) NULL,
    [Hydrant Violation] [nvarchar](250) NULL,
    [Double Parking Violation] [nvarchar](250) NULL,


) ON [PRIMARY]
GO
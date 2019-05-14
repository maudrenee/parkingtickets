USE [importparkingtickets]
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
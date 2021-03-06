USE [DSTRAINING]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROC [dbo].[BLD_WRK_VehicleService]

AS
BEGIN

IF OBJECT_ID('WRK_VehicleService') IS NOT NULL
DROP TABLE [WRK_VehicleService]

CREATE TABLE [WRK_VehicleService]
(
	[RowNumber]				INT IDENTITY(1,1)
      ,[CustomerID]			VARCHAR(100)	
      ,[CustomerSince]		DATE	
      ,[Vehicle]			VARCHAR(100)
      ,[2014]				FLOAT
      ,[2015]				FLOAT
      ,[2016E]				FLOAT      
)

TRUNCATE TABLE [WRK_VehicleService]

INSERT INTO [WRK_VehicleService]
(
	   [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
)

SELECT 
	[CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
FROM [RAW_VehicleService]
 where isnumeric([2015]) = 1
  or [2015] = ''

select *
  from [DSTRAINING].[dbo].[RAW_VehicleService]
  where isnumeric([2015]) = 0
  and [2015] <> ''

SELECT [CustomerID], count(*)
FROM [WRK_VehicleService]
GROUP BY [CustomerID]
HAVING COUNT(*) > 1

select *
from [WRK_VehicleService]
where [CustomerID] like '3490750'

select *
from [WRK_VehicleService]
where [CustomerSince] < '1966-01-01'

select avg([2014])
from [WRK_VehicleService]

select max([2014])
from [WRK_VehicleService]

select min([2014])
from [WRK_VehicleService]

select avg([2015])
from [WRK_VehicleService]

select max([2015])
from [WRK_VehicleService]

select min([2015])
from [WRK_VehicleService]

select avg([2016E])
from [WRK_VehicleService]

select max([2016E])
from [WRK_VehicleService]

select min([2016E])
from [WRK_VehicleService]

select *
from [WRK_VehicleService]
where [2014] > 800

select sum([2014])
from [WRK_VehicleService]

select sum([2015])
from [WRK_VehicleService]

select sum([2016E])
from [WRK_VehicleService]


END
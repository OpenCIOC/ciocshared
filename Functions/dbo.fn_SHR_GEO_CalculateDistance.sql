SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GEO_CalculateDistance](@Longitude1 [decimal](11, 7), @Latitude1 [decimal](11, 7), @Longitude2 [decimal](11, 7), @Latitude2 [decimal](11, 7))
RETURNS [float] WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE @Temp FLOAT
 
SET @Temp = SIN(@Latitude1/57.2957795130823) * SIN(@Latitude2/57.2957795130823) + COS(@Latitude1/57.2957795130823) * COS(@Latitude2/57.2957795130823) * COS(@Longitude2/57.2957795130823 - @Longitude1/57.2957795130823) 
IF @Temp > 1
    SET @Temp = 1
ELSE IF @Temp < -1
    SET @Temp = -1
 
RETURN (6378.7 * ACOS(@Temp) )
 
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GEO_CalculateDistance] TO [cioc_login_role]
GO

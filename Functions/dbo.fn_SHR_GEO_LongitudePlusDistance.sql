SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GEO_LongitudePlusDistance](@StartLongitude [float], @StartLatitude [float], @Distance [float])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
BEGIN
    RETURN (SELECT @StartLongitude + SQRT((@Distance * @Distance) / (2972.884677958261254275 * COS((2 * @StartLatitude) / 114.59156) * COS((2 * @StartLatitude) / 114.59156))))
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GEO_LongitudePlusDistance] TO [cioc_login_role]
GO

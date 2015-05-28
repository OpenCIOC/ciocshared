SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GEO_LatitudePlusDistance](@StartLatitude [float], @Distance [float])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
BEGIN
    RETURN (SELECT @StartLatitude + SQRT((@Distance * @Distance) / 2962.014284))
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GEO_LatitudePlusDistance] TO [cioc_login_role]
GO

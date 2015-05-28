SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_DisplayGeoCodeType](@GCTypeID [int])
RETURNS nvarchar(50) WITH EXECUTE AS CALLER
AS 
BEGIN 

DECLARE	@GeoCodeType nvarchar(50)

SELECT @GeoCodeType = gcn.Name
	FROM SHR_GBL_GeoCodeType gc
	INNER JOIN SHR_GBL_GeoCodeType_Name gcn
		ON gc.GCTypeID=gcn.GCTypeID AND gcn.LangID=(SELECT TOP 1 LangID FROM SHR_GBL_GeoCodeType_Name WHERE GCTypeID=gcn.GCTypeID ORDER BY CASE WHEN LangID=@@LANGID THEN 0 ELSE 1 END, LangID)
WHERE gc.GCTypeID = @GCTypeID

IF @GeoCodeType = '' SET @GeoCodeType = NULL

RETURN @GeoCodeType

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_DisplayGeoCodeType] TO [cioc_login_role]
GO

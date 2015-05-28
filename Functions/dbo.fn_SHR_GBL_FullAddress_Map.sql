SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_FullAddress_Map](
	@MailAddress nvarchar(max),
	@Latitude [decimal](11, 7),
	@Longitude [decimal](11, 7)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN

DECLARE	@returnStr varchar(max)

SET @returnStr = @MailAddress

IF @returnStr IS NOT NULL AND @Latitude IS NOT NULL AND @Longitude IS NOT NULL BEGIN
	SET @returnStr = '<div style="float:left;">' + REPLACE(@returnStr, CHAR(13) + CHAR(10), '<br>') + '</div><div id="map_canvas" class="NotVisible DetailsMapCanvas" latitude="' + CAST(@Latitude AS varchar) + '" longitude="' + CAST(@Longitude AS varchar) + '"></div>'
END

IF @returnStr = '' SET @returnStr = NULL

RETURN @returnStr

END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_FullAddress_Map] TO [cioc_login_role]
GO


SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_ExtraCheckList](
	@Type [char](1),
	@EXC_ID [int],
	@ExtraCheckList nvarchar(255),
	@HTTPVals [varchar](500),
	@PathToStart [varchar](50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

-- THIS FUNCTION IS DEPRECATED AS OF 3.6

RETURN '<a href="' + @PathToStart + 'results.asp?EXC' + @Type + 'ID=' + CAST(@EXC_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @ExtraCheckList + '</a>'

END



GO

GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_ExtraCheckList] TO [cioc_login_role]
GO

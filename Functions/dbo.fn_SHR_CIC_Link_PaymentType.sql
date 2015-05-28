SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_PaymentType](
	@PAY_ID int,
	@PaymentType nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart [varchar](50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<A HREF="' + @PathToStart + 'results.asp?PAYID=' + CAST(@PAY_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @PaymentType + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_PaymentType] TO [cioc_login_role]
GO

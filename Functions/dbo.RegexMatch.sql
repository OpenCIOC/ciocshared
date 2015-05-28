CREATE FUNCTION [dbo].[RegexMatch] (@input [nvarchar] (max), @pattern [nvarchar] (4000))
RETURNS [bit]
WITH EXECUTE AS CALLER
EXTERNAL NAME [Msdn.SqlRegex].[UserDefinedFunctions].[RegexMatch]
GO
GRANT EXECUTE ON  [dbo].[RegexMatch] TO [cioc_login_role]
GO

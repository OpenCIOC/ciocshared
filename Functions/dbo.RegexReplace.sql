CREATE FUNCTION [dbo].[RegexReplace] (@expression [nvarchar] (4000), @pattern [nvarchar] (4000), @replace [nvarchar] (4000))
RETURNS [nvarchar] (4000)
WITH EXECUTE AS CALLER
EXTERNAL NAME [Msdn.SqlRegex].[UserDefinedFunctions].[RegexReplace]
GO
GRANT EXECUTE ON  [dbo].[RegexReplace] TO [cioc_login_role]
GO

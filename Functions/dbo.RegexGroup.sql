CREATE FUNCTION [dbo].[RegexGroup] (@input [nvarchar] (max), @pattern [nvarchar] (4000), @name [nvarchar] (4000))
RETURNS [nvarchar] (max)
WITH EXECUTE AS CALLER
EXTERNAL NAME [Msdn.SqlRegex].[UserDefinedFunctions].[RegexGroup]
GO

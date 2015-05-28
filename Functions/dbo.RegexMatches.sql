CREATE FUNCTION [dbo].[RegexMatches] (@input [nvarchar] (max), @pattern [nvarchar] (4000))
RETURNS TABLE (
[Index] [int] NULL,
[Text] [nvarchar] (max) COLLATE Latin1_General_100_CI_AI NULL)
WITH EXECUTE AS CALLER
EXTERNAL NAME [Msdn.SqlRegex].[UserDefinedFunctions].[RegexMatches]
GO

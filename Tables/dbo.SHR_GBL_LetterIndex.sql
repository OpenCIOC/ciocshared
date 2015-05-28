CREATE TABLE [dbo].[SHR_GBL_LetterIndex]
(
[LetterIndex] [varchar] (3) COLLATE Latin1_General_100_CI_AI NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_GBL_LetterIndex] ADD CONSTRAINT [PK_SHR_GBL_LetterIndex] PRIMARY KEY CLUSTERED  ([LetterIndex]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[SHR_GBL_LetterIndex] TO [cioc_login_role]
GO

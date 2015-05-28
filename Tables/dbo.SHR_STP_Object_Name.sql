CREATE TABLE [dbo].[SHR_STP_Object_Name]
(
[ObjectID] [int] NOT NULL,
[LangID] [smallint] NOT NULL,
[ObjectName] [nvarchar] (100) COLLATE Latin1_General_100_CS_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_STP_Object_Name] ADD CONSTRAINT [PK_SHR_STP_Object_Name] PRIMARY KEY CLUSTERED  ([ObjectID], [LangID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SHR_STP_Object_Name_ObjectIDLangIDInclObjectName] ON [dbo].[SHR_STP_Object_Name] ([ObjectID], [LangID]) INCLUDE ([ObjectName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_STP_Object_Name] ADD CONSTRAINT [FK_SHR_STP_Object_Name_SHR_STP_Language] FOREIGN KEY ([LangID]) REFERENCES [dbo].[SHR_STP_Language] ([LangID])
GO
ALTER TABLE [dbo].[SHR_STP_Object_Name] ADD CONSTRAINT [FK_SHR_STP_Object_Name_SHR_STP_Object] FOREIGN KEY ([ObjectID]) REFERENCES [dbo].[SHR_STP_Object] ([ObjectID]) ON DELETE CASCADE ON UPDATE CASCADE
GO

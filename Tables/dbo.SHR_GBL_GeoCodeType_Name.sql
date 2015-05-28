CREATE TABLE [dbo].[SHR_GBL_GeoCodeType_Name]
(
[GCTypeID] [tinyint] NOT NULL,
[LangID] [smallint] NOT NULL,
[Name] [nvarchar] (50) COLLATE Latin1_General_100_CI_AI NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_GBL_GeoCodeType_Name] ADD CONSTRAINT [PK_SHR_GBL_GeoCodeType_Name] PRIMARY KEY CLUSTERED  ([GCTypeID], [LangID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_GBL_GeoCodeType_Name] ADD CONSTRAINT [FK_SHR_GBL_GeoCodeType_Name_SHR_GBL_GeoCodeType] FOREIGN KEY ([GCTypeID]) REFERENCES [dbo].[SHR_GBL_GeoCodeType] ([GCTypeID])
GO
ALTER TABLE [dbo].[SHR_GBL_GeoCodeType_Name] ADD CONSTRAINT [FK_SHR_GBL_GeoCodeType_Name_SHR_GBL_GeoCodeType1] FOREIGN KEY ([GCTypeID]) REFERENCES [dbo].[SHR_GBL_GeoCodeType] ([GCTypeID])
GO

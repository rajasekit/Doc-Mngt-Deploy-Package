IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'DocumentManagement')
BEGIN
    CREATE DATABASE DocumentManagement;
END
GO

USE DocumentManagement;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CaseTransactions' AND type = 'U')
BEGIN
    SET ANSI_NULLS ON;
    GO
    SET QUOTED_IDENTIFIER ON;
    GO

    CREATE TABLE [dbo].[CaseTransactions](
        [CaseTransactionID] [int] IDENTITY(1,1) NOT NULL,
        [CaseNumber] [uniqueidentifier] NOT NULL,
        CONSTRAINT [PK_CaseTransactions] PRIMARY KEY CLUSTERED 
        (
            [CaseTransactionID] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
END
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Documents' AND type = 'U')
BEGIN
    SET ANSI_NULLS ON;
    GO
    SET QUOTED_IDENTIFIER ON;
    GO

    
CREATE TABLE [dbo].[Documents](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[CaseTransactionID] [int] NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FileType] [nvarchar](max) NOT NULL,
	[FileSize] [bigint] NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[UploadedBy] [nvarchar](max) NOT NULL,
	[UploadDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_CaseTransactions_CaseTransactionID] FOREIGN KEY([CaseTransactionID])
REFERENCES [dbo].[CaseTransactions] ([CaseTransactionID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_CaseTransactions_CaseTransactionID]
GO



END
GO
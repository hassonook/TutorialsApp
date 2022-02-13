
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/09/2022 00:55:35
-- Generated from EDMX file: C:\Users\Lenovo\source\repos\hassonook\Tutorials\Tutorials\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Tutorials];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tutorials] DROP CONSTRAINT [FK_TutorialCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [FK_CategoryCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialTypeTutorial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tutorials] DROP CONSTRAINT [FK_TutorialTypeTutorial];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialAspNetUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tutorials] DROP CONSTRAINT [FK_TutorialAspNetUser];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_TutorialRating];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_AspNetUserRating];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialCommenting]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Commentings] DROP CONSTRAINT [FK_TutorialCommenting];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserCommenting]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Commentings] DROP CONSTRAINT [FK_AspNetUserCommenting];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Tutorials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tutorials];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[TutorialTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TutorialTypes];
GO
IF OBJECT_ID(N'[dbo].[Ratings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ratings];
GO
IF OBJECT_ID(N'[dbo].[Commentings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Commentings];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [FullName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Tutorials'
CREATE TABLE [dbo].[Tutorials] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [PathFile] nvarchar(max)  NOT NULL,
    [CategoryId] int  NOT NULL,
    [TutorialTypeId] int  NOT NULL,
    [Desc] nvarchar(max)  NOT NULL,
    [Active] bit  NOT NULL,
    [CreatedOn] datetime  NOT NULL,
    [CreatedBy] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CategoryId] int  NOT NULL
);
GO

-- Creating table 'TutorialTypes'
CREATE TABLE [dbo].[TutorialTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Rate] nvarchar(max)  NOT NULL,
    [TutorialId] int  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL,
    [RatedOn] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Commentings'
CREATE TABLE [dbo].[Commentings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [TutorialId] int  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL,
    [CommentOn] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [RoleId] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tutorials'
ALTER TABLE [dbo].[Tutorials]
ADD CONSTRAINT [PK_Tutorials]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TutorialTypes'
ALTER TABLE [dbo].[TutorialTypes]
ADD CONSTRAINT [PK_TutorialTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Commentings'
ALTER TABLE [dbo].[Commentings]
ADD CONSTRAINT [PK_Commentings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([RoleId], [UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([UserId]);
GO

-- Creating foreign key on [CategoryId] in table 'Tutorials'
ALTER TABLE [dbo].[Tutorials]
ADD CONSTRAINT [FK_TutorialCategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorialCategory'
CREATE INDEX [IX_FK_TutorialCategory]
ON [dbo].[Tutorials]
    ([CategoryId]);
GO

-- Creating foreign key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_CategoryCategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryCategory'
CREATE INDEX [IX_FK_CategoryCategory]
ON [dbo].[Categories]
    ([CategoryId]);
GO

-- Creating foreign key on [TutorialTypeId] in table 'Tutorials'
ALTER TABLE [dbo].[Tutorials]
ADD CONSTRAINT [FK_TutorialTypeTutorial]
    FOREIGN KEY ([TutorialTypeId])
    REFERENCES [dbo].[TutorialTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorialTypeTutorial'
CREATE INDEX [IX_FK_TutorialTypeTutorial]
ON [dbo].[Tutorials]
    ([TutorialTypeId]);
GO

-- Creating foreign key on [CreatedBy] in table 'Tutorials'
ALTER TABLE [dbo].[Tutorials]
ADD CONSTRAINT [FK_TutorialAspNetUser]
    FOREIGN KEY ([CreatedBy])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorialAspNetUser'
CREATE INDEX [IX_FK_TutorialAspNetUser]
ON [dbo].[Tutorials]
    ([CreatedBy]);
GO

-- Creating foreign key on [TutorialId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_TutorialRating]
    FOREIGN KEY ([TutorialId])
    REFERENCES [dbo].[Tutorials]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorialRating'
CREATE INDEX [IX_FK_TutorialRating]
ON [dbo].[Ratings]
    ([TutorialId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_AspNetUserRating]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRating'
CREATE INDEX [IX_FK_AspNetUserRating]
ON [dbo].[Ratings]
    ([AspNetUserId]);
GO

-- Creating foreign key on [TutorialId] in table 'Commentings'
ALTER TABLE [dbo].[Commentings]
ADD CONSTRAINT [FK_TutorialCommenting]
    FOREIGN KEY ([TutorialId])
    REFERENCES [dbo].[Tutorials]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorialCommenting'
CREATE INDEX [IX_FK_TutorialCommenting]
ON [dbo].[Commentings]
    ([TutorialId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'Commentings'
ALTER TABLE [dbo].[Commentings]
ADD CONSTRAINT [FK_AspNetUserCommenting]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserCommenting'
CREATE INDEX [IX_FK_AspNetUserCommenting]
ON [dbo].[Commentings]
    ([AspNetUserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
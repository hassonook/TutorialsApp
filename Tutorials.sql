USE [Tutorials]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 2/13/2022 11:34:33 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[RoleId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commentings]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commentings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[TutorialId] [int] NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
	[CommentOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Commentings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [int] NOT NULL,
	[TutorialId] [int] NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
	[RatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutorials]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutorials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PathFile] [nvarchar](max) NOT NULL,
	[FileSize] [decimal](18, 8) NULL,
	[CategoryId] [int] NOT NULL,
	[TutorialTypeId] [int] NOT NULL,
	[Desc] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Tutorials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TutorialTypes]    Script Date: 2/13/2022 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorialTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TutorialTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'24a34b70-7b00-4fb5-bd9a-7af6089d3643', N'Student')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9d498431-24aa-42c6-b921-8c9a6a5070fd', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([RoleId], [UserId]) VALUES (N'9d498431-24aa-42c6-b921-8c9a6a5070fd', N'4926ae54-005f-4b58-9ec0-c4eb20fbcc12')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1c391e40-b55d-40d0-b727-aa92ceda529f', N'Hassona Hassan', N'hassonook@gmail.com', 0, N'ADceoIA9j4PlPst7ZQWigLC/my0ga+Kab/acGx/r29yysiy4DLG48liIe5msxmbm7g==', N'd462bc5b-1111-4ac8-82de-2278248b23df', NULL, 0, 0, NULL, 1, 0, N'hassonook@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4926ae54-005f-4b58-9ec0-c4eb20fbcc12', N'Super User', N'admin@tutorials.com', 0, N'AJ7zzL60sMSI+/pxFW+ks7nl5h5ycVpgizCBJymlHv2QL1f/2ObHMPIsLhFfyC+FAw==', N'84e8b3ac-dd88-41a1-a248-5487a10fe9aa', NULL, 0, 0, NULL, 0, 0, N'admin@tutorials.com')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (6, N'Computer Science', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (7, N'Arts', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (8, N'Engineering', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Commentings] ON 

INSERT [dbo].[Commentings] ([Id], [Comment], [TutorialId], [AspNetUserId], [CommentOn]) VALUES (9, N'This tutorials very nice
', 18, N'4926ae54-005f-4b58-9ec0-c4eb20fbcc12', CAST(N'2022-02-11T16:03:11.037' AS DateTime))
INSERT [dbo].[Commentings] ([Id], [Comment], [TutorialId], [AspNetUserId], [CommentOn]) VALUES (10, N'Very good', 18, N'4926ae54-005f-4b58-9ec0-c4eb20fbcc12', CAST(N'2022-02-11T16:03:38.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[Commentings] OFF
GO
SET IDENTITY_INSERT [dbo].[Tutorials] ON 

INSERT [dbo].[Tutorials] ([Id], [Name], [PathFile], [FileSize], [CategoryId], [TutorialTypeId], [Desc], [Active], [CreatedOn], [CreatedBy]) VALUES (18, N'UXUI Design', N'~/Libarary/Computer Science/UXUIDesign.pdf', CAST(3806267.00000000 AS Decimal(18, 8)), 6, 3, N'Human Computer Interaction (HCI) research is focused on the interfaces between people (users) and computers. The point of interaction or communication between a computer and another entity, such as a printer or human operator. Information flows in one direction or two. The layout of an application''s graphic, spoken, touch, or textual controls in conjunction with the way the application responds to user activity.', 1, CAST(N'2022-02-11T11:43:04.793' AS DateTime), N'4926ae54-005f-4b58-9ec0-c4eb20fbcc12')
SET IDENTITY_INSERT [dbo].[Tutorials] OFF
GO
SET IDENTITY_INSERT [dbo].[TutorialTypes] ON 

INSERT [dbo].[TutorialTypes] ([Id], [Name]) VALUES (3, N'Book')
INSERT [dbo].[TutorialTypes] ([Id], [Name]) VALUES (4, N'Video')
SET IDENTITY_INSERT [dbo].[TutorialTypes] OFF
GO
ALTER TABLE [dbo].[Ratings] ADD  CONSTRAINT [DF_Ratings_Rate]  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[Tutorials] ADD  CONSTRAINT [DF_Tutorials_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_CategoryCategory]
GO
ALTER TABLE [dbo].[Commentings]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserCommenting] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Commentings] CHECK CONSTRAINT [FK_AspNetUserCommenting]
GO
ALTER TABLE [dbo].[Commentings]  WITH CHECK ADD  CONSTRAINT [FK_TutorialCommenting] FOREIGN KEY([TutorialId])
REFERENCES [dbo].[Tutorials] ([Id])
GO
ALTER TABLE [dbo].[Commentings] CHECK CONSTRAINT [FK_TutorialCommenting]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRating] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_AspNetUserRating]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_TutorialRating] FOREIGN KEY([TutorialId])
REFERENCES [dbo].[Tutorials] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_TutorialRating]
GO
ALTER TABLE [dbo].[Tutorials]  WITH CHECK ADD  CONSTRAINT [FK_TutorialAspNetUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Tutorials] CHECK CONSTRAINT [FK_TutorialAspNetUser]
GO
ALTER TABLE [dbo].[Tutorials]  WITH CHECK ADD  CONSTRAINT [FK_TutorialCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Tutorials] CHECK CONSTRAINT [FK_TutorialCategory]
GO
ALTER TABLE [dbo].[Tutorials]  WITH CHECK ADD  CONSTRAINT [FK_TutorialTypeTutorial] FOREIGN KEY([TutorialTypeId])
REFERENCES [dbo].[TutorialTypes] ([Id])
GO
ALTER TABLE [dbo].[Tutorials] CHECK CONSTRAINT [FK_TutorialTypeTutorial]
GO

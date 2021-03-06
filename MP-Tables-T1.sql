USE [master]
GO

CREATE DATABASE [MenuPlanner]
GO

USE [MenuPlanner]
GO

CREATE TABLE [dbo].[Program](
	[ProgramID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[DisplayName] [varchar](255) NULL,
	[Description] [text] NULL,
	[IsCustomPlan] [bit] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Price] [money] NULL,
	[CostPerDay] [money] NULL,
	[Shipping] [money] NULL,
	[DoNotSubstitute] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsSnack] [bit] NOT NULL,
	[SnackTemplateId] [int] NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Abbreviation] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Abbreviation] [varchar](10) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Ice] [int] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderPrint]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderPrint](
	[OrderPrintID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[GeneratedDate] [datetime] NOT NULL,
	[TargetDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderPrint] PRIMARY KEY CLUSTERED 
(
	[OrderPrintID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTypes]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTypes](
	[OrderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerStatus]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerStatus](
	[CustomerStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerStatus] PRIMARY KEY CLUSTERED 
(
	[CustomerStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerType]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerType](
	[CustomerTypeId] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_OrderType] PRIMARY KEY CLUSTERED 
(
	[CustomerTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carrier]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carrier](
	[CarrierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [text] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Carrier] PRIMARY KEY CLUSTERED 
(
	[CarrierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(10000,1) NOT NULL,
	[First] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[LeadDate] [datetime] NULL,
	[LeadSource] [varchar](255) NULL,
	[Email] [varchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[BillingAddressID] [int] NULL,
	[ShippingAddressID] [int] NULL,
	[EmailPreference] [int] NULL,
	[EmailBounces] [int] NULL,
	[CustomerStatusID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Ice] [int] NULL,
	[AlwaysReviewHold] [bit] NULL,
	[PickListComments] [varchar](1000) NULL,
	[MenuComments] [varchar](255) NULL,
	[LegacyUserID] [int] NULL,
	[LegacyLastModified] [datetime] NULL,
	[CustomerPlanID] [int] NULL,
	[PreferredShipDay] [int] NULL,
	[AlwaysHoldReason] [text] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[SalesForceID] [varchar](50) NULL,
	[CarrierID] [int] NOT NULL,
	[WareHouse] [nchar](10) NULL,
	[Custom] [bit] NULL,
	[IsShipDateOverride] [bit] NULL,
	[CustomerShipDate] [datetime] NULL,
	[CutOffDate] [datetime] NULL,
	[PaymentStatus] [int] NULL,
	[OrderType] [varchar](50) NULL,
	[CustomerTypeId] [int] NULL,
	[IsVerified] [bit] NULL,
	[SnackTemlplateId] [int] NULL,
	[IsUrgentShipping] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(100000,1) NOT NULL,
	[BuildDate] [datetime] NULL,
	[PrintDate] [datetime] NULL,
	[OrderStatusID] [int] NOT NULL,
	[ShippedWeight] [int] NOT NULL,
	[TrackingNumber] [varchar](255) NOT NULL,
	[ShipDate] [datetime] NULL,
	[ReceivedDate] [datetime] NULL,
	[MealWeight] [int] NOT NULL,
	[PackagingWeight] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PlanID] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[Address1] [varchar](255) NOT NULL,
	[Address2] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[StateID] [int] NOT NULL,
	[PostalCode] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[DeliveryInstructions] [varchar](255) NOT NULL,
	[Ice] [int] NOT NULL,
	[BusinessAddress] [bit] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[Price] [money] NULL,
	[Shipping] [money] NULL,
	[PickListComments] [varchar](1000) NULL,
	[MenuComments] [varchar](255) NULL,
	[PickListOrderPrintID] [int] NULL,
	[MenuOrderPrintID] [int] NULL,
	[FirstOrder] [bit] NULL,
	[SecondOrder] [bit] NULL,
	[OpportunityName] [varchar](max) NULL,
	[BuildID] [int] NOT NULL,
	[Custom] [bit] NULL,
	[OpportunityId] [varchar](50) NULL,
	[OrderTypeId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDay]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDay](
	[OrderDayID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Day] [int] NOT NULL,
 CONSTRAINT [PK_OrderDay] PRIMARY KEY CLUSTERED 
(
	[OrderDayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacationHoldHistory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VacationHoldHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[HoldId] [varchar](255) NULL,
	[EventId] [varchar](255) NULL,
	[TaskId] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Promo]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Promo](
	[PromoID] [int] IDENTITY(1,1) NOT NULL,
	[PomoCode] [varchar](50) NOT NULL,
	[Description] [text] NOT NULL,
	[DollarDiscount] [money] NOT NULL,
	[PercentDiscount] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[AppliesToPrice] [bit] NOT NULL,
	[AppliesToShipping] [bit] NOT NULL,
	[DollarLimit] [money] NOT NULL,
	[OrderLimit] [int] NOT NULL,
	[NewCustomerOnly] [bit] NOT NULL,
 CONSTRAINT [PK_Promo] PRIMARY KEY CLUSTERED 
(
	[PromoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerPlan]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerPlan](
	[CustomerPlanID] [int] IDENTITY(10000,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PlanID] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Week] [int] NOT NULL,
	[TotalWeek] [int] NOT NULL,
	[PreferedShipDayOfWeek] [int] NOT NULL,
	[Price] [money] NULL,
	[Shipping] [money] NULL,
	[PromoID] [int] NULL,
	[Nickname] [varchar](255) NULL,
	[LegacyOrderID] [int] NULL,
	[IsDynamic] [bit] NOT NULL,
	[DynamicBreakfast] [int] NOT NULL,
	[DynamicLunch] [int] NOT NULL,
	[DynamicDinner] [int] NOT NULL,
	[DynamicSnack] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerPlan] PRIMARY KEY CLUSTERED 
(
	[CustomerPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current week to be fulfilled.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerPlan', @level2type=N'COLUMN',@level2name=N'Week'
GO
/****** Object:  Table [dbo].[CustomerPlanHold]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPlanHold](
	[CustomerPlanHoldID] [int] NOT NULL,
	[HoldDate] [datetime] NULL,
	[ResumeDate] [datetime] NULL,
	[Notes] [text] NULL,
	[CustomerPlanID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerPlanHold] PRIMARY KEY CLUSTERED 
(
	[CustomerPlanHoldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPayment]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerPayment](
	[CustomerPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [varchar](255) NOT NULL,
	[ExpMonth] [int] NOT NULL,
	[ExpYear] [int] NOT NULL,
	[LastFour] [char](4) NOT NULL,
	[NameOnCard] [varchar](255) NOT NULL,
	[CardType] [int] NOT NULL,
	[SecurityCode] [varchar](4) NULL,
	[DefaultPayment] [bit] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerPayment] PRIMARY KEY CLUSTERED 
(
	[CustomerPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerMealHistory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMealHistory](
	[CustomerMealReferenceID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MealID] [int] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Override] [bit] NOT NULL,
	[LastAction] [datetime] NULL,
	[Rating] [int] NOT NULL,
	[IngredientStatus] [int] NOT NULL,
	[CustomerStatus] [int] NOT NULL,
 CONSTRAINT [PK_CustomerMealHistory] PRIMARY KEY CLUSTERED 
(
	[CustomerMealReferenceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerIngredientExclusionHistory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerIngredientExclusionHistory](
	[CustomerIngredientExclusionID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[IngredientLevelID] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[LastAction] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerImport]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerImport](
	[Name] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[StatusID] [nvarchar](255) NULL,
	[Week] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[PlanID] [nvarchar](255) NULL,
	[ICE] [nvarchar](255) NULL,
	[Warehouse] [nvarchar](255) NULL,
	[First] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerImport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerAccess]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccess](
	[CustomerAccessID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LoginDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerAccess] PRIMARY KEY CLUSTERED 
(
	[CustomerAccessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Active]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Active](
	[ActiveId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuplannerKey](
	[MenuplannerKeyId] [int] IDENTITY(1,1) NOT NULL,
	[MenuplannerKeyName] [varchar](100) NULL,
	[DisplayName] [varchar](150) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_MenuplannerKeys] PRIMARY KEY CLUSTERED 
(
	[MenuPlannerKeyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Application]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[Username] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[PasswordQuestion] [nvarchar](255) NULL,
	[PasswordAnswer] [nvarchar](255) NULL,
	[IsApproved] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangedDate] [datetime] NULL,
	[IsOnline] [bit] NULL,
	[IsLockedOut] [bit] NOT NULL,
	[LastLockedOutDate] [datetime] NULL,
	[FailedPasswordAttemptCount] [int] NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NULL,
	[FailedPasswordAnswerAttemptCount] [int] NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[Comment] [nvarchar](255) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[CustomerID] [int] NULL,
	[IsNotified] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiReport]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApiReport](
	[ApiReportId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[CustomerName] [nchar](30) NULL,
	[ApiStatus] [nchar](10) NULL,
	[Result] [varchar](250) NULL,
	[SentOn] [date] NULL,
 CONSTRAINT [PK_ApiReport] PRIMARY KEY CLUSTERED 
(
	[ApiReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ControlRegister]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlRegister](
	[PageControlID] [int] NOT NULL,
	[UsernameText] [varchar](50) NOT NULL,
	[PasswordText] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ControlRegister] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ControlProfile]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlProfile](
	[PageControlID] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ControlProfile] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ControlMarkup]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControlMarkup](
	[PageControlID] [int] NOT NULL,
	[Markup] [text] NULL,
 CONSTRAINT [PK_ControlMarkup] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControlLoginStatus]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlLoginStatus](
	[PageControlID] [int] NOT NULL,
	[LoginText] [varchar](50) NOT NULL,
	[LogoutText] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ControlLoginStatus] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ControlLoginName]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlLoginName](
	[PageControlID] [int] NOT NULL,
	[WelcomeText] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ControlLoginName] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ControlLogin]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlLogin](
	[PageControlID] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ControlLogin] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ControlChangePassword]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlChangePassword](
	[PageControlID] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ControlChangePassword] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Control]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Control](
	[ControlID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [text] NULL,
	[Path] [varchar](255) NULL,
	[ClassName] [varchar](50) NULL,
 CONSTRAINT [PK_Control] PRIMARY KEY CLUSTERED 
(
	[ControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BulkOrderHistory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BulkOrderHistory](
	[BulkOrderID] [int] IDENTITY(1,1) NOT NULL,
	[BulkOrderDate] [datetime] NULL,
	[BulkOrderGUID] [uniqueidentifier] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Status] [text] NOT NULL,
 CONSTRAINT [PK_BulkOrderHistory] PRIMARY KEY CLUSTERED 
(
	[BulkOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailTrack]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MailTrack](
	[MailTrackId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[MailId] [varchar](50) NOT NULL,
	[MailStatus] [bit] NOT NULL,
	[TrackingNum] [varchar](50) NULL,
	[SentOn] [date] NULL,
 CONSTRAINT [PK_MailTrack] PRIMARY KEY CLUSTERED 
(
	[MailTrackId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoggingForMpClient](
	[LoggingID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Logged] [datetime] NULL,
	[EventName] [varchar](225) NULL,
	[URL] [varchar](225) NULL,
	[SiteID] [int] NULL,
	[Exception] [text] NULL,
 CONSTRAINT [PK_LoggingForMpClient] PRIMARY KEY CLUSTERED 
(
	[LoggingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logging]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logging](
	[LoggingID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Logged] [datetime] NULL,
	[EventName] [varchar](255) NULL,
	[URL] [varchar](255) NULL,
	[SiteID] [int] NULL,
	[Exception] [text] NULL,
 CONSTRAINT [PK_Logging] PRIMARY KEY CLUSTERED 
(
	[LoggingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IPAccess]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IPAccess](
	[IPAccessID] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
	[AddedDate] [datetime] NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_IPAccess] PRIMARY KEY CLUSTERED 
(
	[IPAccessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvImport]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvImport](
	[ID] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[Qty] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealImageCategory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealImageCategory](
	[MealImageCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Path] [varchar](255) NOT NULL,
	[LocalPath] [varchar](255) NOT NULL,
	[Height] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Format] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ImageCategory] PRIMARY KEY CLUSTERED 
(
	[MealImageCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientCategory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientCategory](
	[IngredientCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [PK_IngredientCatagory] PRIMARY KEY CLUSTERED 
(
	[IngredientCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerIngredientCategoryExclusion]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerIngredientCategoryExclusion](
	[CustomerIngredientCategoryExclusionID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[IngredientCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerIngredientCatagoryExclusion] PRIMARY KEY CLUSTERED 
(
	[CustomerIngredientCategoryExclusionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ingredient](
	[IngredientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[RestrictionCount] [int] NOT NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FishBowl]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FishBowl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CARRIERNAME] [nvarchar](30) NULL,
	[TaxRateName] [nchar](31) NULL,
	[SOItemTypeID] [int] NULL,
	[ProductQuantity] [int] NULL,
	[UOM] [text] NULL,
	[ProductPrice] [int] NULL,
	[Taxable] [bit] NULL,
	[QuickBooksClassName] [text] NULL,
	[ShowItem] [bit] NULL,
	[KitItem] [bit] NULL,
 CONSTRAINT [PK_FishBowl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorNo] [varchar](50) NULL,
	[Application] [varchar](max) NULL,
	[Function] [varchar](max) NULL,
	[ErrorDesc] [varchar](max) NULL,
	[DetailedDesc] [varchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailNotification]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailNotification](
	[MailID] [int] NOT NULL,
	[From] [nvarchar](60) NOT NULL,
	[To] [nvarchar](max) NOT NULL,
	[CC] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_EmailNotification] PRIMARY KEY CLUSTERED 
(
	[MailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomOrder]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomOrder](
	[CustomOrderID] [int] IDENTITY(1,1) NOT NULL,
	[BuildDate] [datetime] NULL,
	[PrintDate] [datetime] NULL,
	[OrderStatusID] [int] NULL,
	[ShippedWeight] [int] NULL,
	[TrackingNumber] [varchar](255) NULL,
	[ShipDate] [datetime] NULL,
	[ReceivedDate] [datetime] NULL,
	[MealWeight] [int] NULL,
	[PackagingWeight] [int] NULL,
	[CustomerID] [int] NULL,
	[PlanID] [int] NULL,
	[Week] [int] NULL,
	[Address1] [varchar](255) NULL,
	[Address2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[StateID] [int] NULL,
	[PostalCode] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[DeliveryInstructions] [varchar](255) NULL,
	[Ice] [int] NULL,
	[BusinessAddress] [bit] NULL,
	[PaymentStatus] [int] NULL,
	[Price] [money] NULL,
	[Shipping] [money] NULL,
	[PickListComments] [varchar](255) NULL,
	[MenuComments] [varchar](255) NULL,
	[PickListOrderPrintID] [int] NULL,
	[MenuOrderPrintID] [int] NULL,
	[FirstOrder] [bit] NULL,
	[SecondOrder] [bit] NULL,
	[MovedToOrder] [bit] NULL,
	[OpportunityName] [varchar](max) NULL,
	[BuildID] [int] NULL,
 CONSTRAINT [PK_CustomOrder] PRIMARY KEY CLUSTERED 
(
	[CustomOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientStatus]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientStatus](
	[StatusID] [int] NOT NULL,
	[Description] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientLevel]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientLevel](
	[IngredientLevelID] [int] IDENTITY(1,1) NOT NULL,
	[MealText] [varchar](50) NOT NULL,
	[CustomerText] [varchar](50) NULL,
 CONSTRAINT [PK_IngredientLevel] PRIMARY KEY CLUSTERED 
(
	[IngredientLevelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerIngredientExclusion]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerIngredientExclusion](
	[CustomerIngredientExclusionID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[IngredientLevelID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerIngredientExclusion] PRIMARY KEY CLUSTERED 
(
	[CustomerIngredientExclusionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientIngredientStatus]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientIngredientStatus](
	[IngredientID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Description] [varchar](500) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTypeSettings]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTypeSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderTypeSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderRegeneration]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderRegeneration](
	[OrderRegenerationID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[MpClientRemarks] [varchar](max) NOT NULL,
	[OrdercreationRemarks] [varchar](max) NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_OrderRegeneration] PRIMARY KEY CLUSTERED 
(
	[OrderRegenerationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderPayment]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderPayment](
	[OrderPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Amount] [money] NULL,
	[CardNumber] [varchar](255) NOT NULL,
	[ExpMonth] [int] NOT NULL,
	[ExpYear] [int] NOT NULL,
	[LastFour] [char](4) NOT NULL,
	[NameOnCard] [varchar](255) NOT NULL,
	[CardType] [int] NOT NULL,
	[SecurityCode] [varchar](4) NULL,
	[AuthDate] [datetime] NULL,
	[AuthResponseCode] [int] NULL,
	[AuthApproved] [bit] NULL,
	[AuthTransactionID] [varchar](255) NULL,
	[AuthMessage] [varchar](255) NULL,
	[AuthAuthorizationCode] [varchar](255) NULL,
	[CaptureDate] [datetime] NULL,
	[CaptureResponseCode] [int] NULL,
	[CaptureApproved] [bit] NULL,
	[CaptureTransactionID] [varchar](255) NULL,
	[CaptureMessage] [varchar](255) NULL,
	[CaptureAuthorizationCode] [varchar](255) NULL,
 CONSTRAINT [PK_OrderPayment] PRIMARY KEY CLUSTERED 
(
	[OrderPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDayMealHistory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDayMealHistory](
	[OrderDayMealID] [int] NOT NULL,
	[MealID] [int] NOT NULL,
	[IsSubstitute] [bit] NOT NULL,
	[OrderDayID] [int] NOT NULL,
	[MealTypeID] [int] NOT NULL,
	[LastAction] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Physical]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Physical](
	[PhysicalID] [int] IDENTITY(1,1) NOT NULL,
	[PhysicalDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Items] [int] NOT NULL,
 CONSTRAINT [PK_Physical] PRIMARY KEY CLUSTERED 
(
	[PhysicalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PendingNotification]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PendingNotification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationUser] [int] NOT NULL,
	[Message] [varchar](1000) NOT NULL,
	[IsNotified] [bit] NOT NULL,
 CONSTRAINT [PK_PendingNotification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyProfileDetails]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MyProfileDetails](
	[CustomerID] [int] NOT NULL,
	[CurrentWeight] [varchar](255) NULL,
	[GoalWeight] [varchar](255) NULL,
	[TimeFrame] [varchar](255) NULL,
	[Height] [varchar](255) NULL,
	[Inches] [varchar](255) NULL,
	[ActivityLevel] [varchar](255) NULL,
	[Gender] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MembershipLogin]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MembershipLogin](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [varchar](200) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
	[CustomerID] [int] NULL,
	[First] [varchar](50) NOT NULL,
	[Last] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealType]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealType](
	[MealTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MealType] PRIMARY KEY CLUSTERED 
(
	[MealTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealStatus]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MealStatus](
	[MealStatus] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MealStatus] PRIMARY KEY CLUSTERED 
(
	[MealStatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDayHistory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDayHistory](
	[OrderDayID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[LastAction] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyNames] [ntext] NULL,
	[PropertyValuesString] [ntext] NULL,
	[PropertyValuesBinary] [image] NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Profile_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrinterDetails]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrinterDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PrinterName] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PrinterDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Site]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Site](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[URL] [varchar](50) NULL,
	[ContactPhone] [varchar](50) NULL,
	[ContactEmail] [varchar](50) NULL,
	[ThemeID] [int] NULL,
	[TitlePrefix] [varchar](50) NULL,
	[UIThemeID] [int] NULL,
	[StagingSiteID] [int] NULL,
	[BackupSiteID] [int] NULL,
	[GoogleAnalytics] [varchar](50) NULL,
	[Active] [bit] NULL,
	[NotActiveRediret] [varchar](50) NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Setting](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Value] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesforceSyncReport]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesforceSyncReport](
	[SalesforceReportID] [int] IDENTITY(1,1) NOT NULL,
	[SyncDate] [datetime] NULL,
	[SyncGUID] [uniqueidentifier] NOT NULL,
	[ErrorType] [int] NOT NULL,
	[CustomerName] [varchar](500) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Exception] [text] NOT NULL,
 CONSTRAINT [PK_SalesforceSyncReport] PRIMARY KEY CLUSTERED 
(
	[SalesforceReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlanDetails]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlanDetails](
	[CustomerID] [int] NOT NULL,
	[PlanType] [varchar](255) NULL,
	[DaysPerWeek] [varchar](255) NULL,
	[MealsPerDay] [varchar](255) NULL,
	[Snacks] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stagecu]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stagecu](
	[CustomerID] [float] NULL,
	[Mealcount] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRatings]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRatings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MealID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempMealQuantity]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempMealQuantity](
	[TempMealQuantityID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NULL,
	[AllocatedQuantity] [int] NULL,
	[ChangedAllocatedQuantity] [int] NULL,
	[IsChanged] [bit] NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TempMealQuantityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempMealMerge]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempMealMerge](
	[MealMergeID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[CustomOrderDayMealID] [int] NULL,
	[MealID] [int] NULL,
	[MealTypeID] [int] NULL,
	[Day] [int] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempCustomMenu]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempCustomMenu](
	[TempCustomMenuID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NULL,
	[MealName] [varchar](255) NULL,
	[MealDescription] [varchar](max) NULL,
	[MealTypeID] [int] NULL,
	[Day] [int] NULL,
	[IsSubstitute] [bit] NULL,
	[OrderID] [int] NULL,
	[DayCount] [int] NULL,
	[DayMealID] [int] NULL,
	[CustomerID] [int] NULL,
	[IsAutoSubstitute] [bit] NULL,
	[Priority] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ShortName] [varchar](10) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[CustomerAddressID] [int] IDENTITY(10000,1) NOT NULL,
	[Address1] [varchar](255) NOT NULL,
	[Address2] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[StateID] [int] NOT NULL,
	[PostalCode] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[DeliveryInstructions] [varchar](255) NOT NULL,
	[BusinessAddress] [bit] NOT NULL,
	[BusinessName] [varchar](255) NULL,
	[First] [varchar](255) NULL,
	[Last] [varchar](255) NULL,
 CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED 
(
	[CustomerAddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteURL]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteURL](
	[SiteID] [int] NOT NULL,
	[URL] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SiteURL] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[URL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[ExpectedDate] [datetime] NULL,
	[ReceivedDate] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[RoleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_UsersInRoles_1] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Build]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Build](
	[BuildID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[UserID] [int] NULL,
	[PlanID] [int] NULL,
	[ProgramID] [int] NULL,
	[InProgress] [bit] NOT NULL,
 CONSTRAINT [PK_Build] PRIMARY KEY CLUSTERED 
(
	[BuildID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomOrderDay]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomOrderDay](
	[CustomOrderDayID] [int] IDENTITY(1,1) NOT NULL,
	[CustomOrderID] [int] NOT NULL,
	[Day] [int] NOT NULL,
 CONSTRAINT [PK_CustomOrderDay] PRIMARY KEY CLUSTERED 
(
	[CustomOrderDayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Page](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[Name] [varchar](50) NULL,
	[URL] [varchar](255) NULL,
	[TitleBar] [varchar](255) NULL,
	[LinkText] [varchar](50) NULL,
	[MetaDescription] [text] NULL,
	[MetaKeywords] [text] NULL,
	[InHeader] [text] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[PublishDate] [datetime] NULL,
	[ExpiresDate] [datetime] NULL,
	[ParentPageID] [int] NULL,
	[PageCategoryID] [int] NULL,
	[ThemeLayoutID] [int] NULL,
	[ListOrder] [int] NULL,
	[OnSitemap] [bit] NULL,
	[MembersOnly] [bit] NULL,
	[AdminsOnly] [bit] NULL,
	[RequireSSL] [bit] NULL,
	[IsPublished] [bit] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PdfTemplate]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PdfTemplate](
	[PdfTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[PdfTemplateName] [varchar](50) NULL,
	[ProgramID] [int] NULL,
 CONSTRAINT [PK_PdfTemplate] PRIMARY KEY CLUSTERED 
(
	[PdfTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientIngredientCategory]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientIngredientCategory](
	[IngredientIngredientCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[IngredientCategoryID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
 CONSTRAINT [PK_IngredientIngredientCategory] PRIMARY KEY CLUSTERED 
(
	[IngredientIngredientCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Meal](
	[MealID] [int] IDENTITY(1000,1) NOT NULL,
	[Active] [bit] NOT NULL,
	[SKU] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[MealTypeID] [int] NOT NULL,
	[ShortDescription] [varchar](255) NOT NULL,
	[LongDescription] [text] NOT NULL,
	[Calories] [decimal](10, 2) NOT NULL,
	[CaloriesFromFat] [decimal](10, 2) NOT NULL,
	[TotalFat] [decimal](10, 2) NOT NULL,
	[SaturatedFat] [decimal](10, 2) NOT NULL,
	[TransFat] [decimal](10, 2) NOT NULL,
	[Cholesterol] [decimal](10, 2) NOT NULL,
	[Protein] [decimal](10, 2) NOT NULL,
	[Carbohydrate] [decimal](10, 2) NOT NULL,
	[DietaryFiber] [decimal](10, 2) NOT NULL,
	[Sugars] [decimal](10, 2) NOT NULL,
	[Sodium] [decimal](10, 2) NOT NULL,
	[AddDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CutoffQuantity] [int] NOT NULL,
	[QuantityInProcess] [int] NOT NULL,
	[QuantityShipped] [int] NOT NULL,
	[AlertLevelQuantity] [int] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ProductNumber] [varchar](50) NOT NULL,
	[AllocatedQuantity] [int] NOT NULL,
	[MenuplannerActive] [int] NULL,
	[DisplayOrder] [int] NULL,
	[TotalQuantity] [int] NULL,
	[IsGluten] [bit] NULL,
	[MpClientActive] [bit] NULL,
	[ingredient_label] [ntext] NULL,
 CONSTRAINT [PK_Meal_1] PRIMARY KEY CLUSTERED 
(
	[MealID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meal'
GO
/****** Object:  Table [dbo].[OrderDayMeal]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDayMeal](
	[OrderDayMealID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[IsSubstitute] [bit] NOT NULL,
	[OrderDayID] [int] NOT NULL,
	[MealTypeID] [int] NOT NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_OrderDayMeal] PRIMARY KEY CLUSTERED 
(
	[OrderDayMealID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerMeal]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMeal](
	[CustomerMealID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MealID] [int] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Override] [bit] NOT NULL,
	[LastAction] [datetime] NULL,
	[Rating] [int] NOT NULL,
	[IngredientStatus] [int] NOT NULL,
	[CustomerStatus] [int] NOT NULL,
 CONSTRAINT [PK_CustomerMeal] PRIMARY KEY CLUSTERED 
(
	[CustomerMealID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryItem](
	[InventoryItemID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CostPerUnit] [money] NOT NULL,
	[CostPerCase] [money] NOT NULL,
	[UnitsPerCase] [int] NOT NULL,
	[OrderLeadDays] [int] NOT NULL,
	[QuantityInProcess] [int] NOT NULL,
	[QuantityShipped] [int] NOT NULL,
	[QuantityLost] [int] NOT NULL,
	[LocatorBin] [int] NOT NULL,
	[LocatorLevel] [varchar](1) NOT NULL,
	[ItemType] [int] NOT NULL,
 CONSTRAINT [PK_InventoryItem] PRIMARY KEY CLUSTERED 
(
	[InventoryItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgentNote]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgentNote](
	[AgentNoteID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[Subject] [varchar](255) NOT NULL,
	[Notes] [text] NOT NULL,
	[NoteDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[PurchaseOrderID] [int] NULL,
	[MealID] [int] NULL,
	[PlanID] [int] NULL,
	[InventoryItemID] [int] NULL,
 CONSTRAINT [PK_AgentNote] PRIMARY KEY CLUSTERED 
(
	[AgentNoteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InventoryItemUsage]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryItemUsage](
	[InventoryItemUsageID] [int] IDENTITY(1,1) NOT NULL,
	[ShipDate] [datetime] NOT NULL,
	[InventoryItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_MealUsage] PRIMARY KEY CLUSTERED 
(
	[InventoryItemUsageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomOrderDayMeal]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomOrderDayMeal](
	[CustomOrderDayMealID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[MealName] [varchar](255) NULL,
	[MealDescription] [varchar](max) NULL,
	[IsSubstitute] [bit] NOT NULL,
	[CustomOrderDayID] [int] NOT NULL,
	[MealTypeID] [int] NOT NULL,
	[IsAutoSubstitute] [bit] NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_CustomOrderDayMeal] PRIMARY KEY CLUSTERED 
(
	[CustomOrderDayMealID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PermissionByRole]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PermissionByRole](
	[PermissionRoleId] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsFullAccess] [bit] NULL,
	[IsReadOnly] [bit] NULL,
	[IsEditAccess] [bit] NULL,
	[IsDeleteAccess] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdtaedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_PermissionByRole] PRIMARY KEY CLUSTERED 
(
	[PermissionRoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PageControl]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PageControl](
	[PageControlID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[PageContainerID] [int] NOT NULL,
	[ControlID] [int] NOT NULL,
	[ControlOptionID] [int] NOT NULL,
	[ControlOrder] [int] NOT NULL,
	[ControlNickname] [varchar](50) NULL,
	[ControlInheritID] [int] NOT NULL,
 CONSTRAINT [PK_PageControl] PRIMARY KEY CLUSTERED 
(
	[PageControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PageAlias]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PageAlias](
	[PageAliasID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NOT NULL,
	[AliasURL] [varchar](255) NOT NULL,
	[PageID] [int] NOT NULL,
	[PermanentRedirect] [bit] NOT NULL,
 CONSTRAINT [PK_PageAlias] PRIMARY KEY CLUSTERED 
(
	[PageAliasID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MealPlanDetails]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealPlanDetails](
	[MealPlanID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[PlanID] [int] NOT NULL,
 CONSTRAINT [PK_MealPlanDetails] PRIMARY KEY CLUSTERED 
(
	[MealPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealInventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealInventoryItem](
	[MealInventoryItemID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[InventoryItemID] [int] NOT NULL,
	[ItemCount] [int] NOT NULL,
 CONSTRAINT [PK_MealInventoryItem] PRIMARY KEY CLUSTERED 
(
	[MealInventoryItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealIngredient]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealIngredient](
	[MealIngredientID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[IngredientLevelID] [int] NOT NULL,
 CONSTRAINT [PK_MealIngredient] PRIMARY KEY CLUSTERED 
(
	[MealIngredientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealSubstitute]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealSubstitute](
	[MealSubstituteID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[SubstituteMealID] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[SubstitutePlanID] [int] NOT NULL,
 CONSTRAINT [PK_MealSubstitute] PRIMARY KEY CLUSTERED 
(
	[MealSubstituteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanWeek]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlanWeek](
	[PlanWeekID] [int] IDENTITY(1,1) NOT NULL,
	[Week] [int] NOT NULL,
	[ShortDescription] [varchar](255) NULL,
	[LongDescription] [text] NULL,
	[PlanID] [int] NOT NULL,
 CONSTRAINT [PK_PlanWeek] PRIMARY KEY CLUSTERED 
(
	[PlanWeekID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhysicalInventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysicalInventoryItem](
	[PhysicalInventoryItemID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PhysicalID] [int] NOT NULL,
	[PendingOrders] [int] NOT NULL,
	[Reported] [int] NOT NULL,
 CONSTRAINT [PK_PhysicalInventoryItem] PRIMARY KEY CLUSTERED 
(
	[PhysicalInventoryItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderItem]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderItem](
	[PurchaseOrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryItemID] [int] NOT NULL,
	[QuantityOrdered] [int] NOT NULL,
	[QuantityReceived] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderItem] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDay]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDay](
	[PlanDayID] [int] IDENTITY(1,1) NOT NULL,
	[PlanWeekID] [int] NOT NULL,
	[Day] [int] NOT NULL,
 CONSTRAINT [PK_PlanDay] PRIMARY KEY CLUSTERED 
(
	[PlanDayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDayMeal]    Script Date: 01/05/2017 12:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDayMeal](
	[PlanDayMealID] [int] IDENTITY(1,1) NOT NULL,
	[PlanDayID] [int] NOT NULL,
	[MealTypeID] [int] NOT NULL,
	[MealID] [int] NOT NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_PlanDayMeal] PRIMARY KEY CLUSTERED 
(
	[PlanDayMealID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_AgentNote_AgentID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote] ADD  CONSTRAINT [DF_AgentNote_AgentID]  DEFAULT ((0)) FOR [AgentID]
GO
/****** Object:  Default [DF_AgentNote_Subject]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote] ADD  CONSTRAINT [DF_AgentNote_Subject]  DEFAULT ('') FOR [Subject]
GO
/****** Object:  Default [DF_AgentNote_Notes]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote] ADD  CONSTRAINT [DF_AgentNote_Notes]  DEFAULT ('') FOR [Notes]
GO
/****** Object:  Default [DF_Build_Status]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Build] ADD  CONSTRAINT [DF_Build_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Build_InProgress]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Build] ADD  CONSTRAINT [DF_Build_InProgress]  DEFAULT ((0)) FOR [InProgress]
GO
/****** Object:  Default [DF_Table_1_ErrorType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[BulkOrderHistory] ADD  CONSTRAINT [DF_Table_1_ErrorType]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF_Table_1_CustomerName]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[BulkOrderHistory] ADD  CONSTRAINT [DF_Table_1_CustomerName]  DEFAULT ((0)) FOR [OrderID]
GO
/****** Object:  Default [DF_Table_1_Exception]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[BulkOrderHistory] ADD  CONSTRAINT [DF_Table_1_Exception]  DEFAULT ('') FOR [Status]
GO
/****** Object:  Default [DF_Carrier_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Carrier] ADD  CONSTRAINT [DF_Carrier_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Carrier_Description]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Carrier] ADD  CONSTRAINT [DF_Carrier_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Carrier_Active]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Carrier] ADD  CONSTRAINT [DF_Carrier_Active]  DEFAULT ((0)) FOR [Active]
GO
/****** Object:  Default [DF_ControlChangePassword_Title]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlChangePassword] ADD  CONSTRAINT [DF_ControlChangePassword_Title]  DEFAULT ('Change Password') FOR [Title]
GO
/****** Object:  Default [DF_ControlLogin_Title]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlLogin] ADD  CONSTRAINT [DF_ControlLogin_Title]  DEFAULT ('Login') FOR [Title]
GO
/****** Object:  Default [DF_ControlLoginName_WelcomeText]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlLoginName] ADD  CONSTRAINT [DF_ControlLoginName_WelcomeText]  DEFAULT ('Welcome') FOR [WelcomeText]
GO
/****** Object:  Default [DF_ControlLoginStatus_LoginText]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlLoginStatus] ADD  CONSTRAINT [DF_ControlLoginStatus_LoginText]  DEFAULT ('Login') FOR [LoginText]
GO
/****** Object:  Default [DF_ControlLoginStatus_LogoutText]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlLoginStatus] ADD  CONSTRAINT [DF_ControlLoginStatus_LogoutText]  DEFAULT ('Logout') FOR [LogoutText]
GO
/****** Object:  Default [DF_ControlMarkup_Markup]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlMarkup] ADD  CONSTRAINT [DF_ControlMarkup_Markup]  DEFAULT ('') FOR [Markup]
GO
/****** Object:  Default [DF_ControlProfile_Title]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlProfile] ADD  CONSTRAINT [DF_ControlProfile_Title]  DEFAULT ('Profile') FOR [Title]
GO
/****** Object:  Default [DF_ControlRegister_UsernameText]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlRegister] ADD  CONSTRAINT [DF_ControlRegister_UsernameText]  DEFAULT ('Username') FOR [UsernameText]
GO
/****** Object:  Default [DF_ControlRegister_PasswordText]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[ControlRegister] ADD  CONSTRAINT [DF_ControlRegister_PasswordText]  DEFAULT ('Password') FOR [PasswordText]
GO
/****** Object:  Default [DF_Country_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Country_Abbreviation]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_Abbreviation]  DEFAULT ('') FOR [Abbreviation]
GO
/****** Object:  Default [DF_Customer_First]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_First]  DEFAULT ('') FOR [First]
GO
/****** Object:  Default [DF_Customer_Last]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Last]  DEFAULT ('') FOR [Last]
GO
/****** Object:  Default [DF_Customer_LeadSource]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LeadSource]  DEFAULT ('') FOR [LeadSource]
GO
/****** Object:  Default [DF_Customer_Email]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Email]  DEFAULT ('') FOR [Email]
GO
/****** Object:  Default [DF_Customer_BillingAddressID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_BillingAddressID]  DEFAULT ((0)) FOR [BillingAddressID]
GO
/****** Object:  Default [DF_Customer_ShippingAddressID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_ShippingAddressID]  DEFAULT ((0)) FOR [ShippingAddressID]
GO
/****** Object:  Default [DF_Customer_CustomerStatusID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomerStatusID]  DEFAULT ((1)) FOR [CustomerStatusID]
GO
/****** Object:  Default [DF_Customer_Ice]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Ice]  DEFAULT ((2)) FOR [Ice]
GO
/****** Object:  Default [DF_Customer_AlwaysReviewHold]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AlwaysReviewHold]  DEFAULT ((0)) FOR [AlwaysReviewHold]
GO
/****** Object:  Default [DF_Customer_PreferedShipDay]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PreferedShipDay]  DEFAULT ((1)) FOR [PreferredShipDay]
GO
/****** Object:  Default [DF_Customer_IsDeleted]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Customer_Active]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Active]  DEFAULT ((0)) FOR [Active]
GO
/****** Object:  Default [DF_Customer_CarrierID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CarrierID]  DEFAULT ((12)) FOR [CarrierID]
GO
/****** Object:  Default [DF_CustomerAddress_Address1]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_Address1]  DEFAULT ('') FOR [Address1]
GO
/****** Object:  Default [DF_CustomerAddress_Address2]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_Address2]  DEFAULT ('') FOR [Address2]
GO
/****** Object:  Default [DF_CustomerAddress_City]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_City]  DEFAULT ('') FOR [City]
GO
/****** Object:  Default [DF_CustomerAddress_StateProvinceID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_StateProvinceID]  DEFAULT ((1)) FOR [StateID]
GO
/****** Object:  Default [DF_CustomerAddress_PostalCode]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_PostalCode]  DEFAULT ('') FOR [PostalCode]
GO
/****** Object:  Default [DF_CustomerAddress_Phone]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_Phone]  DEFAULT ('') FOR [Phone]
GO
/****** Object:  Default [DF_CustomerAddress_DeliveryInstructions]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_DeliveryInstructions]  DEFAULT ('') FOR [DeliveryInstructions]
GO
/****** Object:  Default [DF_CustomerAddress_BusinessAddress]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress] ADD  CONSTRAINT [DF_CustomerAddress_BusinessAddress]  DEFAULT ((0)) FOR [BusinessAddress]
GO
/****** Object:  Default [DF_CustomerIngredientExclusionHistory_Status]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerIngredientExclusionHistory] ADD  CONSTRAINT [DF_CustomerIngredientExclusionHistory_Status]  DEFAULT ('') FOR [Status]
GO
/****** Object:  Default [DF_CustomerMeal_Approved]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMeal] ADD  CONSTRAINT [DF_CustomerMeal_Approved]  DEFAULT ((0)) FOR [Approved]
GO
/****** Object:  Default [DF_CustomerMeal_Override]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMeal] ADD  CONSTRAINT [DF_CustomerMeal_Override]  DEFAULT ((0)) FOR [Override]
GO
/****** Object:  Default [DF_CustomerMeal_Rating]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMeal] ADD  CONSTRAINT [DF_CustomerMeal_Rating]  DEFAULT ((0)) FOR [Rating]
GO
/****** Object:  Default [DF_CustomerMeal_IngredientStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMeal] ADD  CONSTRAINT [DF_CustomerMeal_IngredientStatus]  DEFAULT ((1)) FOR [IngredientStatus]
GO
/****** Object:  Default [DF_CustomerMeal_CustomerStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMeal] ADD  CONSTRAINT [DF_CustomerMeal_CustomerStatus]  DEFAULT ((0)) FOR [CustomerStatus]
GO
/****** Object:  Default [DF_CustomerMealHistory_Approved]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMealHistory] ADD  CONSTRAINT [DF_CustomerMealHistory_Approved]  DEFAULT ((0)) FOR [Approved]
GO
/****** Object:  Default [DF_CustomerMealHistory_Override]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMealHistory] ADD  CONSTRAINT [DF_CustomerMealHistory_Override]  DEFAULT ((0)) FOR [Override]
GO
/****** Object:  Default [DF_CustomerMealHistory_Rating]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMealHistory] ADD  CONSTRAINT [DF_CustomerMealHistory_Rating]  DEFAULT ((0)) FOR [Rating]
GO
/****** Object:  Default [DF_CustomerMealHistory_IngredientStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMealHistory] ADD  CONSTRAINT [DF_CustomerMealHistory_IngredientStatus]  DEFAULT ((1)) FOR [IngredientStatus]
GO
/****** Object:  Default [DF_CustomerMealHistory_CustomerStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMealHistory] ADD  CONSTRAINT [DF_CustomerMealHistory_CustomerStatus]  DEFAULT ((0)) FOR [CustomerStatus]
GO
/****** Object:  Default [DF_CustomerPayment_CardNumber]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_CardNumber]  DEFAULT ('') FOR [CardNumber]
GO
/****** Object:  Default [DF_CustomerPayment_ExpMonth]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_ExpMonth]  DEFAULT ((1)) FOR [ExpMonth]
GO
/****** Object:  Default [DF_CustomerPayment_ExpYear]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_ExpYear]  DEFAULT ((11)) FOR [ExpYear]
GO
/****** Object:  Default [DF_CustomerPayment_LastFour]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_LastFour]  DEFAULT ('') FOR [LastFour]
GO
/****** Object:  Default [DF_CustomerPayment_NameOnCard]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_NameOnCard]  DEFAULT ('') FOR [NameOnCard]
GO
/****** Object:  Default [DF_CustomerPayment_CardType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_CardType]  DEFAULT ((1)) FOR [CardType]
GO
/****** Object:  Default [DF_CustomerPayment_SecurityCode]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_SecurityCode]  DEFAULT ('') FOR [SecurityCode]
GO
/****** Object:  Default [DF_CustomerPayment_IsActive]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_IsActive]  DEFAULT ((1)) FOR [DefaultPayment]
GO
/****** Object:  Default [DF_CustomerPlan_PlanWeekID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_PlanWeekID]  DEFAULT ((0)) FOR [Week]
GO
/****** Object:  Default [DF_CustomerPlan_TotalWeek]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_TotalWeek]  DEFAULT ((0)) FOR [TotalWeek]
GO
/****** Object:  Default [DF_CustomerPlan_PreferedShipDay]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_PreferedShipDay]  DEFAULT ((1)) FOR [PreferedShipDayOfWeek]
GO
/****** Object:  Default [DF_CustomerPlan_IsDynamic]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_IsDynamic]  DEFAULT ((0)) FOR [IsDynamic]
GO
/****** Object:  Default [DF_CustomerPlan_DynamicBreakfast]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_DynamicBreakfast]  DEFAULT ((0)) FOR [DynamicBreakfast]
GO
/****** Object:  Default [DF_CustomerPlan_DynamicLunch]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_DynamicLunch]  DEFAULT ((0)) FOR [DynamicLunch]
GO
/****** Object:  Default [DF_CustomerPlan_DynamicDinner]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_DynamicDinner]  DEFAULT ((0)) FOR [DynamicDinner]
GO
/****** Object:  Default [DF_CustomerPlan_DynamicSnack]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_DynamicSnack]  DEFAULT ((0)) FOR [DynamicSnack]
GO
/****** Object:  Default [DF_CustomerPlan_IsDeleted]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan] ADD  CONSTRAINT [DF_CustomerPlan_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_EmailNotification_ModifiedDate]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[EmailNotification] ADD  CONSTRAINT [DF_EmailNotification_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Ingredient_IsVisible]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF_Ingredient_IsVisible]  DEFAULT ((0)) FOR [IsVisible]
GO
/****** Object:  Default [DF__Ingredien__Restr__7F2BE32F]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Ingredient] ADD  DEFAULT ((0)) FOR [RestrictionCount]
GO
/****** Object:  Default [DF_IngredientCatagory_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[IngredientCategory] ADD  CONSTRAINT [DF_IngredientCatagory_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_IngredientCategory_IsVisible]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[IngredientCategory] ADD  CONSTRAINT [DF_IngredientCategory_IsVisible]  DEFAULT ((0)) FOR [IsVisible]
GO
/****** Object:  Default [DF_IngredientLevel_LevelText]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[IngredientLevel] ADD  CONSTRAINT [DF_IngredientLevel_LevelText]  DEFAULT ('') FOR [MealText]
GO
/****** Object:  Default [DF_InventoryItem_Quantity]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_InventoryItem_CostPerUnit]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_CostPerUnit]  DEFAULT ((0)) FOR [CostPerUnit]
GO
/****** Object:  Default [DF_InventoryItem_CostPerCase]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_CostPerCase]  DEFAULT ((0)) FOR [CostPerCase]
GO
/****** Object:  Default [DF_InventoryItem_UnitsPerCase]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_UnitsPerCase]  DEFAULT ((0)) FOR [UnitsPerCase]
GO
/****** Object:  Default [DF_InventoryItem_OrderLeadDays]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_OrderLeadDays]  DEFAULT ((0)) FOR [OrderLeadDays]
GO
/****** Object:  Default [DF_InventoryItem_QuantityInProcess]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_QuantityInProcess]  DEFAULT ((0)) FOR [QuantityInProcess]
GO
/****** Object:  Default [DF_InventoryItem_QuantityShipped]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_QuantityShipped]  DEFAULT ((0)) FOR [QuantityShipped]
GO
/****** Object:  Default [DF_InventoryItem_QuantityLost]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_QuantityLost]  DEFAULT ((0)) FOR [QuantityLost]
GO
/****** Object:  Default [DF_InventoryItem_LocatorBin]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_LocatorBin]  DEFAULT ((1)) FOR [LocatorBin]
GO
/****** Object:  Default [DF_InventoryItem_LocatorLevel]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_LocatorLevel]  DEFAULT ('A') FOR [LocatorLevel]
GO
/****** Object:  Default [DF_InventoryItem_ItemType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_ItemType]  DEFAULT ((1)) FOR [ItemType]
GO
/****** Object:  Default [DF_MealUsage_Count]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItemUsage] ADD  CONSTRAINT [DF_MealUsage_Count]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_Meal_Active]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Active]  DEFAULT ((1)) FOR [Active]
GO
/****** Object:  Default [DF_Meal_SKU]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_SKU]  DEFAULT ('') FOR [SKU]
GO
/****** Object:  Default [DF_Meal_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Meal_MealTypeID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_MealTypeID]  DEFAULT ((1)) FOR [MealTypeID]
GO
/****** Object:  Default [DF_Meal_ShortDescription]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_ShortDescription]  DEFAULT ('') FOR [ShortDescription]
GO
/****** Object:  Default [DF_Meal_Description]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Description]  DEFAULT ('') FOR [LongDescription]
GO
/****** Object:  Default [DF_Meal_CalorieGroupID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_CalorieGroupID]  DEFAULT ((0)) FOR [Calories]
GO
/****** Object:  Default [DF_Meal_CaloriesFromFat]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_CaloriesFromFat]  DEFAULT ((0)) FOR [CaloriesFromFat]
GO
/****** Object:  Default [DF_Meal_Fat]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Fat]  DEFAULT ((0)) FOR [TotalFat]
GO
/****** Object:  Default [DF_Meal_SaturatedFat]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_SaturatedFat]  DEFAULT ((0)) FOR [SaturatedFat]
GO
/****** Object:  Default [DF_Meal_TransFat]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_TransFat]  DEFAULT ((0)) FOR [TransFat]
GO
/****** Object:  Default [DF_Meal_Cholesterol]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Cholesterol]  DEFAULT ((0)) FOR [Cholesterol]
GO
/****** Object:  Default [DF_Meal_Protein]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Protein]  DEFAULT ((0)) FOR [Protein]
GO
/****** Object:  Default [DF_Meal_Carbs]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Carbs]  DEFAULT ((0)) FOR [Carbohydrate]
GO
/****** Object:  Default [DF_Meal_Fiber]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Fiber]  DEFAULT ((0)) FOR [DietaryFiber]
GO
/****** Object:  Default [DF_Meal_Sugars]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Sugars]  DEFAULT ((0)) FOR [Sugars]
GO
/****** Object:  Default [DF_Meal_Sodium]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Sodium]  DEFAULT ((0)) FOR [Sodium]
GO
/****** Object:  Default [DF_Meal_Status]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Meal_Quantity]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_Meal_CutoffQuantity]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_CutoffQuantity]  DEFAULT ((0)) FOR [CutoffQuantity]
GO
/****** Object:  Default [DF_Meal_QuantityInProcess]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_QuantityInProcess]  DEFAULT ((0)) FOR [QuantityInProcess]
GO
/****** Object:  Default [DF_Meal_QuantityShipped]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_QuantityShipped]  DEFAULT ((0)) FOR [QuantityShipped]
GO
/****** Object:  Default [DF_Meal_AlertLevelQuantity]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_AlertLevelQuantity]  DEFAULT ((0)) FOR [AlertLevelQuantity]
GO
/****** Object:  Default [DF_Meal_ItemCount]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_ItemCount]  DEFAULT ((0)) FOR [ItemCount]
GO
/****** Object:  Default [DF_Meal_isDeleted]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_isDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Meal_SKU1]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_SKU1]  DEFAULT ('') FOR [ProductNumber]
GO
/****** Object:  Default [DF__Meal__AllocatedQ__5BA4467E]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF__Meal__AllocatedQ__5BA4467E]  DEFAULT ((0)) FOR [AllocatedQuantity]
GO
/****** Object:  Default [DF_Meal_TotalQuantity]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal] ADD  CONSTRAINT [DF_Meal_TotalQuantity]  DEFAULT ((0)) FOR [TotalQuantity]
GO
/****** Object:  Default [DF_ImageCategory_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealImageCategory] ADD  CONSTRAINT [DF_ImageCategory_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_ImageCategory_Path]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealImageCategory] ADD  CONSTRAINT [DF_ImageCategory_Path]  DEFAULT ('') FOR [Path]
GO
/****** Object:  Default [DF_ImageCategory_LocalPath]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealImageCategory] ADD  CONSTRAINT [DF_ImageCategory_LocalPath]  DEFAULT ('') FOR [LocalPath]
GO
/****** Object:  Default [DF_MealPlanDetails_MealID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealPlanDetails] ADD  CONSTRAINT [DF_MealPlanDetails_MealID]  DEFAULT ((0)) FOR [MealID]
GO
/****** Object:  Default [DF_MealPlanDetails_PlanID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealPlanDetails] ADD  CONSTRAINT [DF_MealPlanDetails_PlanID]  DEFAULT ((0)) FOR [PlanID]
GO
/****** Object:  Default [DF_MealStatus_MealStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealStatus] ADD  CONSTRAINT [DF_MealStatus_MealStatus]  DEFAULT ((0)) FOR [MealStatus]
GO
/****** Object:  Default [DF_MealStatus_Description]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealStatus] ADD  CONSTRAINT [DF_MealStatus_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_MealSubstitute_Sequence]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealSubstitute] ADD  CONSTRAINT [DF_MealSubstitute_Sequence]  DEFAULT ((1)) FOR [Priority]
GO
/****** Object:  Default [DF_MealSubstitute_SubstitutePlanID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealSubstitute] ADD  CONSTRAINT [DF_MealSubstitute_SubstitutePlanID]  DEFAULT ((2)) FOR [SubstitutePlanID]
GO
/****** Object:  Default [DF_MealType_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealType] ADD  CONSTRAINT [DF_MealType_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_MembershipLogin_First]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MembershipLogin] ADD  CONSTRAINT [DF_MembershipLogin_First]  DEFAULT ('') FOR [First]
GO
/****** Object:  Default [DF_MembershipLogin_Last]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MembershipLogin] ADD  CONSTRAINT [DF_MembershipLogin_Last]  DEFAULT ('') FOR [Last]
GO
/****** Object:  Default [DF_Order_OrderStatusID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderStatusID]  DEFAULT ((1)) FOR [OrderStatusID]
GO
/****** Object:  Default [DF_Order_ShippedWeight]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippedWeight]  DEFAULT ((0)) FOR [ShippedWeight]
GO
/****** Object:  Default [DF_Order_TrackingNumber]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_TrackingNumber]  DEFAULT ('') FOR [TrackingNumber]
GO
/****** Object:  Default [DF_Order_MealWeight]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_MealWeight]  DEFAULT ((0)) FOR [MealWeight]
GO
/****** Object:  Default [DF_Order_PackagingWeight]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_PackagingWeight]  DEFAULT ((0)) FOR [PackagingWeight]
GO
/****** Object:  Default [DF_Order_PlanID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_PlanID]  DEFAULT ((1)) FOR [PlanID]
GO
/****** Object:  Default [DF_Order_Week]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Week]  DEFAULT ((0)) FOR [Week]
GO
/****** Object:  Default [DF_Order_Address1]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Address1]  DEFAULT ('') FOR [Address1]
GO
/****** Object:  Default [DF_Order_Address2]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Address2]  DEFAULT ('') FOR [Address2]
GO
/****** Object:  Default [DF_Order_City]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_City]  DEFAULT ('') FOR [City]
GO
/****** Object:  Default [DF_Order_StateID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_StateID]  DEFAULT ((1)) FOR [StateID]
GO
/****** Object:  Default [DF_Order_PostalCode]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_PostalCode]  DEFAULT ('') FOR [PostalCode]
GO
/****** Object:  Default [DF_Order_Phone]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Phone]  DEFAULT ('') FOR [Phone]
GO
/****** Object:  Default [DF_Order_DeliveryInstructions]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DeliveryInstructions]  DEFAULT ('') FOR [DeliveryInstructions]
GO
/****** Object:  Default [DF_Order_Ice]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Ice]  DEFAULT ((1)) FOR [Ice]
GO
/****** Object:  Default [DF_Order_BusinessAddress]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_BusinessAddress]  DEFAULT ((0)) FOR [BusinessAddress]
GO
/****** Object:  Default [DF_Order_PaymentStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_PaymentStatus]  DEFAULT ((1)) FOR [PaymentStatus]
GO
/****** Object:  Default [DF_Order_FirstOrder]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_FirstOrder]  DEFAULT ((0)) FOR [FirstOrder]
GO
/****** Object:  Default [DF_Order_SecondOrder]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SecondOrder]  DEFAULT ((0)) FOR [SecondOrder]
GO
/****** Object:  Default [DF_Order_BuildID_1]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_BuildID_1]  DEFAULT ((0)) FOR [BuildID]
GO
/****** Object:  Default [DF_OrderDay_Day]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDay] ADD  CONSTRAINT [DF_OrderDay_Day]  DEFAULT ((1)) FOR [Day]
GO
/****** Object:  Default [DF_OrderDayHistory_Day]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDayHistory] ADD  CONSTRAINT [DF_OrderDayHistory_Day]  DEFAULT ((1)) FOR [Day]
GO
/****** Object:  Default [DF_OrderDayMeal_MealTypeID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDayMeal] ADD  CONSTRAINT [DF_OrderDayMeal_MealTypeID]  DEFAULT ((1)) FOR [MealTypeID]
GO
/****** Object:  Default [DF_OrderDayMeal_Priority]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDayMeal] ADD  CONSTRAINT [DF_OrderDayMeal_Priority]  DEFAULT ((0)) FOR [Priority]
GO
/****** Object:  Default [DF_OrderDayMealHistory_MealTypeID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDayMealHistory] ADD  CONSTRAINT [DF_OrderDayMealHistory_MealTypeID]  DEFAULT ((1)) FOR [MealTypeID]
GO
/****** Object:  Default [DF_OrderPayment_CardNumber]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderPayment] ADD  CONSTRAINT [DF_OrderPayment_CardNumber]  DEFAULT ('') FOR [CardNumber]
GO
/****** Object:  Default [DF_OrderPayment_ExpMonth]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderPayment] ADD  CONSTRAINT [DF_OrderPayment_ExpMonth]  DEFAULT ((1)) FOR [ExpMonth]
GO
/****** Object:  Default [DF_OrderPayment_ExpYear]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderPayment] ADD  CONSTRAINT [DF_OrderPayment_ExpYear]  DEFAULT ((11)) FOR [ExpYear]
GO
/****** Object:  Default [DF_OrderPayment_LastFour]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderPayment] ADD  CONSTRAINT [DF_OrderPayment_LastFour]  DEFAULT ('') FOR [LastFour]
GO
/****** Object:  Default [DF_OrderPayment_NameOnCard]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderPayment] ADD  CONSTRAINT [DF_OrderPayment_NameOnCard]  DEFAULT ('') FOR [NameOnCard]
GO
/****** Object:  Default [DF_OrderPayment_CardType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderPayment] ADD  CONSTRAINT [DF_OrderPayment_CardType]  DEFAULT ((1)) FOR [CardType]
GO
/****** Object:  Default [DF_OrderPayment_SecurityCode]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderPayment] ADD  CONSTRAINT [DF_OrderPayment_SecurityCode]  DEFAULT ('') FOR [SecurityCode]
GO
/****** Object:  Default [DF_OrderRegeneration_MyBistroRemarks]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderRegeneration] ADD  CONSTRAINT [DF_OrderRegeneration_MpClientRemarks]  DEFAULT ('') FOR [MpClientRemarks]
GO
/****** Object:  Default [DF_OrderRegeneration_OrdercreationRemarks]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderRegeneration] ADD  CONSTRAINT [DF_OrderRegeneration_OrdercreationRemarks]  DEFAULT ('') FOR [OrdercreationRemarks]
GO
/****** Object:  Default [DF_Table_1_Permanent]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageAlias] ADD  CONSTRAINT [DF_Table_1_Permanent]  DEFAULT ((0)) FOR [PermanentRedirect]
GO
/****** Object:  Default [DF_PageControl_PageID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_PageID]  DEFAULT ((0)) FOR [PageID]
GO
/****** Object:  Default [DF_PageControl_SiteID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_SiteID]  DEFAULT ((1)) FOR [SiteID]
GO
/****** Object:  Default [DF_PageControl_PageContainerID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_PageContainerID]  DEFAULT ((1)) FOR [PageContainerID]
GO
/****** Object:  Default [DF_PageControl_ControlID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_ControlID]  DEFAULT ((0)) FOR [ControlID]
GO
/****** Object:  Default [DF_PageControl_ControlOptionID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_ControlOptionID]  DEFAULT ((0)) FOR [ControlOptionID]
GO
/****** Object:  Default [DF_PageControl_ControlOrder]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_ControlOrder]  DEFAULT ((0)) FOR [ControlOrder]
GO
/****** Object:  Default [DF_PageControl_ControlNickName]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_ControlNickName]  DEFAULT ('') FOR [ControlNickname]
GO
/****** Object:  Default [DF_PageControl_ControlInheritID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl] ADD  CONSTRAINT [DF_PageControl_ControlInheritID]  DEFAULT ((0)) FOR [ControlInheritID]
GO
/****** Object:  Default [DF_Plan_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DF_Plan_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Plan_IsCustomPlan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DF_Plan_IsCustomPlan]  DEFAULT ((0)) FOR [IsCustomPlan]
GO
/****** Object:  Default [DF_Plan_ProgramID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DF_Plan_ProgramID]  DEFAULT ((1)) FOR [ProgramID]
GO
/****** Object:  Default [DF_Plan_Active]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DF_Plan_Active]  DEFAULT ((1)) FOR [Active]
GO
/****** Object:  Default [DF_Plan_DoNotSubstitute]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DF_Plan_DoNotSubstitute]  DEFAULT ((0)) FOR [DoNotSubstitute]
GO
/****** Object:  Default [DF_Plan_IsDeleted]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DF_Plan_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Plan_IsSnack]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DF_Plan_IsSnack]  DEFAULT ((0)) FOR [IsSnack]
GO
/****** Object:  Default [DF_PlanDay_Day]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanDay] ADD  CONSTRAINT [DF_PlanDay_Day]  DEFAULT ((1)) FOR [Day]
GO
/****** Object:  Default [DF_PlanWeek_ShortDescription]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanWeek] ADD  CONSTRAINT [DF_PlanWeek_ShortDescription]  DEFAULT ('') FOR [ShortDescription]
GO
/****** Object:  Default [DF_PlanWeek_LongDescription]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanWeek] ADD  CONSTRAINT [DF_PlanWeek_LongDescription]  DEFAULT ('') FOR [LongDescription]
GO
/****** Object:  Default [DF_Program_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Program] ADD  CONSTRAINT [DF_Program_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Program_Active]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Program] ADD  CONSTRAINT [DF_Program_Active]  DEFAULT ((1)) FOR [Active]
GO
/****** Object:  Default [DF_Program_IsDeleted]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Program] ADD  CONSTRAINT [DF_Program_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Promo_PomoCode]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_PomoCode]  DEFAULT ('') FOR [PomoCode]
GO
/****** Object:  Default [DF_Promo_Description]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Promo_DollarDiscount]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_DollarDiscount]  DEFAULT ((0)) FOR [DollarDiscount]
GO
/****** Object:  Default [DF_Promo_PercentDiscount]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_PercentDiscount]  DEFAULT ((0)) FOR [PercentDiscount]
GO
/****** Object:  Default [DF_Promo_AppliesToPrice]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_AppliesToPrice]  DEFAULT ((0)) FOR [AppliesToPrice]
GO
/****** Object:  Default [DF_Promo_AppliesToShipping]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_AppliesToShipping]  DEFAULT ((0)) FOR [AppliesToShipping]
GO
/****** Object:  Default [DF_Promo_DollarLimit]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_DollarLimit]  DEFAULT ((100)) FOR [DollarLimit]
GO
/****** Object:  Default [DF_Promo_OrderLimit]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_OrderLimit]  DEFAULT ((1)) FOR [OrderLimit]
GO
/****** Object:  Default [DF_Promo_NewCustomerOnly]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Promo] ADD  CONSTRAINT [DF_Promo_NewCustomerOnly]  DEFAULT ((1)) FOR [NewCustomerOnly]
GO
/****** Object:  Default [DF_SalesforceSyncReport_ErrorType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[SalesforceSyncReport] ADD  CONSTRAINT [DF_SalesforceSyncReport_ErrorType]  DEFAULT ((0)) FOR [ErrorType]
GO
/****** Object:  Default [DF_SalesforceSyncReport_CustomerName]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[SalesforceSyncReport] ADD  CONSTRAINT [DF_SalesforceSyncReport_CustomerName]  DEFAULT ('') FOR [CustomerName]
GO
/****** Object:  Default [DF_SalesforceSyncReport_Email]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[SalesforceSyncReport] ADD  CONSTRAINT [DF_SalesforceSyncReport_Email]  DEFAULT ('') FOR [Email]
GO
/****** Object:  Default [DF_SalesforceSyncReport_Exception]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[SalesforceSyncReport] ADD  CONSTRAINT [DF_SalesforceSyncReport_Exception]  DEFAULT ('') FOR [Exception]
GO
/****** Object:  Default [DF_State_Name]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_State_Abbreviation]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_Abbreviation]  DEFAULT ('') FOR [Abbreviation]
GO
/****** Object:  Default [DF_State_CountryID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_CountryID]  DEFAULT ((1)) FOR [CountryID]
GO
/****** Object:  Default [DF_State_Ice]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_Ice]  DEFAULT ((1)) FOR [Ice]
GO
/****** Object:  Default [DF_Supplier_SupplierName]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_SupplierName]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_TempMealMerge_CreatedDate]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[TempMealMerge] ADD  CONSTRAINT [DF_TempMealMerge_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__TempMealQ__Chang__56B3DD81]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[TempMealQuantity] ADD  DEFAULT ((0)) FOR [ChangedAllocatedQuantity]
GO
/****** Object:  Default [DF_User_IsApproved]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsApproved]  DEFAULT ((1)) FOR [IsApproved]
GO
/****** Object:  Default [DF_User_IsAnonymous]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAnonymous]  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_User_IsNotified]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsNotified]  DEFAULT ((0)) FOR [IsNotified]
GO
/****** Object:  Default [DF_User_IsDeleted]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF__VacationH__Creat__66EA454A]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[VacationHoldHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  ForeignKey [FK_AgentNote_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote]  WITH CHECK ADD  CONSTRAINT [FK_AgentNote_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[AgentNote] CHECK CONSTRAINT [FK_AgentNote_Customer]
GO
/****** Object:  ForeignKey [FK_AgentNote_InventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote]  WITH CHECK ADD  CONSTRAINT [FK_AgentNote_InventoryItem] FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItem] ([InventoryItemID])
GO
ALTER TABLE [dbo].[AgentNote] CHECK CONSTRAINT [FK_AgentNote_InventoryItem]
GO
/****** Object:  ForeignKey [FK_AgentNote_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote]  WITH CHECK ADD  CONSTRAINT [FK_AgentNote_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
GO
ALTER TABLE [dbo].[AgentNote] CHECK CONSTRAINT [FK_AgentNote_Meal]
GO
/****** Object:  ForeignKey [FK_AgentNote_Order]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote]  WITH CHECK ADD  CONSTRAINT [FK_AgentNote_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[AgentNote] CHECK CONSTRAINT [FK_AgentNote_Order]
GO
/****** Object:  ForeignKey [FK_AgentNote_Plan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote]  WITH CHECK ADD  CONSTRAINT [FK_AgentNote_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[AgentNote] CHECK CONSTRAINT [FK_AgentNote_Plan]
GO
/****** Object:  ForeignKey [FK_AgentNote_PurchaseOrder]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote]  WITH CHECK ADD  CONSTRAINT [FK_AgentNote_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderID])
GO
ALTER TABLE [dbo].[AgentNote] CHECK CONSTRAINT [FK_AgentNote_PurchaseOrder]
GO
/****** Object:  ForeignKey [FK_AgentNote_User]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[AgentNote]  WITH CHECK ADD  CONSTRAINT [FK_AgentNote_User] FOREIGN KEY([AgentID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[AgentNote] CHECK CONSTRAINT [FK_AgentNote_User]
GO
/****** Object:  ForeignKey [FK_Build_Plan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Build]  WITH CHECK ADD  CONSTRAINT [FK_Build_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[Build] CHECK CONSTRAINT [FK_Build_Plan]
GO
/****** Object:  ForeignKey [FK_Build_Program]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Build]  WITH CHECK ADD  CONSTRAINT [FK_Build_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[CustomerStatus] ([CustomerStatusID])
GO
ALTER TABLE [dbo].[Build] CHECK CONSTRAINT [FK_Build_Program]
GO
/****** Object:  ForeignKey [FK_Build_User]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Build]  WITH NOCHECK ADD  CONSTRAINT [FK_Build_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Build] CHECK CONSTRAINT [FK_Build_User]
GO
/****** Object:  ForeignKey [FK_Customer_Carrier]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Carrier] FOREIGN KEY([CarrierID])
REFERENCES [dbo].[Carrier] ([CarrierID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Carrier]
GO
/****** Object:  ForeignKey [FK_Customer_CustomerAddress]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_CustomerAddress] FOREIGN KEY([BillingAddressID])
REFERENCES [dbo].[CustomerAddress] ([CustomerAddressID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerAddress]
GO
/****** Object:  ForeignKey [FK_Customer_CustomerAddress1]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_CustomerAddress1] FOREIGN KEY([ShippingAddressID])
REFERENCES [dbo].[CustomerAddress] ([CustomerAddressID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerAddress1]
GO
/****** Object:  ForeignKey [FK_Customer_CustomerPlan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_CustomerPlan] FOREIGN KEY([CustomerPlanID])
REFERENCES [dbo].[CustomerPlan] ([CustomerPlanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer] NOCHECK CONSTRAINT [FK_Customer_CustomerPlan]
GO
/****** Object:  ForeignKey [FK_Customer_CustomerStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerStatus] FOREIGN KEY([CustomerStatusID])
REFERENCES [dbo].[CustomerStatus] ([CustomerStatusID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerStatus]
GO
/****** Object:  ForeignKey [FK_Customer_CustomerType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerType] FOREIGN KEY([CustomerTypeId])
REFERENCES [dbo].[CustomerType] ([CustomerTypeId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerType]
GO
/****** Object:  ForeignKey [FK_CustomerAddress_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerAddress_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FK_CustomerAddress_Customer]
GO
/****** Object:  ForeignKey [FK_CustomerAddress_State]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FK_CustomerAddress_State]
GO
/****** Object:  ForeignKey [FK_CustomerIngredientCategoryExclusion_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerIngredientCategoryExclusion]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerIngredientCategoryExclusion_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerIngredientCategoryExclusion] CHECK CONSTRAINT [FK_CustomerIngredientCategoryExclusion_Customer]
GO
/****** Object:  ForeignKey [FK_CustomerIngredientCategoryExclusion_IngredientCategory]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerIngredientCategoryExclusion]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerIngredientCategoryExclusion_IngredientCategory] FOREIGN KEY([IngredientCategoryID])
REFERENCES [dbo].[IngredientCategory] ([IngredientCategoryID])
GO
ALTER TABLE [dbo].[CustomerIngredientCategoryExclusion] CHECK CONSTRAINT [FK_CustomerIngredientCategoryExclusion_IngredientCategory]
GO
/****** Object:  ForeignKey [FK_CustomerIngredientExclusion_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerIngredientExclusion]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerIngredientExclusion_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerIngredientExclusion] CHECK CONSTRAINT [FK_CustomerIngredientExclusion_Customer]
GO
/****** Object:  ForeignKey [FK_CustomerIngredientExclusion_Ingredient]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerIngredientExclusion]  WITH CHECK ADD  CONSTRAINT [FK_CustomerIngredientExclusion_Ingredient] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredient] ([IngredientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerIngredientExclusion] CHECK CONSTRAINT [FK_CustomerIngredientExclusion_Ingredient]
GO
/****** Object:  ForeignKey [FK_CustomerIngredientExclusion_IngredientLevel]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerIngredientExclusion]  WITH CHECK ADD  CONSTRAINT [FK_CustomerIngredientExclusion_IngredientLevel] FOREIGN KEY([IngredientLevelID])
REFERENCES [dbo].[IngredientLevel] ([IngredientLevelID])
GO
ALTER TABLE [dbo].[CustomerIngredientExclusion] CHECK CONSTRAINT [FK_CustomerIngredientExclusion_IngredientLevel]
GO
/****** Object:  ForeignKey [FK_CustomerMeal_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMeal]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerMeal_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerMeal] CHECK CONSTRAINT [FK_CustomerMeal_Customer]
GO
/****** Object:  ForeignKey [FK_CustomerMeal_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerMeal]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerMeal_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerMeal] CHECK CONSTRAINT [FK_CustomerMeal_Meal]
GO
/****** Object:  ForeignKey [FK_CustomerPayment_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerPayment_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerPayment] CHECK CONSTRAINT [FK_CustomerPayment_Customer]
GO
/****** Object:  ForeignKey [FK_CustomerPlan_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerPlan_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerPlan] NOCHECK CONSTRAINT [FK_CustomerPlan_Customer]
GO
/****** Object:  ForeignKey [FK_CustomerPlan_Plan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerPlan_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerPlan] NOCHECK CONSTRAINT [FK_CustomerPlan_Plan]
GO
/****** Object:  ForeignKey [FK_CustomerPlan_Promo]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerPlan_Promo] FOREIGN KEY([PromoID])
REFERENCES [dbo].[Promo] ([PromoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerPlan] CHECK CONSTRAINT [FK_CustomerPlan_Promo]
GO
/****** Object:  ForeignKey [FK_CustomerPlanHold_CustomerPlan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomerPlanHold]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerPlanHold_CustomerPlan] FOREIGN KEY([CustomerPlanID])
REFERENCES [dbo].[CustomerPlan] ([CustomerPlanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerPlanHold] NOCHECK CONSTRAINT [FK_CustomerPlanHold_CustomerPlan]
GO
/****** Object:  ForeignKey [FK_CustomOrderDay_CustomOrder_CustomOrderID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomOrderDay]  WITH CHECK ADD  CONSTRAINT [FK_CustomOrderDay_CustomOrder_CustomOrderID] FOREIGN KEY([CustomOrderID])
REFERENCES [dbo].[CustomOrder] ([CustomOrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomOrderDay] CHECK CONSTRAINT [FK_CustomOrderDay_CustomOrder_CustomOrderID]
GO
/****** Object:  ForeignKey [FK_CustomOrderDayMeal_CustomOrderDay_CustomOrderDayID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[CustomOrderDayMeal]  WITH CHECK ADD  CONSTRAINT [FK_CustomOrderDayMeal_CustomOrderDay_CustomOrderDayID] FOREIGN KEY([CustomOrderDayID])
REFERENCES [dbo].[CustomOrderDay] ([CustomOrderDayID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomOrderDayMeal] CHECK CONSTRAINT [FK_CustomOrderDayMeal_CustomOrderDay_CustomOrderDayID]
GO
/****** Object:  ForeignKey [FK_IngredientIngredientCategory_Ingredient]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[IngredientIngredientCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_IngredientIngredientCategory_Ingredient] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredient] ([IngredientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientIngredientCategory] CHECK CONSTRAINT [FK_IngredientIngredientCategory_Ingredient]
GO
/****** Object:  ForeignKey [FK_IngredientIngredientCategory_IngredientCategory]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[IngredientIngredientCategory]  WITH CHECK ADD  CONSTRAINT [FK_IngredientIngredientCategory_IngredientCategory] FOREIGN KEY([IngredientCategoryID])
REFERENCES [dbo].[IngredientCategory] ([IngredientCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientIngredientCategory] CHECK CONSTRAINT [FK_IngredientIngredientCategory_IngredientCategory]
GO
/****** Object:  ForeignKey [FK_InventoryItem_Supplier]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItem]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItem_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[InventoryItem] CHECK CONSTRAINT [FK_InventoryItem_Supplier]
GO
/****** Object:  ForeignKey [FK_InventoryItemUsage_InventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[InventoryItemUsage]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemUsage_InventoryItem] FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItem] ([InventoryItemID])
GO
ALTER TABLE [dbo].[InventoryItemUsage] CHECK CONSTRAINT [FK_InventoryItemUsage_InventoryItem]
GO
/****** Object:  ForeignKey [FK_Meal_MealType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_MealType] FOREIGN KEY([MealTypeID])
REFERENCES [dbo].[MealType] ([MealTypeID])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_MealType]
GO
/****** Object:  ForeignKey [FK_MealIngredient_Ingredient]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MealIngredient_Ingredient] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredient] ([IngredientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MealIngredient] CHECK CONSTRAINT [FK_MealIngredient_Ingredient]
GO
/****** Object:  ForeignKey [FK_MealIngredient_IngredientLevel]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MealIngredient_IngredientLevel] FOREIGN KEY([IngredientLevelID])
REFERENCES [dbo].[IngredientLevel] ([IngredientLevelID])
GO
ALTER TABLE [dbo].[MealIngredient] CHECK CONSTRAINT [FK_MealIngredient_IngredientLevel]
GO
/****** Object:  ForeignKey [FK_MealIngredient_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealIngredient]  WITH NOCHECK ADD  CONSTRAINT [FK_MealIngredient_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MealIngredient] CHECK CONSTRAINT [FK_MealIngredient_Meal]
GO
/****** Object:  ForeignKey [FK_MealInventoryItem_InventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealInventoryItem]  WITH NOCHECK ADD  CONSTRAINT [FK_MealInventoryItem_InventoryItem] FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItem] ([InventoryItemID])
GO
ALTER TABLE [dbo].[MealInventoryItem] CHECK CONSTRAINT [FK_MealInventoryItem_InventoryItem]
GO
/****** Object:  ForeignKey [FK_MealInventoryItem_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealInventoryItem]  WITH CHECK ADD  CONSTRAINT [FK_MealInventoryItem_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
GO
ALTER TABLE [dbo].[MealInventoryItem] CHECK CONSTRAINT [FK_MealInventoryItem_Meal]
GO
/****** Object:  ForeignKey [FK_MealPlanDetails_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealPlanDetails]  WITH CHECK ADD  CONSTRAINT [FK_MealPlanDetails_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MealPlanDetails] CHECK CONSTRAINT [FK_MealPlanDetails_Meal]
GO
/****** Object:  ForeignKey [FK_MealSubstitute_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealSubstitute]  WITH NOCHECK ADD  CONSTRAINT [FK_MealSubstitute_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MealSubstitute] CHECK CONSTRAINT [FK_MealSubstitute_Meal]
GO
/****** Object:  ForeignKey [FK_MealSubstitute_Meal2]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealSubstitute]  WITH NOCHECK ADD  CONSTRAINT [FK_MealSubstitute_Meal2] FOREIGN KEY([SubstituteMealID])
REFERENCES [dbo].[Meal] ([MealID])
GO
ALTER TABLE [dbo].[MealSubstitute] CHECK CONSTRAINT [FK_MealSubstitute_Meal2]
GO
/****** Object:  ForeignKey [FK_MealSubstitute_Plan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[MealSubstitute]  WITH CHECK ADD  CONSTRAINT [FK_MealSubstitute_Plan] FOREIGN KEY([SubstitutePlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[MealSubstitute] CHECK CONSTRAINT [FK_MealSubstitute_Plan]
GO
/****** Object:  ForeignKey [FK_Menu_Order_OrderPrint]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Order_OrderPrint] FOREIGN KEY([MenuOrderPrintID])
REFERENCES [dbo].[OrderPrint] ([OrderPrintID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Menu_Order_OrderPrint]
GO
/****** Object:  ForeignKey [FK_Order_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  ForeignKey [FK_Order_OrderStatus]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
/****** Object:  ForeignKey [FK_Order_OrderTypes]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderTypes] FOREIGN KEY([OrderTypeId])
REFERENCES [dbo].[OrderTypes] ([OrderTypeId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderTypes]
GO
/****** Object:  ForeignKey [FK_Order_Plan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Plan]
GO
/****** Object:  ForeignKey [FK_Order_State]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_State]
GO
/****** Object:  ForeignKey [FK_PickList_Order_OrderPrint]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_PickList_Order_OrderPrint] FOREIGN KEY([PickListOrderPrintID])
REFERENCES [dbo].[OrderPrint] ([OrderPrintID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_PickList_Order_OrderPrint]
GO
/****** Object:  ForeignKey [FK_OrderDay_Order]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDay]  WITH CHECK ADD  CONSTRAINT [FK_OrderDay_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDay] CHECK CONSTRAINT [FK_OrderDay_Order]
GO
/****** Object:  ForeignKey [FK_OrderDayMeal_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDayMeal]  WITH CHECK ADD  CONSTRAINT [FK_OrderDayMeal_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDayMeal] CHECK CONSTRAINT [FK_OrderDayMeal_Meal]
GO
/****** Object:  ForeignKey [FK_OrderDayMeal_MealType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDayMeal]  WITH CHECK ADD  CONSTRAINT [FK_OrderDayMeal_MealType] FOREIGN KEY([MealTypeID])
REFERENCES [dbo].[MealType] ([MealTypeID])
GO
ALTER TABLE [dbo].[OrderDayMeal] CHECK CONSTRAINT [FK_OrderDayMeal_MealType]
GO
/****** Object:  ForeignKey [FK_OrderDayMeal_OrderDay]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[OrderDayMeal]  WITH CHECK ADD  CONSTRAINT [FK_OrderDayMeal_OrderDay] FOREIGN KEY([OrderDayID])
REFERENCES [dbo].[OrderDay] ([OrderDayID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDayMeal] CHECK CONSTRAINT [FK_OrderDayMeal_OrderDay]
GO
/****** Object:  ForeignKey [FK_Page_Site]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Site] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Site]
GO
/****** Object:  ForeignKey [FK_PageAlias_Page]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageAlias]  WITH NOCHECK ADD  CONSTRAINT [FK_PageAlias_Page] FOREIGN KEY([PageID])
REFERENCES [dbo].[Page] ([PageID])
GO
ALTER TABLE [dbo].[PageAlias] CHECK CONSTRAINT [FK_PageAlias_Page]
GO
/****** Object:  ForeignKey [FK_PageAlias_Site]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageAlias]  WITH NOCHECK ADD  CONSTRAINT [FK_PageAlias_Site] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[PageAlias] CHECK CONSTRAINT [FK_PageAlias_Site]
GO
/****** Object:  ForeignKey [FK_PageControl_Control]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl]  WITH NOCHECK ADD  CONSTRAINT [FK_PageControl_Control] FOREIGN KEY([ControlID])
REFERENCES [dbo].[Control] ([ControlID])
GO
ALTER TABLE [dbo].[PageControl] CHECK CONSTRAINT [FK_PageControl_Control]
GO
/****** Object:  ForeignKey [FK_PageControl_Page]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl]  WITH NOCHECK ADD  CONSTRAINT [FK_PageControl_Page] FOREIGN KEY([PageID])
REFERENCES [dbo].[Page] ([PageID])
GO
ALTER TABLE [dbo].[PageControl] CHECK CONSTRAINT [FK_PageControl_Page]
GO
/****** Object:  ForeignKey [FK_PageControl_Site]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PageControl]  WITH NOCHECK ADD  CONSTRAINT [FK_PageControl_Site] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[PageControl] CHECK CONSTRAINT [FK_PageControl_Site]
GO
/****** Object:  ForeignKey [FK_PdfTemplate_Program]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PdfTemplate]  WITH CHECK ADD  CONSTRAINT [FK_PdfTemplate_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO
ALTER TABLE [dbo].[PdfTemplate] CHECK CONSTRAINT [FK_PdfTemplate_Program]
GO
/****** Object:  ForeignKey [FK_PermissionByRole_BistroKey_BistroKeyId]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PermissionByRole]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionByRole_MenuplannerKey_MenuplannerKeyId] FOREIGN KEY([PageId])
REFERENCES [dbo].[MenuplannerKey] ([MenuplannerKeyId])
GO
ALTER TABLE [dbo].[PermissionByRole] CHECK CONSTRAINT [FK_PermissionByRole_MenuplannerKey_MenuplannerKeyId]
GO
/****** Object:  ForeignKey [FK_PermissionByRole_Role_RoleId]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PermissionByRole]  WITH CHECK ADD  CONSTRAINT [FK_PermissionByRole_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[PermissionByRole] CHECK CONSTRAINT [FK_PermissionByRole_Role_RoleId]
GO
/****** Object:  ForeignKey [FK_PhysicalInventoryItem_InventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PhysicalInventoryItem]  WITH NOCHECK ADD  CONSTRAINT [FK_PhysicalInventoryItem_InventoryItem] FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItem] ([InventoryItemID])
GO
ALTER TABLE [dbo].[PhysicalInventoryItem] CHECK CONSTRAINT [FK_PhysicalInventoryItem_InventoryItem]
GO
/****** Object:  ForeignKey [FK_PhysicalInventoryItem_Physical]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PhysicalInventoryItem]  WITH CHECK ADD  CONSTRAINT [FK_PhysicalInventoryItem_Physical] FOREIGN KEY([PhysicalID])
REFERENCES [dbo].[Physical] ([PhysicalID])
GO
ALTER TABLE [dbo].[PhysicalInventoryItem] CHECK CONSTRAINT [FK_PhysicalInventoryItem_Physical]
GO
/****** Object:  ForeignKey [FK_Plan_Program]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Program]
GO
/****** Object:  ForeignKey [FK_PlanDay_PlanWeek]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanDay]  WITH CHECK ADD  CONSTRAINT [FK_PlanDay_PlanWeek] FOREIGN KEY([PlanWeekID])
REFERENCES [dbo].[PlanWeek] ([PlanWeekID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlanDay] CHECK CONSTRAINT [FK_PlanDay_PlanWeek]
GO
/****** Object:  ForeignKey [FK_PlanDayMeal_Meal]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanDayMeal]  WITH NOCHECK ADD  CONSTRAINT [FK_PlanDayMeal_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlanDayMeal] CHECK CONSTRAINT [FK_PlanDayMeal_Meal]
GO
/****** Object:  ForeignKey [FK_PlanDayMeal_MealType]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanDayMeal]  WITH CHECK ADD  CONSTRAINT [FK_PlanDayMeal_MealType] FOREIGN KEY([MealTypeID])
REFERENCES [dbo].[MealType] ([MealTypeID])
GO
ALTER TABLE [dbo].[PlanDayMeal] CHECK CONSTRAINT [FK_PlanDayMeal_MealType]
GO
/****** Object:  ForeignKey [FK_PlanDayMeal_PlanDay]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanDayMeal]  WITH CHECK ADD  CONSTRAINT [FK_PlanDayMeal_PlanDay] FOREIGN KEY([PlanDayID])
REFERENCES [dbo].[PlanDay] ([PlanDayID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlanDayMeal] CHECK CONSTRAINT [FK_PlanDayMeal_PlanDay]
GO
/****** Object:  ForeignKey [FK_PlanWeek_Plan]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PlanWeek]  WITH NOCHECK ADD  CONSTRAINT [FK_PlanWeek_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlanWeek] CHECK CONSTRAINT [FK_PlanWeek_Plan]
GO
/****** Object:  ForeignKey [FK_PurchaseOrder_Supplier]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PurchaseOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier]
GO
/****** Object:  ForeignKey [FK_PurchaseOrderItem_InventoryItem]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PurchaseOrderItem]  WITH NOCHECK ADD  CONSTRAINT [FK_PurchaseOrderItem_InventoryItem] FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItem] ([InventoryItemID])
GO
ALTER TABLE [dbo].[PurchaseOrderItem] CHECK CONSTRAINT [FK_PurchaseOrderItem_InventoryItem]
GO
/****** Object:  ForeignKey [FK_PurchaseOrderItem_PurchaseOrder]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[PurchaseOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItem_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderID])
GO
ALTER TABLE [dbo].[PurchaseOrderItem] CHECK CONSTRAINT [FK_PurchaseOrderItem_PurchaseOrder]
GO
/****** Object:  ForeignKey [FK_Role_Application]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([ApplicationID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Application]
GO
/****** Object:  ForeignKey [FK_SiteURL_Site]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[SiteURL]  WITH CHECK ADD  CONSTRAINT [FK_SiteURL_Site] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[SiteURL] CHECK CONSTRAINT [FK_SiteURL_Site]
GO
/****** Object:  ForeignKey [FK_State_Country]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
/****** Object:  ForeignKey [FK_User_Application]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([ApplicationID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Application]
GO
/****** Object:  ForeignKey [FK_User_Customer]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Customer]
GO
/****** Object:  ForeignKey [FK_User_User]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
/****** Object:  ForeignKey [FK_UsersInRoles_Role]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersInRoles_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_UsersInRoles_Role]
GO
/****** Object:  ForeignKey [FK_UsersInRoles_User]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_UsersInRoles_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_UsersInRoles_User]
GO
/****** Object:  ForeignKey [FK_VacationHoldHistory_Customer_CustomerID]    Script Date: 01/05/2017 12:07:21 ******/
ALTER TABLE [dbo].[VacationHoldHistory]  WITH CHECK ADD  CONSTRAINT [FK_VacationHoldHistory_Customer_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[VacationHoldHistory] CHECK CONSTRAINT [FK_VacationHoldHistory_Customer_CustomerID]
GO

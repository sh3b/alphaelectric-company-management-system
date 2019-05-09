IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlphaElectric].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlphaElectric] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlphaElectric] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlphaElectric] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlphaElectric] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlphaElectric] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlphaElectric] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlphaElectric] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlphaElectric] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlphaElectric] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlphaElectric] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlphaElectric] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlphaElectric] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlphaElectric] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlphaElectric] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlphaElectric] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlphaElectric] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlphaElectric] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlphaElectric] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlphaElectric] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlphaElectric] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlphaElectric] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlphaElectric] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlphaElectric] SET RECOVERY FULL 
GO
ALTER DATABASE [AlphaElectric] SET  MULTI_USER 
GO
ALTER DATABASE [AlphaElectric] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlphaElectric] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlphaElectric] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlphaElectric] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlphaElectric] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlphaElectric', N'ON'
GO
ALTER DATABASE [AlphaElectric] SET QUERY_STORE = OFF
GO
USE [AlphaElectric]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AlphaElectric]
GO
/****** Object:  Table [dbo].[Certifications]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Certifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerOrders]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[ContactID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designations]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Designations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](200) NOT NULL,
	[Passport] [nvarchar](200) NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[DesignationID] [int] NOT NULL,
	[EmployeeStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeStatus]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmployeeStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventories]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventories](
	[ID] [int] NOT NULL,
	[StockLevel] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_Inventories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logins]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Makes]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Makes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Panel_ProjectBT]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Panel_ProjectBT](
	[Quantity] [int] NOT NULL,
	[PanelID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_Panel_ProjectBT] PRIMARY KEY CLUSTERED 
(
	[PanelID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PanelShellGradeProtections]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PanelShellGradeProtections](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IPNum] [nvarchar](200) NOT NULL,
	[DescriptionSolids] [nvarchar](200) NOT NULL,
	[DescriptionLiquids] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PanelShellGradeProtections] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaTypes]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PaTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_CustomerOrderBT]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_CustomerOrderBT](
	[ProductID] [int] NOT NULL,
	[CustomerOrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Product_CustomerOrderBT] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CustomerOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_PurchaseOrderBT]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_PurchaseOrderBT](
	[Quantity] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
 CONSTRAINT [PK_Product_PurchaseOrderBT] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SerialNo] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[MakeID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products_Panel]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Panel](
	[PanelShellGradeProtectionIPNumber] [int] NOT NULL,
	[SizeTypeID] [int] NOT NULL,
	[CertificationID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_Products_Panel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products_Part]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Part](
	[PaTypeID] [int] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_Products_Part] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DeliveyDate] [datetime] NOT NULL,
	[CustomerOrderID] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PODate] [datetime] NOT NULL,
	[ContactID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SizeTypes]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_SizeTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 5/22/2017 9:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Certifications] ON 

INSERT [dbo].[Certifications] ([ID], [Description], [Name]) VALUES (1, N'Quality Management Systems - Reqirements (2000)', N'9001:2000')
INSERT [dbo].[Certifications] ([ID], [Description], [Name]) VALUES (2, N'Quality Management Systems - Requirements (2015)', N'9001:2015')
SET IDENTITY_INSERT [dbo].[Certifications] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([ID], [CompanyName], [Phone], [Email], [Address]) VALUES (1, N'GRP Giant Reinforced Plastic LLC', N'+971-55-4052312', N'contact@grp.ae', N'Industrial Area 5, Sharjah, UAE.')
INSERT [dbo].[Contacts] ([ID], [CompanyName], [Phone], [Email], [Address]) VALUES (2, N'Al-Amazon Metal Ind. LLC', N'+971-06-5355667', N'alamazonuae@gmail.com', N'Industrial Area 4, Sharjah, UAE.')
INSERT [dbo].[Contacts] ([ID], [CompanyName], [Phone], [Email], [Address]) VALUES (3, N'Bin Ghalib Engineering', N'+971-04-2073777', N'beetrdng@eim.ae', N'Satwa, Dubai, UAE.')
INSERT [dbo].[Contacts] ([ID], [CompanyName], [Phone], [Email], [Address]) VALUES (4, N'Gama Electric', N'+971-06-5335453', N'alamazonuae@gmail.com', N'Industria Area 11, Sharjah, UAE.')
INSERT [dbo].[Contacts] ([ID], [CompanyName], [Phone], [Email], [Address]) VALUES (5, N'Rove Electric', N'+971-04-4266328', N'trading.uae@roveelectric.com', N'Maysaloon, Sharjah, UAE.')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[CustomerOrders] ON 

INSERT [dbo].[CustomerOrders] ([ID], [OrderDate], [DeliveryDate], [ContactID], [OrderStatusID], [EmployeeID]) VALUES (1, CAST(N'2017-01-25T00:00:00.000' AS DateTime), CAST(N'2017-01-26T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[CustomerOrders] ([ID], [OrderDate], [DeliveryDate], [ContactID], [OrderStatusID], [EmployeeID]) VALUES (2, CAST(N'2017-01-25T00:00:00.000' AS DateTime), CAST(N'2017-01-26T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[CustomerOrders] ([ID], [OrderDate], [DeliveryDate], [ContactID], [OrderStatusID], [EmployeeID]) VALUES (3, CAST(N'2017-01-25T00:00:00.000' AS DateTime), CAST(N'2017-01-27T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[CustomerOrders] ([ID], [OrderDate], [DeliveryDate], [ContactID], [OrderStatusID], [EmployeeID]) VALUES (4, CAST(N'2017-01-25T00:00:00.000' AS DateTime), CAST(N'2017-10-11T00:00:00.000' AS DateTime), 1, 5, 2)
SET IDENTITY_INSERT [dbo].[CustomerOrders] OFF
SET IDENTITY_INSERT [dbo].[Designations] ON 

INSERT [dbo].[Designations] ([ID], [Name]) VALUES (1, N'Managing Director')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (2, N'General Manager')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (3, N'Project Manager')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (4, N'HR Manager')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (5, N'Purchase/Sales Manager')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (6, N'QA Engineer')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (7, N'Engineer')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (8, N'IT Manager')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (9, N'Accountant')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (10, N'Factory Worker')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (11, N'Store Keeper')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (12, N'Store Helper')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (13, N'Driver')
INSERT [dbo].[Designations] ([ID], [Name]) VALUES (14, N'Assistant')
SET IDENTITY_INSERT [dbo].[Designations] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (1, N'Shuayb', N'Ashraf', N'+92-336-0572884', N'AV51298998', CAST(N'2016-12-15T00:00:00.000' AS DateTime), N'Hostel 6, IIUI, Islamabad', 1, 1)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (2, N'Muhammad', N'Amir', N'+92-336-7152534', N'AV68049390', CAST(N'2016-11-12T00:00:00.000' AS DateTime), N'Westerage, Rawalpindhi', 5, 1)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (3, N'Anas', N'Malik', N'+92-336-7152534', N'AV68090493', CAST(N'2016-10-25T00:00:00.000' AS DateTime), N'TenchBata, Rawalpindhi', 7, 1)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (4, N'Luqman', N'Haq', N'+92-335-7152534', N'AV65804943', CAST(N'2014-12-13T00:00:00.000' AS DateTime), N'Mohanpura, Rawalpindhi', 4, 1)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (5, N'Fawaz', N'Abid', N'+92-333-7152534', N'AV86804953', CAST(N'2016-11-14T00:00:00.000' AS DateTime), N'SaidPur Road', 9, 1)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (6, N'Jasim', N'Muhammad', N'+92-336-7152534', N'AV66804963', CAST(N'2016-11-18T00:00:00.000' AS DateTime), N'H-10 Islamabad', 10, 2)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (7, N'Farooq', N'Tayyab', N'+92-333-7152534', N'AV63800493', CAST(N'2016-12-20T00:00:00.000' AS DateTime), N'G-9/2 Islamabad', 2, 4)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (8, N'Tajudin', N'Waqar', N'+92-333-7152534', N'AV86380497', CAST(N'2016-10-24T00:00:00.000' AS DateTime), N'Westerage, Rawalpindhi', 5, 3)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone], [Passport], [JoinDate], [Address], [DesignationID], [EmployeeStatusID]) VALUES (9, N'Sheroz', N'Mustafa', N'+92-333-7152534', N'AV68849374', CAST(N'2016-10-27T00:00:00.000' AS DateTime), N'Rawalpindhi', 6, 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[EmployeeStatus] ON 

INSERT [dbo].[EmployeeStatus] ([ID], [Name]) VALUES (1, N'Full-time')
INSERT [dbo].[EmployeeStatus] ([ID], [Name]) VALUES (2, N'Part-time')
INSERT [dbo].[EmployeeStatus] ([ID], [Name]) VALUES (3, N'Consultant')
INSERT [dbo].[EmployeeStatus] ([ID], [Name]) VALUES (4, N'Ex-Employee')
INSERT [dbo].[EmployeeStatus] ([ID], [Name]) VALUES (5, N'On-leave')
SET IDENTITY_INSERT [dbo].[EmployeeStatus] OFF
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (1, 10, 1)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (2, 20, 2)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (3, 30, 3)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (4, 40, 4)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (5, 50, 5)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (6, 60, 6)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (7, 70, 7)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (8, 0, 16)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (9, 90, 9)
INSERT [dbo].[Inventories] ([ID], [StockLevel], [LocationID]) VALUES (13, 6, 1)
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([ID], [Name]) VALUES (1, N'A1')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (2, N'A2')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (3, N'A3')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (4, N'A4')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (5, N'A5')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (6, N'A6')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (7, N'A7')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (8, N'A8')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (9, N'A9')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (10, N'A10')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (11, N'A11')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (12, N'A12')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (13, N'A13')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (14, N'A14')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (15, N'A15')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (16, N'None')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Logins] ON 

INSERT [dbo].[Logins] ([ID], [Username], [Password], [Name]) VALUES (1, N'shuayb', N'$2a$12$Loy2gXl8eO3fwC4E/82o8OxSqwR7WR/USI2AdcftYiT6NvZk0K4Ei', N'Shuayb Ashraf')
SET IDENTITY_INSERT [dbo].[Logins] OFF
SET IDENTITY_INSERT [dbo].[Makes] ON 

INSERT [dbo].[Makes] ([ID], [Name]) VALUES (1, N'LEGRAND')
INSERT [dbo].[Makes] ([ID], [Name]) VALUES (2, N'ALPHA ELECTRIC')
INSERT [dbo].[Makes] ([ID], [Name]) VALUES (3, N'HAGER')
INSERT [dbo].[Makes] ([ID], [Name]) VALUES (4, N'SCHNEIDER')
INSERT [dbo].[Makes] ([ID], [Name]) VALUES (5, N'BB')
INSERT [dbo].[Makes] ([ID], [Name]) VALUES (6, N'CIRCUITOR')
SET IDENTITY_INSERT [dbo].[Makes] OFF
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (1, N'Accepted')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (2, N'Declined')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (3, N'Cancelled')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (4, N'In-process')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (5, N'Completed')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
INSERT [dbo].[Panel_ProjectBT] ([Quantity], [PanelID], [ProjectID]) VALUES (10, 8, 1)
INSERT [dbo].[Panel_ProjectBT] ([Quantity], [PanelID], [ProjectID]) VALUES (20, 9, 1)
SET IDENTITY_INSERT [dbo].[PanelShellGradeProtections] ON 

INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (1, N'IP00', N'Not protected from solids.', N'Not protected from liquids.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (2, N'IP01', N'Not protected from solids.', N'Protected from condensation.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (3, N'IP02', N'Not protected from solids.', N'Protected from water spray less than 15 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (4, N'IP03', N'Not protected from solids.', N'Protected from water spray less than 60 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (5, N'IP04', N'Not protected from solids.', N'Protected from water spray from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (6, N'IP05', N'Not protected from solids.', N'Protected from low pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (7, N'IP06', N'Not protected from solids.', N'Protected from high pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (8, N'IP07', N'Not protected from solids.', N'Protected from immersion between 15 centimeters and 1 meter in depth.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (9, N'IP08', N'Not protected from solids.', N'Protected from long term immersion up to a specified pressure.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (10, N'IP10', N'Protected from touch by hands greater than 50 millimeters.', N'Not protected from liquids.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (11, N'IP11', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from condensation.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (12, N'IP12', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from water spray less than 15 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (13, N'IP13', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from water spray less than 60 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (14, N'IP14', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from water spray from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (15, N'IP15', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from low pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (16, N'IP16', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from high pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (17, N'IP17', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from immersion between 15 centimeters and 1 meter in depth.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (18, N'IP18', N'Protected from touch by hands greater than 50 millimeters.', N'Protected from long term immersion up to a specified pressure.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (19, N'IP20', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Not protected from liquids.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (20, N'IP21', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from condensation.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (21, N'IP22', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from water spray less than 15 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (22, N'IP23', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from water spray less than 60 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (23, N'IP24', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from water spray from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (24, N'IP25', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from low pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (25, N'IP26', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from high pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (26, N'IP27', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from immersion between 15 centimeters and 1 meter in depth.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (27, N'IP28', N'Protected from touch by fingers and objects greater than 12 millimeters.', N'Protected from long term immersion up to a specified pressure.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (28, N'IP30', N'Protected from tools and wires greater than 2.5 millimeters.', N'Not protected from liquids.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (29, N'IP31', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from condensation.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (30, N'IP32', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from water spray less than 15 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (31, N'IP33', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from water spray less than 60 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (32, N'IP34', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from water spray from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (33, N'IP35', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from low pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (34, N'IP36', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from high pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (35, N'IP37', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from immersion between 15 centimeters and 1 meter in depth.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (36, N'IP38', N'Protected from tools and wires greater than 2.5 millimeters.', N'Protected from long term immersion up to a specified pressure.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (37, N'IP40', N'Protected from tools and small wires greater than 1 millimeter.', N'Not protected from liquids.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (38, N'IP41', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from condensation.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (39, N'IP42', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from water spray less than 15 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (40, N'IP43', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from water spray less than 60 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (41, N'IP44', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from water spray from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (42, N'IP45', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from low pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (43, N'IP46', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from high pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (44, N'IP47', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from immersion between 15 centimeters and 1 meter in depth.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (45, N'IP48', N'Protected from tools and small wires greater than 1 millimeter.', N'Protected from long term immersion up to a specified pressure.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (46, N'IP50', N'Protected from limited dust ingress.', N'Not protected from liquids.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (47, N'IP51', N'Protected from limited dust ingress.', N'Protected from condensation.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (48, N'IP52', N'Protected from limited dust ingress.', N'Protected from water spray less than 15 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (49, N'IP53', N'Protected from limited dust ingress.', N'Protected from water spray less than 60 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (50, N'IP54', N'Protected from limited dust ingress.', N'Protected from water spray from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (51, N'IP55', N'Protected from limited dust ingress.', N'Protected from low pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (52, N'IP56', N'Protected from limited dust ingress.', N'Protected from high pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (53, N'IP57', N'Protected from limited dust ingress.', N'Protected from immersion between 15 centimeters and 1 meter in depth.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (54, N'IP58', N'Protected from limited dust ingress.', N'Protected from long term immersion up to a specified pressure.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (55, N'IP60', N'Protected from total dust ingress.', N'Not protected from liquids.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (56, N'IP61', N'Protected from total dust ingress.', N'Protected from condensation.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (57, N'IP62', N'Protected from total dust ingress.', N'Protected from water spray less than 15 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (58, N'IP63', N'Protected from total dust ingress.', N'Protected from water spray less than 60 degrees from vertical.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (59, N'IP64', N'Protected from total dust ingress.', N'Protected from water spray from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (60, N'IP65', N'Protected from total dust ingress.', N'Protected from low pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (61, N'IP66', N'Protected from total dust ingress.', N'Protected from high pressure water jets from any direction.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (62, N'IP67', N'Protected from total dust ingress.', N'Protected from immersion between 15 centimeters and 1 meter in depth.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (63, N'IP68', N'Protected from total dust ingress.', N'Protected from long term immersion up to a specified pressure.')
INSERT [dbo].[PanelShellGradeProtections] ([ID], [IPNum], [DescriptionSolids], [DescriptionLiquids]) VALUES (64, N'IP69K', N'Protected from total dust ingress.', N'Protected from steam-jet cleaning.')
SET IDENTITY_INSERT [dbo].[PanelShellGradeProtections] OFF
SET IDENTITY_INSERT [dbo].[PaTypes] ON 

INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (1, N'MCCB')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (2, N'MCB')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (3, N'ENCL')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (4, N'ELCB')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (5, N'ISOLATOR')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (6, N'CAPACITOR')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (7, N'HANDLE')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (8, N'BUSBAR')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (9, N'CABLE')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (10, N'METER')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (11, N'THERMOSTAT')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (12, N'REGULATOR')
INSERT [dbo].[PaTypes] ([ID], [Name]) VALUES (13, N'PUSHBUTTON')
SET IDENTITY_INSERT [dbo].[PaTypes] OFF
INSERT [dbo].[Product_CustomerOrderBT] ([ProductID], [CustomerOrderID], [Quantity]) VALUES (4, 2, 7)
INSERT [dbo].[Product_CustomerOrderBT] ([ProductID], [CustomerOrderID], [Quantity]) VALUES (6, 2, 5)
INSERT [dbo].[Product_CustomerOrderBT] ([ProductID], [CustomerOrderID], [Quantity]) VALUES (7, 2, 50)
INSERT [dbo].[Product_CustomerOrderBT] ([ProductID], [CustomerOrderID], [Quantity]) VALUES (8, 1, 5)
INSERT [dbo].[Product_CustomerOrderBT] ([ProductID], [CustomerOrderID], [Quantity]) VALUES (8, 2, 10)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (1, N'250TPMCCB-35K', N'250A TP MCCB 35KA', 3)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (2, N'25CAP', N'25 KVAR CAP 440V', 6)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (3, N'3002PMCCB-35K', N'300A 2P MCCB 35KA', 3)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (4, N'3004PMCCB-50K3LS', N'300A 4P MCCB 3LS 50KA', 1)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (5, N'630TPMCCB-60K', N'630A TP MCCB 60KA', 1)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (6, N'CAPBANK-2500', N'Capacitor Bank 2500KVAR', 2)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (7, N'PFREG-6ST', N'PF REGULATOR 6-STEP', 6)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (8, N'CAPBANK-2500', N'Capacitor Bank 2500KVAR', 1)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (9, N'LV-2500', N'LV Switchgear 2500', 2)
INSERT [dbo].[Products] ([ID], [SerialNo], [Name], [MakeID]) VALUES (13, N'LV-3200', N'LV Switchgear 3200', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Products_Panel] ([PanelShellGradeProtectionIPNumber], [SizeTypeID], [CertificationID], [TypeID], [ID]) VALUES (62, 5, 1, 3, 8)
INSERT [dbo].[Products_Panel] ([PanelShellGradeProtectionIPNumber], [SizeTypeID], [CertificationID], [TypeID], [ID]) VALUES (60, 4, 2, 5, 9)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (1, 2)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (1, 3)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (1, 4)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (1, 6)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (3, 7)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (6, 1)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (8, 13)
INSERT [dbo].[Products_Part] ([PaTypeID], [ID]) VALUES (12, 5)
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ID], [Name], [DeliveyDate], [CustomerOrderID]) VALUES (1, N'Al-Baraka', CAST(N'2017-10-11T00:00:00.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[SizeTypes] ON 

INSERT [dbo].[SizeTypes] ([ID], [Description]) VALUES (1, N'400x300')
INSERT [dbo].[SizeTypes] ([ID], [Description]) VALUES (2, N'800x600')
INSERT [dbo].[SizeTypes] ([ID], [Description]) VALUES (3, N'1200x800')
INSERT [dbo].[SizeTypes] ([ID], [Description]) VALUES (4, N'1600x1200')
INSERT [dbo].[SizeTypes] ([ID], [Description]) VALUES (5, N'1600x1200x2')
SET IDENTITY_INSERT [dbo].[SizeTypes] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([ID], [Description]) VALUES (1, N'SMDB')
INSERT [dbo].[Types] ([ID], [Description]) VALUES (2, N'MDB')
INSERT [dbo].[Types] ([ID], [Description]) VALUES (3, N'LV-S')
INSERT [dbo].[Types] ([ID], [Description]) VALUES (4, N'LV')
INSERT [dbo].[Types] ([ID], [Description]) VALUES (5, N'CAPBANK')
SET IDENTITY_INSERT [dbo].[Types] OFF
/****** Object:  Index [IX_FK_CustomerOrderContact]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CustomerOrderContact] ON [dbo].[CustomerOrders]
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CustomerOrderEmployee]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CustomerOrderEmployee] ON [dbo].[CustomerOrders]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderStatusCustomerOrder]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderStatusCustomerOrder] ON [dbo].[CustomerOrders]
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EmployeeDesignation]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_EmployeeDesignation] ON [dbo].[Employees]
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EmployeeEmployeeStatus]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_EmployeeEmployeeStatus] ON [dbo].[Employees]
(
	[EmployeeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_LocationInventory]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_LocationInventory] ON [dbo].[Inventories]
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProjectPanel_ProjectBT]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProjectPanel_ProjectBT] ON [dbo].[Panel_ProjectBT]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Product_CustomerOrderBTCustomerOrder]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Product_CustomerOrderBTCustomerOrder] ON [dbo].[Product_CustomerOrderBT]
(
	[CustomerOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PurchaseOrderProduct_PurchaseOrderBT]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PurchaseOrderProduct_PurchaseOrderBT] ON [dbo].[Product_PurchaseOrderBT]
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductMake]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductMake] ON [dbo].[Products]
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PanelCertification]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PanelCertification] ON [dbo].[Products_Panel]
(
	[CertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PanelPanelShellGradeProtection]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PanelPanelShellGradeProtection] ON [dbo].[Products_Panel]
(
	[PanelShellGradeProtectionIPNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PanelSizeType]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PanelSizeType] ON [dbo].[Products_Panel]
(
	[SizeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PanelType]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PanelType] ON [dbo].[Products_Panel]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PartPaType]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PartPaType] ON [dbo].[Products_Part]
(
	[PaTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProjectCustomerOrder]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProjectCustomerOrder] ON [dbo].[Projects]
(
	[CustomerOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EmployeePurchaseOrder]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_EmployeePurchaseOrder] ON [dbo].[PurchaseOrders]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderStatusPurchaseOrder]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderStatusPurchaseOrder] ON [dbo].[PurchaseOrders]
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PurchaseOrderContact]    Script Date: 5/22/2017 9:36:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PurchaseOrderContact] ON [dbo].[PurchaseOrders]
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrderContact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ID])
GO
ALTER TABLE [dbo].[CustomerOrders] CHECK CONSTRAINT [FK_CustomerOrderContact]
GO
ALTER TABLE [dbo].[CustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrderEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[CustomerOrders] CHECK CONSTRAINT [FK_CustomerOrderEmployee]
GO
ALTER TABLE [dbo].[CustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatusCustomerOrder] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[CustomerOrders] CHECK CONSTRAINT [FK_OrderStatusCustomerOrder]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDesignation] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[Designations] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_EmployeeDesignation]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeEmployeeStatus] FOREIGN KEY([EmployeeStatusID])
REFERENCES [dbo].[EmployeeStatus] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_EmployeeEmployeeStatus]
GO
ALTER TABLE [dbo].[Inventories]  WITH CHECK ADD  CONSTRAINT [FK_LocationInventory] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[Inventories] CHECK CONSTRAINT [FK_LocationInventory]
GO
ALTER TABLE [dbo].[Inventories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory] FOREIGN KEY([ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Inventories] CHECK CONSTRAINT [FK_ProductInventory]
GO
ALTER TABLE [dbo].[Panel_ProjectBT]  WITH CHECK ADD  CONSTRAINT [FK_PanelPanel_ProjectBT] FOREIGN KEY([PanelID])
REFERENCES [dbo].[Products_Panel] ([ID])
GO
ALTER TABLE [dbo].[Panel_ProjectBT] CHECK CONSTRAINT [FK_PanelPanel_ProjectBT]
GO
ALTER TABLE [dbo].[Panel_ProjectBT]  WITH CHECK ADD  CONSTRAINT [FK_ProjectPanel_ProjectBT] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Panel_ProjectBT] CHECK CONSTRAINT [FK_ProjectPanel_ProjectBT]
GO
ALTER TABLE [dbo].[Product_CustomerOrderBT]  WITH CHECK ADD  CONSTRAINT [FK_Product_CustomerOrderBTCustomerOrder] FOREIGN KEY([CustomerOrderID])
REFERENCES [dbo].[CustomerOrders] ([ID])
GO
ALTER TABLE [dbo].[Product_CustomerOrderBT] CHECK CONSTRAINT [FK_Product_CustomerOrderBTCustomerOrder]
GO
ALTER TABLE [dbo].[Product_CustomerOrderBT]  WITH CHECK ADD  CONSTRAINT [FK_ProductProduct_CustomerOrderBT] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Product_CustomerOrderBT] CHECK CONSTRAINT [FK_ProductProduct_CustomerOrderBT]
GO
ALTER TABLE [dbo].[Product_PurchaseOrderBT]  WITH CHECK ADD  CONSTRAINT [FK_ProductProduct_PurchaseOrderBT] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Product_PurchaseOrderBT] CHECK CONSTRAINT [FK_ProductProduct_PurchaseOrderBT]
GO
ALTER TABLE [dbo].[Product_PurchaseOrderBT]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderProduct_PurchaseOrderBT] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([ID])
GO
ALTER TABLE [dbo].[Product_PurchaseOrderBT] CHECK CONSTRAINT [FK_PurchaseOrderProduct_PurchaseOrderBT]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductMake] FOREIGN KEY([MakeID])
REFERENCES [dbo].[Makes] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductMake]
GO
ALTER TABLE [dbo].[Products_Panel]  WITH CHECK ADD  CONSTRAINT [FK_Panel_inherits_Product] FOREIGN KEY([ID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products_Panel] CHECK CONSTRAINT [FK_Panel_inherits_Product]
GO
ALTER TABLE [dbo].[Products_Panel]  WITH CHECK ADD  CONSTRAINT [FK_PanelCertification] FOREIGN KEY([CertificationID])
REFERENCES [dbo].[Certifications] ([ID])
GO
ALTER TABLE [dbo].[Products_Panel] CHECK CONSTRAINT [FK_PanelCertification]
GO
ALTER TABLE [dbo].[Products_Panel]  WITH CHECK ADD  CONSTRAINT [FK_PanelPanelShellGradeProtection] FOREIGN KEY([PanelShellGradeProtectionIPNumber])
REFERENCES [dbo].[PanelShellGradeProtections] ([ID])
GO
ALTER TABLE [dbo].[Products_Panel] CHECK CONSTRAINT [FK_PanelPanelShellGradeProtection]
GO
ALTER TABLE [dbo].[Products_Panel]  WITH CHECK ADD  CONSTRAINT [FK_PanelSizeType] FOREIGN KEY([SizeTypeID])
REFERENCES [dbo].[SizeTypes] ([ID])
GO
ALTER TABLE [dbo].[Products_Panel] CHECK CONSTRAINT [FK_PanelSizeType]
GO
ALTER TABLE [dbo].[Products_Panel]  WITH CHECK ADD  CONSTRAINT [FK_PanelType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([ID])
GO
ALTER TABLE [dbo].[Products_Panel] CHECK CONSTRAINT [FK_PanelType]
GO
ALTER TABLE [dbo].[Products_Part]  WITH CHECK ADD  CONSTRAINT [FK_Part_inherits_Product] FOREIGN KEY([ID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products_Part] CHECK CONSTRAINT [FK_Part_inherits_Product]
GO
ALTER TABLE [dbo].[Products_Part]  WITH CHECK ADD  CONSTRAINT [FK_PartPaType] FOREIGN KEY([PaTypeID])
REFERENCES [dbo].[PaTypes] ([ID])
GO
ALTER TABLE [dbo].[Products_Part] CHECK CONSTRAINT [FK_PartPaType]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_ProjectCustomerOrder] FOREIGN KEY([CustomerOrderID])
REFERENCES [dbo].[CustomerOrders] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_ProjectCustomerOrder]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePurchaseOrder] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_EmployeePurchaseOrder]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatusPurchaseOrder] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_OrderStatusPurchaseOrder]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderContact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ID])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_PurchaseOrderContact]
GO
USE [master]
GO
ALTER DATABASE [AlphaElectric] SET  READ_WRITE 
GO

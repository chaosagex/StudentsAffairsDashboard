USE [Student_Affairs_Database]
GO
/****** Object:  StoredProcedure [dbo].[updatePaymentDetail]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[updatePaymentDetail]
GO
/****** Object:  StoredProcedure [dbo].[insertStudentFees]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[insertStudentFees]
GO
/****** Object:  StoredProcedure [dbo].[insertPaymentDetail]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[insertPaymentDetail]
GO
/****** Object:  StoredProcedure [dbo].[insertInvoiceItem]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[insertInvoiceItem]
GO
/****** Object:  StoredProcedure [dbo].[getPreviousPayment]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[getPreviousPayment]
GO
/****** Object:  StoredProcedure [dbo].[getPaymentItems]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[getPaymentItems]
GO
/****** Object:  StoredProcedure [dbo].[getPaymentById]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[getPaymentById]
GO
/****** Object:  StoredProcedure [dbo].[getPayment]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[getPayment]
GO
/****** Object:  StoredProcedure [dbo].[getInvoicesById]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[getInvoicesById]
GO
/****** Object:  StoredProcedure [dbo].[getInvoiceItem]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[getInvoiceItem]
GO
/****** Object:  StoredProcedure [dbo].[getInvoiceById]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[getInvoiceById]
GO
/****** Object:  StoredProcedure [dbo].[deletePayment]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[deletePayment]
GO
/****** Object:  StoredProcedure [dbo].[deleteInvoiceItem]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[deleteInvoiceItem]
GO
/****** Object:  StoredProcedure [dbo].[deleteInvoice]    Script Date: 20/07/2022 16:18:58 ******/
DROP PROCEDURE [dbo].[deleteInvoice]
GO
ALTER TABLE [dbo].[StudentSubjectEnroll] DROP CONSTRAINT [fk_subject_Enroll]
GO
ALTER TABLE [dbo].[StudentSubjectEnroll] DROP CONSTRAINT [fk_stu_Enroll]
GO
ALTER TABLE [dbo].[StudentsMain] DROP CONSTRAINT [fk_school_main]
GO
ALTER TABLE [dbo].[StudentsMain] DROP CONSTRAINT [fk_class_main]
GO
ALTER TABLE [dbo].[StudentGradesHistory] DROP CONSTRAINT [fk_stu_history]
GO
ALTER TABLE [dbo].[StudentGradesHistory] DROP CONSTRAINT [fk_grade_history]
GO
ALTER TABLE [dbo].[StudentClothes] DROP CONSTRAINT [fk_stu_clothes]
GO
ALTER TABLE [dbo].[StudentClothes] DROP CONSTRAINT [fk_clothes_student]
GO
ALTER TABLE [dbo].[StudentAccounts] DROP CONSTRAINT [fkStd_account_data]
GO
ALTER TABLE [dbo].[payment_details] DROP CONSTRAINT [FK_payment_details_school]
GO
ALTER TABLE [dbo].[invoice_payment] DROP CONSTRAINT [FK_invoice_payment_student]
GO
ALTER TABLE [dbo].[invoice_payment] DROP CONSTRAINT [FK_invoice_payment_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_item] DROP CONSTRAINT [FK_invoice_item_payment_details]
GO
ALTER TABLE [dbo].[invoice_item] DROP CONSTRAINT [FK_invoice_item_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_payment] DROP CONSTRAINT [DF_invoice_payment_remaining]
GO
/****** Object:  Index [UQ__Subjects__9F7CE1A95985026C]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Subjects] DROP CONSTRAINT [UQ__Subjects__9F7CE1A95985026C]
GO
/****** Object:  Index [UQ__Students__E595B9EDC986DA9C]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[StudentsMain] DROP CONSTRAINT [UQ__Students__E595B9EDC986DA9C]
GO
/****** Object:  Index [UQ__StudentA__4BF2239FAFE89B26]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[StudentAccounts] DROP CONSTRAINT [UQ__StudentA__4BF2239FAFE89B26]
GO
/****** Object:  Index [UQ__NESSchoo__E3D5B6A53076125F]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[NESSchools] DROP CONSTRAINT [UQ__NESSchoo__E3D5B6A53076125F]
GO
/****** Object:  Index [UQ__Grade__4AA309AA1D68A764]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Grade] DROP CONSTRAINT [UQ__Grade__4AA309AA1D68A764]
GO
/****** Object:  Index [UQ__Class__F8BF561BECFCF8C4]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Class] DROP CONSTRAINT [UQ__Class__F8BF561BECFCF8C4]
GO
/****** Object:  Index [UQ__Accounts__A9D1053402DDBF1E]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [UQ__Accounts__A9D1053402DDBF1E]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subjects]') AND type in (N'U'))
DROP TABLE [dbo].[Subjects]
GO
/****** Object:  Table [dbo].[StudentSubjectEnroll]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentSubjectEnroll]') AND type in (N'U'))
DROP TABLE [dbo].[StudentSubjectEnroll]
GO
/****** Object:  Table [dbo].[StudentsMain]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentsMain]') AND type in (N'U'))
DROP TABLE [dbo].[StudentsMain]
GO
/****** Object:  Table [dbo].[StudentGradesHistory]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentGradesHistory]') AND type in (N'U'))
DROP TABLE [dbo].[StudentGradesHistory]
GO
/****** Object:  Table [dbo].[StudentClothes]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentClothes]') AND type in (N'U'))
DROP TABLE [dbo].[StudentClothes]
GO
/****** Object:  Table [dbo].[StudentAccounts]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentAccounts]') AND type in (N'U'))
DROP TABLE [dbo].[StudentAccounts]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payment_details]') AND type in (N'U'))
DROP TABLE [dbo].[payment_details]
GO
/****** Object:  Table [dbo].[NESSchools]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NESSchools]') AND type in (N'U'))
DROP TABLE [dbo].[NESSchools]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs]') AND type in (N'U'))
DROP TABLE [dbo].[Logs]
GO
/****** Object:  Table [dbo].[invoice_payment]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[invoice_payment]') AND type in (N'U'))
DROP TABLE [dbo].[invoice_payment]
GO
/****** Object:  Table [dbo].[invoice_item]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[invoice_item]') AND type in (N'U'))
DROP TABLE [dbo].[invoice_item]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grade]') AND type in (N'U'))
DROP TABLE [dbo].[Grade]
GO
/****** Object:  Table [dbo].[Clothes]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clothes]') AND type in (N'U'))
DROP TABLE [dbo].[Clothes]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Class]') AND type in (N'U'))
DROP TABLE [dbo].[Class]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 20/07/2022 16:18:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts]
GO
USE [master]
GO
/****** Object:  Database [Student_Affairs_Database]    Script Date: 20/07/2022 16:18:58 ******/
DROP DATABASE [Student_Affairs_Database]
GO
/****** Object:  Database [Student_Affairs_Database]    Script Date: 20/07/2022 16:18:58 ******/
CREATE DATABASE [Student_Affairs_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_Affairs', FILENAME = N'D:\devtools\MicrosoftSQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Student_Affairs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_Affairs_log', FILENAME = N'D:\devtools\MicrosoftSQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Student_Affairs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student_Affairs_Database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_Affairs_Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_Affairs_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_Affairs_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_Affairs_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student_Affairs_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_Affairs_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Student_Affairs_Database] SET  MULTI_USER 
GO
ALTER DATABASE [Student_Affairs_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_Affairs_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_Affairs_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_Affairs_Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student_Affairs_Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student_Affairs_Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Student_Affairs_Database] SET QUERY_STORE = OFF
GO
USE [Student_Affairs_Database]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clothes]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clothes](
	[ClothesID] [int] IDENTITY(1,1) NOT NULL,
	[ClothesName] [varchar](100) NOT NULL,
	[ClothesQuantity] [varchar](100) NOT NULL,
	[ClothesSize] [varchar](100) NOT NULL,
	[ClothesPrice] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClothesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_item]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_item](
	[invoice] [int] NOT NULL,
	[payment_item] [int] NOT NULL,
 CONSTRAINT [PK_invoice_item] PRIMARY KEY CLUSTERED 
(
	[invoice] ASC,
	[payment_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_payment]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student] [int] NOT NULL,
	[date] [date] NOT NULL,
	[total_cost] [money] NOT NULL,
	[paid] [money] NOT NULL,
	[remaining] [money] NOT NULL,
	[previous_payment] [int] NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_invoice_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Times] [varchar](100) NOT NULL,
	[LogContent] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NESSchools]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NESSchools](
	[SchoolID] [int] NOT NULL,
	[SchoolName] [varchar](100) NOT NULL,
	[SchooleAbbreviation] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[type] [int] NOT NULL,
	[amount] [money] NOT NULL,
	[school] [int] NOT NULL,
	[year] [char](9) NOT NULL,
	[student_type] [smallint] NOT NULL,
	[Grade] [smallint] NOT NULL,
 CONSTRAINT [PK_payment_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAccounts]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAccounts](
	[StdCode] [int] IDENTITY(1,1) NOT NULL,
	[StdEmail] [varchar](100) NOT NULL,
	[StdPassword] [varchar](100) NOT NULL,
	[StdStatus] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StdCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClothes]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClothes](
	[SCID] [int] IDENTITY(1,1) NOT NULL,
	[StdCode] [int] NOT NULL,
	[ClothesID] [int] NOT NULL,
	[Quantity] [varchar](100) NOT NULL,
	[Price] [varchar](100) NOT NULL,
	[ReceivingStatus] [varchar](100) NOT NULL,
	[PaymentStatus] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGradesHistory]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGradesHistory](
	[SGID] [int] IDENTITY(1,1) NOT NULL,
	[StdCode] [int] NOT NULL,
	[GradeID] [int] NOT NULL,
	[StudyYear] [varchar](100) NOT NULL,
	[KindBatch] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentsMain]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsMain](
	[StdCode] [int] IDENTITY(1,1) NOT NULL,
	[StdArabicFristName] [nvarchar](100) NOT NULL,
	[StdArabicMiddleName] [nvarchar](100) NOT NULL,
	[StdArabicLastName] [nvarchar](100) NOT NULL,
	[StdArabicFamilyName] [nvarchar](100) NOT NULL,
	[StdEnglishFristName] [varchar](100) NOT NULL,
	[StdEnglishMiddleName] [varchar](100) NOT NULL,
	[StdEnglishLastName] [varchar](100) NOT NULL,
	[StdEnglishFamilyName] [varchar](100) NOT NULL,
	[StdMotherArabicName] [nvarchar](100) NOT NULL,
	[StdMotherEnglishName] [varchar](100) NOT NULL,
	[StdFatherMobilePhone] [varchar](100) NOT NULL,
	[StdMotherMobilePhone] [varchar](100) NOT NULL,
	[StdFatherEmail] [varchar](100) NOT NULL,
	[StdMotherEmail] [varchar](100) NOT NULL,
	[StdFatherNationality] [varchar](100) NOT NULL,
	[StdMotherNationality] [varchar](100) NOT NULL,
	[StdFatherSpokenLanguage] [varchar](100) NOT NULL,
	[StdMotherSpokenLanguage] [varchar](100) NOT NULL,
	[StdFatherJob] [varchar](100) NOT NULL,
	[StdMotherJob] [varchar](100) NOT NULL,
	[StdFatherQualification] [varchar](100) NOT NULL,
	[StdMotherQualification] [varchar](100) NOT NULL,
	[StdStudentsAffairs1] [varchar](100) NOT NULL,
	[StdStudentsAffairs2] [varchar](100) NOT NULL,
	[StdBirthCode] [varchar](5) NOT NULL,
	[StdAddressGov] [varchar](100) NOT NULL,
	[StdEmergencyContact] [varchar](100) NOT NULL,
	[StdEmergencyPhone] [varchar](100) NOT NULL,
	[StdBOD] [date] NULL,
	[StdBirthPlace] [varchar](100) NOT NULL,
	[StdGender] [varchar](100) NOT NULL,
	[StdReligion] [varchar](100) NOT NULL,
	[StdFatherNID] [varchar](14) NOT NULL,
	[StdMotherNID] [varchar](14) NOT NULL,
	[StdCity] [varchar](100) NOT NULL,
	[StdAddress] [nvarchar](100) NOT NULL,
	[StdNID] [varchar](14) NOT NULL,
	[StdSchoolID] [int] NOT NULL,
	[StdClassID] [int] NOT NULL,
	[StdNationality] [varchar](100) NOT NULL,
	[StdStatus] [varchar](100) NOT NULL,
	[StdJoinYear] [date] NULL,
	[StdStaffSon] [varchar](100) NOT NULL,
	[StdLegalGuardianship] [varchar](100) NOT NULL,
	[StdParentsSeparated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StdCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentSubjectEnroll]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubjectEnroll](
	[SSID] [int] IDENTITY(1,1) NOT NULL,
	[StdCode] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[StudyYear] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectCode] [varchar](100) NOT NULL,
	[SubjectName] [varchar](100) NOT NULL,
	[SubjectFees] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([ID], [Email], [Password], [UserName]) VALUES (1, N'admin@admin.com', N'admin', N'Admin 1')
INSERT [dbo].[Accounts] ([ID], [Email], [Password], [UserName]) VALUES (2, N'user@user.com', N'user', N'User 1')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (1, N'Class A')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (2, N'Class B')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (3, N'Class C')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (4, N'Class D')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (5, N'Class E')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Clothes] ON 

INSERT [dbo].[Clothes] ([ClothesID], [ClothesName], [ClothesQuantity], [ClothesSize], [ClothesPrice]) VALUES (1, N'T-Shirt', N'5000', N'S', N'120')
INSERT [dbo].[Clothes] ([ClothesID], [ClothesName], [ClothesQuantity], [ClothesSize], [ClothesPrice]) VALUES (2, N'Jacket', N'1000', N'M', N'150')
SET IDENTITY_INSERT [dbo].[Clothes] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1, N'Grade 1')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1009, N'Grade 10')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1010, N'Grade 11')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1011, N'Grade 12')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (2, N'Grade 2')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1002, N'Grade 3')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1003, N'Grade 4')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1004, N'Grade 5')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1005, N'Grade 6')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1006, N'Grade 7')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1007, N'Grade 8')
INSERT [dbo].[Grade] ([GradeID], [GradeName]) VALUES (1008, N'Grade 9')
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (9, 1)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (10, 2)
GO
SET IDENTITY_INSERT [dbo].[invoice_payment] ON 

INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (9, 1031, CAST(N'2022-07-20' AS Date), 15000.0000, 15000.0000, 0.0000, NULL, NULL)
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (10, 1038, CAST(N'2022-07-20' AS Date), 18000.0000, 15000.0000, 3000.0000, NULL, N'10
first installment
')
SET IDENTITY_INSERT [dbo].[invoice_payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([ID], [UserName], [Times], [LogContent]) VALUES (1, N'Admin 1', N'7/6/2022 12:20:11 AM', N'Edit : Account (Admin 1) Edit Student Data With ID: (1)')
INSERT [dbo].[Logs] ([ID], [UserName], [Times], [LogContent]) VALUES (2, N'User 1', N'7/6/2022 12:22:56 AM', N'Edit : Account (User 1) Edit Student Data With ID: (1041)')
INSERT [dbo].[Logs] ([ID], [UserName], [Times], [LogContent]) VALUES (3, N'User 1', N'7/6/2022 12:30:33 AM', N'Update : Account (User 1) Update Student Grade With ID: (1041)')
INSERT [dbo].[Logs] ([ID], [UserName], [Times], [LogContent]) VALUES (4, N'Admin 1', N'7/6/2022 12:35:19 AM', N'Delete : Account (Admin 1) Delete Student Data With ID: (1041)')
INSERT [dbo].[Logs] ([ID], [UserName], [Times], [LogContent]) VALUES (5, N'Admin 1', N'7/6/2022 12:40:31 AM', N'Delete : Account (Admin 1) Delete Student Data With ID: (1037)')
INSERT [dbo].[Logs] ([ID], [UserName], [Times], [LogContent]) VALUES (6, N'Admin 1', N'7/6/2022 12:45:47 AM', N'Delete : Account (Admin 1) Delete Student Data With ID: (1029)')
INSERT [dbo].[Logs] ([ID], [UserName], [Times], [LogContent]) VALUES (7, N'Admin 1', N'7/18/2022 10:24:03 AM', N'Update : Account (Admin 1) Update Student Grade With ID: (1040)')
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
INSERT [dbo].[NESSchools] ([SchoolID], [SchoolName], [SchooleAbbreviation]) VALUES (2135, N'Minia', N'MIN')
INSERT [dbo].[NESSchools] ([SchoolID], [SchoolName], [SchooleAbbreviation]) VALUES (2430, N'Assiut', N'ASU')
INSERT [dbo].[NESSchools] ([SchoolID], [SchoolName], [SchooleAbbreviation]) VALUES (2651, N'Zayed', N'ZAD')
GO
SET IDENTITY_INSERT [dbo].[payment_details] ON 

INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (1, N'first installment', 1, 15000.0000, 2135, N'2022     ', 1, 1)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (2, N'2nd installment', 2, 7000.0000, 2135, N'2022     ', 1, 1)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (3, N'first installment', 1, 18000.0000, 2135, N'2022     ', 1, 2)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (4, N'2nd installment', 2, 8000.0000, 2135, N'2022     ', 1, 2)
SET IDENTITY_INSERT [dbo].[payment_details] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentClothes] ON 

INSERT [dbo].[StudentClothes] ([SCID], [StdCode], [ClothesID], [Quantity], [Price], [ReceivingStatus], [PaymentStatus]) VALUES (1, 1, 1, N'2', N'120', N'False', N'True')
INSERT [dbo].[StudentClothes] ([SCID], [StdCode], [ClothesID], [Quantity], [Price], [ReceivingStatus], [PaymentStatus]) VALUES (2, 1, 2, N'1', N'150', N'True', N'True')
INSERT [dbo].[StudentClothes] ([SCID], [StdCode], [ClothesID], [Quantity], [Price], [ReceivingStatus], [PaymentStatus]) VALUES (3, 1031, 2, N'4', N'200', N'True', N'False')
SET IDENTITY_INSERT [dbo].[StudentClothes] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGradesHistory] ON 

INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (1, 1, 1, N'2018', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (2, 1, 2, N'2019', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (3, 1, 1002, N'2020', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (4, 1, 1003, N'2021', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (5, 1, 1005, N'2023', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (6, 1039, 2, N'2020', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (7, 1040, 2, N'2021', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (10, 1, 1006, N'2024', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (11, 1, 1007, N'2025', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (12, 1, 1008, N'2026', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (13, 1, 1009, N'2027', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (15, 1, 1010, N'2023', N'Gold')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (20, 1040, 1002, N'2022', N'Gold')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (21, 1040, 1005, N'2025', N'Gold')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (22, 1031, 1, N'2022', N'Normal')
INSERT [dbo].[StudentGradesHistory] ([SGID], [StdCode], [GradeID], [StudyYear], [KindBatch]) VALUES (23, 1038, 2, N'2022', N'Normal')
SET IDENTITY_INSERT [dbo].[StudentGradesHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentsMain] ON 

INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1, N'آيان', N'عمرو', N'فتحي', N'محمد', N'Ayan', N'Amr', N'Fathy', N'Mohamed', N'نورهان', N'Nourhan', N'01025611205', N'01069257240', N'amr.fathy27196@gmail.com', N'nooramr291@gmail.com', N'Afghan', N'Afghan', N'Arabic', N'Arabic', N'IT', N'Social Teacher', N'Engineer', N'Teacher', N'Mr Yasser', N'Mr Mohamed', N'23654', N'Assiut', N'Uncle', N'01099301207', CAST(N'1996-01-27' AS Date), N'Assiut', N'Male', N'Muslim', N'29601272502474', N'29607152500548', N'Assiut', N'Mobark City', N'32302152500051', 2430, 3, N'Afghan', N'Transform', CAST(N'2023-09-01' AS Date), N'True', N'Father', 0)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1031, N'2آيان', N'2عمرو', N'2فتحي', N'2محمد', N'2AyaN', N'2Amr', N'2Fathy', N'2Mohammed', N'2نورهان', N'2NourhaN', N'201025611205', N'201069257240', N'2amr.fathy27196@gmail.com', N'2nooramr291@gmail.com', N'2EgyptioN', N'2EgyptioN', N'2Arabic', N'2Arabic', N'2IT', N'2Social Teacher', N'2Engineer', N'2Teacher', N'2Mr Yasser', N'2Mr Mohamed', N'22365', N'2Assiut', N'2Uncle', N'201099301207', CAST(N'2023-02-15' AS Date), N'Assiut', N'Male', N'Muslim', N'29601272502474', N'29607152500548', N'2Assiut', N'2Mobark City', N'32302152500056', 2135, 2, N'2Egyption', N'2Active', CAST(N'2024-12-12' AS Date), N'True', N'Father', 1)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1032, N'2على', N'2محمد', N'2حسن', N'2على', N'2Ali', N'2Mohamed', N'2HassaN', N'2Ali', N'2مها', N'2Maha', N'201112223658', N'201125458962', N'2ali@ali.com', N'2maha@maha.com', N'2EgyptioN', N'2Egyption', N'2Arabic', N'2Englich', N'2Teacher', N'2Teacher', N'2Teacher', N'2Teacher', N'2Mr Mohamed', N'2Mr Yasser', N'23654', N'2Sohag', N'2Not', N'20', CAST(N'2033-02-16' AS Date), N'2Sohage', N'Male', N'2Muslim', N'23654789654123', N'65245897452365', N'2Sohag', N'2Gomhorya', N'32654789652145', 2651, 2, N'2Egyption', N'2Block', CAST(N'2022-10-12' AS Date), N'False', N'Father', 1)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1033, N'3آيان', N'3عمرو', N'3فتحي', N'3محمد', N'3AyaN', N'3Amr', N'3Fathy', N'3Mohamed', N'3نورهان', N'3NourhaN', N'301025611205', N'301069257240', N'3amr.fathy27196@gmail.com', N'3nooramr291@gmail.com', N'3EgyptioN', N'3EgyptioN', N'3Arabic', N'3Arabic', N'3IT', N'3Social Teacher', N'3Engineer', N'3Teacher', N'3Mr Yasser', N'3Mr Mohamed', N'32365', N'3Assiut', N'3Uncle', N'301099301207', CAST(N'2023-02-15' AS Date), N'Assiut', N'Male', N'3Muslim', N'39601272502474', N'39607152500548', N'3Assiut', N'3Mobark City', N'32302152500054', 2430, 1, N'3Egyption', N'3Active', CAST(N'2024-12-12' AS Date), N'True', N'Father', 1)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1034, N'3على', N'3محمد', N'3حسن', N'3على', N'3Ali', N'3Mohamed', N'3HassaN', N'3Ali', N'3مها', N'3Maha', N'301112223658', N'301125458962', N'3ali@ali.com', N'3maha@maha.com', N'3EgyptioN', N'3Egyption', N'3Arabic', N'3Englich', N'3Teacher', N'3Teacher', N'3Teacher', N'3Teacher', N'3Mr Mohamed', N'3Mr Yasser', N'33654', N'3Sohag', N'3Not', N'30', CAST(N'3033-02-16' AS Date), N'3Sohage', N'Male', N'3Muslim', N'33654789654123', N'65245897452365', N'3Sohag', N'3Gomhorya', N'32654789652143', 2651, 2, N'3Egyption', N'3Block', CAST(N'2022-10-12' AS Date), N'False', N'Father', 1)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1035, N'ds', N'hg', N'hg', N'gh', N'gh', N'gh', N'ghgh', N'gh', N'gh', N'ghhg', N'gh', N'ghgh', N'gh', N'ghgh', N'Australian', N'Australian', N'English', N'English', N'ghgh', N'gh', N'ghgh', N'gh', N'gh', N'ghg', N'hgh', N'vb', N'gh', N'ghhg', CAST(N'2022-06-20' AS Date), N'ghgh', N'Male', N'Muslim', N'gh', N'ghg', N'vb', N'vb', N'ds', 2430, 2, N'Egyption', N'Transform', CAST(N'2022-06-06' AS Date), N'True', N'Father', 1)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1038, N'gh', N'hg', N'gh', N'hh', N'h', N'h', N'hh', N'h', N'hh', N'h', N'hh', N'h', N'hh', N'h', N'Egyption', N'Egyption', N'Arabic', N'Arabic', N'd', N'h', N'hh', N'h', N'j', N'j', N'j', N'dw', N'j', N'jj', CAST(N'2022-07-26' AS Date), N'dsw', N'Male', N'Muslim', N'hh', N'h', N'k', N'kl', N'rertryety', 2135, 1, N'Egyption', N'Active', CAST(N'2022-07-25' AS Date), N'True', N'Father', 1)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1039, N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'll', N'l', N'Afghan', N'Afghan', N'Arabic', N'Arabic', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', CAST(N'2022-07-03' AS Date), N'l', N'Male', N'Muslim', N'l', N'l', N'l', N'l', N'ggggggggggg', 2430, 2, N'Australian', N'Transform', CAST(N'2020-09-01' AS Date), N'False', N'Father', 1)
INSERT [dbo].[StudentsMain] ([StdCode], [StdArabicFristName], [StdArabicMiddleName], [StdArabicLastName], [StdArabicFamilyName], [StdEnglishFristName], [StdEnglishMiddleName], [StdEnglishLastName], [StdEnglishFamilyName], [StdMotherArabicName], [StdMotherEnglishName], [StdFatherMobilePhone], [StdMotherMobilePhone], [StdFatherEmail], [StdMotherEmail], [StdFatherNationality], [StdMotherNationality], [StdFatherSpokenLanguage], [StdMotherSpokenLanguage], [StdFatherJob], [StdMotherJob], [StdFatherQualification], [StdMotherQualification], [StdStudentsAffairs1], [StdStudentsAffairs2], [StdBirthCode], [StdAddressGov], [StdEmergencyContact], [StdEmergencyPhone], [StdBOD], [StdBirthPlace], [StdGender], [StdReligion], [StdFatherNID], [StdMotherNID], [StdCity], [StdAddress], [StdNID], [StdSchoolID], [StdClassID], [StdNationality], [StdStatus], [StdJoinYear], [StdStaffSon], [StdLegalGuardianship], [StdParentsSeparated]) VALUES (1040, N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'll', N'l', N'Egyption', N'Egyption', N'Arabic', N'Arabic', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', N'l', CAST(N'2022-07-05' AS Date), N'l', N'Male', N'Muslim', N'l', N'l', N'l', N'l', N'gggghggggg', 2430, 2, N'Australian', N'Transform', CAST(N'2021-09-01' AS Date), N'False', N'Father', 1)
SET IDENTITY_INSERT [dbo].[StudentsMain] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentSubjectEnroll] ON 

INSERT [dbo].[StudentSubjectEnroll] ([SSID], [StdCode], [SubjectID], [StudyYear]) VALUES (1, 1, 1, N'2022-2022')
SET IDENTITY_INSERT [dbo].[StudentSubjectEnroll] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectID], [SubjectCode], [SubjectName], [SubjectFees]) VALUES (1, N'ACR101', N'Arabic', 3320)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectCode], [SubjectName], [SubjectFees]) VALUES (2, N'ENG201', N'English', 6520)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__A9D1053402DDBF1E]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Class__F8BF561BECFCF8C4]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Class] ADD UNIQUE NONCLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Grade__4AA309AA1D68A764]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Grade] ADD UNIQUE NONCLUSTERED 
(
	[GradeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NESSchoo__E3D5B6A53076125F]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[NESSchools] ADD UNIQUE NONCLUSTERED 
(
	[SchoolName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__StudentA__4BF2239FAFE89B26]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[StudentAccounts] ADD UNIQUE NONCLUSTERED 
(
	[StdEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__E595B9EDC986DA9C]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[StudentsMain] ADD UNIQUE NONCLUSTERED 
(
	[StdNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__9F7CE1A95985026C]    Script Date: 20/07/2022 16:18:58 ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[SubjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[invoice_payment] ADD  CONSTRAINT [DF_invoice_payment_remaining]  DEFAULT ((0)) FOR [remaining]
GO
ALTER TABLE [dbo].[invoice_item]  WITH CHECK ADD  CONSTRAINT [FK_invoice_item_invoice_payment] FOREIGN KEY([invoice])
REFERENCES [dbo].[invoice_payment] ([id])
GO
ALTER TABLE [dbo].[invoice_item] CHECK CONSTRAINT [FK_invoice_item_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_item]  WITH CHECK ADD  CONSTRAINT [FK_invoice_item_payment_details] FOREIGN KEY([payment_item])
REFERENCES [dbo].[payment_details] ([id])
GO
ALTER TABLE [dbo].[invoice_item] CHECK CONSTRAINT [FK_invoice_item_payment_details]
GO
ALTER TABLE [dbo].[invoice_payment]  WITH CHECK ADD  CONSTRAINT [FK_invoice_payment_invoice_payment] FOREIGN KEY([previous_payment])
REFERENCES [dbo].[invoice_payment] ([id])
GO
ALTER TABLE [dbo].[invoice_payment] CHECK CONSTRAINT [FK_invoice_payment_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_payment]  WITH CHECK ADD  CONSTRAINT [FK_invoice_payment_student] FOREIGN KEY([student])
REFERENCES [dbo].[StudentsMain] ([StdCode])
GO
ALTER TABLE [dbo].[invoice_payment] CHECK CONSTRAINT [FK_invoice_payment_student]
GO
ALTER TABLE [dbo].[payment_details]  WITH CHECK ADD  CONSTRAINT [FK_payment_details_school] FOREIGN KEY([school])
REFERENCES [dbo].[NESSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[payment_details] CHECK CONSTRAINT [FK_payment_details_school]
GO
ALTER TABLE [dbo].[StudentAccounts]  WITH CHECK ADD  CONSTRAINT [fkStd_account_data] FOREIGN KEY([StdCode])
REFERENCES [dbo].[StudentsMain] ([StdCode])
GO
ALTER TABLE [dbo].[StudentAccounts] CHECK CONSTRAINT [fkStd_account_data]
GO
ALTER TABLE [dbo].[StudentClothes]  WITH CHECK ADD  CONSTRAINT [fk_clothes_student] FOREIGN KEY([ClothesID])
REFERENCES [dbo].[Clothes] ([ClothesID])
GO
ALTER TABLE [dbo].[StudentClothes] CHECK CONSTRAINT [fk_clothes_student]
GO
ALTER TABLE [dbo].[StudentClothes]  WITH CHECK ADD  CONSTRAINT [fk_stu_clothes] FOREIGN KEY([StdCode])
REFERENCES [dbo].[StudentsMain] ([StdCode])
GO
ALTER TABLE [dbo].[StudentClothes] CHECK CONSTRAINT [fk_stu_clothes]
GO
ALTER TABLE [dbo].[StudentGradesHistory]  WITH CHECK ADD  CONSTRAINT [fk_grade_history] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([GradeID])
GO
ALTER TABLE [dbo].[StudentGradesHistory] CHECK CONSTRAINT [fk_grade_history]
GO
ALTER TABLE [dbo].[StudentGradesHistory]  WITH CHECK ADD  CONSTRAINT [fk_stu_history] FOREIGN KEY([StdCode])
REFERENCES [dbo].[StudentsMain] ([StdCode])
GO
ALTER TABLE [dbo].[StudentGradesHistory] CHECK CONSTRAINT [fk_stu_history]
GO
ALTER TABLE [dbo].[StudentsMain]  WITH CHECK ADD  CONSTRAINT [fk_class_main] FOREIGN KEY([StdClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[StudentsMain] CHECK CONSTRAINT [fk_class_main]
GO
ALTER TABLE [dbo].[StudentsMain]  WITH CHECK ADD  CONSTRAINT [fk_school_main] FOREIGN KEY([StdSchoolID])
REFERENCES [dbo].[NESSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[StudentsMain] CHECK CONSTRAINT [fk_school_main]
GO
ALTER TABLE [dbo].[StudentSubjectEnroll]  WITH CHECK ADD  CONSTRAINT [fk_stu_Enroll] FOREIGN KEY([StdCode])
REFERENCES [dbo].[StudentsMain] ([StdCode])
GO
ALTER TABLE [dbo].[StudentSubjectEnroll] CHECK CONSTRAINT [fk_stu_Enroll]
GO
ALTER TABLE [dbo].[StudentSubjectEnroll]  WITH CHECK ADD  CONSTRAINT [fk_subject_Enroll] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[StudentSubjectEnroll] CHECK CONSTRAINT [fk_subject_Enroll]
GO
/****** Object:  StoredProcedure [dbo].[deleteInvoice]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteInvoice]
(@invoiceID int)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	invoice_payment
         WHERE  id = @invoiceID
 
END

GO
/****** Object:  StoredProcedure [dbo].[deleteInvoiceItem]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteInvoiceItem]
(@itemID int,
 @invoiceID int)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	invoice_item
         WHERE  invoice = @invoiceID 
				and
				payment_item=@itemID
 
END

GO
/****** Object:  StoredProcedure [dbo].[deletePayment]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePayment]
(@paymentID int)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	payment_details
         WHERE  id = @paymentID
 
END

GO
/****** Object:  StoredProcedure [dbo].[getInvoiceById]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getInvoiceById]
(@invoiceId int)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_payment
         WHERE  id = @invoiceId
 
END

GO
/****** Object:  StoredProcedure [dbo].[getInvoiceItem]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getInvoiceItem]
(@itemID int,
 @invoiceID int)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_item ii 
		 join payment_details pd 
		 on 
		 ii.payment_item=pd.id
         WHERE  ii.invoice = @invoiceID
		 and
		 ii.payment_item=@itemID
 
END

GO
/****** Object:  StoredProcedure [dbo].[getInvoicesById]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getInvoicesById]
(@invoiceId int)
AS
BEGIN
SET NOCOUNT ON
	Begin
		WITH  MyDescendants AS (
		SELECT *
		FROM invoice_payment
		WHERE id = @invoiceId

		UNION ALL

		SELECT invoice_payment.*
		FROM invoice_payment
		JOIN MyDescendants ON invoice_payment.id = MyDescendants.previous_payment
	)
	SELECT * FROM MyDescendants
	end
END

GO
/****** Object:  StoredProcedure [dbo].[getPayment]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPayment]
(@paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  school=@paymentSchool 
		 and
		 year=@paymentYear 
		 and
		 student_type=@paymentStudentType
 
END

GO
/****** Object:  StoredProcedure [dbo].[getPaymentById]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPaymentById]
(@paymentID int)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  id = @paymentID
 
END

GO
/****** Object:  StoredProcedure [dbo].[getPaymentItems]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPaymentItems]
(@school int,
 @student_type smallint,
 @grade smallint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  school = @school
		 and
		 student_type=@student_type
		 and
		 Grade=@grade
 
END

GO
/****** Object:  StoredProcedure [dbo].[getPreviousPayment]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPreviousPayment]
(@student int)
AS
BEGIN
SET NOCOUNT ON
		 select *
from invoice_payment
where student=@student
order by date desc,id desc;
 
END

GO
/****** Object:  StoredProcedure [dbo].[insertInvoiceItem]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertInvoiceItem]
(@itemID int,
 @invoiceID int)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO invoice_item(invoice,payment_item) VALUES (@invoiceID,@itemID)
 
END

GO
/****** Object:  StoredProcedure [dbo].[insertPaymentDetail]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertPaymentDetail]
(@paymentName varchar(200),
 @paymentType int,
 @paymentAmount money,
 @paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO payment_details(name,type,amount,school,year,student_type) VALUES (@paymentName,@paymentType,@paymentAmount,@paymentSchool,@paymentYear,@paymentStudentType)
 
END

GO
/****** Object:  StoredProcedure [dbo].[insertStudentFees]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertStudentFees]
(@feeActivity int,
 @feeResources int,
 @feeFirstInstallment int,
 @feeSecondInstallment int,
 @feeUniform int,
 @feeTotalFees int,
 @feeYear date)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO student_fees(activity,resources,first_installment,second_installment,uniform,total_fees,year) VALUES (@feeActivity,@feeResources,@feeFirstInstallment,@feeSecondInstallment,@feeUniform,@feeTotalFees,@feeYear)
 
END

GO
/****** Object:  StoredProcedure [dbo].[updatePaymentDetail]    Script Date: 20/07/2022 16:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePaymentDetail]
(@paymentId int,
 @paymentName varchar(200),
 @paymentType int,
 @paymentAmount money,
 @paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
 
 UPDATE payment_details
            SET    name=@paymentName,
			type=@paymentType,
			amount=@paymentAmount,
			school=@paymentSchool,
			year=@paymentYear,
			student_type=@paymentStudentType
            WHERE  id = @paymentId
 
END

GO
USE [master]
GO
ALTER DATABASE [Student_Affairs_Database] SET  READ_WRITE 
GO

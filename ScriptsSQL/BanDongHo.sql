USE [master]
GO
/****** Object:  Database [BanDongHo]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE DATABASE [BanDongHo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanDongHo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BanDongHo.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BanDongHo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BanDongHo_log.ldf' , SIZE = 5248KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BanDongHo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanDongHo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanDongHo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanDongHo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanDongHo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanDongHo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanDongHo] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanDongHo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanDongHo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanDongHo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanDongHo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanDongHo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanDongHo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanDongHo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanDongHo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanDongHo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanDongHo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanDongHo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanDongHo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanDongHo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanDongHo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanDongHo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanDongHo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanDongHo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanDongHo] SET RECOVERY FULL 
GO
ALTER DATABASE [BanDongHo] SET  MULTI_USER 
GO
ALTER DATABASE [BanDongHo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanDongHo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanDongHo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanDongHo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BanDongHo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanDongHo', N'ON'
GO
USE [BanDongHo]
GO
/****** Object:  User [HTRS]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE USER [HTRS] FOR LOGIN [HTRS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HTDN]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE USER [HTDN] FOR LOGIN [HTDN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BanDongHoNhanVien]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE USER [BanDongHoNhanVien] FOR LOGIN [BanDongHoNhanVien] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BanDongHoKhachHang]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE USER [BanDongHoKhachHang] FOR LOGIN [BanDongHoKhachHang] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [NHANVIEN]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE ROLE [NHANVIEN]
GO
/****** Object:  DatabaseRole [KHACHHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE ROLE [KHACHHANG]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [HTRS]
GO
ALTER ROLE [NHANVIEN] ADD MEMBER [BanDongHoNhanVien]
GO
ALTER ROLE [db_owner] ADD MEMBER [BanDongHoNhanVien]
GO
ALTER ROLE [KHACHHANG] ADD MEMBER [BanDongHoKhachHang]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BanDongHoKhachHang]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [BanDongHoKhachHang]
GO
ALTER ROLE [db_owner] ADD MEMBER [NHANVIEN]
GO
ALTER ROLE [db_datareader] ADD MEMBER [KHACHHANG]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [KHACHHANG]
GO
/****** Object:  Table [dbo].[ApDungKM]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApDungKM](
	[MaDotKM] [nvarchar](10) NOT NULL,
	[MaDongHo] [nvarchar](10) NOT NULL,
	[TyLeKM] [float] NOT NULL,
 CONSTRAINT [PK_ApDungKM] PRIMARY KEY CLUSTERED 
(
	[MaDotKM] ASC,
	[MaDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_BaoHanh]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_BaoHanh](
	[MaPhieuBaoHanh] [int] NOT NULL,
	[MaNhanVienNhan] [int] NOT NULL,
	[MaNhanVienTra] [int] NOT NULL,
	[NgayBH] [date] NOT NULL,
	[TrangThaiTruocBH] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CT_BaoHanh] PRIMARY KEY CLUSTERED 
(
	[MaPhieuBaoHanh] ASC,
	[MaNhanVienNhan] ASC,
	[MaNhanVienTra] ASC,
	[NgayBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_DonDatHang]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DonDatHang](
	[MaDonDatHang] [nvarchar](20) NOT NULL,
	[MaDongHo] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [money] NOT NULL,
 CONSTRAINT [PK_CT_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC,
	[MaDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_PhieuDat]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuDat](
	[MaCT_PhieuDat] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieuDat] [int] NOT NULL,
	[MaDongHo] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
 CONSTRAINT [PK_CT_PhieuDat] PRIMARY KEY CLUSTERED 
(
	[MaPhieuDat] ASC,
	[MaDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_PhieuNhap]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuNhap](
	[MaPhieuNhap] [nvarchar](20) NOT NULL,
	[MaDongHo] [nvarchar](10) NOT NULL,
	[DonGia] [money] NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_CT_PhieuNhap_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaDongHo] ASC,
	[DonGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_PhieuTra]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuTra](
	[MaPhieuTra] [int] NOT NULL,
	[MaCT_PhieuDat] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[LyDo] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CT_PhieuTra] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTra] ASC,
	[MaCT_PhieuDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoiGia]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiGia](
	[MaNhanVien] [int] NOT NULL,
	[MaDongHo] [nvarchar](10) NOT NULL,
	[NgayDoi] [date] NOT NULL,
	[Gia] [money] NOT NULL,
 CONSTRAINT [PK_DoiGia] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC,
	[MaDongHo] ASC,
	[NgayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDonDatHang] [nvarchar](20) NOT NULL,
	[NgayDatHang] [date] NULL CONSTRAINT [DF__DonDatHan__NgayD__35BCFE0A]  DEFAULT (getdate()),
	[MaNhanVien] [int] NOT NULL,
	[MaNhaCungCap] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__DonDatHa__17C939D1E419820C] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DongHo]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongHo](
	[MaDongHo] [nvarchar](10) NOT NULL,
	[TenDongHo] [nvarchar](50) NOT NULL,
	[Gia] [money] NOT NULL,
	[SoLuongTon] [int] NULL CONSTRAINT [DF__DongHo__SoLuongT__29572725]  DEFAULT ((0)),
	[MoTa] [nvarchar](128) NULL,
	[HinhAnh] [nvarchar](128) NOT NULL,
	[MaTrangThai] [nvarchar](5) NOT NULL CONSTRAINT [DF__DongHo__TrangTha__2B3F6F97]  DEFAULT ('THH'),
	[MaLoai] [nvarchar](10) NOT NULL,
	[MaHang] [nvarchar](10) NOT NULL,
	[MaNhaCungCap] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__DongHo__1EF57D74D30663DB] PRIMARY KEY CLUSTERED 
(
	[MaDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DotKhuyenMai]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DotKhuyenMai](
	[MaDotKM] [nvarchar](10) NOT NULL,
	[LyDoKM] [nvarchar](128) NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[MaNhanVien] [int] NOT NULL,
 CONSTRAINT [PK__DotKhuye__C3162DCF809625E3] PRIMARY KEY CLUSTERED 
(
	[MaDotKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangDongHo]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangDongHo](
	[MaHang] [nvarchar](10) NOT NULL,
	[TenHang] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[SoHoaDon] [int] NULL,
	[NgayInHoaDon] [date] NULL,
	[TongTien] [money] NULL,
	[MaSoThue] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[CMND] [nvarchar](10) NOT NULL,
	[Ho] [nvarchar](40) NOT NULL,
	[Ten] [nvarchar](10) NOT NULL,
	[GioiTinh] [nvarchar](3) NOT NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](128) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](128) NULL,
	[MaSoThue] [nvarchar](20) NULL,
	[TaiKhoan] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__KhachHan__88D2F0E51DA14ADD] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDongHo]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDongHo](
	[MaLoai] [nvarchar](10) NOT NULL,
	[TenLoai] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [nvarchar](10) NOT NULL,
	[TenNhaCungCap] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](40) NOT NULL,
	[Ten] [nvarchar](10) NOT NULL,
	[GioiTinh] [nvarchar](3) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](128) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[TaiKhoan] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__NhanVien__77B2CA470E0E85C7] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuBaoHanh]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuBaoHanh](
	[MaPhieuBaoHanh] [int] NOT NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuDat]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDat](
	[MaPhieuDat] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [date] NULL CONSTRAINT [DF__PhieuDat__NgayDa__71D1E811]  DEFAULT (getdate()),
	[HoTenNN] [nvarchar](50) NOT NULL,
	[DiaChiNN] [nvarchar](128) NOT NULL,
	[SDTNN] [nvarchar](10) NOT NULL,
	[NgayGioGiaoHang] [date] NULL,
	[TrangThai] [nvarchar](10) NULL CONSTRAINT [DF__PhieuDat__TrangT__72C60C4A]  DEFAULT ('CD'),
	[MaKhachHang] [int] NOT NULL,
	[MaNhanVien] [int] NOT NULL,
 CONSTRAINT [PK__PhieuDat__01EA0D2B86B5B4DE] PRIMARY KEY CLUSTERED 
(
	[MaPhieuDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [nvarchar](20) NOT NULL,
	[NgayNhap] [date] NULL CONSTRAINT [DF__PhieuNhap__NgayN__5DCAEF64]  DEFAULT (getdate()),
	[MaNhanVien] [int] NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuTra]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuTra](
	[MaPhieuTra] [int] IDENTITY(1,1) NOT NULL,
	[NgayTra] [date] NOT NULL,
	[MaNhanVien] [int] NOT NULL,
 CONSTRAINT [PK__PhieuTra__1D880A46B2F8E303] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoan] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
	[Nhom] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [nvarchar](5) NOT NULL,
	[TrangThai] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[FN_GET_BACKUP_HISTORY]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_GET_BACKUP_HISTORY] ()
RETURNS TABLE
AS
RETURN
( 
	SELECT bs.database_name, BackupBatDau = bs.backup_start_date, BackupXong = bs.backup_finish_date, Loai = IIF(bs.type = 'D', 'Full', IIF(bs.type = 'I', 'Differential', 'Transaction Log'))
	FROM msdb.dbo.backupset AS bs
	WHERE bs.database_name = 'BanDongHo'
)
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GET_DONGHO_NCC]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_GET_DONGHO_NCC](@MADONDATHANG NVARCHAR(20)) RETURNS TABLE AS
RETURN 
(
	SELECT MaDongHo, TenDongHo = MaDongHo + ' - ' + TenDongHo 
	FROM DongHo 
	WHERE 
		MaNhaCungCap = (SELECT MaNhaCungCap FROM DonDatHang WHERE MaDonDatHang = @MADONDATHANG) AND -- MÃ NCC GIỐNG VỚI CỦA ĐƠN ĐẶT HÀNG
		MaDongHo NOT IN (SELECT MaDongHo FROM CT_DonDatHang WHERE MaDonDatHang = @MADONDATHANG) -- LOẠI NHỮNG ĐỒNG HỒ ĐÃ CÓ TRONG CT ĐƠN ĐẶT KHÁC
);
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GET_DONGHO_TRONG_DONDAT]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_GET_DONGHO_TRONG_DONDAT](@MADONDATHANG NVARCHAR(20)) RETURNS TABLE AS
RETURN
(
	SELECT CT_DonDatHang.MaDongHo, TenDongHo = DongHo.MaDongHo + ' - ' + DongHo.TenDongHo 
	FROM CT_DonDatHang
	INNER JOIN DongHo
	ON CT_DonDatHang.MaDongHo = DongHo.MaDongHo
	WHERE MaDonDatHang = @MADONDATHANG
)
GO
/****** Object:  View [dbo].[V_GET_NHANVIEN]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_GET_NHANVIEN] AS
SELECT *
FROM NhanVien
GO
/****** Object:  View [dbo].[V_GET_PHIEUNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_GET_PHIEUNHAP] 
AS
SELECT MaPhieuNhap, NgayNhap, MaNhanVien
FROM PhieuNhap
GO
INSERT [dbo].[CT_DonDatHang] ([MaDonDatHang], [MaDongHo], [SoLuong], [DonGia]) VALUES (N'DH20220530082832', N'DH001', 10, 2000000.0000)
INSERT [dbo].[CT_DonDatHang] ([MaDonDatHang], [MaDongHo], [SoLuong], [DonGia]) VALUES (N'DH20220530082832', N'DH003', 5, 3000000.0000)
INSERT [dbo].[CT_DonDatHang] ([MaDonDatHang], [MaDongHo], [SoLuong], [DonGia]) VALUES (N'DH20220530082832', N'DH005', 5, 5000000.0000)
INSERT [dbo].[CT_DonDatHang] ([MaDonDatHang], [MaDongHo], [SoLuong], [DonGia]) VALUES (N'DH20220531034843', N'DH002', 1, 1000000.0000)
INSERT [dbo].[CT_DonDatHang] ([MaDonDatHang], [MaDongHo], [SoLuong], [DonGia]) VALUES (N'DH20220531034843', N'DH006', 1, 3000000.0000)
INSERT [dbo].[CT_DonDatHang] ([MaDonDatHang], [MaDongHo], [SoLuong], [DonGia]) VALUES (N'DH20220531034850', N'DH001', 1, 4000000.0000)
INSERT [dbo].[CT_DonDatHang] ([MaDonDatHang], [MaDongHo], [SoLuong], [DonGia]) VALUES (N'DH20220608085522', N'DH001', 5, 3000000.0000)
SET IDENTITY_INSERT [dbo].[CT_PhieuDat] ON 

INSERT [dbo].[CT_PhieuDat] ([MaCT_PhieuDat], [MaPhieuDat], [MaDongHo], [SoLuong], [DonGia]) VALUES (1, 1, N'DH001', 8, 16000000.0000)
INSERT [dbo].[CT_PhieuDat] ([MaCT_PhieuDat], [MaPhieuDat], [MaDongHo], [SoLuong], [DonGia]) VALUES (1002, 1002, N'DH005', 2, 20000000.0000)
SET IDENTITY_INSERT [dbo].[CT_PhieuDat] OFF
INSERT [dbo].[CT_PhieuNhap] ([MaPhieuNhap], [MaDongHo], [DonGia], [SoLuong]) VALUES (N'DH20220530082832', N'DH001', 2000000.0000, 8)
INSERT [dbo].[CT_PhieuNhap] ([MaPhieuNhap], [MaDongHo], [DonGia], [SoLuong]) VALUES (N'DH20220530082832', N'DH005', 5000000.0000, 5)
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayDatHang], [MaNhanVien], [MaNhaCungCap]) VALUES (N'DH20220530082832', CAST(N'2022-05-30' AS Date), 4, N'NTT')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayDatHang], [MaNhanVien], [MaNhaCungCap]) VALUES (N'DH20220530083458', CAST(N'2022-05-30' AS Date), 4, N'NTT')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayDatHang], [MaNhanVien], [MaNhaCungCap]) VALUES (N'DH20220531034843', CAST(N'2022-05-31' AS Date), 4, N'NTT2')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayDatHang], [MaNhanVien], [MaNhaCungCap]) VALUES (N'DH20220531034850', CAST(N'2022-05-31' AS Date), 4, N'NTT')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayDatHang], [MaNhanVien], [MaNhaCungCap]) VALUES (N'DH20220608085522', CAST(N'2022-06-08' AS Date), 4, N'NTT')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH001', N'Đồng hồ no1', 2000000.0000, 0, N'Đồng hồ số 1', N'dongho1.jpg', N'THH', N'SM', N'CA', N'NTT')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH002', N'Đồng hồ no2', 1000000.0000, 0, N'Đồng hồ no2', N'dongho2.jpg', N'NKD', N'TE', N'RO', N'NTT2')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH003', N'Đồng hồ no3', 1000000.0000, 0, N'Đồng hồ no1', N'dongho3.jpg', N'THH', N'CO', N'PAPH', N'NTT')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH004', N'Đồng hồ no4', 2000000.0000, 0, N'Đồng hồ no4', N'dong-ho-seiko-snk807k2_1-ims.jpg', N'THH', N'TE', N'CA', N'NTT')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH005', N'Đồng hồ no5', 10000000.0000, 3, N'Đồng hồ no5', N'dong-ho-orient--fag03001d0_2-ims.jpg', N'CH', N'SM', N'RO', N'NTT')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH006', N'Đồng hồ 6', 6000000.0000, 0, N'Chưa có mô tả', N'RA-AS0010S10B-2-1639626352140.jpg', N'NKD', N'CO', N'TAHE', N'NTT2')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH007', N'Đồng hồ 7', 3000000.0000, 0, N'Mô tả đồng hồ số 7', N'dong-ho-casio-mtp-1384l-1a_1-ims.jpg', N'THH', N'CO', N'CA', N'NTT')
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [Gia], [SoLuongTon], [MoTa], [HinhAnh], [MaTrangThai], [MaLoai], [MaHang], [MaNhaCungCap]) VALUES (N'DH008', N'Đồng hồ 8', 8888000.0000, 0, N'Đồng hồ đồ chơi đến từ thương hiệu Rolex', N'dong-ho-casio-mtp-1384l-1a_1-ims.jpg', N'THH', N'TE', N'RO', N'NTT2')
INSERT [dbo].[HangDongHo] ([MaHang], [TenHang]) VALUES (N'CA', N'Casio')
INSERT [dbo].[HangDongHo] ([MaHang], [TenHang]) VALUES (N'PAPH', N'Patek Philippe')
INSERT [dbo].[HangDongHo] ([MaHang], [TenHang]) VALUES (N'RO', N'Rolex')
INSERT [dbo].[HangDongHo] ([MaHang], [TenHang]) VALUES (N'TAHE', N'Tag Heuer')
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [CMND], [Ho], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [Email], [MaSoThue], [TaiKhoan]) VALUES (1, N'123', N'Nguyễn Thành', N'Tân', N'Nam', CAST(N'2001-01-01' AS Date), N'Bình Dương', N'000', N'abc', N'123', N'ntt2')
INSERT [dbo].[KhachHang] ([MaKhachHang], [CMND], [Ho], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [Email], [MaSoThue], [TaiKhoan]) VALUES (2, N'516219286', N'Nguyễn', N'A', N'Nam', CAST(N'2022-06-06' AS Date), N'Tp HCM', N'461269861', NULL, NULL, N'ntt10')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (N'CO', N'Đồng hồ cơ')
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (N'TE', N'Đồng hồ đồ chơi')
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (N'SM', N'Đồng hồ thông minh')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SDT]) VALUES (N'NTT', N'Nguyễn Thành Tân', N'Bình Dương', N'ntt', N'000')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SDT]) VALUES (N'NTT2', N'Nguyễn Thành Tân 2', N'Bình Dương', N'ntt2', N'111')
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNhanVien], [Ho], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [Email], [TaiKhoan]) VALUES (4, N'Nguyễn Thành', N'Tân', N'Nam', CAST(N'2001-01-01' AS Date), N'Bình Dương', N'000', N'abc', N'ntt')
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ho], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [Email], [TaiKhoan]) VALUES (7, N'Nguyễn Thành', N'Tân', N'Nam', CAST(N'2001-01-01' AS Date), N'Bình Dương', N'111', N'def', N'qtv')
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ho], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [Email], [TaiKhoan]) VALUES (13, N'Nguyễn Thành', N'Tân', N'Nam', CAST(N'2022-06-03' AS Date), N'Bình Dương', N'333', N'bbb', N'ntt3')
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ho], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [Email], [TaiKhoan]) VALUES (14, N'Nguyễn', N'Tân', N'Nam', CAST(N'2022-06-03' AS Date), N'BD', N'444', N'bon', N'ntt4')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuDat] ON 

INSERT [dbo].[PhieuDat] ([MaPhieuDat], [NgayDat], [HoTenNN], [DiaChiNN], [SDTNN], [NgayGioGiaoHang], [TrangThai], [MaKhachHang], [MaNhanVien]) VALUES (1, CAST(N'2022-06-07' AS Date), N'Nguyễn Thành Tân', N'Bình Dương', N'000', NULL, N'DD', 1, 4)
INSERT [dbo].[PhieuDat] ([MaPhieuDat], [NgayDat], [HoTenNN], [DiaChiNN], [SDTNN], [NgayGioGiaoHang], [TrangThai], [MaKhachHang], [MaNhanVien]) VALUES (1002, CAST(N'2022-06-08' AS Date), N'Nguyễn Thành Tân', N'Bình Dương', N'000', NULL, N'DD', 1, 4)
SET IDENTITY_INSERT [dbo].[PhieuDat] OFF
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNhanVien]) VALUES (N'DH20220530082832', CAST(N'2022-06-02' AS Date), 4)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNhanVien]) VALUES (N'DH20220531034843', CAST(N'2022-06-01' AS Date), 4)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNhanVien]) VALUES (N'DH20220531034850', CAST(N'2022-06-01' AS Date), 4)
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Nhom]) VALUES (N'ntt', N'123456', N'nhanvien')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Nhom]) VALUES (N'ntt10', N'123456', N'khachhang')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Nhom]) VALUES (N'ntt2', N'123456', N'khachhang')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Nhom]) VALUES (N'ntt3', N'123456', N'nhanvien')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Nhom]) VALUES (N'ntt4', N'123456', N'nhanvien')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Nhom]) VALUES (N'qtv', N'123456', N'quantri')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TrangThai]) VALUES (N'CH', N'Còn hàng')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TrangThai]) VALUES (N'NKD', N'Ngừng kinh doanh')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TrangThai]) VALUES (N'THH', N'Tạm hết hàng')
/****** Object:  Index [UQ__CT_Phieu__1B18121E9A01696D]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[CT_PhieuDat] ADD UNIQUE NONCLUSTERED 
(
	[MaCT_PhieuDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__HangDong__E6C9BFA87EFF66C7]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[HangDongHo] ADD UNIQUE NONCLUSTERED 
(
	[TenHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__HoaDon__012E9E5334389E0E]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[HoaDon] ADD UNIQUE NONCLUSTERED 
(
	[SoHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KhachHan__CA1930A56F4C2009]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [UQ__KhachHan__CA1930A56F4C2009] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KhachHan__F67C8D0B4F8B2E9D]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [UQ__KhachHan__F67C8D0B4F8B2E9D] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_KhachHang_TaiKhoan]    Script Date: 6/8/2022 10:26:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_KhachHang_TaiKhoan] ON [dbo].[KhachHang]
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__LoaiDong__E29B104207E96B8D]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[LoaiDongHo] ADD UNIQUE NONCLUSTERED 
(
	[TenLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhaCungC__A9D1053437EBE8DE]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[NhaCungCap] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhaCungC__C6818DB24C79DEA8]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[NhaCungCap] ADD UNIQUE NONCLUSTERED 
(
	[TenNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhaCungC__CA1930A5C51D5758]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[NhaCungCap] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_NhanVien_TaiKhoan]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UK_NhanVien_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhanVien__A9D1053467250B56]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UQ__NhanVien__A9D1053467250B56] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhanVien__CA1930A5E6105426]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UQ__NhanVien__CA1930A5E6105426] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__PhieuBao__340E9DBB25F97B25]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[PhieuBaoHanh] ADD UNIQUE NONCLUSTERED 
(
	[MaPhieuBaoHanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__PhieuNha__1470EF3A60C43909]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [UQ__PhieuNha__1470EF3A60C43909] UNIQUE NONCLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_TrangThai]    Script Date: 6/8/2022 10:26:47 PM ******/
ALTER TABLE [dbo].[TrangThai] ADD  CONSTRAINT [UK_TrangThai] UNIQUE NONCLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_BaoHanh] ADD  CONSTRAINT [DF__CT_BaoHan__NgayB__19DFD96B]  DEFAULT (getdate()) FOR [NgayBH]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NgayInHoaDon]
GO
ALTER TABLE [dbo].[PhieuBaoHanh] ADD  DEFAULT (getdate()) FOR [NgayBatDau]
GO
ALTER TABLE [dbo].[ApDungKM]  WITH CHECK ADD  CONSTRAINT [FK__ApDungKM__MaDong__208CD6FA] FOREIGN KEY([MaDongHo])
REFERENCES [dbo].[DongHo] ([MaDongHo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ApDungKM] CHECK CONSTRAINT [FK__ApDungKM__MaDong__208CD6FA]
GO
ALTER TABLE [dbo].[ApDungKM]  WITH CHECK ADD  CONSTRAINT [FK__ApDungKM__MaDotK__1F98B2C1] FOREIGN KEY([MaDotKM])
REFERENCES [dbo].[DotKhuyenMai] ([MaDotKM])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ApDungKM] CHECK CONSTRAINT [FK__ApDungKM__MaDotK__1F98B2C1]
GO
ALTER TABLE [dbo].[CT_BaoHanh]  WITH CHECK ADD  CONSTRAINT [FK__CT_BaoHan__MaNha__17F790F9] FOREIGN KEY([MaNhanVienNhan])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_BaoHanh] CHECK CONSTRAINT [FK__CT_BaoHan__MaNha__17F790F9]
GO
ALTER TABLE [dbo].[CT_BaoHanh]  WITH CHECK ADD  CONSTRAINT [FK__CT_BaoHan__MaNha__18EBB532] FOREIGN KEY([MaNhanVienTra])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[CT_BaoHanh] CHECK CONSTRAINT [FK__CT_BaoHan__MaNha__18EBB532]
GO
ALTER TABLE [dbo].[CT_BaoHanh]  WITH CHECK ADD  CONSTRAINT [FK__CT_BaoHan__MaPhi__17036CC0] FOREIGN KEY([MaPhieuBaoHanh])
REFERENCES [dbo].[PhieuBaoHanh] ([MaPhieuBaoHanh])
GO
ALTER TABLE [dbo].[CT_BaoHanh] CHECK CONSTRAINT [FK__CT_BaoHan__MaPhi__17036CC0]
GO
ALTER TABLE [dbo].[CT_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK__CT_DonDat__MaDon__3E52440B] FOREIGN KEY([MaDonDatHang])
REFERENCES [dbo].[DonDatHang] ([MaDonDatHang])
GO
ALTER TABLE [dbo].[CT_DonDatHang] CHECK CONSTRAINT [FK__CT_DonDat__MaDon__3E52440B]
GO
ALTER TABLE [dbo].[CT_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK__CT_DonDat__MaDon__3F466844] FOREIGN KEY([MaDongHo])
REFERENCES [dbo].[DongHo] ([MaDongHo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DonDatHang] CHECK CONSTRAINT [FK__CT_DonDat__MaDon__3F466844]
GO
ALTER TABLE [dbo].[CT_PhieuDat]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuDat_MaDongHo] FOREIGN KEY([MaDongHo])
REFERENCES [dbo].[DongHo] ([MaDongHo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_PhieuDat] CHECK CONSTRAINT [FK_CT_PhieuDat_MaDongHo]
GO
ALTER TABLE [dbo].[CT_PhieuDat]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuDat_MaPhieuDat] FOREIGN KEY([MaPhieuDat])
REFERENCES [dbo].[PhieuDat] ([MaPhieuDat])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_PhieuDat] CHECK CONSTRAINT [FK_CT_PhieuDat_MaPhieuDat]
GO
ALTER TABLE [dbo].[CT_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_DONGHO] FOREIGN KEY([MaDongHo])
REFERENCES [dbo].[DongHo] ([MaDongHo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_PhieuNhap] CHECK CONSTRAINT [FK_DONGHO]
GO
ALTER TABLE [dbo].[CT_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAP] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_PhieuNhap] CHECK CONSTRAINT [FK_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CT_PhieuTra]  WITH CHECK ADD FOREIGN KEY([MaCT_PhieuDat])
REFERENCES [dbo].[CT_PhieuDat] ([MaCT_PhieuDat])
GO
ALTER TABLE [dbo].[CT_PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK__CT_PhieuT__MaPhi__09A971A2] FOREIGN KEY([MaPhieuTra])
REFERENCES [dbo].[PhieuTra] ([MaPhieuTra])
GO
ALTER TABLE [dbo].[CT_PhieuTra] CHECK CONSTRAINT [FK__CT_PhieuT__MaPhi__09A971A2]
GO
ALTER TABLE [dbo].[DoiGia]  WITH CHECK ADD  CONSTRAINT [FK_DoiGia_DongHo] FOREIGN KEY([MaDongHo])
REFERENCES [dbo].[DongHo] ([MaDongHo])
GO
ALTER TABLE [dbo].[DoiGia] CHECK CONSTRAINT [FK_DoiGia_DongHo]
GO
ALTER TABLE [dbo].[DoiGia]  WITH CHECK ADD  CONSTRAINT [FK_DoiGia_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DoiGia] CHECK CONSTRAINT [FK_DoiGia_NhanVien]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK__DonDatHan__MaNha__36B12243] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK__DonDatHan__MaNha__36B12243]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK__DonDatHan__MaNha__37A5467C] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK__DonDatHan__MaNha__37A5467C]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK__DongHo__MaHang__2D27B809] FOREIGN KEY([MaHang])
REFERENCES [dbo].[HangDongHo] ([MaHang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK__DongHo__MaHang__2D27B809]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK__DongHo__MaLoai__2C3393D0] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiDongHo] ([MaLoai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK__DongHo__MaLoai__2C3393D0]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK__DongHo__MaNhaCun__2E1BDC42] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK__DongHo__MaNhaCun__2E1BDC42]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK_DongHo_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK_DongHo_TrangThai]
GO
ALTER TABLE [dbo].[DotKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK__DotKhuyen__MaNha__1CBC4616] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DotKhuyenMai] CHECK CONSTRAINT [FK__DotKhuyen__MaNha__1CBC4616]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__SoHoaDon__7F2BE32F] FOREIGN KEY([SoHoaDon])
REFERENCES [dbo].[PhieuDat] ([MaPhieuDat])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__SoHoaDon__7F2BE32F]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_TaiKhoan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[PhieuBaoHanh]  WITH CHECK ADD FOREIGN KEY([MaPhieuBaoHanh])
REFERENCES [dbo].[CT_PhieuDat] ([MaCT_PhieuDat])
GO
ALTER TABLE [dbo].[PhieuDat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDat_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuDat] CHECK CONSTRAINT [FK_PhieuDat_KhachHang]
GO
ALTER TABLE [dbo].[PhieuDat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDat_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuDat] CHECK CONSTRAINT [FK_PhieuDat_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_MaPhieuNhap] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[DonDatHang] ([MaDonDatHang])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_MaPhieuNhap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK__PhieuTra__MaNhan__06CD04F7] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuTra] CHECK CONSTRAINT [FK__PhieuTra__MaNhan__06CD04F7]
GO
ALTER TABLE [dbo].[CT_DonDatHang]  WITH CHECK ADD  CONSTRAINT [CK__CT_DonDat__DonGi__412EB0B6] CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[CT_DonDatHang] CHECK CONSTRAINT [CK__CT_DonDat__DonGi__412EB0B6]
GO
ALTER TABLE [dbo].[CT_DonDatHang]  WITH CHECK ADD  CONSTRAINT [CK__CT_DonDat__SoLuo__403A8C7D] CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[CT_DonDatHang] CHECK CONSTRAINT [CK__CT_DonDat__SoLuo__403A8C7D]
GO
ALTER TABLE [dbo].[CT_PhieuDat]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[CT_PhieuDat]  WITH CHECK ADD CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[CT_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [CK__CT_PhieuN__DonGi__6477ECF3] CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[CT_PhieuNhap] CHECK CONSTRAINT [CK__CT_PhieuN__DonGi__6477ECF3]
GO
ALTER TABLE [dbo].[CT_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [CK__CT_PhieuN__SoLuo__6383C8BA] CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[CT_PhieuNhap] CHECK CONSTRAINT [CK__CT_PhieuN__SoLuo__6383C8BA]
GO
ALTER TABLE [dbo].[CT_PhieuTra]  WITH CHECK ADD CHECK  (([soluong]>(0)))
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [CK__DongHo__Gia__276EDEB3] CHECK  (([Gia]>=(0)))
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [CK__DongHo__Gia__276EDEB3]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [CK__DongHo__SoLuongT__286302EC] CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [CK__DongHo__SoLuongT__286302EC]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CK_GioiTinh] CHECK  (([GioiTinh]=N'Nam' OR [GioiTinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CK_GioiTinh]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK__NhanVien__GioiTi__32E0915F] CHECK  (([GioiTinh]=N'Nữ' OR [GioiTinh]=N'Nam'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK__NhanVien__GioiTi__32E0915F]
GO
ALTER TABLE [dbo].[PhieuDat]  WITH CHECK ADD  CONSTRAINT [CK_TrangThai] CHECK  (([TrangThai]='CD' OR [TrangThai]='DD' OR [TrangThai]='DH' OR [TrangThai]='DG'))
GO
ALTER TABLE [dbo].[PhieuDat] CHECK CONSTRAINT [CK_TrangThai]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [CK_TaiKhoan_Role] CHECK  (([Nhom]='nhanvien' OR [Nhom]='khachhang' OR [Nhom]='quantri'))
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [CK_TaiKhoan_Role]
GO
/****** Object:  StoredProcedure [dbo].[SP_CAPNHAT_DONGHO]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CAPNHAT_DONGHO] 
	@MADONGHO NVARCHAR(10), 
	@TENDONGHO NVARCHAR(50), 
	@GIA MONEY, 
	@MOTA NTEXT, 
	@HINHANH NVARCHAR(128),
	@MALOAI NVARCHAR(10), 
	@MAHANG NVARCHAR(10) 
AS
BEGIN
	UPDATE DongHo
	SET TenDongHo = @TENDONGHO, Gia = @GIA, MoTa = @MOTA, HinhAnh = @HINHANH, MaLoai = @MALOAI, MaHang = @MAHANG
	WHERE MaDongHo = @MADONGHO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECK_HAS_FULLBACKUP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHECK_HAS_FULLBACKUP]
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM FN_GET_BACKUP_HISTORY() WHERE LOAI = 'Full')
		RAISERROR(N'Hiện chưa có bản Full Backup gần nhất', 16, 1)
	ELSE SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DANGKY_KHACHHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DANGKY_KHACHHANG] @TAIKHOAN NVARCHAR(20), @MATKHAU NVARCHAR(20), @CMND NVARCHAR(10), @HO NVARCHAR(40), @TEN NVARCHAR(10), @GIOITINH NVARCHAR(3), @NGAYSINH DATE, @DIACHI NVARCHAR(128), @SDT NVARCHAR(10), @EMAIL NVARCHAR(128), @MASOTHUE NVARCHAR(20)
AS
BEGIN
	IF EXISTS(SELECT TaiKhoan FROM TaiKhoan WHERE TaiKhoan = @TAIKHOAN)
		RAISERROR('Tài khoản đã tồn tại, vui lòng chọn tài khoản khác', 16, 1);
	ELSE IF EXISTS(SELECT MaKhachHang FROM KhachHang WHERE CMND = @CMND)
		RAISERROR('CMND đã tồn tại', 16, 1);
	ELSE IF EXISTS(SELECT MaKhachHang FROM KhachHang WHERE SDT = @SDT)
		RAISERROR('Số điện thoại đã tồn tại', 16, 1);
	ELSE
	BEGIN
		BEGIN TRAN
			INSERT INTO TaiKhoan(TaiKhoan, MatKhau, Nhom) VALUES(@TAIKHOAN, @MATKHAU, 'khachhang')
			INSERT INTO KhachHang(CMND, Ho, Ten, GioiTinh, NgaySinh, DiaChi, SDT, Email, MaSoThue, TaiKhoan)
			VALUES(@CMND, @HO, @TEN, @GIOITINH, @NGAYSINH, @DIACHI, @SDT, @EMAIL, @MASOTHUE, @TAIKHOAN)
		COMMIT TRAN
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DANGNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DANGNHAP] @TAIKHOAN NVARCHAR(20), @MATKHAU NVARCHAR(20) AS
BEGIN
	IF EXISTS(SELECT TaiKhoan FROM TaiKhoan WHERE TaiKhoan = @TAIKHOAN AND MatKhau = @MATKHAU)
	BEGIN
		DECLARE @NHOM NVARCHAR(10)
		SELECT @NHOM = Nhom
		FROM TaiKhoan
		WHERE TaiKhoan = @TAIKHOAN AND MatKhau = @MATKHAU
		
		IF(@NHOM = 'nhanvien' OR @NHOM = 'quantri')
		BEGIN
			SELECT ID = MaNhanVien, Nhom, HoTen = Ho + ' ' + Ten, TaiKhoan.TaiKhoan, SDT, DiaChi
			FROM TaiKhoan
			INNER JOIN NhanVien
			ON TaiKhoan.TaiKhoan = NhanVien.TaiKhoan
			WHERE TaiKhoan.TaiKhoan = @TAIKHOAN AND TaiKhoan.MatKhau = @MATKHAU 
		END
		ELSE
		BEGIN
			SELECT ID = MaKhachHang, Nhom, HoTen = Ho + ' ' + Ten, TaiKhoan.TaiKhoan, SDT, DiaChi
			FROM TaiKhoan
			INNER JOIN KhachHang
			ON TaiKhoan.TaiKhoan = KhachHang.TaiKhoan
			WHERE TaiKhoan.TaiKhoan = @TAIKHOAN AND TaiKhoan.MatKhau = @MATKHAU 
		END
	END
	ELSE
		RAISERROR('Tài khoản hoặc mật khẩu không chính xác', 16, 1);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DIFF_BACKUP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DIFF_BACKUP] @DISKPATH VARCHAR(255)
AS
BEGIN
	BACKUP DATABASE BanDongHo to disk = @DISKPATH WITH INIT,DIFFERENTIAL
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DOI_MATKHAU]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DOI_MATKHAU] @TAIKHOAN NVARCHAR(20), @MATKHAUCU NVARCHAR(20), @MATKHAUMOI NVARCHAR(20) AS
BEGIN
	IF NOT EXISTS(SELECT TaiKhoan FROM TaiKhoan WHERE TaiKhoan = @TAIKHOAN AND MatKhau = @MATKHAUCU)
		RAISERROR('Mật khẩu cũ không chính xác', 16, 1);
	ELSE
		UPDATE TaiKhoan
		SET MatKhau = @MATKHAUMOI
		WHERE TaiKhoan = @TAIKHOAN
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FULLBACKUP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FULLBACKUP] @DISKPATH VARCHAR(255)
AS
BEGIN
	BACKUP DATABASE BanDongHo to disk = @DISKPATH WITH INIT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_1_CT_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_1_CT_DONDATHANG] @MADONDATHANG NVARCHAR(20), @MADONGHO NVARCHAR(10) AS
BEGIN
	DECLARE @SLDANHAP INT
	IF EXISTS(SELECT SoLuong FROM CT_PhieuNhap WHERE MaPhieuNhap = @MADONDATHANG AND MaDongHo = @MADONGHO)
		SELECT @SLDANHAP = SUM(SoLuong) FROM CT_PhieuNhap WHERE MaPhieuNhap = @MADONDATHANG AND MaDongHo = @MADONGHO
	ELSE
		SET @SLDANHAP = 0
	SELECT SoLuong = SoLuong - @SLDANHAP, DonGia
	FROM CT_DonDatHang
	WHERE MaDonDatHang = @MADONDATHANG AND MaDongHo = @MADONGHO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CT_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_CT_DONDATHANG] @MADONDATHANG NVARCHAR(20) AS
BEGIN
	SELECT MaDonDatHang, MaDongHo, SoLuong, DonGia
	FROM CT_DonDatHang
	WHERE MaDonDatHang = @MADONDATHANG
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CT_PHIEUNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_CT_PHIEUNHAP] @MAPHIEUNHAP NVARCHAR(20)
AS
BEGIN
	SELECT MaPhieuNhap, MaDongHo, DonGia, SoLuong
	FROM CT_PhieuNhap
	WHERE MaPhieuNhap = @MAPHIEUNHAP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_DONDATHANG] AS
BEGIN
	SELECT MaDonDatHang, NgayDatHang, MaNhanVien, 
		NhaCungCap = (SELECT TenNhaCungCap FROM NhaCungCap WHERE NhaCungCap.MaNhaCungCap = DonDatHang.MaNhaCungCap),
		DaNhapHang = IIF(EXISTS(SELECT MaPhieuNhap FROM PhieuNhap WHERE MaPhieuNhap = MaDonDatHang), 1, 0)
	FROM DonDatHang
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_DONGHO]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_DONGHO] AS
BEGIN
	SELECT MaDongHo, TenDongHo, Gia, SoLuongTon, MoTa, HinhAnh, 
		TrangThai = (SELECT TrangThai FROM TrangThai WHERE TrangThai.MaTrangThai = DongHo.MaTrangThai),
		Loai = (SELECT TenLoai FROM LoaiDongHo WHERE LoaiDongHo.MaLoai = DongHo.MaLoai),
		Hang = (SELECT TenHang FROM HangDongHo WHERE HangDongHo.MaHang = DongHo.MaHang),
		NhaCungCap = (SELECT TenNhaCungCap FROM NhaCungCap WHERE NhaCungCap.MaNhaCungCap = DongHo.MaNhaCungCap)
	FROM DongHo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_DONGHO_KH]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_DONGHO_KH] AS
BEGIN
	SELECT MaDongHo, TenDongHo, Gia, SoLuongTon, MoTa, HinhAnh, 
		TrangThai = (SELECT TrangThai FROM TrangThai WHERE TrangThai.MaTrangThai = DongHo.MaTrangThai),
		Loai = (SELECT TenLoai FROM LoaiDongHo WHERE LoaiDongHo.MaLoai = DongHo.MaLoai),
		Hang = (SELECT TenHang FROM HangDongHo WHERE HangDongHo.MaHang = DongHo.MaHang),
		NhaCungCap = (SELECT TenNhaCungCap FROM NhaCungCap WHERE NhaCungCap.MaNhaCungCap = DongHo.MaNhaCungCap)
	FROM DongHo 
	WHERE DongHo.MaTrangThai != 'NKD' 
	ORDER BY TrangThai
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_THONG_TIN_KH]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_THONG_TIN_KH]
@MaKhachHang INT
AS
BEGIN
	SELECT HOTEN = HO + ' ' + Ten, SDT, DiaChi FROM KhachHang WHERE MaKhachHang = @MaKhachHang
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LOG_BACKUP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LOG_BACKUP] @DISKPATH VARCHAR(255)
AS
BEGIN
	BACKUP LOG BanDongHo to disk = @DISKPATH WITH INIT, NO_TRUNCATE
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NGUNGKINHDOANH_DONGHO]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_NGUNGKINHDOANH_DONGHO] @MADONGHO NVARCHAR(20) AS
BEGIN
	UPDATE DongHo
	SET MaTrangThai = 'NKD'
	WHERE MaDongHo = @MADONGHO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_CT_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SUA_CT_DONDATHANG] @MADONDATHANG NVARCHAR(20), @MADONGHO NVARCHAR(10), @SOLUONG INT, @DONGIA MONEY AS
BEGIN
	UPDATE CT_DonDatHang
	SET SoLuong = @SOLUONG, DonGia = @DONGIA
	WHERE MaDonDatHang = @MADONDATHANG AND MaDongHo = @MADONGHO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_CT_PHIEUNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SUA_CT_PHIEUNHAP] @MAPHIEUNHAP NVARCHAR(20), @MADONGHO NVARCHAR(10), @DONGIA MONEY, @SOLUONG INT AS
BEGIN
	IF @SOLUONG > (SELECT SoLuong FROM CT_PhieuNhap WHERE MaPhieuNhap = @MAPHIEUNHAP AND MaDongHo = @MADONGHO) -- Sửa TĂNG số lượng nhập hàng
		UPDATE CT_PhieuNhap
		SET SoLuong = @SOLUONG, DonGia = @DONGIA
		WHERE MaPhieuNhap = @MAPHIEUNHAP AND MaDongHo = @MADONGHO
	ELSE
	BEGIN
		DECLARE @SLTON INT
		SELECT @SLTON = SoLuongTon FROM DongHo WHERE MaDongHo = @MADONGHO
		IF @SOLUONG - (SELECT SoLuong FROM CT_PhieuNhap WHERE MaPhieuNhap = @MAPHIEUNHAP AND MaDongHo = @MADONGHO) > @SLTON
			RAISERROR('Số lượng tồn của sản phẩm này hiện không đủ để giảm số lượng nhập', 16, 1);
		ELSE
			UPDATE CT_PhieuNhap
			SET SoLuong = @SOLUONG, DonGia = @DONGIA
			WHERE MaPhieuNhap = @MAPHIEUNHAP AND MaDongHo = @MADONGHO
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_CT_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_CT_DONDATHANG] @MADONDATHANG NVARCHAR(20), @MADONGHO NVARCHAR(10), @SOLUONG INT, @DONGIA MONEY AS
BEGIN
	INSERT INTO CT_DonDatHang(MaDonDatHang, MaDongHo, SoLuong, DonGia)
	VALUES(@MADONDATHANG, @MADONGHO, @SOLUONG, @DONGIA)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_CT_PHIEU_DAT]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_CT_PHIEU_DAT]
@MaPhieuDat INT,
@MaDongHo NVARCHAR(10),
@SoLuong INT,
@DonGia MONEY
AS
BEGIN
	INSERT INTO CT_PhieuDat (MaPhieuDat, MaDongHo, SoLuong, DonGia)
	VALUES (@MaPhieuDat, @MaDongHo, @SoLuong, @DonGia)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_CT_PHIEUNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_CT_PHIEUNHAP] @MAPHIEUNHAP NVARCHAR(20), @MADONGHO NVARCHAR(10), @DONGIA MONEY, @SOLUONG INT AS
BEGIN
	IF EXISTS(SELECT MaPhieuNhap FROM CT_PhieuNhap WHERE MaPhieuNhap = @MAPHIEUNHAP AND MaDongHo = @MADONGHO AND DonGia = @DONGIA)
		RAISERROR('Không thể thêm chi tiết bởi vì chi tiết nhập hàng đồng hồ với đơn giá này đã tồn tại', 16, 1);
	ELSE
	BEGIN
		INSERT CT_PhieuNhap(MaPhieuNhap, MaDongHo, DonGia, SoLuong)
		VALUES(@MAPHIEUNHAP, @MADONGHO, @DONGIA, @SOLUONG)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_DONDATHANG] @MADONDATHANG NVARCHAR(20), @MANHANVIEN INT, @MANHACUNGCAP NVARCHAR(10) AS
BEGIN
	IF EXISTS(SELECT MaDonDatHang FROM DonDatHang WHERE MaDonDatHang = @MADONDATHANG)
		RAISERROR('Mã đơn đặt hàng đã tồn tại', 16, 1);
	ELSE
		INSERT INTO DonDatHang(MaDonDatHang, NgayDatHang, MaNhanVien, MaNhaCungCap)
		VALUES(@MADONDATHANG, GETDATE(), @MANHANVIEN, @MANHACUNGCAP)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_DONGHO]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_DONGHO] @MADONGHO NVARCHAR(10), @TENDONGHO NVARCHAR(50), @GIA MONEY, @SOLUONGTON INT, @MOTA NTEXT, @HINHANH NVARCHAR(128), @MATRANGTHAI NVARCHAR(5), @MALOAI NVARCHAR(10), @MAHANG NVARCHAR(10), @MANHACUNGCAP NVARCHAR(10) AS
BEGIN
	INSERT INTO DongHo(MaDongHo, TenDongHo, Gia, SoLuongTon, MoTa, HinhAnh, MaTrangThai, MaLoai, MaHang, MaNhaCungCap)
	VALUES(@MADONGHO, @TENDONGHO, @GIA, @SOLUONGTON, @MOTA, @HINHANH, @MATRANGTHAI, @MALOAI, @MAHANG, @MANHACUNGCAP)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_NHANVIEN]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_NHANVIEN] @HO NVARCHAR(40), @TEN NVARCHAR(10), @GIOITINH NVARCHAR(3), @NGAYSINH DATE, @DIACHI NVARCHAR(128), @SDT NVARCHAR(10), @EMAIL NVARCHAR(128), @TAIKHOAN NVARCHAR(20)
AS
BEGIN
	IF EXISTS(SELECT TaiKhoan FROM TaiKhoan WHERE TaiKhoan = @TAIKHOAN)
		RAISERROR('Tài khoản đã tồn tại, hãy thử tài khoản khác', 16, 1);
	ELSE
	BEGIN
		BEGIN TRAN
			INSERT INTO TaiKhoan(TaiKhoan, MatKhau, Nhom)
			VALUES(@TAIKHOAN, '123456', 'nhanvien')
			INSERT INTO NhanVien(Ho, Ten, GioiTinh, NgaySinh, DiaChi, SDT, Email, TaiKhoan) OUTPUT inserted.MaNhanVien
			VALUES(@HO, @TEN, @GIOITINH, @NGAYSINH, @DIACHI, @SDT, @EMAIL, @TAIKHOAN)
		COMMIT TRAN
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_PHIEU_DAT]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_PHIEU_DAT]
@HoTenNN NVARCHAR(50),
@DiaChiNN NVARCHAR(128),
@SDTNN NVARCHAR(10),
@MaKhachHang INT
AS
BEGIN
	INSERT INTO PhieuDat (NgayDat, HoTenNN, DiaChiNN, SDTNN, NgayGioGiaoHang, TrangThai, MaKhachHang, MaNhanVien)
	OUTPUT inserted.MaPhieuDat
	VALUES (GETDATE(), @HoTenNN, @DiaChiNN, @SDTNN, NULL, 'DD', @MaKhachHang, 4)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_PHIEUNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_PHIEUNHAP] @MAPHIEUNHAP NVARCHAR(20), @MANHANVIEN INT AS
BEGIN
	INSERT PhieuNhap(MaPhieuNhap, NgayNhap, MaNhanVien)
	VALUES(@MAPHIEUNHAP, GETDATE(), @MANHANVIEN)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIM_KIEM_DH]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TIM_KIEM_DH]
@MaLoai NVARCHAR(10),
@MaNhaCungCap NVARCHAR(10),
@MaHang NVARCHAR(10)
AS
BEGIN
SELECT MaDongHo, TenDongHo, Gia, SoLuongTon, MoTa, HinhAnh, 
		TrangThai = (SELECT TrangThai FROM TrangThai WHERE TrangThai.MaTrangThai = DongHo.MaTrangThai),
		Loai = (SELECT TenLoai FROM LoaiDongHo WHERE MaLoai = @MaLoai),
		Hang = (SELECT TenHang FROM HangDongHo WHERE MaHang = @MaHang),
		NhaCungCap = (SELECT TenNhaCungCap FROM NhaCungCap WHERE MaNhaCungCap = @MaNhaCungCap)
	FROM DongHo WHERE MaLoai = @MaLoai AND MaHang = @MaHang AND MaNhaCungCap = @MaNhaCungCap AND DongHo.MaTrangThai != 'NKD'
	ORDER BY TrangThai
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_CT_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOA_CT_DONDATHANG] @MADONDATHANG NVARCHAR(20), @MADONGHO NVARCHAR(10) AS
BEGIN
	DELETE CT_DonDatHang
	WHERE MaDonDatHang = @MADONDATHANG AND MaDongHo = @MADONGHO
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_CT_PHIEUNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOA_CT_PHIEUNHAP] @MAPHIEUNHAP NVARCHAR(20), @MADONGHO NVARCHAR(10), @DONGIA MONEY, @SOLUONG INT AS
BEGIN
	IF (SELECT SoLuongTon FROM DongHo WHERE MaDongHo = @MADONGHO) - @SOLUONG < 0
		RAISERROR('Không thể xóa chi tiết phiếu nhập này do số lượng tồn sản phẩm trong kho không đủ', 16, 1);
	ELSE
		DELETE CT_PhieuNhap
		WHERE MaPhieuNhap = @MAPHIEUNHAP AND MaDongHo = @MADONGHO AND DonGia = @DONGIA
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_DONDATHANG]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOA_DONDATHANG] @MADONDATHANG NVARCHAR(20) AS
BEGIN
	IF EXISTS(SELECT MaPhieuNhap FROM PhieuNhap WHERE MaPhieuNhap = @MADONDATHANG)
		RAISERROR('Không thể xóa đơn đặt hàng đã nhập hàng', 16, 1);
	ELSE
	BEGIN
		BEGIN TRAN
			DELETE CT_DonDatHang WHERE MaDonDatHang = @MADONDATHANG
			DELETE DonDatHang WHERE MaDonDatHang = @MADONDATHANG
		COMMIT TRAN
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_DONGHO]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOA_DONGHO] @MADONGHO NVARCHAR(10) AS
BEGIN
	IF
	EXISTS(SELECT MaPhieuNhap FROM CT_PhieuNhap WHERE MaDongHo = @MADONGHO) OR
	EXISTS(SELECT MaDonDatHang FROM CT_DonDatHang WHERE MaDongHo = @MADONGHO) OR
	EXISTS(SELECT MaDotKM FROM ApDungKM WHERE MaDongHo = @MADONGHO) OR
	EXISTS(SELECT MaDongHo FROM DoiGia WHERE MaDongHo = @MADONGHO) OR
	EXISTS(SELECT MaPhieuDat FROM CT_PhieuDat WHERE MaDongHo = @MADONGHO)
		RAISERROR('Đồng hồ đã được sử dụng nên không thể xóa.', 16, 1);
	ELSE
		DELETE DongHo
		WHERE MaDongHo = @MADONGHO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_PHIEUNHAP]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOA_PHIEUNHAP] @MAPHIEUNHAP NVARCHAR(20) AS
BEGIN
	DELETE PhieuNhap
	WHERE MaPhieuNhap = @MAPHIEUNHAP
END
GO
/****** Object:  Trigger [dbo].[DBO.TR_AfterInsert_CTPD]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DBO.TR_AfterInsert_CTPD] ON [BanDongHo].[dbo].[CT_PhieuDat] AFTER INSERT
AS
BEGIN
	UPDATE DongHo
		SET SoLuongTon = SoLuongTon - (SELECT SoLuong FROM inserted) 
		WHERE MaDongHo = (SELECT MaDongHo FROM inserted)
END

GO
/****** Object:  Trigger [dbo].[DBO.TR_AfterDelete_CTPN]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DBO.TR_AfterDelete_CTPN] ON [BanDongHo].[dbo].[CT_PhieuNhap] AFTER DELETE
AS
BEGIN
	UPDATE DongHo
		SET SoLuongTon = SoLuongTon - (SELECT SoLuong FROM deleted) 
		WHERE MaDongHo = (SELECT MaDongHo FROM deleted) 
END
GO
/****** Object:  Trigger [dbo].[DBO.TR_AfterInsert_CTPN]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DBO.TR_AfterInsert_CTPN] ON [BanDongHo].[dbo].[CT_PhieuNhap] AFTER INSERT
AS
BEGIN
	UPDATE DongHo
		SET SoLuongTon = SoLuongTon + (SELECT SoLuong FROM inserted) 
		WHERE MaDongHo = (SELECT MaDongHo FROM inserted)
END
GO
/****** Object:  Trigger [dbo].[DBO.TR_AfterUpdate_CTPN]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DBO.TR_AfterUpdate_CTPN] ON [BanDongHo].[dbo].[CT_PhieuNhap] AFTER UPDATE
AS
BEGIN
	IF(UPDATE(SoLuong))
	BEGIN
		UPDATE DongHo
		SET SoLuongTon = SoLuongTon - (SELECT SoLuong FROM deleted) + (SELECT SoLuong FROM inserted)
		WHERE DongHo.MaDongHo = (SELECT MaDongHo FROM inserted) OR DongHo.MaDongHo = (SELECT MaDongHo FROM deleted)
	END
END
GO
/****** Object:  Trigger [dbo].[DBO.TR_AfterUpdate_DongHo]    Script Date: 6/8/2022 10:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DBO.TR_AfterUpdate_DongHo] ON [BanDongHo].[dbo].[DongHo] AFTER UPDATE
AS
BEGIN
	DECLARE @MaDongHo Nvarchar(10)
	IF(EXISTS (SELECT MaDongHo FROM inserted)) SET @MaDongHo = (SELECT MaDongHo FROM inserted) 
	IF(EXISTS (SELECT MaDongHo FROM deleted)) SET @MaDongHo = (SELECT MaDongHo FROM deleted) 

	IF(UPDATE(SoLuongTon))
	BEGIN
		IF ((SELECT SoLuongTon FROM DongHo WHERE MaDongHo = @MaDongHo) = 0)
		UPDATE DongHo SET MaTrangThai = 'THH' WHERE MaDongHo = @MaDongHo
		IF ((SELECT SoLuongTon FROM DongHo WHERE MaDongHo = @MaDongHo) > 0 AND 
		(SELECT MaTrangThai FROM DongHo WHERE MaDongHo = @MaDongHo) = 'THH')
		UPDATE DongHo SET MaTrangThai = 'CH' WHERE MaDongHo = @MaDongHo	
	END
END
GO
USE [master]
GO
ALTER DATABASE [BanDongHo] SET  READ_WRITE 
GO

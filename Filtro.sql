USE [master]
GO
/****** Object:  Database [Filtro]    Script Date: 12/6/2022 3:36:33 PM ******/
CREATE DATABASE [Filtro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Filtro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Filtro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Filtro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Filtro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Filtro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Filtro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Filtro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Filtro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Filtro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Filtro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Filtro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Filtro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Filtro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Filtro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Filtro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Filtro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Filtro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Filtro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Filtro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Filtro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Filtro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Filtro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Filtro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Filtro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Filtro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Filtro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Filtro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Filtro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Filtro] SET RECOVERY FULL 
GO
ALTER DATABASE [Filtro] SET  MULTI_USER 
GO
ALTER DATABASE [Filtro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Filtro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Filtro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Filtro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Filtro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Filtro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Filtro', N'ON'
GO
ALTER DATABASE [Filtro] SET QUERY_STORE = OFF
GO
USE [Filtro]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [int] NULL,
	[ThoiGianMua] [date] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [varchar](50) NOT NULL,
	[MaKH] [int] NULL,
	[NgayMua] [date] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon_ChiTiet]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [varchar](50) NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [int] NULL,
 CONSTRAINT [PK_HoaDon_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1000,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [varchar](50) NULL,
	[SDT] [varchar](50) NULL,
	[MaTK] [int] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luong]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luong](
	[MaLuong] [varchar](50) NOT NULL,
	[VaiTro] [varchar](50) NULL,
	[HinhThuc] [varchar](50) NULL,
	[LuongTheoGio] [int] NULL,
 CONSTRAINT [PK_Luong] PRIMARY KEY CLUSTERED 
(
	[MaLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [varchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [varchar](50) NULL,
	[SDT] [varchar](50) NULL,
	[MaLuong] [varchar](50) NULL,
	[MaTK] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [int] NULL,
	[MoTa] [nvarchar](500) NULL,
	[Anh] [varchar](500) NULL,
	[TinhTrang] [int] NULL,
	[MaDanhMuc] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[NgayTao] [date] NULL,
	[MaVaiTro] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 12/6/2022 3:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVaiTro] [int] IDENTITY(1,1) NOT NULL,
	[TenVaiTro] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [TinhTrang]) VALUES (1, N'Cà phê bột', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [TinhTrang]) VALUES (2, N'Cà phê nén', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [TinhTrang]) VALUES (3, N'Cà phê nhân xanh', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [TinhTrang]) VALUES (4, N'Cà phê hạt đã rang', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [TinhTrang]) VALUES (5, N'Cà phê hạt', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [TinhTrang]) VALUES (6, N'TET', 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [TinhTrang]) VALUES (7, N'ATCA', 1)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaTK], [MaNV]) VALUES (1000, N'Hung', CAST(N'1994-02-02' AS Date), N'Nam', N'0147258369', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaTK], [MaNV]) VALUES (1001, N'Tin', CAST(N'1996-04-23' AS Date), N'Nam', N'0123456789', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaTK], [MaNV]) VALUES (1002, N'Nguyen Xuyen', CAST(N'1997-05-06' AS Date), N'Nam', N'0987654321', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaTK], [MaNV]) VALUES (1003, N'Truong Hoang Long', CAST(N'1999-09-09' AS Date), N'Nam', N'0369825147', NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[Luong] ([MaLuong], [VaiTro], [HinhThuc], [LuongTheoGio]) VALUES (N'ml1', N'Nhan Vien', N'Part-time', 50000)
INSERT [dbo].[Luong] ([MaLuong], [VaiTro], [HinhThuc], [LuongTheoGio]) VALUES (N'ml2', N'Admin', N'Full-time', 80000)
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaLuong], [MaTK]) VALUES (1, N'Huynh Banh', CAST(N'1996-10-10' AS Date), N'Nam', N'0123456789', N'ml2', 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaLuong], [MaTK]) VALUES (2, N'Nguyen An', CAST(N'1998-06-12' AS Date), N'Nu', N'0987654321', N'ml1', 2)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaLuong], [MaTK]) VALUES (3, N'Tran Bich Thuy', CAST(N'2000-01-11' AS Date), N'Nu', N'0111111111', N'ml2', 2)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [SDT], [MaLuong], [MaTK]) VALUES (4, N'Tran Canh', CAST(N'1997-07-26' AS Date), N'Nam', N'0147258369', N'ml2', 2)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (1, N'Cà phê hạt Lavazza Gran Espresso', 30, 950000, N'Cà phê hạt Lavazza Gran Espresso là một trong những túi cà phê được yêu thích của Lavazza trong những tháng đầu năm 2022, Với sự kế hợp đặt biệt của hạt Arabica, và hạt Robusta tạo nên loại cà phê đậm đà phù hợp với những khách hàng yêu thích Espreso', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2022/05/blagu-sieuthicafevn-ethiopia-nensebo-refisa.jpg&h=400&w=600&fit=outside&il=1', NULL, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (2, N'Cà phê Blagu hạt đã rang', 45, 375000, N'Hương hoa
Si-rô cùng với hương vị của quả boysenberry và blueberry và một số hương vị khác tạo nên cảm giác mới mẻ cho người uống.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2022/05/blagu-sieuthicafevn-ethiopia-nensebo-refisa.jpg&h=400&w=600&fit=outside&il=1', NULL, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (3, N'Cà phê nén Nespresso Ristretto', 70, 200000, N'Trọng tâm duy nhất của Nespresso là cung cấp cà phê chất lượng cao nhất và trải nghiệm cà phê  sau mỗi tách. Toàn bộ viên Nespresso – có vỏ bằng nhôm Nespresso ban đầu với máy pha cà phê Nespresso chính hãng –  Nhờ những đổi mới liên tục và chất lượng cao nhất, Nespresso đã phát triển từ việc trở thành người tiên phong và là người tạo ra xu hướng cho cà phê  một tài liệu tham khảo trên toàn thếgiới.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2022/05/ffee-ispirazione-ristretto-italiano-decaffeinato-capsule-nespresso-50g_f6fa7fcd48584bfe910275490e02781c.webp&h=400&w=600&fit=outside&il=1', NULL, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (4, N'Cà phê hạt nhân xanh Brazil Fazenda', 65, 300000, N'Cà phê Brazil từ vùng Fazenda da Lagoa samba mang đến độ chua tròn đầy, vị ngọt dễ chịu, độ phức tạp tốt, hạt Hazelnut, đường nâu, caramel, táo đỏ, mơ, trà hoa hồng, mật đường.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2021/07/greenbeanbrazil-sieuthicafe-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (5, N'Cà phê bột Lavazza Ground', 80, 280000, N'Một loại cà phê đầy đủ hương vị nổi bật với những nốt hương caramel khói. Việc rang đậm càng giúp tăng cường độ đậm đặc của cà phê và hương vị khiến Intenso trở nên thơm ngon, cho dù nó được thưởng thức như cà phê đen hay với sữa và đường.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2021/10/Lavazza-Ground-Coffee-Intenso-sieuthicafe-01.jpg&h=160&w=160&fit=contain&cbg=white&il=1', NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (6, N'Cà phê Blagu hạt đã rang Tazania Kilimanjaro', 115, 80000, N'Hương hoa cùng độ chua nhẹ, tròn vị, hậu vị ngọt và thơm hương hoa quả nhiệt đới cùng trà đen  ', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2020/03/blagu-sieuthicafevn-tanzania.jpg&h=400&w=600&fit=outside&il=1', NULL, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (7, N'Cà phê hạt Carraro Globo Arabic', 40, 650000, N'100% arabica- sự phối hợp giữa 4 loại arabica chất lượng tạo nên vị ngọt kéo dài, tinh tế bổi bật hương hoa', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2018/05/Carraro-Globo-Arabica-sieuthicafe-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (8, N'Cà phê nén Illy Iperespresso Itenso Bold Roasted', 115, 400000, N'Cà phê rang được rang đậm, thể hiện đầy đủ hương vị. Một kết thúc mạnh mẽ với các nốt hương sống động của ca cao và trái cây khô.  ', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2021/12/illyiperespressocapsulesintenso-sieuthicafe-02.jpg&h=400&w=600&fit=outside&il=1', NULL, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (9, N'Cà phê hạt nhân xanh Sidamo Guji Bensa', 55, 450000, N'Hương vị: Hoa cơm cháy (Elderflower), ổi hồng, vỏ nho, rượu vang trắng, quả mọng, mượt', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2021/10/Ethiopia-Arabica-Sidamo-Guji-Bensa-sieuthicafe-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (10, N'

Cà phê hạt Carraro Globo Rosso', 100, 600000, N'Sự pha trộn Globo Rosso bao gồm ba loại Arabica và ba loại Robusta được chọn lọc theo từng đợt', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2018/05/carraro-globo-rosso-sieuthicafe-01.png&h=400&w=600&fit=outside&il=1', NULL, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (11, N'Cà phê hạt Carraro Globo Oro', 100, 650000, N'100% arabica- sự phối hợp giữa 4 loại arabica chất lượng tạo nên vị ngọt kéo dài, tinh tế bổi bật hương hoa', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2018/05/carroglobooro-sieuthicafe-01.png&h=400&w=600&fit=outside&il=1', NULL, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (12, N'Cà phê nén Blagu Kiểu Ý', 150, 170000, N'Hương vị cà phê rang xay tự nhiên', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2018/02/capsule-5-sieuthicafe-03.jpg&h=400&w=600&fit=outside&il=1', NULL, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (13, N'

Cà phê Blagu hạt đã rang, Gesha Panama vùng Finca Lerida', 20, 750000, N'Gesha tại vùng Boquete, Panama được các chuyên gia chúng tôi đánh giá chung có hương vị trái cây và hương hoa đặc trưng, hậu vị với độ chua, ngọt thanh tao và thể chất cân bằng hoàn hảo.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2022/06/gesha-lon.jpg&h=400&w=600&fit=outside&il=1', NULL, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (14, N'Cà phê hạt nhân xanh Golden Arabica Bourbon', 80, 350000, N'BLAGU nguyên hạt chưa rang Golden Arabica Bourbon 100% (1 kg)', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2016/04/BLAGU-Golden-Arabica-Bourbon-.png&h=400&w=600&fit=outside&il=1', NULL, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (15, N'Cà phê nhân xanh Green Bean Costa Rica Hacienda Sonora Centroamericano', 50, 420000, N'Cà phê Costa Rica rang sáng có hương vị sống động, với độ chua nhẹ từ trước tạo ra một kết thúc ngọt ngào.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2022/01/costarica-sieuthicafe-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (16, N'Cà phê bột Lavazza Crema E Gusto Arabica/Robusta Blend', 90, 220000, N'Đầy đủ hương vị, và hương thơm, dư vị phong phú với ghi chú sô cô la.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2018/05/Lavazza-Coffee-Crema-E-Gusto-sieuthicafe-04.jpg&h=400&w=600&fit=outside&il=1', NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (17, N'Cà phê bột Lavazza Club 100% Arabica', 60, 310000, N'Một loại cà phê đặc biệt với hương vị mãnh liệt và hương thơm tinh tế.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2014/05/Lavazza-Coffee-Club-100-Arabica-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (18, N'Cà phê viên nén Nespresso Ispirazione Venezia Switzerland', 25, 185000, N'Hương thơm cà phê tinh tế, sự cân bằng, hài hòa giữa vị Caramel và cà phê sóng sánh.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2021/05/nespressovenezia-sieuthicafe-05.jpg&h=400&w=600&fit=outside&il=1', NULL, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (19, N'Cà phê Viên Nén Starbucks by Nespresso', 110, 250000, N'Hương thơm ngào ngạt, cơ thể và hương vị đều cân bằng — với vị của các loại hạt và ca cao do quá trình rang mang lại.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2021/02/starbuckshouseblend-sieuthicafe-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (20, N'Cà phê hạt đã rang Illy Arabica Guatemala', 70, 380000, N'Vị đậm đà. Cà phê được trồng ở vùng núi hoang sơ của Guatemala có hương thơm phức hợp với hương sô cô la, caramel và mật ong nổi bật. Tất cả những hương vị này được nâng cao bởi mức rang đậm của illy', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2020/11/ILLY-COFFEE-ARABICA-ORIGINAL-GUATEMALA-250GR-WHOLE-BEAN-SIEUTHICAFE-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (21, N'Cà phê Blagu hạt đã rang Guru 3 blend Cold brew', 15, 170000, N'Với dòng Bold Cold Mr.Guru đã nghiên cứu để tạo ra những nốt cho chocolate đậm đà, hòa quyện với sự ngọt ngào của kẹo cam cùng vị trà đen, hậu ngọt kéo dài kèm theo vị chua thanh từ các hạt arabica.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2022/11/blagu-guru-3-cold-brew-bold-cold.png&h=400&w=600&fit=outside&il=1', NULL, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (22, N'Cà phê bột Lavazza Qualita Rossa', 35, 600000, N'Hỗn hợp Globo Oro bao gồm 5 loại hạt Arabica và ba loại Robusta chất lượng được chọn theo từng đợt. Nhẹ nhàng, hương thơm dai dẳng', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2018/05/rossa-lavazza-sieuthicafe-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (23, N'Cà phê hạt Lavazza Espresso Top Class', 55, 950000, N'Cà phê Top Class là một trong những loại cà phê được tìm kiếm nhiều nhất từ ​​Lavazza. Sự pha trộn của nó là thành phần của những hạt cà phê Arabica tốt nhất từ ​​Nam và Trung Mỹ và những hạt cà phê Robusta hảo hạng của Indonesia.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2021/12/Lavazza-Espresso-Top-Class-Coffee-Beans-sieuthicafe-01.jpg&h=400&w=600&fit=outside&il=1', NULL, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [SoLuong], [GiaTien], [MoTa], [Anh], [TinhTrang], [MaDanhMuc]) VALUES (24, N'Cà phê nhân xanh Ethiopia Nensebo Refisa', 10, 670000, N'Cà phê nhân xanh Green Beans Ethiopia Dry Process Nensebo Refisa được nông trại chế biến theo phương thức chế biến khô (Natural) đã tạo nên những hương vị đặc trưng, khi uống bạn có thể cảm nhận được vị ngọt như Si-rô, hương thơm nồng nàn của trái cây, một chút của nốt hương ngọt của đường nâu và mứt anh đào. Ngoài ra bạn cũng có thể cảm nhận được một số hương vị của Berry, Cocoa, Nuts.', N'https://images.weserv.nl/?url=wp.sieuthicafe.vn/wp-content/uploads/2022/04/Ca-phe-nhan-xanh-Green-Beans-Ethiopia-Dry-Process-Nensebo-Refisa-%E2%80%93-1kg-sieuthicafe-1.jpg&h=400&w=600&fit=outside&il=1', NULL, 3)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (2, N'admin', N'ad1', NULL, CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (3, N'nhanvien1', N'nv1', NULL, CAST(N'2022-10-10' AS Date), 2)
INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (4, N'nhanvien2', N'nv2', NULL, CAST(N'2022-10-10' AS Date), 2)
INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (5, N'nhanvien3', N'nv3', NULL, CAST(N'2022-10-10' AS Date), 2)
INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (6, N'phu123', N'123', NULL, CAST(N'2022-10-10' AS Date), 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (7, N'phu', N'123', NULL, NULL, 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Email], [NgayTao], [MaVaiTro]) VALUES (8, N'phu147', N'123', NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (1, N'Admin')
INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (2, N'Nhan Vien')
INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (3, N'KhachHang')
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__CA1930A552DDABDA]    Script Date: 12/6/2022 3:36:33 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UQ__NhanVien__CA1930A552DDABDA] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__D5B8C7F039955D82]    Script Date: 12/6/2022 3:36:33 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UQ__TaiKhoan__D5B8C7F039955D82] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__D5B8C7F08B36CD08]    Script Date: 12/6/2022 3:36:33 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UQ__TaiKhoan__D5B8C7F08B36CD08] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__D5B8C7F0AC18A387]    Script Date: 12/6/2022 3:36:33 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UQ__TaiKhoan__D5B8C7F0AC18A387] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__D5B8C7F0C701C38D]    Script Date: 12/6/2022 3:36:33 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UQ__TaiKhoan__D5B8C7F0C701C38D] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_TK] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_TK]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_ChiTiet_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDon_ChiTiet] CHECK CONSTRAINT [FK_HoaDon_ChiTiet_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_ChiTiet_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDon_ChiTiet] CHECK CONSTRAINT [FK_HoaDon_ChiTiet_SanPham]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__MaTK__339FAB6E] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__MaTK__339FAB6E]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_NV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_NV]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_TK] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_TK]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Luong] FOREIGN KEY([MaLuong])
REFERENCES [dbo].[Luong] ([MaLuong])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Luong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_VaiTro] FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[VaiTro] ([MaVaiTro])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_VaiTro]
GO
USE [master]
GO
ALTER DATABASE [Filtro] SET  READ_WRITE 
GO


--=========================================================================================================
go
alter table TaiKhoan
add TrangThai int null
constraint store_trang_thai default 1
with values
go

alter table NhanVien
add TrangThai int null
constraint store_trang_thai default 1
with values
go
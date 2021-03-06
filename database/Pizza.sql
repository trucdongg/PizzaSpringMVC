USE [master]
GO
/****** Object:  Database [testdb]    Script Date: 06/16/2020 19:39:05 ******/
CREATE DATABASE [testdb] ON  PRIMARY 
( NAME = N'testdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\testdb.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'testdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\testdb_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [testdb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [testdb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [testdb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [testdb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [testdb] SET ARITHABORT OFF
GO
ALTER DATABASE [testdb] SET AUTO_CLOSE ON
GO
ALTER DATABASE [testdb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [testdb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [testdb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [testdb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [testdb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [testdb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [testdb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [testdb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [testdb] SET  ENABLE_BROKER
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [testdb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [testdb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [testdb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [testdb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [testdb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [testdb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [testdb] SET  READ_WRITE
GO
ALTER DATABASE [testdb] SET RECOVERY SIMPLE
GO
ALTER DATABASE [testdb] SET  MULTI_USER
GO
ALTER DATABASE [testdb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [testdb] SET DB_CHAINING OFF
GO
USE [testdb]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 06/16/2020 19:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[iddanhmuc] [int] IDENTITY(1,1) NOT NULL,
	[tensanpham] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[iddanhmuc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON
INSERT [dbo].[DanhMuc] ([iddanhmuc], [tensanpham]) VALUES (1, N'Mì Ý')
INSERT [dbo].[DanhMuc] ([iddanhmuc], [tensanpham]) VALUES (2, N'Khai Vị')
INSERT [dbo].[DanhMuc] ([iddanhmuc], [tensanpham]) VALUES (3, N'Thức Uống')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 06/16/2020 19:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[id_taikhoan] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[taikhoan] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[sdt] [varchar](50) NOT NULL,
	[matkhau] [varchar](50) NOT NULL,
	[ngaysinh] [date] NOT NULL,
	[gioitinh] [bit] NULL,
	[quyen] [int] NULL,
	[diachi] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_taikhoan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sdt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[taikhoan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (1, N'Bảo Bảo', N'abcd123', N'ab232@gmail.com', N'0123456789', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (82, N'Đại Đại', N'admin', N'dai123@gmail.com', N'0123456798', N'1234567', CAST(0x07240B00 AS Date), 1, 0, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (89, N'Nguyễn Văn H', N'dong', N'abmskcnd123@gmail.com', N'0284937463', N'12345678', CAST(0x07240B00 AS Date), 0, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (90, N'Dương Trực Đông', N'abmskcnd', N'daiphan308@gmail.com', N'0378549364', N'1234567', CAST(0x9B220B00 AS Date), 0, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (91, N'Nguyễn Văn F', N'abcd2323', N'abmskcn34343d@gmail.com', N'0378349364', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (92, N'Nguyễn Văn G', N'admin123', N'abmskc2321123nd@gmail.com', N'0378489333', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (93, N'Nguyễn Văn E', N'admin423', N'abmskc2321223nd@gmail.com', N'0378389333', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (94, N'Nguyễn Văn A', N'admin123123', N'abmskc231nd@gmail.com', N'0385927598', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (95, N'Nguyễn Văn D', N'admin321123', N'abmskcnd123321@gmail.com', N'0145896523', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (96, N'Nguyễn Văn A', N'nguyenvana', N'nguyenvan@gmail.com', N'0378489364', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (97, N'Đông Đông', N'admin321', N'123abmskcnd@gmail.com', N'0378489365', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (98, N'Nguyễn Văn P', N'phuongthuy', N'phuongthuynguyen137@gmail.com', N'0908801093', N'1234567', CAST(0x961F0B00 AS Date), 0, 1, N'Phan Văn Hân')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (99, N'Nguyễn Văn A', N'nguyenvana123', N'nguyenvana123@gmail.com', N'0378889964', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Phan Văn Hân')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (104, N'Nguyễn Văn A', N'dai1234', N'abmskcnd1@gmail.com', N'0123459989', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Phan Văn Hân')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (105, N'Nguyễn Văn C', N'test123', N'test123@gmail.com', N'0378483333', N'1234567', CAST(0x07240B00 AS Date), 1, 1, N'Phan Văn Hân')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (106, N'Hồ Anh Tiến', N'hoanhtien', N'hotien51999@gmail.com', N'0944056688', N'12345678', CAST(0x07240B00 AS Date), 1, 1, N'Quận 9')
INSERT [dbo].[TaiKhoan] ([id_taikhoan], [hoten], [taikhoan], [email], [sdt], [matkhau], [ngaysinh], [gioitinh], [quyen], [diachi]) VALUES (107, N'Nguyễn Quốc Khánh', N'nguyenquockhanh', N'khanh@gmail.com', N'0378489366', N'12345678', CAST(0x07240B00 AS Date), 1, 1, N'Linh Đông')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
/****** Object:  Table [dbo].[Pizza]    Script Date: 06/16/2020 19:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pizza](
	[id_pizza] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[detail] [nvarchar](2000) NULL,
	[hinh] [varchar](50) NOT NULL,
	[trangthai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pizza] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Pizza] ON
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (1, N'PIZZA TÔM VIÊN', N'Pizza Tôm Viền Phô Mai Ba Vị phủ tôm cao cấp kết hợp cùng dứa, ô liu và ớt chuông trên nền Xốt Cheesy Mayo đặc biệt', N'thapcam.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (2, N'PIZZA HẢI SẢN CAO CẤP', N'Tôm, mực hảo hạng cùng cà chua bi, bí ngòi và phô mai Mozzarella trên xốt nền Pesto', N'haisancaocap.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (3, N'PIZZA THẬP CẨM CAO CẤP', N'Xúc xích nướng, thịt nguội, thịt bò, xúc xích gà, thơm, nấm, hành tây, ớt chuông và ô liu', N'thapcamcaocap.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (5, N'PIZZA HẢI SẢN XỐT PESTO', N'Tôm, mực và nấm trên nền xốt Pesto đặc trưng, phủ phô mai Mozzarella và rau ngò tây.', N'haisansotpesto.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (6, N'PIZZA CƠN LỐC HẢI SẢN', N'Mực, thanh cua, thơm, ớt chuông xanh, hành tây trên nền xốt Cheesy Mayo và phô mai Mozzarella', N'conlochaisan.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (7, N'PIZZA THẬP CẨM', N'Thịt bò, xúc xích nướng, ớt chuông, nấm và hành tây, phủ phô mai Mozzarella', N'thapcam.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (8, N'PIZZA HẢI SẢN XỐT TIÊU ĐEN', N'Tôm, mực, thanh cua, hành tây, thơm phủ xốt tiêu đen và phô mai Mozzarella', N'haisantieuden.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (9, N'PIZZA THỊT VÀ XÚC XÍCH', N'Thịt muối, thịt bò, thịt nguội và xúc xích nướng', N'thitvaxucxich.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (10, N'PIZZA CÁ NGỪ', N'Pizza Tôm Viền Phô Mai Ba Vị phủ tôm cao cấp kết hợp cùng dứa, ô liu và ớt chuông trên nền Xốt Cheesy Mayo đặc biệt', N'tomxotbotoi.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (11, N'PIZZA TÔM XỐT BƠ TỎI', N'Tôm, nấm, hành tây, ớt chuông đỏ và phô mai Mozzarella trên nền xốt Bơ Tỏi', N'tomxotbotoi.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (13, N'PIZZA ĂN THỬ', N'Tôm, nấm, hành tây, ớt chuông đỏ và phô mai Mozzarella trên nền xốt Bơ Tỏi', N'tomxotbotoi.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (35, N'PIZZA NGỬ NGỮ', N'Tôm,nấm', N'tomxotbotoi.png', 1)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (36, N'Tiêu Phong', N'Phan Đại Đẹp Trai', N'tomxotbotoi.png', 0)
INSERT [dbo].[Pizza] ([id_pizza], [name], [detail], [hinh], [trangthai]) VALUES (37, N'Hồ Anh Tiến', N'Hồ Anh Tiến', N'tomxotbotoi.png', 1)
SET IDENTITY_INSERT [dbo].[Pizza] OFF
/****** Object:  Table [dbo].[MonAn]    Script Date: 06/16/2020 19:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonAn](
	[idmonan] [int] IDENTITY(1,1) NOT NULL,
	[madanhmuc] [int] NULL,
	[tenmonan] [nvarchar](200) NULL,
	[mota] [nvarchar](200) NULL,
	[giatien] [int] NULL,
	[hinhanh] [varchar](200) NULL,
	[trangthai] [bit] NOT NULL,
	[soluong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idmonan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MonAn] ON
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (1, 1, N'MÌ Ý THỊT BẰM XỐT CÀ CHUA', N'MÌ Ý THỊT BẰM XỐT CÀ CHUA', 110, N'haisantieuden.png', 1, 8)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (2, 1, N'MÌ Ý HẢI SẢN XỐT CÀ CHUA', N'Tôm, mực, ớt chuông xanh, hành tây cùng xốt cà chua', 110, N'haisansot.png', 1, 8)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (3, 1, N'MỲ Ý HẢI SẢN XỐT TIÊU ĐEN', N'Tôm, thanh cua, mực, đậu Pháp, nấm, ớt chuông xanh cùng xốt tiêu đen cay nồng', 120, N'haisantieuden.png', 1, 12)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (4, 1, N'MÌ Ý TÔM VÀ XÚC XÍCH', N'Tôm, xúc xích xông khói, cà rốt sợi cùng xốt kem thơm béo', 100, N'tomvaxucxich.png', 1, 15)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (5, 1, N'MÌ Ý THỊT VIÊN XỐT CÀ CHUA', N'Mì Ý xốt cà chua với thịt viên kèm phô mai Parmesan', 119, N'thitvien.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (6, 2, N'CÁNH GÀ NƯỚNG PHÔ MAI TỨ VỊ', N'Cánh gà nướng thơm ngon với bốn vị phô mai đặc biệt', 99, N'canhgaphomai.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (7, 2, N'BÁNH MÌ BƠ TỎI', N'Bánh mì phết xốt bơ tỏi nướng', 29, N'botoi.png', 1, 10)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (8, 2, N'BÁNH CUỘN PHÔ MAI', N'Bánh cuộn phô mai hai vị phủ Parmesan', 29, N'banhcuon.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (9, 2, N'PHÔ MAI CHIÊN GIÒN', N'Từng khoanh phô mai được chiên giòn thơm', 69, N'phomai.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (10, 2, N'KHOAI TÂY CHIÊN', N'Khoai tây chiên', 59, N'khoaitay.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (11, 2, N'XÀ LÁCH CÁ NGỪ', N'Cá ngừ, thịt xông khói, đậu Pháp, khoai tây, bắp trộn cùng xốt mayonnaise cổ điển', 69, N'xalachcangu.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (12, 3, N'COCA COLA 1,5L', N'COCA COLA 1,5L', 42, N'coca.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (13, 3, N'SPRITE 1,5L', N'Chai Sprite 1,5L', 42, N'spirte.png', 1, 11)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (14, 3, N'FANTA 1,5L', N'Chai Fanta 1,5L', 42, N'fanta.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (15, 3, N'COCA COLA 330ML', N'Lon Coca Cola 330ml', 30, N'cocalon.png', 1, 12)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (16, 3, N'SPRITE 330ML', N'Lon Sprite 330ml', 30, N'spritelon.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (17, 3, N'FANTA 330ML', N'Lon Fanta 330ml', 30, N'fantalon.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (18, 3, N'DASANI', N'Nước suối', 20, N'suoi.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (19, 3, N'HEINEKEN', N'Bia', 49, N'bia.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (20, 3, N'TRÀ SỮA TRÀ ĐEN', N'Trà Oolong, hạt Chia và kem sữa', 35, N'trasua.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (21, 3, N'TRÀ ĐÀO HẠT CHIA', N'Trà đào, đào miếng và hạt Chia', 35, N'tradao.png', 1, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (24, 1, N'Mì Trộn Trực Đông', N'Quá Ngon', 123, N'haisansot.png', 1, 4)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (25, 1, N'Mì Trộn Tôm Tôm', N'Tôm Tôm', 1234, N'haisantieuden.png', 1, 12)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (26, 2, N'Tôm Ráng', N'Tôm Rágn', 123, N'botoi.png', 0, 13)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (27, 3, N'Trà Tứng', N'Trà Tứng', 123, N'bia.png', 0, 1)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (28, 1, N'Mì Ý Trực Đông', N'Mì Ý', 123, N'haisantieuden.png', 0, 12)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (29, 2, N'CÁNH GÀ CHIÊN MẮM', N'CÁNH GÀ CHIÊN MẮM', 130, N'canhgaphomai.png', 0, 2)
INSERT [dbo].[MonAn] ([idmonan], [madanhmuc], [tenmonan], [mota], [giatien], [hinhanh], [trangthai], [soluong]) VALUES (30, 3, N'TRÀ SỮA CHÂN CHÂU', N'TRÀ SỮA CHÂN CHÂU', 123, N'tradao.png', 0, 2)
SET IDENTITY_INSERT [dbo].[MonAn] OFF
/****** Object:  Table [dbo].[KichThuoc]    Script Date: 06/16/2020 19:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KichThuoc](
	[id_kichthuoc] [int] IDENTITY(1,1) NOT NULL,
	[idpizza] [int] NOT NULL,
	[tenkc] [nvarchar](50) NOT NULL,
	[gia] [int] NOT NULL,
	[idtenkc] [int] NULL,
	[soluong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_kichthuoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KichThuoc] ON
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (1, 1, N'Lớn', 500, 2, 118)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (3, 1, N'Vừa', 299, 1, 9)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (5, 2, N'Vừa', 239, 1, 6)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (6, 3, N'Nhỏ', 125, 0, 10)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (7, 3, N'Vừa', 209, 1, 10)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (10, 3, N'Lớn', 315, 2, 10)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (14, 5, N'Nhỏ', 115, 0, 9)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (16, 5, N'Vừa', 199, 1, 10)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (18, 5, N'Lớn', 287, 2, 10)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (19, 6, N'Nhỏ', 115, 0, 10)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (21, 6, N'Vừa', 199, 1, 11)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (23, 6, N'Lớn', 287, 2, 12)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (27, 7, N'Nhỏ', 115, 0, 13)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (28, 7, N'Vừa', 199, 1, 14)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (29, 7, N'Lớn', 287, 2, 15)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (30, 8, N'Nhỏ', 115, 0, 16)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (31, 8, N'Vừa', 199, 1, 17)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (32, 8, N'Lớn', 287, 2, 18)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (33, 9, N'Nhỏ', 123, 0, 19)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (34, 9, N'Vừa', 198, 1, 20)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (35, 9, N'Lớn', 299, 2, 21)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (36, 10, N'Nhỏ', 121, 0, 22)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (37, 10, N'Vừa', 174, 1, 23)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (38, 10, N'Lớn', 245, 2, 24)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (39, 11, N'Nhỏ', 131, 0, 25)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (40, 11, N'Vừa', 179, 1, 26)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (41, 11, N'Lớn', 265, 2, 27)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (43, 13, N'Nhỏ', 131, 0, 28)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (49, 35, N'Nhỏ', 500, 0, 12)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (53, 35, N'Vừa', 123, 1, 3)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (54, 36, N'Vừa', 123, 1, 23)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (56, 37, N'Nhỏ', 123, 0, 12)
INSERT [dbo].[KichThuoc] ([id_kichthuoc], [idpizza], [tenkc], [gia], [idtenkc], [soluong]) VALUES (58, 37, N'Vừa', 456, 1, 45)
SET IDENTITY_INSERT [dbo].[KichThuoc] OFF
/****** Object:  Table [dbo].[GioHang]    Script Date: 06/16/2020 19:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GioHang](
	[id_giohang] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NOT NULL,
	[total] [int] NULL,
	[tt] [bit] NOT NULL,
	[day] [date] NULL,
	[diachi] [nvarchar](2000) NULL,
	[sdt] [varchar](50) NULL,
	[tuchoi] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_giohang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (90, 89, 1148, 1, CAST(0x34410B00 AS Date), N'Linh Đông, Thủ Đức', N'0284937463', 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (92, 82, 0, 0, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (93, 89, 768, 0, CAST(0x34410B00 AS Date), N'Linh Đông', N'0284937463', 1)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (94, 89, 500, 1, CAST(0x34410B00 AS Date), N'Linh Đông', N'0284937463', 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (95, 89, 29, 1, CAST(0x34410B00 AS Date), N'Linh Đông', N'0284937463', 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (96, 89, 739, 0, CAST(0x36410B00 AS Date), N'Linh Đông', N'0284937463', 1)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (97, 106, 0, 0, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (98, 89, 239, 1, CAST(0x36410B00 AS Date), N'Linh Đông', N'0284937463', 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (100, 89, 115, 1, CAST(0x37410B00 AS Date), N'Linh Đông', N'0284937463', 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (101, 89, 420, 1, CAST(0x37410B00 AS Date), N'Linh Đông', N'0284937463', 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (102, 89, 1360, 1, CAST(0x37410B00 AS Date), N'Quận 9', N'0378489364', 0)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (103, 89, 799, 0, CAST(0x37410B00 AS Date), N'Linh Đông', N'0284937463', 1)
INSERT [dbo].[GioHang] ([id_giohang], [iduser], [total], [tt], [day], [diachi], [sdt], [tuchoi]) VALUES (104, 89, 0, 0, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
/****** Object:  Table [dbo].[CTGH]    Script Date: 06/16/2020 19:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTGH](
	[id_ctgh] [int] IDENTITY(1,1) NOT NULL,
	[idgh] [int] NOT NULL,
	[idpizza] [int] NULL,
	[sl] [int] NULL,
	[idkt] [int] NULL,
	[idmonan] [int] NULL,
	[soluongmonan] [int] NULL,
	[giapizza] [int] NULL,
	[giamonan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ctgh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CTGH] ON
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (381, 90, 1, 1, 1, NULL, 0, 500, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (382, 90, 1, 1, 3, NULL, 0, 299, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (383, 90, 2, 1, 5, NULL, 0, 239, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (384, 90, NULL, 0, NULL, 2, 1, 0, 110)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (385, 93, 1, 1, 1, NULL, 0, 500, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (386, 93, 2, 1, 5, NULL, 0, 239, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (387, 93, NULL, 0, NULL, 7, 1, 0, 29)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (388, 94, 1, 1, 1, NULL, 0, 500, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (389, 95, NULL, 0, NULL, 7, 1, 0, 29)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (390, 96, 1, 1, 1, NULL, 0, 500, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (391, 96, 2, 1, 5, NULL, 0, 239, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (392, 98, 2, 1, 5, NULL, 0, 239, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (393, 100, 5, 1, 14, NULL, 0, 115, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (394, 101, 2, 1, 5, NULL, 0, 239, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (395, 101, NULL, 0, NULL, 2, 1, 0, 110)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (396, 101, NULL, 0, NULL, 7, 1, 0, 29)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (397, 101, NULL, 0, NULL, 13, 1, 0, 42)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (398, 102, 1, 2, 1, NULL, 0, 500, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (399, 102, NULL, 0, NULL, 1, 3, 0, 110)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (401, 102, NULL, 0, NULL, 15, 1, 0, 30)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (402, 103, 1, 1, 1, NULL, 0, 500, 0)
INSERT [dbo].[CTGH] ([id_ctgh], [idgh], [idpizza], [sl], [idkt], [idmonan], [soluongmonan], [giapizza], [giamonan]) VALUES (403, 103, 1, 1, 3, NULL, 0, 299, 0)
SET IDENTITY_INSERT [dbo].[CTGH] OFF
/****** Object:  Default [DF_Pizza_trangthai]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[Pizza] ADD  CONSTRAINT [DF_Pizza_trangthai]  DEFAULT ((0)) FOR [trangthai]
GO
/****** Object:  Default [DF_MonAn_trangthai]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[MonAn] ADD  CONSTRAINT [DF_MonAn_trangthai]  DEFAULT ((0)) FOR [trangthai]
GO
/****** Object:  Default [DF_MonAn_soluong]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[MonAn] ADD  CONSTRAINT [DF_MonAn_soluong]  DEFAULT ((0)) FOR [soluong]
GO
/****** Object:  Default [DF_KichThuoc_soluong]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[KichThuoc] ADD  CONSTRAINT [DF_KichThuoc_soluong]  DEFAULT ((0)) FOR [soluong]
GO
/****** Object:  Default [DF_GioHang_tuchoi]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[GioHang] ADD  CONSTRAINT [DF_GioHang_tuchoi]  DEFAULT ((0)) FOR [tuchoi]
GO
/****** Object:  Default [DF_CTGH_giapizza]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[CTGH] ADD  CONSTRAINT [DF_CTGH_giapizza]  DEFAULT ((0)) FOR [giapizza]
GO
/****** Object:  Default [DF_CTGH_giamonan]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[CTGH] ADD  CONSTRAINT [DF_CTGH_giamonan]  DEFAULT ((0)) FOR [giamonan]
GO
/****** Object:  ForeignKey [FK_MonAn_DanhMuc]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_DanhMuc] FOREIGN KEY([madanhmuc])
REFERENCES [dbo].[DanhMuc] ([iddanhmuc])
GO
ALTER TABLE [dbo].[MonAn] CHECK CONSTRAINT [FK_MonAn_DanhMuc]
GO
/****** Object:  ForeignKey [FK_KichThuoc_Pizza]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[KichThuoc]  WITH CHECK ADD  CONSTRAINT [FK_KichThuoc_Pizza] FOREIGN KEY([idpizza])
REFERENCES [dbo].[Pizza] ([id_pizza])
GO
ALTER TABLE [dbo].[KichThuoc] CHECK CONSTRAINT [FK_KichThuoc_Pizza]
GO
/****** Object:  ForeignKey [FK_GioHang_TaiKhoan]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_TaiKhoan] FOREIGN KEY([iduser])
REFERENCES [dbo].[TaiKhoan] ([id_taikhoan])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_TaiKhoan]
GO
/****** Object:  ForeignKey [FK_CTGH_GioHang]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[CTGH]  WITH CHECK ADD  CONSTRAINT [FK_CTGH_GioHang] FOREIGN KEY([idgh])
REFERENCES [dbo].[GioHang] ([id_giohang])
GO
ALTER TABLE [dbo].[CTGH] CHECK CONSTRAINT [FK_CTGH_GioHang]
GO
/****** Object:  ForeignKey [FK_CTGH_KichThuoc]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[CTGH]  WITH CHECK ADD  CONSTRAINT [FK_CTGH_KichThuoc] FOREIGN KEY([idkt])
REFERENCES [dbo].[KichThuoc] ([id_kichthuoc])
GO
ALTER TABLE [dbo].[CTGH] CHECK CONSTRAINT [FK_CTGH_KichThuoc]
GO
/****** Object:  ForeignKey [FK_CTGH_MonAn]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[CTGH]  WITH CHECK ADD  CONSTRAINT [FK_CTGH_MonAn] FOREIGN KEY([idmonan])
REFERENCES [dbo].[MonAn] ([idmonan])
GO
ALTER TABLE [dbo].[CTGH] CHECK CONSTRAINT [FK_CTGH_MonAn]
GO
/****** Object:  ForeignKey [FK_CTGH_Pizza]    Script Date: 06/16/2020 19:39:06 ******/
ALTER TABLE [dbo].[CTGH]  WITH CHECK ADD  CONSTRAINT [FK_CTGH_Pizza] FOREIGN KEY([idpizza])
REFERENCES [dbo].[Pizza] ([id_pizza])
GO
ALTER TABLE [dbo].[CTGH] CHECK CONSTRAINT [FK_CTGH_Pizza]
GO

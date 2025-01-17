USE [WebBanGame1]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[MaOrder] [nvarchar](50) NOT NULL,
	[MaGame] [nvarchar](50) NOT NULL,
	[NgayOrder] [datetime] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_MaOrder_MaGame] PRIMARY KEY CLUSTERED 
(
	[MaOrder] ASC,
	[MaGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon] [nvarchar](50) NOT NULL,
	[MaGame] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_MaHoaDon_MaGame] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[MaGame] [nvarchar](50) NOT NULL,
	[TenGame] [nvarchar](100) NULL,
	[MoTa] [nvarchar](max) NULL,
	[DonGia] [float] NULL,
	[NamRaMat] [date] NULL,
	[SoLuong] [int] NULL,
	[MaTheLoai] [nvarchar](50) NOT NULL,
	[Anh] [nvarchar](max) NULL,
	[SoLuotXem] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaOrder] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[NgayThanhToan] [datetime] NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[ID] [nvarchar](50) NOT NULL,
	[PhanTramGiamGia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaXacNhan]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaXacNhan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaXacNhan] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Username] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[SDT] [nvarchar](15) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Quyen] [bit] NOT NULL,
	[SoThich] [nvarchar](max) NULL,
	[Lop] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [nvarchar](50) NOT NULL,
	[TenTheLoai] [nvarchar](100) NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietGioHang] ADD  DEFAULT (getdate()) FOR [NgayOrder]
GO
ALTER TABLE [dbo].[Game] ADD  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[Game] ADD  DEFAULT ((0)) FOR [SoLuotXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NgayThanhToan]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [Quyen]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_MaGame] FOREIGN KEY([MaGame])
REFERENCES [dbo].[Game] ([MaGame])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_MaGame]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_MaOrder] FOREIGN KEY([MaOrder])
REFERENCES [dbo].[GioHang] ([MaOrder])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_MaOrder]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_MaGame_ChiTietHD] FOREIGN KEY([MaGame])
REFERENCES [dbo].[Game] ([MaGame])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_MaGame_ChiTietHD]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_MaHoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_MaHoaDon]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_TheLoaiGame] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_TheLoaiGame]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang] FOREIGN KEY([Username])
REFERENCES [dbo].[TaiKhoan] ([Username])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon] FOREIGN KEY([Username])
REFERENCES [dbo].[TaiKhoan] ([Username])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon]
GO
/****** Object:  StoredProcedure [dbo].[proc_DangKiGioHang]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_DangKiGioHang]
    @Username NVARCHAR(50),
    @HoTen NVARCHAR(100),
    @GioiTinh BIT,
    @NgaySinh DATE,
    @Email NVARCHAR(100),
    @SDT NVARCHAR(15),
    @Password NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem Username đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM TaiKhoan WHERE Username = @Username)
    BEGIN
        RAISERROR ('Username đã tồn tại. Vui lòng chọn tên khác.', 16, 1);
        RETURN;
    END

    -- Thêm tài khoản mới vào bảng TaiKhoan
    INSERT INTO TaiKhoan (Username, HoTen, GioiTinh, NgaySinh, Email, SDT, Password)
    VALUES (@Username, @HoTen, @GioiTinh, @NgaySinh, @Email, @SDT, @Password);

    -- Tạo mã Order mới
    DECLARE @MaOrder NVARCHAR(50);
    DECLARE @OrderCount INT;

    -- Đếm số lượng đơn hàng hiện tại trong bảng GioHang
    SELECT @OrderCount = COUNT(*) FROM GioHang;

    -- Tạo mã Order mới theo dạng order1, order2, ...
    SET @MaOrder = 'ODR' + CAST(@OrderCount + 1 AS NVARCHAR(50));

    -- Thêm mã Order mới và Username vào bảng GioHang
    INSERT INTO GioHang (MaOrder, Username)
    VALUES (@MaOrder, @Username);

    PRINT N'Tạo tài khoản và mã giỏ hàng thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_DangKiGioHang1]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_DangKiGioHang1]
    @Username NVARCHAR(50),
    @HoTen NVARCHAR(100),
    @GioiTinh BIT,
    @NgaySinh DATE,
    @Email NVARCHAR(100),
    @SDT NVARCHAR(15),
    @Password NVARCHAR(50),
    @SoThich NVARCHAR(MAX), -- Thêm tham số Sở thích
	@Lop NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem Username đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM TaiKhoan WHERE Username = @Username)
    BEGIN
        RAISERROR ('Username đã tồn tại. Vui lòng chọn tên khác.', 16, 1);
        RETURN;
    END

    -- Thêm tài khoản mới vào bảng TaiKhoan
    INSERT INTO TaiKhoan (Username, HoTen, GioiTinh, NgaySinh, Email, SDT, Password, SoThich, Lop)
    VALUES (@Username, @HoTen, @GioiTinh, @NgaySinh, @Email, @SDT, @Password, @SoThich, @Lop);

    -- Tạo mã Order mới
    DECLARE @MaOrder NVARCHAR(50);
    DECLARE @OrderCount INT;

    -- Đếm số lượng đơn hàng hiện tại trong bảng GioHang
    SELECT @OrderCount = COUNT(*) FROM GioHang;

    -- Tạo mã Order mới theo dạng ODR1, ODR2, ...
    SET @MaOrder = 'ODR' + CAST(@OrderCount + 1 AS NVARCHAR(50));

    -- Thêm mã Order mới và Username vào bảng GioHang
    INSERT INTO GioHang (MaOrder, Username)
    VALUES (@MaOrder, @Username);

    PRINT N'Tạo tài khoản và mã giỏ hàng thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_LayLichSuMuaHang]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_LayLichSuMuaHang]
    @Username NVARCHAR(50)
AS
BEGIN
    SELECT 
        hd.MaHoaDon, 
        hd.NgayThanhToan, 
        hd.PhuongThucThanhToan, 
        ct.MaGame, 
        g.TenGame, 
        ct.SoLuong, 
        g.DonGia, 
        (ct.SoLuong * g.DonGia) AS ThanhTien
    FROM 
        HoaDon hd
    JOIN 
        ChiTietHoaDon ct ON hd.MaHoaDon = ct.MaHoaDon
    JOIN 
        Game g ON ct.MaGame = g.MaGame
    WHERE 
        hd.Username = @Username
    ORDER BY 
        hd.NgayThanhToan DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_TaoHoaDon]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_TaoHoaDon]
    @MaHoaDon NVARCHAR(50),
    @Username NVARCHAR(50),
    @NgayThanhToan DATETIME,
    @PhuongThucThanhToan NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Thêm hóa đơn vào bảng HoaDon
    INSERT INTO HoaDon (MaHoaDon, Username, NgayThanhToan, PhuongThucThanhToan)
    VALUES (@MaHoaDon, @Username, @NgayThanhToan, @PhuongThucThanhToan);

    -- Chuyển các sản phẩm từ ChiTietGioHang sang ChiTietHoaDon
    INSERT INTO ChiTietHoaDon (MaHoaDon, MaGame, SoLuong)
    SELECT 
        @MaHoaDon, 
        ct.MaGame, 
        ct.SoLuong
    FROM 
        ChiTietGioHang ct
    INNER JOIN 
        GioHang gh ON ct.MaOrder = gh.MaOrder
    WHERE 
        gh.Username = @Username;

    -- Xóa sản phẩm khỏi ChiTietGioHang sau khi chuyển sang ChiTietHoaDon
    DELETE ct
    FROM 
        ChiTietGioHang ct
    INNER JOIN 
        GioHang gh ON ct.MaOrder = gh.MaOrder
    WHERE 
        gh.Username = @Username;
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_ThemGameVaoGio]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_ThemGameVaoGio]
    @Username NVARCHAR(50),
    @MaGame NVARCHAR(50),
    @SoLuong INT,
    @NgayOrder DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Nếu @NgayOrder không được truyền vào, sử dụng ngày hiện tại
    SET @NgayOrder = ISNULL(@NgayOrder, GETDATE());

    DECLARE @MaOrder NVARCHAR(50);

    -- Lấy MaOrder từ bảng GioHang dựa trên Username
    SELECT @MaOrder = MaOrder
    FROM GioHang
    WHERE Username = @Username;

    -- Kiểm tra xem MaOrder có tồn tại không
    IF @MaOrder IS NULL
    BEGIN
        RAISERROR ('Không tìm thấy giỏ hàng cho người dùng này.', 16, 1);
        RETURN;
    END

    -- Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
    IF EXISTS (SELECT 1 FROM ChiTietGioHang WHERE MaOrder = @MaOrder AND MaGame = @MaGame)
    BEGIN
        -- Nếu sản phẩm đã tồn tại, cập nhật số lượng bằng cách tăng thêm 1
        UPDATE ChiTietGioHang
        SET SoLuong = SoLuong + @SoLuong
        WHERE MaOrder = @MaOrder AND MaGame = @MaGame;
    END
    ELSE
    BEGIN
        -- Nếu sản phẩm chưa tồn tại, thêm mới vào ChiTietGioHang
        INSERT INTO ChiTietGioHang (MaOrder, MaGame, SoLuong, NgayOrder)
        VALUES (@MaOrder, @MaGame, @SoLuong, @NgayOrder);
    END

    PRINT N'Đã thêm hoặc cập nhật sản phẩm trong giỏ hàng thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_ThongTinGioHang]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_ThongTinGioHang]
    @Username NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy thông tin sản phẩm trong giỏ hàng dựa trên Username
    SELECT 
		ctg.MaGame,
        g.TenGame,
        g.DonGia,
        ctg.SoLuong,
        (g.DonGia * ctg.SoLuong) AS ThanhTien,
        g.Anh AS HinhAnh
    FROM 
        ChiTietGioHang ctg
    INNER JOIN 
        Game g ON ctg.MaGame = g.MaGame
    INNER JOIN 
        GioHang gh ON ctg.MaOrder = gh.MaOrder
    WHERE 
        gh.Username = @Username;
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_XoaSPGioHang]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_XoaSPGioHang]
    @Username NVARCHAR(50),
    @MaGame NVARCHAR(50)
AS
BEGIN
    DELETE FROM ChiTietGioHang
    WHERE MaOrder = (SELECT MaOrder FROM GioHang WHERE Username = @Username)
      AND MaGame = @MaGame;
END;

GO
/****** Object:  StoredProcedure [dbo].[proc_XoaUser]    Script Date: 1/5/2025 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_XoaUser]
    @Username NVARCHAR(50)  -- Tham số: Tên đăng nhập của người dùng muốn xóa
AS
BEGIN
    SET NOCOUNT ON;

    -- Bắt đầu một giao dịch (Transaction) để đảm bảo tính toàn vẹn dữ liệu
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Xóa các bản ghi liên quan đến người dùng trong bảng GioHang
        DELETE FROM GioHang WHERE Username = @Username;

        -- Xóa người dùng khỏi bảng TaiKhoan
        DELETE FROM TaiKhoan WHERE Username = @Username;

        -- Commit giao dịch nếu không có lỗi
        COMMIT TRANSACTION;

        PRINT 'Đã xóa người dùng và giỏ hàng thành công.';
    END TRY
    BEGIN CATCH
        -- Rollback giao dịch nếu có lỗi
        ROLLBACK TRANSACTION;

        -- Thông báo lỗi
        PRINT 'Đã xảy ra lỗi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

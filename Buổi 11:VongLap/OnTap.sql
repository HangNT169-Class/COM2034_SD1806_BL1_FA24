-- Tao CSDL Buoi11
-- Tao bang NhanVien gom cac thuoc tinh sau: ID - int, ma  - varchar(50), ten - nvarchar(50), tuoi - int ,
--  gioiTinh - bit, diaChi - nvarchar(50), bac_id - int
-- Tao bang Bac gom cac thuoc tinh sau: ID - int, ma  - varchar(50), ten - nvarchar(50)
-- ID: la khoa chinh cac bang va tu tang
-- Ma la duy nhat cac bang 
-- bac_id_id: la khoa ngoai cua bang Nhan vien noi vs bang Bac 
-- Thuc hien cac yeu cau sau:
-- 1. Tao CSDL va tao bang
-- 2. Them moi bang 5 ban ghi 
-- 3. Thuc hien cac cau truy van sau:
    -- 3.1: Hien thi thong tin cua Nhan vien voi cap bac co ma la B01 
    -- 3.2 Hien thi danh sach Nhan vien co tuoi >= tuoi TB va co ten bac chua chu A
    -- 3.3 Hien thi ds nhan vien voi yeu cau:
        -- ten NV: Anh + Ten ( neu gioi tinh = 1)
        -- Ten NV: Chi + Ten ( neu gioi tinh = 0)
    -- Sử dụng T-SQL để tính tổng, hiệu, tich, thương của 2 biến truyền vào và in ra màn hình tổng hiệu, tích , thương 
    -- Sử dụng T-SQL để tính diện tích, chu vi của hình chữ nhật và in ra màn hình chu vi, diện tích
    -- Hien thi xem ban than truot hay passs khi biet diem thi COM2034
    -- Kiem tra hoc luc cua sv khi biet diem toan,ly,toa.
      -- Neu diem trung binh trong khoang 8-10 => SV xx
      -- Neu diem TB tu 7-8 => SV kha 
      -- Neu diem TB 6-7=> SV TB kha
      -- Neu diem tb tu 5-6=> SV TB
      -- Neu diem <5 => SV yeu
CREATE DATABASE Buoi11
USE Buoi11
CREATE TABLE nhanVien(
    ID INT PRIMARY KEY IDENTITY,
    Ma VARCHAR(50) UNIQUE,
    Ten NVARCHAR(50),
    Tuoi INT,
    GioiTinh BIT,
    DiaChi NVARCHAR(50),
    Bac_ID INT FOREIGN KEY REFERENCES Bac(ID)
)

CREATE TABLE Bac(
    ID INT PRIMARY KEY IDENTITY,
    Ma VARCHAR(50),
    Ten NVARCHAR(50)

)
INSERT INTO nhanVien
VALUES
    ('001', N'Ng A', 30, 0, N'HaNoi', 1),
    ('002', N'ng B', 12, 1, N'HaNoi', 2) 

INSERT INTO nhanVien
VALUES 
    ('003', N'Ng C', 11, 1, N'HaNoi', 3),
    ('004', N'Ng D', 33, 1, N'HaNoi', 4)

INSERT INTO Bac
VALUES
    ( '001', N'Ng A'),
    ( '002', N'Ng B')

INSERT INTO Bac 
VALUES
    ('B01', N'Ng C'),
    ('B04', N'Ng D')

SELECT * FROM nhanVien
SELECT * FROM Bac

SELECT * 
FROM nhanVien nv, Bac b 
WHERE nv.Bac_ID = b.ID
AND b.Ma = 'B01'

SELECT *
FROM nhanVien nv INNER JOIN Bac b ON nv.Bac_ID = b.ID
WHERE nv.Tuoi >= (SELECT AVG( Tuoi ) FROM nhanVien)
AND nv.Ten LIKE '%A%' 

UPDATE nhanVien
SET Ten = CASE 
    WHEN GioiTinh = 1 THEN 'Anh ' + Ten
    WHEN GioiTinh = 0 THEN 'Chi ' + Ten
END 

SELECT * FROM nhanVien

BEGIN
    DECLARE @a INT, @b INT,@tong INT,@hieu INT,@tich INT,@thuong FLOAT
    SET @a = 8
    SET @b = 4
    SET @tong = @a + @b
    SET @hieu = @a - @b
    SET @tich = @a * @b
    SET @thuong = @a / @b
    PRINT @tong
    PRINT @hieu
    PRINT @tich
    PRINT @thuong
END

BEGIN
    DECLARE @c INT, @d INT, @dientich FLOAT, @chuvi FLOAT
    SET @c = 5
    SET @d = 6
    SET @dientich = @c * @d
    SET @chuvi = (@c + @d )*2
    PRINT @dientich
    PRINT @chuvi
END

DECLARE @diemCOM2034 INT
SET @diemCOM2034 = 5
IF @diemCOM2034 >=5
    PRINT 'pass'
ELSE
    PRINT 'truot'

DECLARE @toan INT, @ly INT , @hoa INT, @diemTrungBinh FLOAT
SET @toan= 8
SET @ly=5
SET @hoa=7
SET @diemTrungBinh=(@toan +@ly+ @hoa)/3
IF @diemTrungBinh >=8 AND @diemTrungBinh<=10
    PRINT 'Xuat sac'
ELSE IF @diemTrungBinh>=7 AND @diemTrungBinh<8
    PRINT 'Kha'
ELSE IF @diemTrungBinh>=6 AND @diemTrungBinh<7
    PRINT 'Trung binh kha'
ELSE IF @diemTrungBinh>=5 AND @diemTrungBinh<6
    PRINT 'tb'
ELSE 
    PRINT 'yeu'














/**
Ham: 
Bao gom khoi lenh gom cac nhiem vu theo yeu cau cua de.
1. Ham tra ve (RETURN)
2. HAM K CO KIEU TRA VE          
CU PHAP:
    CREATE FUNCTION ten ham(ts truyen vao)
    RETURNS kieu du lieu tra ve -- DUNG RETURN  de dinh nghia kieu tra ve ham
    AS
    BEGIN
        - Code 
    END            
*/
-- Tinh tuoi cua ban khi biet nam sinh 
CREATE FUNCTION tinhTuoi(@nam_sinh INT)
RETURNS INT 
AS 
BEGIN 
    RETURN 2024 - @nam_sinh
END

GO

-- Khi goi ham bat buoc phai dung dbo.tenHam
PRINT dbo.tinhTuoi(2023)

/**
Tao CSDL: Buoi14_TrenLop
Tao bang:
    NhanVien(ID,Ma,Ten,GioiTinh- bit, ngaySinh -date)
    ID: khoa chinh - tu tang
Them vao bang 3 ban ghi
*/

CREATE DATABASE Buoi14_TrenLop
GO
USE Buoi14_TrenLop
GO
CREATE TABLE NhanVien(
    ID INT IDENTITY PRIMARY KEY,
    Ma VARCHAR(20),
    TEN VARCHAR(50),
    GioiTinh BIT,
    ngaySinh DATE
)
INSERT INTO NhanVien
VALUES
('NV1','AAA',1,'2000-01-01'),
('NV2','BBB',1,'2000-06-01'),
('NV3','CCC',0,'2000-01-31')

SELECT * FROM NhanVien
/**
    1. Viet ham dem xem co bn nhan vien co gioi tinh la Nu
         va ten bat dau bang chu A
    2. Viet ham tao 1 bang hien thi danh sach nhan vien co gt la Nu
*/
GO
CREATE FUNCTION demSoLuongNhanVien(@gioi_tinh BIT)
RETURNS INT 
AS 
BEGIN 
    -- Code 
    RETURN (
        SELECT COUNT(GioiTinh)
        FROM NhanVien
        WHERE GioiTinh = @gioi_tinh
        AND TEN LIKE 'A%'
    )
END
GO 
PRINT dbo.demSoLuongNhanVien(1)
/**
    Tao them bang CaLam(ID, IDNhanVien, maCaLam, ThoiGianBatDau - DATE, thoiGianKetThuc - Date)
    -- ID: Khoa chinh tu tang
    -- IDNhanVien -La khoa ngoai
    -- Insert 5 ban ghi cua bang CaLam
*/

CREATE TABLE CaLam(
    ID INT PRIMARY KEY IDENTITY,
    maCaLam VARCHAR(20),
    IDNhanVien INT FOREIGN KEY REFERENCES NhanVien(ID),
    ThoiGianBatDau DATE,
    ThoiGianKetThuc DATE
)

INSERT INTO CaLam
VALUES
    ('CL01',5,'2024-11-20','2028-11-20'),
    ('CL02',6,'2024-11-20','2028-11-20'),
    ('CL03',7,'2024-11-20','2028-11-20'),
    ('CL04',5,'2024-11-20','2028-11-20')
    
SELECT * FROM CaLam
-- Su dung procedure de insert du lieu vao 2 bang Nhan Vien, Ca lam. Moi bang them 5 truong ban ghi
GO
CREATE PROCEDURE insertNhanVien(
    @Ma VARCHAR(50),
    @Ten NVARCHAR(100),
    @GioiTinh BIT,
    @NgaySinh DATE
)
AS
BEGIN
    INSERT INTO NhanVien
    VALUES
        (@Ma, @Ten, @GioiTinh, @NgaySinh )
END
EXECUTE insertNhanVien  @Ma = 'NV01', @Ten = N'Nguyen Van A', @GioiTinh = 1, @NgaySinh = '2000-01-31'
-- Viet ham dem so luong nhan vien co gioiTinh la Nu va co maCaLam chua chu A

GO 
CREATE FUNCTION demSoLuongNhanVien()
RETURNS INT
AS
BEGIN
    RETURN(
        SELECT COUNT(GioiTinh)
        FROM NhanVien nv, CaLam cl
        WHERE nv.ID = cl.IDNhanVien
        AND nv.GioiTinh = 1
        AND cl.maCaLam = '%A%'
    )
END
GO
PRINT dbo.demSoLuongNhanVien()

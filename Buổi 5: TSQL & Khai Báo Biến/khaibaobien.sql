/**
    1. Kieu du lieu:
        - nvarchar, varchar, int, float, date,datetime, bit..
    => Goi la kieu du lieu 
    2. Khai bao bien
        - DECLARE : Dung de khai bao bien 
        - Co 2 loai bien 
            + Bien khai bao thong thuong 
            + Bien bang (table)
        - Cu phap khai bao bien:
            DECLARE @name data type:
                + name: ten cua bien ( do cac ban dat)
                + data type : kieu du lieu cua bien
        VD: DECLARE @number INT
        - Thay doi/ Gan gia tri cho bien : SET 
        - Truy xuat hien thi gia tri cua bien: PRINT/ SELECT 
*/
-- 1: Tinh tong cua 3 nguyen co gia tri bat ky 
-- 2: Tinh tuoi cua ban than khi bien nam sinh 

DECLARE @year INT
SET @year = 2007
SELECT (2024 - @year)

DECLARE @a INT, @b INT, @c INT, @tong INT
SET @a = 5
SET @b = 3
SET @c = 7
SET @tong = @a + @b + @c
SELECT @tong
/**
    3. Bien bang
    DECLARE @ten bien TABLE
    (khai bao cac thanh phan cua table)
*/
-- VD: Tao CSDL Buoi5
-- Tao 1 bien bang @sinh_vien 
-- gom cac thuoc tinh: mssv-varchar(10), ten - nvarchar(20), tuoi - int
-- Them 3 du lieu vao bien bang sinh vien

DECLARE @tb_sinh_vien TABLE
(mssv VARCHAR(10), ten NVARCHAR(20), tuoi INT)

INSERT INTO @tb_sinh_vien
VALUES('HE130461',N'Nguyễn Thuý Hằng',10)

SELECT * FROM @tb_sinh_vien

/**
    T-SQL: Structure Query Language 
    Ngon ngu truy van co cau truc cho phep tao va truy van tren SQL
    Cu phap:
    BEGIN
        -- Muon lam gi thi lam 
    END
    Co 4 nhom lenh trong SQL 
        + DQL: Nhom nay gom cac cau lenh SELECT
            => Khong thay doi duoc du lieu cua bang 
        + DDL: Nhom nay gom cac cau lenh : ALTER,DROP......
            => Nhom nay thay doi cau truc cua bang 
        + Nhom nay gom cac cau lenh(Nhom thao tac du lieu): INSERT, UPDATE, DELETE...
            => Nhom nay gom cac cau lenh thay doi du lieu cua bang 
        + Nhom nay thay doi cau truc cua bang/ lenh: GRANT....
*/

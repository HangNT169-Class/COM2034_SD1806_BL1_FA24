/**
Re nhanh
1. If..else 
Cu phap:
 IF Dieu kien
    BEGIN 
     -- CODE
     END
 ELSE 
    BEGIN 
    -- CODE 
    END
*/
-- Viet chuong trinh lam theo nao de qua mon COM2034 khi biet diem final.
-- Neu diem >= 5 => Passs
-- Neu diem < 5 => Di 
DECLARE @diem INT 
SET @diem = 10
IF @diem >=5 
    PRINT N'Pass'
ELSE 
    PRINT N'Toang'

-- Viet chuong trinh tinh toan so tien mat voi mon COM2034  khi biet diem final 
-- Neu diem < 5 => Mat 2.5M 
-- Neu diem < 8 => Mat 500K 
-- Con lai => Khong mat dong nao 
DECLARE @diem1 INT 
SET @diem1 = 4
IF (@diem1 < 5)
    PRINT N'Mat 2.5M'
ELSE IF (@diem1 < 8 AND @diem1 >=5)
    PRINT N'Mat 500K'
ELSE 
    PRINT N'Khong mat dong nao'

-- 2. IF EXISTS : Check co ton tai hay k 
-- Cu phap
-- IF EXISTS (ca cau lenh SQL)
--     BEGIN
--     -- CODE 
--     END 
-- ELSE 
--     BEGIN
--     -- CODE 
--     END 

SELECT * FROM may_tinh

-- Kiem tra trong bang may tinh cac danh sach may tinh co gia >10 
IF EXISTS (SELECT * FROM may_tinh WHERE gia > 15)
    BEGIN
        PRINT N'Tồn tại danh sách máy tính có giá > 15:'
        SELECT * FROM may_tinh WHERE gia >15
    END
ELSE 
    PRINT N'K Tồn tại danh sách máy tính có giá > 15:'

-- 3. Toan tu 3 ngoi : IIF
-- Cu phap:
-- IIF(dieu kien, gia tri dung, gia tri sai)

SELECT IIF(5<=9, N'Dung', N'Sai') 
-- 4. Switch ..case (case..then)
-- CASE 
--     WHEN (giong cac case) .... then 
--     WHEN (giong cac case) .... then 
--     WHEN (giong cac case) .... then 
--     ELSE 
-- THEN
CREATE TABLE NhanVien(
    ma NVARCHAR(100),
    ten NVARCHAR(100),
    gioi_tinh NVARCHAR(20)
)
INSERT INTO NhanVien
VALUES  
    ('HE130461','Nguyen van a','Nam'),
    ('HE130462','Nguyen van b','Nam'),  
    ('HE130463','Nguyen van c','Nam'),
    ('HE130464','Nguyen van d','Nữ')
SELECT * FROM NhanVien

SELECT TEN = (CASE gioi_tinh
                WHEN 'Nam' THEN 'Anh ' + TEN
                WHEN 'Nữ' THEN 'Chi ' + TEN
                ELSE  N'Khong co gia tri'
            END)
FROM NhanVien
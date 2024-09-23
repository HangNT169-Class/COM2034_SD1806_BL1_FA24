CREATE DATABASE BTVNBuoi5
GO 
USE BTVNBuoi5
GO
CREATE TABLE lopHoc(
    maLop VARCHAR(10) PRIMARY KEY,
    tenLop NVARCHAR(20),
)

CREATE TABLE hocSinh(
    maHS VARCHAR(10) PRIMARY KEY,
    maLop VARCHAR(10) FOREIGN KEY REFERENCES lopHoc(maLop),
    tenHS NVARCHAR(20),
    ngaySinh DATE
)
CREATE TABLE monHoc(
    maMon VARCHAR(10) PRIMARY KEY,
    tenMonHoc NVARCHAR(10),
    soTinChi INT
)
CREATE TABLE diem(
    id INT PRIMARY KEY IDENTITY,
    maMon VARCHAR(10) FOREIGN KEY REFERENCES monHoc(maMon),
    diem INT
)
INSERT INTO lopHoc
VALUES
('LH1',N'adaf'),
('LH2',N'adaf'),
('LH3',N'adaf')
INSERT INTO hocSinh
VALUES
('HS1','LH1',N'AAA','2020-10-10'),
('HS2','LH2',N'AAA','2020-11-11'),
('HS3','LH3',N'AAA','2020-11-10')
INSERT INTO monHoc
VALUES
('M1',N'hh',1),
('M2',N'hh',1),
('M3',N'hh',1)
INSERT INTO diem
VALUES
('M1',10),
('M2',10),
('M3',10)

SELECT * FROM lopHoc
SELECT * FROM monHoc
SELECT * FROM hocSinh
SELECT * FROM diem

-- chinh sua ang loop hoc th
ALTER TABLE lopHoc
ADD maKhoa VARCHAR(10)

-- xoa 
ALTER TABLE lopHoc
DROP COLUMN maKhoa

DECLARE @luong INT, @he_so INT, @income INT
SET @luong = 200
SET @he_so = 2
SET @income = @luong * @he_so
SELECT @income

DECLARE @tbhocSinh_Tam TABLE(
    maSinhVien VARCHAR(20),
    tenSV VARCHAR(20)
)



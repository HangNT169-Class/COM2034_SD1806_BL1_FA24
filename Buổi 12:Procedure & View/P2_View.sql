/**
    - view:
        + muc dich: che giau cac du lieu ben trong (bao mat du lieu)
        + bang cach: chi dinh cac cot co o trong view => che dau mot 1 tt con lai
        => hien thi du lieu tuy bien
    Cu phap:
     CREATE VIEW ten_view
     AS
     cac cau truy van 
*/
SELECT * FROM may_tinh
-- tao 1 view co may tinh co gia >=11
GO
CREATE VIEW danhsachmaytinhtheogia
AS
SELECT * FROM may_tinh WHERE gia >=11
-- xem thong tin cua view vua tao
GO
SELECT * FROM danhsachmaytinhtheogia WHERE ma = 'MT04'

CREATE DATABASE buoi12
GO
USE buoi12
GO

CREATE TABLE loaisach(
    maloaisach VARCHAR(20) PRIMARY KEY,
    tenloaisach NVARCHAR(100)
)

INSERT INTO loaisach
VALUES
    ('ls1',N'a'),
    ('ls2',N'b'),
    ('ls3',N'c')

CREATE TABLE tacGia(
    maTacgia VARCHAR(20) PRIMARY KEY,
    tenTacgia NVARCHAR(100),
    gioitinh BIT
)

INSERT  INTO tacGia
VALUES
    ('tg1',N'aa',0),
    ('tg2',N'ab',1),
    ('tg3',N'ac',0)

CREATE TABLE sach(
    maSach VARCHAR(20),
    maLoaisach VARCHAR(20) FOREIGN KEY REFERENCES loaisach(maloaisach),
    maTacGia VARCHAR(20) FOREIGN KEY REFERENCES tacGia(maTacgia),
    tensach NVARCHAR(100),
    gia INT
)

INSERT INTO sach
VALUES
    ('s1','ls1','tg1',N'ba',300),
    ('s2','ls2','tg2',N'bb',200),
    ('s3','ls3','tg3',N'bd',100)

SELECT * FROM loaisach
SELECT * FROM tacGia
SELECT * FROM sach

-- Liệt kê các sách với tên sáchviết thường, tên tác giả viết hoa có giới tính là 1 và có giá lớn nhất
SELECT * 
FROM loaisach l, tacGia t, sach s 
WHERE l.maloaisach = s.maLoaisach
AND  t.maTacgia = s.maTacGia



--Liệt kê các sách với tên sách viết hoa và có giá thấp nhất

-- Liệt kê các sách có giá>= giátrung bình

--Liệt kê tác giả có nhiều sách nhất

-- Liệt kê các sách mà trong tên sách chứa chữ o và tác giả là Nguyễn Thuý Hằng

--Liệt kê các nhân viên có số ngày đi làm lơn nhất trong tháng 8

-- Liệt kê các tác giả gồm các trường sau : tên tác giả, giới tính. Nếu

--gioiTinh = 1 => Hiển thị ra là Nam

--gioiTinh = 0 => Hiển thị ra là Nữ

--Liệt kê các nhân viên gồm các trường sau: tên sách, tên tác giả, giá, thuế

--giá>=5000 => Thuế = lương *0.1

--iá<5000 && >=10000 => Thuế = Lương * 0.12

--giá<10000 && >= 11000 => Thuế = lương * 0.15

--Còn lại => thuế = lương * 0.2

--Tính tổng các số chẵn từ 1-10 và bỏ qua 4

--Tính tích các số lẻ từ 1-19 và nếu gặp 9 thì dừng lại

--Nếu trong tất cả sách đếm được số nhân viên có sách>8000 thì lấy ra danh sách sách có giá>8000. Nếu không có thì in ra “ Không tồn tại”

--Thêm tiền tố Mr hoặc Mrs cho tên tách giá phụ thuộc vào giới tính

--Viết chương trình tính tổng các số từ 1 đến 10

-- Viết chương trình tính tổng các số chẵn từ 1 đến 10

--Viết chương trình tính tổng các số lẻ từ 1 đến 10 bỏ số 5

--4. dụng DB QLDA và thực hiện các yêu cầu dưới đây

--Tạo view chứa 2 thông tin là tenNV, tenPB

--Tạo view chứa các thông tin maNV, tenNV, tenPB, gioiTinh,luong, thuế. Nếu luong >=30000 => thuế = 0.1*lương và còn lại thì thuế = lương * 0.2

--Tạo View hiển thị Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân
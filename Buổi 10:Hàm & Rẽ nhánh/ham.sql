/**
Cac ham trong SQL 
1. CAST - Ep kieu du lieu 
-- Ham case se chuyen doi tu kieu du lieu nay sang kieu du lieu khac 
-- Chuyen doi thanh cong => Tra ra ket qua => loi 
-- Cu phap:
CAST(bieu thuc can ep AS Kieu du lieu(dodai))
*/
-- VD: 1.2 => nguyen 
SELECT CAST(1.2 AS INT)
SELECT CAST ('2024 - 09 - 30' AS datetime)
SELECT CAST (GETDATE() AS datetime)
/**
2.CONVERT - Ep kieu du lieu
Ham chuyen tu kieu tu kieu du lieu nay sang kieu du lieu khac
Khi chuyen loi => Tra ra loi. Khi thanh cong => Tra ra kieu mong muon
Cu phap
CONVERT(kieu du lieu (dodai), bieu thuc can ep, dinh dang)
dinh dang: Khong bat buoc => Chuyen ve dung dinh dang mong muon
VD: 101, 102,103...
*/
-- VD
SELECT CONVERT(INT, 16.4);
SELECT CONVERT (DATE, '2024.09.30',102)
-- https://quantrimang.com/hoc/ham-convert-trong-sql-server-161965

SELECT CONVERT(varchar(30), GETDATE(), 101)
-- mm/dd/yyyy 
SELECT CONVERT(varchar,GETDATE(),103)
-- dd/mm/yyyy 
SELECT CONVERT(varchar, GETDATE(), 105)
-- dd-mm-yyyy 

-- 3. Ham lien quan toi toan hoc
-- ham tri tuyet doi : ABS
-- Ham tiem can tren: CEILING
-- Ham tiem can duoi: FLOOR 
-- Luy thua: POWER 
-- Lay can bac 2: SQRT
-- Ham logorait: LOG 

-- 4. Ham lien quan toi chuoi
-- TRIM
-- LTRIM, RTRIM 
-- LEN(chuoi)
-- ... 

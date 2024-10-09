/** 
 Vong lap: 
 WHILE( dieu kien)
    BEGIN
    -- code
    END

*/
-- tao 1 bien dem 
-- neu bien dem < 5 =< in ra ahihi + dem

DECLARE @dem INT
SET @dem = 4
WHILE(@dem <5 )
    BEGIN
    PRINT N'ahihi'+ CONVERT(VARCHAR(20), @dem)
    -- set @dem = @dem + 1
    -- i = i+1
    -- i+=1
    SET @dem +=1
    END
-- In cac so tu 0 - 10
DECLARE @lap INT
SET @lap = 0
WHILE (@lap <11)
    BEGIN
     PRINT @lap
     SET @lap +=1
    END
/**
Break: dung vong lap ngay lap tuc 
Continue: Bo qua va tiep tuc vong lap tiep theo

*/
-- in cac so tu 0-9 => neu gap 4 thi dung lai
DECLARE @so INT
SET @so = 0
WHILE (@so <9)
    BEGIN
        IF(@so = 4)
        BEGIN
             BREAK
        END
        PRINT @so
        SET @so +=1
    END
-- in cac so tu 0-10 => neu gap 5 thi bo qua va in tiep 6-10
DECLARE @number INT = 0
WHILE(@number < 10)
    BEGIN
        IF(@number = 5)
        BEGIN
            SET @number +=1
            CONTINUE 
            
        END
        PRINT @number
         SET @number +=1
    END


/**
Nhung luu y khi su dung vong lap
1. xac dinh duong diue kien cua vong lap
2. xax dinh buoc nhay phu hop
3. xac dieu kien khi ngat vong lap
*/
/**
    Try.. catch: xu ly ngoai le trong SQL
    => xu ly loi
    SQL cung co che kiem soat loi giong Java/C# bang try..catch
    mot so ham  ERROP hya dung khi kiem soat loi
    + ERROP_NUMBER(): Tra ve ma so cua loi
    + ERROR_MESSAGE(): Tra ve ten loi
    + ERROR_LINE(): Tra ve so dong bi loi
    + ERROR_SEVERITY(): Tra ra muc do nghiem trong cua loi
    + ERROR_PROCEDURE(): Tra ve thu tuc/trigger

*/

BEGIN TRY
    -- vut cac dong nghi ngo xay xa loi
    SELECT 1 +'aa'
    --PRINT 1 + 'aa'
END TRY
BEGIN CATCH
    -- xu ly  loi
    SELECT ERROR_MESSAGE() AS N'thong bao loi'
    SELECT ERROR_NUMBER() AS N'ma loi'
END CATCH

/**
    PROCEDURE: day la noi luu tru tap hop cac cau lenh di kem trong SQL, tai su dung khi can
    co 2 loai: 
        1. System stored procedure
        2. User stored procedure
    Cu phap: 
    CREATE PROCEDURE ten_procedure(Tham so truyen vao)
    AS
    BEGIN
        // logic code
    END
    Chu y: 
        - Procedure: chi chay dc 1 lan duy nhat. Neu muon thay doi => ALTER
        - De chay dc procedure
             => EXCUTE ten_procedure
             => EXEC ten_procedure
             
*/
-- SELECT * FROM may_tinh
-- tao 1 procedure hien thi tat ca cac may tinh 
-- co mau sac la mau truyen vao va gia >= gia truyen vao
GO
ALTER PROCEDURE danhSachMayTinh(@mauSac NVARCHAR(20), @gia INT)
AS
BEGIN
    SELECT * FROM may_tinh
    WHERE mau_sac = @mauSac
    AND gia >= @gia
END

EXECUTE danhSachMayTinh @mauSac = N'do', @gia = 12

-- Su dung procedure de them du lieu vao bang may tinh (5 ban ghi)
GO
CREATE PROCEDURE themMayTinh(@ma VARCHAR(20), @ten NVARCHAR(100))
AS
BEGIN
    IF @ma IS NULL
        BEGIN
            PRINT N'khong dc de thuoc tinh bi null'
        END
    ELSE
        BEGIN
            INSERT INTO may_tinh (ma, ten)
            VALUES(@ma, @ten)
        END
END
GO
EXECUTE themMayTinh @ma = 'Ma01', @ten = N'May tinh moi1'
EXECUTE themMayTinh @ma = 'Ma02', @ten = N'May tinh moi2'
EXECUTE themMayTinh @ma = 'Ma03', @ten = N'May tinh moi3'
GO
SELECT * FROM may_tinh

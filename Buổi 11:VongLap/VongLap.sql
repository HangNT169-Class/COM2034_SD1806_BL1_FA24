/**
    Vong lap: 
    WHILE(dieu kien)
        BEGIN
            Code 
        END 
*/
-- Tao 1 bien dem
-- Neu bien dem < 5 => in ra ahihi + dem 

DECLARE @count INT = 0
WHILE(@count < 5)
    BEGIN
        PRINT'ahihi' + CONVERT(VARCHAR(10), @count)
        SET @count = @count + 1
    END

DECLARE @count1 INT = 0
WHILE(@count1 < 5)
    BEGIN
        PRINT'ahihi' + CONVERT(VARCHAR(10), @count1)
        -- SET @count = @count + 1
        --  i = i+1
        -- i+=1
        SET @count +=1
    END

-- In cac so tu 0 - 10 
DECLARE @dem INT = 0
WHILE (@dem< 11)
    BEGIN
        PRINT @dem
        SET @dem +=1
    END

/**
    Break: Dung vong lap ngay lap tuc 
    Continue: Bo qua va tiep tuc vong lap tiep theo 
*/
-- In cac so tu 0 - 9 => Neu gap 4 thi dung lai
-- In cac so tu 0 - 10 => Neu gap 5 thi bo qua va in tiep 6 - 10 
DECLARE @dem INT = 1 
WHILE (@dem < 10)
    BEGIN
        IF(@dem=4)
            BEGIN
                BREAK
            END
        PRINT @dem
        SET @dem +=1 -- Tang buoc nhay len 1
    END
-- Giai quyet van de bai nay dung continue
DECLARE @dem2 INT = 0
WHILE(@dem2 < 11)
    BEGIN
        IF(@dem2 = 5)
            BEGIN
                SET @dem2 +=1 -- Khac vs Java
                -- CONTINUE
            END
        PRINT @dem2
        SET @dem2 += 1
    END
/**
    Nhung luu y khi su dung vong lap
    1. Xac dinh duong dieu kien cua vong lap
    2. Xac dinh buoc nhay phu hop 
    3. Xac dieu kieu khi ngat vong lap
*/
/**
    Try..Catch: Xy ly ngoai le trong SQL 
    => Xy ly loi
    SQL cung co che kiem soat loi giong Java/C# bang try..catch
    Mot so ham ERROR hay dung khi kiem soat loi
        + ERROR_Number(): Tra ve ma so cua loi 
        + ERROR_MESSAGE(): Tra ve ten loi
        + ERROR_LINE(): Tra ve so dong bi loi 
        + ERROR_SEVERITY(): Tra ra muc do nghiem trong cua loi => kieu so int 
        + ERROR_STATE(): Tra ve trang thai loi
        + ERROR_PROCEDURE(): Tra ve thu tuc/trigger
*/
-- SELECT 1 +'aa'
-- PRINT 1 +'aa'
BEGIN TRY 
    -- Vut cac dong nghi ngo xay ra loi 
    SELECT 1 +'aa'
    -- PRINT 1 +'aa'
END TRY
BEGIN CATCH
    -- Xu ly loi 
    SELECT ERROR_MESSAGE()  AS N'Thông báo lỗi'
    SELECT ERROR_Number()  AS N'Mã lỗi '

END CATCH
-- RAISERROR

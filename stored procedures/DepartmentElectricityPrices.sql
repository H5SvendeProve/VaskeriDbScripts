CREATE PROCEDURE InsertDepartmentElectricityPrice
    @DepartmentName nvarchar(128),
    @Exr FLOAT,
    @TimeStart DATETIME,
    @TimeEnd DATETIME,
    @Location nvarchar(32)
AS
	begin
	if not exists (select * from DepartmentElectricityPrices where DepartmentName = @DepartmentName and Exr = @Exr and TimeStart = @TimeStart and TimeEnd = @TimeEnd and Location = @Location)
BEGIN
    INSERT INTO DepartmentElectricityPrices (DepartmentName, Exr, TimeStart, TimeEnd, Location)
    VALUES (@DepartmentName, @Exr, @TimeStart, @TimeEnd, @Location);
	end;
END;
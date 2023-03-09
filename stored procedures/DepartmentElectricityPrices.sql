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


create Procedure GetElectricityPrice

	@DepartmentName nvarchar(64)

as
begin

	set NOCOUNT on;


	select DepartmentName, ep.DKKPerKWh, ep.TimeStart,ep.TimeEnd, ep.Location from DepartmentElectricityPrices dep
	inner join ElectricityPrices ep
	on dep.Exr = ep.Exr and dep.Location = ep.Location and dep.TimeStart = ep.TimeStart and dep.TimeEnd = ep.TimeEnd
	where dep.DepartmentName = @DepartmentName order by dep.TimeStart, dep.TimeEnd

end
CREATE PROCEDURE InsertElectricityPrice
    @DKKPerKWh FLOAT,
    @EURPerKWh FLOAT,
    @Exr FLOAT,
    @TimeStart DATETIME,
    @TimeEnd DATETIME,
    @Location nvarchar(50)
AS
BEGIN

	if not exists (select * from ElectricityPrices where Exr = @Exr and TimeStart = @TimeStart and TimeEnd = @TimeEnd and Location = @Location)

	begin

    INSERT INTO ElectricityPrices (DKKPerKWh, EURPerKWh, Exr, TimeStart, TimeEnd, Location)
    VALUES (@DKKPerKWh, @EURPerKWh, @Exr, @TimeStart, @TimeEnd, @Location);

	end;
END;

GO

create procedure PriceExistsInDb
    @TimeStart DATETIME,
    @TimeEnd DATETIME,
    @Location nvarchar(50)

as
    begin
    set nocount on;

    select 1 from ElectricityPrices where Location = @Location and convert(DATE, TimeStart) = convert(DATE, @TimeStart) and convert(DATE, TimeEnd) = convert(DATE, @TimeEnd)

    end
GO


create procedure GetAllElectricityPrices

as
    begin
    set nocount on;

    select DKKPerKwh, EURPerKWh, Exr, TimeStart, TimeEnd, Location from ElectricityPrices;

    end
GO
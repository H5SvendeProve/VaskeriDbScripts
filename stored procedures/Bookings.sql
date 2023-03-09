CREATE PROCEDURE InsertBooking
(
    @Username nvarchar(16),
    @Price decimal(19, 4),
    @StartTime datetime,
    @EndTime datetime,
    @ProgramId int,
    @MachineManufacturer nvarchar(64),
    @ModelName nvarchar(64)
)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Bookings (Username, Price, StartTime, EndTime, ProgramId, MachineManufacturer, ModelName)
    VALUES (@Username, @Price, @StartTime, @EndTime, @ProgramId, @MachineManufacturer, @ModelName);

    SELECT SCOPE_IDENTITY() AS BookingId; -- returns the auto-generated booking number
END

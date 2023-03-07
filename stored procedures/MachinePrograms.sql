CREATE PROCEDURE InsertMachineProgram
    @MachineManufacturer nvarchar(64),
    @ModelName nvarchar(64),
    @ProgramName nvarchar(128),
    @ProgramRunTimeMinutes int
AS
BEGIN
    DECLARE @ProgramId int
    SELECT @ProgramId = ProgramId FROM Programs WHERE ProgramName = @ProgramName
    
    IF @ProgramId IS NULL
    BEGIN
        EXEC InsertProgram @ProgramName, @ProgramRunTimeMinutes
        SELECT @ProgramId = SCOPE_IDENTITY()
    END
    
    INSERT INTO MachinePrograms (MachineManufacturer, ModelName, ProgramId)
    VALUES (@MachineManufacturer, @ModelName, @ProgramId)
END
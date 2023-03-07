CREATE PROCEDURE InsertProgram
    @ProgramName nvarchar(128),
    @ProgramRunTimeMinutes int
AS
	begin
	if not exists (select * from Programs where ProgramName = @ProgramName and ProgramRunTimeMinutes = @ProgramRunTimeMinutes)
BEGIN
    INSERT INTO Programs (ProgramName, ProgramRunTimeMinutes)
    VALUES (@ProgramName, @ProgramRunTimeMinutes)
	end;
END
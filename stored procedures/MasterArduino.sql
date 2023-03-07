CREATE PROCEDURE InsertMasterArduino
    @MasterArduinoId nvarchar(36),
    @DepartmentName nvarchar(128),
    @ApiKey nvarchar(36)
AS
	begin
	if not exists (select * from MasterArduinos where MasterArduinoId = @MasterArduinoId and DepartmentName = @DepartmentName and ApiKey = @ApiKey)
	
BEGIN
    INSERT INTO MasterArduinos (MasterArduinoId, DepartmentName, ApiKey)
    VALUES (@MasterArduinoId, @DepartmentName, @ApiKey);
	end;
END;
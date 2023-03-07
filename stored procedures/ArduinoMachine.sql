CREATE PROCEDURE InsertArduinoMachine
    @MasterArduinoId NVARCHAR(36),
    @MachineManufacturer NVARCHAR(64),
    @ModelName NVARCHAR(64)
AS
	begin
	if not exists (select * from ArduinoMachines where MasterArduinoId = @MasterArduinoId and MachineManufacturer = @MachineManufacturer and ModelName = @ModelName)
BEGIN
    INSERT INTO ArduinoMachines (MasterArduinoId, MachineManufacturer, ModelName)
    VALUES (@MasterArduinoId, @MachineManufacturer, @ModelName);
	end;
END;
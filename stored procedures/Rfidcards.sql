CREATE PROCEDURE InsertRfidCard
    @RfidCardId nvarchar(32),
    @Username nvarchar(16)
AS
	begin
	if not exists (select * from rfidCards where RfidCardId = @RfidCardId and Username = @Username)
BEGIN
    INSERT INTO rfidCards(RfidCardId, Username)
    VALUES (@RfidCardId, @Username)
	end;
END;


create PROCEDURE GetRfidCard

	@RfidCardId nvarchar(32)

as
begin

	set NOCOUNT on;
	
	select RfidCardId, Username from RfidCards where RfidCardId = @RfidCardId
end
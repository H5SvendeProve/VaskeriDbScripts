CREATE PROCEDURE InsertUser
    @Username nvarchar(16),
    @Password nvarchar(1024),
    @PasswordSalt nvarchar(256),
    @UserRole nvarchar(16),
	@DepartmentName nvarchar(128)
AS
BEGIN

	if not exists (select * from Users where Username = @Username)

	begin

    -- Insert the new user
    INSERT INTO Users (Username, Password, PasswordSalt, UserRole, DepartmentName)
    VALUES (@Username, @Password, @PasswordSalt, @UserRole, @DepartmentName);

	end

END

GO

CREATE PROCEDURE GetAllUsers

AS
BEGIN
    SET NOCOUNT ON;

	begin

    select username, Password, PasswordSalt, UserRole from Users;

	end

END
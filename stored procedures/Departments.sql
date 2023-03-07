CREATE PROCEDURE InsertDepartment
	@DepartmentName nvarchar(128),
	@Address nvarchar(128),
	@City nvarchar(128),
	@Zipcode nvarchar(5)
AS
	BEGIN

	if not exists (select * from Departments where DepartmentName = @DepartmentName)
	BEGIN
	
    INSERT INTO Departments (DepartmentName, Address, City, Zipcode)
    VALUES (@DepartmentName, @Address, @City, @Zipcode);
	
	end;
END;
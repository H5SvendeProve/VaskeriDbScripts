CREATE TRIGGER tr_ElectricityPrices_Insert
ON ElectricityPrices
AFTER INSERT
AS
BEGIN
    INSERT INTO DepartmentElectricityPrices (DepartmentName, Exr, TimeStart, TimeEnd, Location)
    SELECT d.DepartmentName, ep.Exr, ep.TimeStart, ep.TimeEnd,
           CASE WHEN d.ZipCode > 4999 THEN 'WestDenmark'
                ELSE 'EastDenmark'
           END AS Location
    FROM Departments d, ElectricityPrices ep
END

CREATE DATABASE VaskeriDb;


use VaskeriDb;


CREATE TABLE ElectricityPrices (
    DKKPerKWh FLOAT NOT NULL,
    EURPerKWh FLOAT NOT NULL,
    Exr FLOAT NOT NULL,
    TimeStart DATETIME NOT NULL,
    TimeEnd DATETIME NOT NULL,
    Location nvarchar(50) NOT NULL
	constraint PK_ElectricityPrices PRIMARY KEY (Exr, TimeStart, TimeEnd, Location)
);

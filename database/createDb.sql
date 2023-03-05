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


CREATE TABLE Users (
    Username nvarchar(16) NOT NULL,
    Password nvarchar (1024) NOT NULL,
    PasswordSalt nvarchar (256) NOT NULL,
    UserRole nvarchar (16) NOT NULL,
	constraint PK_Users PRIMARY KEY (Username)
);

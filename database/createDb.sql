
CREATE DATABASE VaskeriDb;


use VaskeriDb;



CREATE TABLE ElectricityPrices (
    DKKPerKWh FLOAT NOT NULL,
    EURPerKWh FLOAT NOT NULL,
    Exr FLOAT NOT NULL,
    TimeStart DATETIME NOT NULL,
    TimeEnd DATETIME NOT NULL,
    Location nvarchar(32) NOT NULL
	constraint PK_ElectricityPrices PRIMARY KEY (Exr, TimeStart, TimeEnd, Location)
);


create table Departments (

	DepartmentName nvarchar(128) NOT NULL,
	Address nvarchar (128) NOT NULL,
	City nvarchar (128) NOT NULL,
	Zipcode nvarchar (5) NOT NULL

	constraint PK_Departments PRIMARY key (DepartmentName)

);

CREATE TABLE DepartmentElectricityPrices (
    DepartmentName nvarchar(128) NOT NULL,
    Exr FLOAT NOT NULL,
    TimeStart DATETIME NOT NULL,
    TimeEnd DATETIME NOT NULL,
    Location nvarchar(32) NOT NULL,
    CONSTRAINT PK_DepartmentElectricityPrices PRIMARY KEY (DepartmentName, Exr, TimeStart, TimeEnd, Location),
    CONSTRAINT FK_DepartmentElectricityPrices_Departments FOREIGN KEY (DepartmentName)
        REFERENCES Departments (DepartmentName)
        ON DELETE CASCADE,
    CONSTRAINT FK_DepartmentElectricityPrices_ElectricityPrices FOREIGN KEY (Exr, TimeStart, TimeEnd, Location)
        REFERENCES ElectricityPrices (Exr, TimeStart, TimeEnd, Location)
        ON DELETE CASCADE
);

CREATE TABLE Users (
    Username nvarchar(16) NOT NULL,
    Password nvarchar (1024) NOT NULL,
    PasswordSalt nvarchar (256) NOT NULL,
    UserRole nvarchar (16) NOT NULL,
	DepartmentName nvarchar (128) NOT NULL,
	constraint PK_Users PRIMARY KEY (Username),
	constraint FK_Departments FOREIGN key (DepartmentName)
	REFERENCES Departments (DepartmentName)
	on delete cascade
);

create table MasterArduinos (

	MasterArduinoId nvarchar (36) NOT NULL,
	DepartmentName nvarchar (128) not NULL,
	ApiKey nvarchar (36) NOT NULL,

    constraint PK_MasterArduinos primary key (MasterArduinoId),
	CONSTRAINT FK_MasterArduinos_Departments FOREIGN KEY (DepartmentName)
	references  Departments (DepartmentName)
	ON DELETE CASCADE
);

CREATE TABLE Machines (
    MachineManufacturer nvarchar(64) NOT NULL,
    ModelName nvarchar(64) NOT NULL,
    EffectKWh float NOT NULL,
    MasterArduinoId nvarchar(36) NOT NULL,
    CONSTRAINT PK_Machines PRIMARY KEY (MachineManufacturer, ModelName),
    CONSTRAINT FK_Machines_MasterArduinos FOREIGN KEY (MasterArduinoId)
        REFERENCES MasterArduinos (MasterArduinoId)
        ON DELETE CASCADE
);

CREATE TABLE ArduinoMachines (
    MasterArduinoId nvarchar(36) NOT NULL,
    MachineManufacturer nvarchar(64) NOT NULL,
    ModelName nvarchar(64) NOT NULL,
    CONSTRAINT PK_ArduinoMachines PRIMARY KEY (MasterArduinoId, MachineManufacturer, ModelName),
    CONSTRAINT FK_ArduinoMachines_MasterArduinos FOREIGN KEY (MasterArduinoId)
        REFERENCES MasterArduinos (MasterArduinoId)
        ON DELETE CASCADE,
    CONSTRAINT FK_ArduinoMachines_Machines FOREIGN KEY (MachineManufacturer, ModelName)
        REFERENCES Machines (MachineManufacturer, ModelName)
        ON DELETE NO ACTION
);

create table Programs (

	ProgramId int identity (1,1),
    ProgramName nvarchar (128) NOT NULL,
    ProgramRunTimeMinutes int not null,
    CONSTRAINT PK_Programs PRIMARY KEY (ProgramId)
);

CREATE TABLE MachinePrograms (
    MachineManufacturer nvarchar(64) NOT NULL,
    ModelName nvarchar(64) NOT NULL,
    ProgramId int NOT NULL,
    CONSTRAINT FK_MachinePrograms_Machines FOREIGN KEY (MachineManufacturer, ModelName)
        REFERENCES Machines (MachineManufacturer, ModelName)
        ON DELETE CASCADE,
    CONSTRAINT FK_MachinePrograms_Programs FOREIGN KEY (ProgramId)
        REFERENCES Programs (ProgramId)
        ON DELETE CASCADE,
    CONSTRAINT PK_MachinePrograms PRIMARY KEY (MachineManufacturer, ModelName, ProgramId)
);

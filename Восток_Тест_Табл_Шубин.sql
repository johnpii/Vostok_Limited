CREATE DATABASE Vostok;
GO

USE Vostok;
GO

-- Напишите скрипты по созданию двух таблиц.

-- Таблица контейнеров
CREATE TABLE Containers (
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    Number INT NOT NULL,
    [Type] NVARCHAR(20) NOT NULL,
    [Length] DECIMAL(10, 2) NOT NULL,
    Width DECIMAL(10, 2) NOT NULL,
    Height DECIMAL(10, 2) NOT NULL,
    [Weight] DECIMAL(10, 2) NOT NULL,
    IsEmpty BIT NOT NULL,
    ArrivalDate DATETIME NOT NULL
);
GO

-- Таблица операций.
CREATE TABLE Operations (
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    ContainerID UNIQUEIDENTIFIER NOT NULL,
    OperationStartDate DATETIME NOT NULL,
    OperationEndDate DATETIME NOT NULL,
    OperationType NVARCHAR(50) NOT NULL,
    OperatorFullName NVARCHAR(100) NOT NULL,
    InspectionPlace NVARCHAR(100) NOT NULL,
    FOREIGN KEY (ContainerID) REFERENCES Containers(ID) ON DELETE CASCADE
);
GO
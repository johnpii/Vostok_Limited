USE Vostok

-- �������� ������, ���������� �� ������ ������� ��� ������ �� ����������� � ������� JSON��� ��������� ���������� �������.

SELECT
    '[' + STRING_AGG(
        '{' +
        '"Id":"' + CAST(Id AS NVARCHAR(36)) + '",' +
        '"Number":' + CAST(Number AS NVARCHAR(10)) + ',' +
        '"Type":"' + [Type] + '",' +
        '"Length":' + CAST([Length] AS NVARCHAR(10)) + ',' +
        '"Width":' + CAST(Width AS NVARCHAR(10)) + ',' +
        '"Height":' + CAST(Height AS NVARCHAR(10)) + ',' +
        '"Weight":' + CAST([Weight] AS NVARCHAR(10)) + ',' +
        '"IsEmpty":' + CASE IsEmpty WHEN 1 THEN 'true' ELSE 'false' END + ',' +
        '"ArrivalDate":"' + CONVERT(NVARCHAR(25), ArrivalDate, 121) + '"' +
        '}',
        ','
    ) + ']' AS JsonDataA
FROM Containers

-- �������� ������, ���������� �� ������ ������� ��� ������ �� ��������� ��� ������������� ���������� � ������� JSON �� ��������� ���������� �������.

DECLARE @ContainerId UNIQUEIDENTIFIER = '1DA7A395-7FAE-48CC-8798-C6CA24CC7601'; -- �������� �� ������ Id ����������.

SELECT
    '[' + STRING_AGG(
        '{' +
        '"Id":"' + CAST(Id AS NVARCHAR(36)) + '",' +
        '"ContainerID":"' + CAST(ContainerID AS NVARCHAR(36)) + '",' +
        '"OperationStartDate":"' + CONVERT(NVARCHAR(25), OperationStartDate, 121) + '",' +
        '"OperationEndDate":"' + CONVERT(NVARCHAR(25), OperationEndDate, 121) + '",' +
        '"OperationType":"' + OperationType + '",' +
        '"OperatorFullName":"' + OperatorFullName + '",' +
        '"InspectionPlace":"' + InspectionPlace + '"' +
        '}',
        ','
    ) + ']' AS JsonDataB
FROM Operations
WHERE ContainerID = @ContainerId;
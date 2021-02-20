use Project_Banking;
--Inserting Into ZIP
insert into zip  values ('10001','NY','New York');
insert into zip  values ('90209','LA','Beverly hills');
insert into zip  values ('90264','LA','Malibu');
insert into zip  values ('90267','LA','Manhattan Beach');
insert into zip  values ('75039','TX','Irving');
insert into zip  values ('98102','WA','Seattle');
insert into zip  values ('22009','VA','Springfield');
insert into zip  values ('88901','NV','Las Vegas');
insert into zip  values ('60007','IL','Chicago');
insert into zip values('02120','MA','Boston')
------------------------------

--Inserting into Customer using Create_Customer
--@CusID should be declared as a scalar variavle each time you insert value into the table
--1
Declare @CusID numeric(10,0)
--'Nag','Prud','Gandikota',2222222223,'M','251-28-1111','1998-02-15','2372256','abc@gmail.com','abd street',02120,
Exec Create_Customer 'Saheb','Simarjit','Chabra',8572345456,'M', '328-56-1851','1994-02-21','765701672','saheb@gmail.com','Parker st' ,'02120',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--2
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Urvi','Pravin','Mehta',8572345457,'F', '628-48-1473','1997-08-1','407521202','urvi@gmail.com','Vile Parle st' ,'90209',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--3
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Brad','Duo','Fox',9872345456,'M','231-74-0772','1987-04-08','441473965','brad@gmail.com','Roxbury st' ,'10001',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--4
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Steve','Solo','Brown',8572345459,'M', '416-45-1279','2001-03-12','190242962','steve@gmail.com','tremont st' ,'90209',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--5
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Neil','Lalit','Shah',7872345454,'M', '007-60-8097','1997-02-11','416643130','neil@gmail.com','Wahlberg st' ,'10001',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--6
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Maxie','Goldie','Kahn',3572345453,'F', '445-36-7316','1979-08-30',' 777357253','maxie@gmail.com','Dwayne st' ,'10001',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--7
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Olivia','Chelsea','Giroud',6572345451,'F', '116-18-5924','1993-12-21','102741064','olivia@gmail.com','Silverstone st' ,'75039',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--8
Exec Create_Customer 'Paul','Nadeem','Pogba',5723454587,'M', '633-60-6537','1999-01-01','183039420','paul@gmail.com','mosque st' ,'60007',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--9
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Sergio','Roberto','Busquets',9972345456,'M', '140-96-3136','1994-07-07','751245249','sergio@gmail.com','Spanish st' ,'60007',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--10
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Lionel','Andres','Messi',8572345400,'M', '141-28-5395','2000-05-31','510372365','lionel@gmail.com','God st' ,'75039',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--11
--Declare @CusID numeric(10,0)
Exec Create_Customer 'Angela','Manuel','Pirlo',7072345456,'F', '059-96-5747','1995-02-11','359488037','angela@gmail.com','Kuala st' ,'22009',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--12
Declare @CusID numeric(10,0)
Exec Create_Customer 'Tupaarnaq','Ajith',' Dcruze',8062345456,'M', '049-97-5647','1996-02-15','359488067','ajith123@gmail.com','washington st' ,'98102',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID
--13
Exec Create_Customer 'Tatanka','Nila','Chaudhri',7162345456,'F', '169-86-5647','1998-02-14','739488037','nilachaudari@gmail.com','Tremont st' ,'02120',@CusID output
select concat('Your Customer ID is',@CusID) as CustomerID

---------------
--Branch Details
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('Boston Branch','Huntington street','02120',8572631780,00001000)
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('New York Branch','13th and 11th street', '10001',8572631781,00002000) 

INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('Beverly Hills Branch','Mountain street', '90209',8572631782,00003000)
 INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('Malibu Branch','Beach street', '90264',8572631783,00004000) 
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('Manhattan Branch','Gerald street', '90267',8572631784,00005000) 
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('Irving','Texas street','75039',8572631785,00006000) 
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('Seattle Branch','Twin towers street', '98102',8572631786,00007000)  
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           (' Springfield  Branch','Garden Street', '22009',8572631787,00008000) 
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           (' Las Vegas',' Nevada street', '88901',8572631788,00009000) 
INSERT INTO [dbo].[BranchDetails]
           ([Name]
           ,[StreetAddress]
           ,[ZipCode]
           ,[ContactNo]
           ,[SwiftCode])
     VALUES
           ('Chicago branch','Steve street', '60007',8572631789,00001100)
------------------------------
-- Inserting Into Employee
INSERT INTO employee
           (EmployeeId
           ,PhoneNo
           ,SSN
           ,EmailId
           ,FirstName
           ,MiddleName
           ,[LastName]
           ,[ApprisalRating]
           ,[PassportNo]
           ,[Gender]
           ,[DateOfBirth]
           ,[BranchCode]
           ,[Position]
           ,[Salary]
           ,[Street]
           ,[ZipCode]
           )
     VALUES
           (111 
           ,8765432146
           ,'9876543210'
           ,'fred@bank.com'
           ,'Fred'
           ,'pan'
           ,'Ferreia'
           ,'X'
           ,'A99991871'
           ,'M'
           ,'1998-01-2'
           ,100001
           ,'Manager'
           ,500000
           ,'Parker st'
           ,'02120'
           )

INSERT INTO [dbo].[employee]
           ([EmployeeId]
           ,[PhoneNo]
           ,[SSN]
           ,[EmailId]
           ,[FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[ApprisalRating]
           ,[PassportNo]
           ,[Gender]
           ,[DateOfBirth]
           ,[BranchCode]
           ,[Position]
           ,[Salary]
           ,[Street]
           ,[ZipCode]
           ,[ManagerID])
values 
	(112,3365432146,772387519,'joe@bank.com','joe',null,'ronaldo','C','P89991871','O','1988-02-16',100005,'employee',20000,'32 st','22009',111),
 (113,5665321246,363963957,'jonny@bank.com','jonny','mack','cardoz','C','O89111871','M','1978-11-12',100006,'employee',45000,'92 st','60007',111),
 (114,3453212980,628483439,'alice@bank.com','Alice','sam','parker','C','A29115872','F','1992-08-21',100003,'employee',32100,'62 st','88901',111),
 (115,6782129981,390340282,'samuel@bank.com','samuel','jam','figure','L','B34515899','M','2002-02-02',100010,'employee',4444,'87 st','90264',111),
 (116,8761294323,439939208,'roger@bank.com','roger','dan','fedrer','X','F23415899','M','2001-12-10',100006,'employee',12000,'91 st','10001',111),
 (117,6532129234,155120700,'prajakta@bank.com','prajakta','thomas','rodrigues','C','P54315812','F','1994-01-12',100009,'employee',40101,'27 st','75039',111),
 (118,6721269000,225943930,'olivia@bank.com','olivia','felix','rumao','C','O43567899','F','1995-10-10',100005,'employee',10004,'88 st','98102',111),
 (119,8572292008,600172047,'niel@bank.com','niel','cam','correia','L','N77715809','M','1992-12-13',100008,'employee',30303,'45 st','90264',111),
 (120,1238329098,415897104,'jude@bank.com','jude','jerome','Ran','C','J55118899','M','1997-04-09',100005,'employee',23232,'17 st','22009',111);
-----------------

--Inserting into Support
INSERT INTO [dbo].[Support]
           ([Description]
           ,[CustomerID]
           ,[OpenDate]
           ,[ClosedDate]
           ,[EmployeeID]
           ,[CustomerFeedback]
           ,[EmployeeFeedback])
     VALUES
           ('online banking not working'
           ,11
           ,'2020-02-01'
           ,'2020-03-05'
           ,111
           ,'Resovle asap'
           ,'Resolved'),
('unknow transaction',1,'2020-02-12','2020-03-15',113,'Check','Resolved'),

('request checkbook',2,'2019-12-19','2020-01-10' ,114,'?','allocated'),

('request Credit card ',9,'2019-11-29','2020-02-12' ,117,'Conisder','deliverd'),

('request debit card ',10,'2019-10-08','2019-12-12' ,112,'Miss placed','deliverd'),

('unknow transaction',7,'2019-10-07','2019-11-11' ,117,'check please','Resolved'),

('money deducted twice',3,'2019-11-02','2019-11-30' ,118,'check please','Resolved'),

('money deducted twice',5,'2020-03-14',NULL ,120,'check please','pending'),

('request credit card ',9,'2020-03-18',NULL ,111,'awaiting','peding'),

('request checkbook ',10,'2020-03-20',null ,112,'Asap','peding');
----------------------------
--Inserting into LoanAccount
INSERT INTO [dbo].[LoanAccount]
           ([Type]
           ,[InterestRate]
           ,[Tenure]
           ,[MoratoriumPeriod]
           ,[SanctionedDate]
           ,[SanctionedAmount]
           ,[OutstandingAmount]
           ,[EMIAmount]
           ,[EMIDate]
           ,[Due]
           ,[Collateral]
           ,[CustomerID]
           ,[EmployeeId])
     VALUES
           ('House Loan'
           ,08.12
           ,12
           ,10
           ,'2020-02-01'
           ,20000.00
           ,15000.00
           ,325.00
           ,'2020-05-01'
           ,'2023-02-01'
           ,'gold'
           ,11
           ,111),
('car loan',11.2,22,4,'2019-12-21',20032.00,15430.00,501.10,'2020-01-01','2023-02-01','shares',2,112),

('house loan',10.22,10,5,'2019-12-30',567032.00,25420.10,671.00,'2020-03-01','2024-02-11','shares',3,111),

('car loan',11.2,32,6,'2019-12-06',521032.00,11430.00,701.10,'2020-04-01','2025-12-07','gold',1,111),

('house loan',12.12,12,3,'2020-02-11',88932.10,1090.00,1201.10,'2020-05-01','2023-04-03','property',9,116),

('education loan',07.22,24,7,'2020-02-19',200012.00,65430.00,802.90,'2020-06-02','2024-02-01','mutal funds',10,115),
('education loan',11.2,22,4,'2019-11-21',926742.00,5430.60,761.10,'2020-01-02','2023-12-01','shares',7,118),

('education loan',09.11,32,6,'2020-03-14',776742.00,8487.60,876.10,'2020-04-02','2026-10-10','gold',4,120),

('car loan',13.21,13,3,'2020-03-18',3456112.32,3456.87,345.11,'2020-05-01','2025-10-14','mutal funds',6,113),

('car loan',13.21,13,3,'2020-03-18',3456112.32,3456.87,345.11,'2020-05-04','2025-10-14','mutal funds',5,119),

('house loan',11.33,12,7,'2020-03-17',444456.12,30000.34,321.10,'2020-04-07','2022-10-31','gold',8,119);

----------------------
--Inserting into Insurance
INSERT INTO [dbo].[Insurance]
           ([Amount]
           ,[Term]
           ,[PremiumAmount]
           ,[EmployeeId]
           ,[Description]
           ,[CustomerID]
           ,[StartDate]
           ,[MaturityDate])
     VALUES
           (10000.00
           ,12
           ,200.50
           ,111
           ,'Car Insurance'
           ,1
           ,'2020-04-01'
           ,'2021-12-02'),
(1232345.10,22,2030.20,112,'Car Insurance',2,'2020-02-04','2022-02-22'),
(45672.11,32,3232.21,113,'house Insurance',3,'2020-02-14','2023-12-24'),
(54562.00,21,1001.02,114,'house Insurance',4,'2020-02-21','2023-11-19'),
(478700.17,30,7766.01,115,'house Insurance',5,'2020-03-28','2023-10-25'),
(54545.87,23,5648.81,116,'life Insurance',6,'2020-03-14','2023-09-15'),
(69805.07,13,3323.02,117,'life Insurance',7,'2020-03-11','2023-09-29'),
(213123.00,19,32999.03,118,'life Insurance',8,'2020-03-04','2023-09-01'),
(457211.10,18,90999.12,119,'health Insurance',9,'2020-03-25','2023-09-11'),
(865839.22,28,90321.21,120,'health Insurance',10,'2020-03-12','2023-10-29');
--------------------------------------
-- Inserting into Account by using Procedure Create_Acount
--@accountNO should be initialized as a scalar variable each time you insert into the table
declare @AccNo numeric(10,0)
Exec Create_Account 1,7654323462,898,'Provident Fund','Y',100001,'C','X1234',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 1,211178006,323,'Provident Fund','Y', 100001,'D','X1234',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 3,311178006,323,'Provident Fund','N', 100004,'C','AbC@258',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 4,456117857,323,'Provident Fund','Y', 100001,'D','xyzlpq',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 4,456345811,323,'Provident Fund','N', 100001,'C','abyufd',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 7,888345810,323,'Provident Fund','Y', 100003,'D','password',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 7,888345840,323,'Provident Fund','Y', 100003,'C','password',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 5,812343810,323,'Provident Fund','N',100006,'C','safdsayfcg',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 5,812343910,323,'Provident Fund','Y',100006,'D','safdsayfcg',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 10,776793821,323,'Provident Fund','Y',100002,'D','tartsew',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 10,66793821,323,'Provident Fund','N',100002,'C','dgfewygf',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 9,126793789,323,'Provident Fund','N', 100010,'C','drastic',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 9,126823789,323,'Provident Fund','N', 100010,'D','koaifrfu',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 11,657937891,323,'Provident Fund','N',100007, 'C','godzilla',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 11,657227891,323,'Provident Fund','Y',100007, 'D','godzilla26',@AccNo output
print concat('Your Account No is',@AccNo)

Exec Create_Account 2,211178154,323,'Provident Fund','Y', 100008,'D','Interest@234',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 2,32278154,323,'Provident Fund','Y', 100008,'C','Interest@234',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 6,711162154,323,'Provident Fund','Y', 100010,'D','Gamer123',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 6,102378154,323,'Provident Fund','N', 100010,'C','Int@2987',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 8,402378154,323,'Personal Fund','N', 100001,'C','fraud',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 12,784378154,323,'Personal Fund','N', 100007,'D','Strong Password',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 13,402000154,453,'Personal Fund','N', 100001,'C','pass@245',@AccNo output
print concat('Your Account No is',@AccNo)
Exec Create_Account 13,587378154,323,'Personal Fund','N', 100001,'D','fraud',@AccNo output
print concat('Your Account No is',@AccNo)

-----------------------------
--Inserting into CardDetails Table using procedure CreateCard

exec Create_Card 4000000001,'2024-9-1',321,'Saheb S','Active',20.21,10.00,'D','2020-04-04'
exec Create_Card 4000000002,'2022-12-21',453,'Saheb S','Active',15,20.00,'C','2020-04-09'
exec Create_Card 4000000003,'2022-12-21',575,'Brad Duo','Active',15,20.00,'C','2020-04-09'
exec Create_Card 4000000003,'2022-12-21',595,'Brad Duo','Active',15,20.00,'D','2020-04-09'
exec Create_Card 4000000004,'2023-01-21',633,'Steve','Active',15,20.00,'C','2020-04-09'
exec Create_Card 4000000005,'2024-10-1',336,'Steve Brown','Active',15,20.00,'D','2020-04-09'
exec Create_Card 4000000007,'2024-01-1',222,'Olivia','Active',15,20.00,'D','2020-04-09'
exec Create_Card 4000000007,'2023-10-15',485,'Olivia','Active',15,20.00,'C','2020-04-02'
exec Create_Card 4000000008,'2022-10-15',850,'Neil Lalit Sah','Active',15,20.00,'D','2020-04-09'
exec Create_Card 4000000008,'2022-06-22',587,'Neil Lalit Sah','Active',15,20.00,'C','2020-04-09'
exec Create_Card 4000000011,'2022-06-22',587,'Andres','Active',15,20.00,'C','2020-04-07'
exec Create_Card 4000000011,'2022-06-22',659,'Andres','Active',15,20.00,'D','2020-04-07'
exec Create_Card 4000000012,'2024-03-02',777,'Sergio','Active',15,20.00,'D','2020-04-07'
exec Create_Card 4000000012,'2024-03-02',778,'Sergio','Active',15,20.00,'C','2020-05-07'
exec Create_Card 4000000012,'2024-03-02',778,'Sergio','Active',15,20.00,'D','2020-05-07'
exec Create_Card 4000000014,'2024-03-02',778,'Pirlo','Active',15,20.00,'C','2020-05-07'
exec Create_Card 4000000014,'2024-03-02',778,'Pirlo','Active',15,20.00,'D','2020-05-07'
exec Create_Card 4000000016,'2024-03-02',226,'Pravin','Active',15,20.00,'C','2020-05-07'
exec Create_Card 4000000016,'2024-03-02',226,'Pravin','Active',15,20.00,'D','2020-05-07'
exec Create_Card 4000000019,'2024-03-02',186,'Khan','Active',15,20.00,'C','2020-05-07'
exec Create_Card 4000000019,'2024-03-02',186,'Khan','Active',15,20.00,'D','2020-05-07'
exec Create_Card 4000000021,'2024-03-02',186,'Ajith','Active',15,20.00,'C','2020-05-07'
exec Create_Card 4000000022,'2024-03-02',186,'Nila','Active',15,20.00,'D','2020-05-07'
exec Create_Card 4000000022,'2024-03-02',186,'Nila','Active',15,20.00,'C','2020-05-07'

--Inserting into Transaction which invokes the trigger
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000001,CURRENT_TIMESTAMP,'Initial Deposit','Credit',15,null,'Counter','N');
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000002,CURRENT_TIMESTAMP,'Initial Deposit','Credit',35,null,'Counter','N');
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000003,CURRENT_TIMESTAMP,'Initial Deposit','Credit',16,null,'Counter','N');
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000004,CURRENT_TIMESTAMP,'Initial Deposit','Credit',35,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000005,CURRENT_TIMESTAMP,'Initial Deposit','Credit',60,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000006,CURRENT_TIMESTAMP,'Initial Deposit','Credit',25,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000007,CURRENT_TIMESTAMP,'Initial Deposit','Credit',30,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000008,CURRENT_TIMESTAMP,'Initial Deposit','Credit',70,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000009,CURRENT_TIMESTAMP,'Initial Deposit','Credit',32,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000010,CURRENT_TIMESTAMP,'Initial Deposit','Credit',140,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000011,CURRENT_TIMESTAMP,'Initial Deposit','Credit',1600,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000012,CURRENT_TIMESTAMP,'Initial Deposit','Credit',705,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000013,CURRENT_TIMESTAMP,'Initial Deposit','Credit',1500,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000014,CURRENT_TIMESTAMP,'Initial Deposit','Credit',350,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000015,CURRENT_TIMESTAMP,'Initial Deposit','Credit',35,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000016,CURRENT_TIMESTAMP,'Initial Deposit','Credit',500,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000017,CURRENT_TIMESTAMP,'Initial Deposit','Credit',225,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000018,CURRENT_TIMESTAMP,'Initial Deposit','Credit',150,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000019,CURRENT_TIMESTAMP,'Initial Deposit','Credit',7000,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000020,CURRENT_TIMESTAMP,'Initial Deposit','Credit',355,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000021,CURRENT_TIMESTAMP,'Initial Deposit','Credit',1500,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000022,CURRENT_TIMESTAMP,'Initial Deposit','Credit',365,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000023,CURRENT_TIMESTAMP,'Initial Deposit','Credit',35,null,'Counter','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000021,CURRENT_TIMESTAMP,'Grocery','Debit',150,4000000006,'Online','N')
Insert into [Transaction] (AccountNO,[TimeStamp],[Description],[Type],Amount,BenificiaryAccount,Mode,Credit) values(4000000007,CURRENT_TIMESTAMP,'Cash','Credit',150,null,'ATM','N')


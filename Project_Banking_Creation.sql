Create database Project_Banking;
use Project_Banking;
--Creating ZipCode
create table Zip(
ZipCode varchar(6) not null,
[state] char(2) not null,
city varchar(35) not null,
Constraint ZipCode_pk primary key(ZipCode)
)
--Creating Customer

create table Customer(
CustomerID numeric(10,0) not null identity(0000000001,1),
FirstName varchar(20) not null,
MiddleName varchar(20),
LastName varchar(20) not null,
PhoneNo numeric(10,0) not null,
Gender char(1) not null,
SSN char(11) not null unique,
DateOfBirth date,
TotalNoOfAccounts int,
PassportNo varchar(20) not null unique,
EmailID varchar(30),
Street varchar(50),
ZipCode varchar(6),
CONSTRAINT CustomerID_PK PRIMARY KEY (CustomerID),
constraint chk_gender check(Gender in ('M','F','O')),
constraint chk_EmailID check(EmailID  LIKE '%@%.%'),
constraint CusZip_Fk foreign key(ZipCode) references Zip(ZipCode)
)
--Creating BranchDetails

create table BranchDetails
(
BranchCode Numeric(8) not null identity(100001,1),
[Name] nvarchar (40) not null,
SwiftCode varchar(10) not null unique,
StreetAddress varchar(35),
ZipCode varchar(6) not null,
ContactNo numeric(10),
CONSTRAINT Branchdetails_PK PRIMARY KEY (BranchCode),
Constraint BranchZip_fk Foreign Key(ZipCode) references Zip(ZipCode)
)


--Creating Employee Table

create table employee
(  
EmployeeId numeric (10) not null, 
PhoneNo numeric (10) not null,
SSN varchar(10) not null unique,
EmailId varchar(10) not null,
FirstName varchar(20) not null,
MiddleName varchar(20),
LastName varchar(20) not null,
ApprisalRating char(1),
PassportNo varchar(20)not null unique,
Gender char(1) not null,
DateOfBirth date,
BranchCode numeric(8) not null,
Position varchar(15) not null,
Salary numeric(12,2) not null,
Street   varchar(35),
ZipCode varchar(6) not null,
ManagerID numeric(10),
CONSTRAINT Employee_PK  PRIMARY KEY (EmployeeId),
Constraint EmpManagerID_FK foreign key(ManagerID) references employee(EmployeeID),
CONSTRAINT employee_FK1 FOREIGN KEY (BranchCode) references BranchDetails(BranchCode) ,
constraint chk_Empgender check(Gender in ('M','F','O')),
constraint chk_EmpEmailID check(EmailID  LIKE '%@%.%'),
constraint chkApp check(ApprisalRating in('X','C','L')),
constraint EmpZip_Fk foreign key(ZipCode) references Zip(ZipCode)
);
Alter table employee alter column EmailID varchar(30);

--Creating Account
create table Account
( 
AccountNo numeric(10) not null identity(4000000001,1), 
CustomerID numeric(10,0),
RoutingNumber numeric(10) not null,
SchemeCode numeric(3) not null,
SchemeName varchar(35),
OpeningDate date not null,
ClosingDate date,
Balance numeric(12,2) not null default(0.00),
CheckAllowed char(1) not null,
BranchCode numeric(8),
LastTransactionDate date,
LastChangeTime datetime,
AccountType char(1) not null,
CONSTRAINT Account_PK  PRIMARY KEY (AccountNo),
CONSTRAINT AccCusID_FK FOREIGN KEY (CustomerID) references Customer(CustomerID),
CONSTRAINT AccBranch_FK FOREIGN KEY (BranchCode) references BranchDetails(BranchCode),
CONSTRAINT CheckAllowed_chk check(CheckAllowed in('Y','N')),
CONSTRAINT AccountType_chk check(AccountType in('D','C'))
);
alter table Account add constraint RN_unique unique(RoutingNumber);
Alter table Account add [password] varbinary(600);
--ENCRYPTION
--Master Key
create MASTER KEY ENCRYPTION BY PASSWORD = 'pass';
CREATE CERTIFICATE AccPass  WITH SUBJECT = 'Account Password';  
-- Creating Symmetric Key
 CREATE SYMMETRIC KEY AccPass_SM WITH ALGORITHM = AES_256  ENCRYPTION BY CERTIFICATE AccPass;  

 --Creating Savings
create table Savings(
SavingsAccountNUmber numeric(10) not null,
AnnualInterest numeric(4,2) not null,
MaximumTransactions int,
CONSTRAINT AccNum_FK foreign key(SavingsAccountNumber) references Account(AccountNo));
--Creating Checking
create table Checking(
CheckingAccountNumber numeric(10) not null,
CardNo numeric(16) 
CONSTRAINT CAccNum_FK foreign key(CheckingAccountNumber) references Account(AccountNo));
--Creating Transaction
create table [Transaction]
(
TransactionID int not null identity(1,1),
AccountNO numeric(10) not null,
[TimeStamp] datetime,
[Description] varchar(30),
[Type] varchar(6) not null,
Amount numeric(12,2),
BenificiaryAccount numeric(10),
Mode varchar(10) not null,
CONSTRAINT Transaction_PK  PRIMARY KEY (TransactionID),
CONSTRAINT  TransactionID FOREIGN KEY (AccountNo) references Account(AccountNo),
Constraint Type_chk check([Type] in ('Debit','Credit')),
Constraint Mode_chk check(Mode in ('Online','Counter','ATM')),
)
Alter table [Transaction] add Credit char(1) not null;
Alter table [Transaction] add Constraint Credit_chk check(Credit in('Y','N'));
--Creating CardDetails
create table CardDetails(
CardNO numeric(16) not null identity(5544000000000001,1),
AccountNo numeric(10,0),
ExpiryDate date,
CVV numeric(3),
[Name] nvarchar(20),
[Status] varchar(20),
IssuanceCharge numeric(20),
AnnualCharge numeric(10),
CardType char(1),
CONSTRAINT CardDetails_PK PRIMARY KEY (CardNO),
CONSTRAINT  CardDetails_FK FOREIGN KEY (AccountNo) references Account(AccountNo),
Constraint CardType_chk check(CardType in ('D','C')),
Constraint  Status_chk check([Status] in ('Active','InActive'))
)

--Creating Debit
Create Table Debit(
DCardNo numeric(16) not null,
WithDrawalLimit numeric(7,2),
Constraint Dcard_Fk foreign key(DCardNo) references CardDetails(CardNo)
)
--Creating Credit
create table Credit(
CreditCardNo numeric(16,0) not null,
AvailableLimit numeric(10,2),
TotalCreditLimit numeric(10,2),
AnnualPercentageRate numeric(5,2),
StatementDate date,
MinimumAmountDue numeric(10,2),
TotalAmountDue numeric(10,2),
constraint Credit_PK primary key (CreditCardNo),
constraint Credit_Card_FK foreign key(CreditCardNo) references CardDetails(CardNO))


--Creating LoanAccount
create table LoanAccount (
LoanID numeric(10,0) not null identity(2000000000,1),
[Type] varchar(20),
InterestRate numeric(5,2) not null,
Tenure numeric(3,0) not null, -- in months
MoratoriumPeriod numeric(3,0), -- in months
SanctionedDate date not null ,
SanctionedAmount numeric(10,2) not null,
OutstandingAmount numeric(10,2) not null, --- balance due
EMIAmount numeric(10,2) not null,
EMIDate date not null,
Due date not null,
Collateral varchar(30),
CustomerID numeric(10,0),
EmployeeId numeric(10,0),
CONSTRAINT LoanAccount_PK  PRIMARY KEY (LoanID),
CONSTRAINT LoanAccount_Customer_FK FOREIGN KEY (CustomerID) references Customer(CustomerID), 
CONSTRAINT LoanAccount_Employee_FK FOREIGN KEY (employeeID) references Employee(employeeID)
)

Create table Support (
SupportID numeric(10) not null identity(4000000000,1),
Description varchar(30) not null,
CustomerID numeric(10),
OpenDate date not null,
ClosedDate date,
EmployeeID numeric (10),
CustomerFeedback varchar(40),
EmployeeFeedback varchar(40),
CONSTRAINT Support_PK  PRIMARY KEY (SupportID),
CONSTRAINT Support_Customer_FK FOREIGN KEY (CustomerID) references Customer(CustomerID), 
CONSTRAINT Support_Employee_FK FOREIGN KEY (employeeID) references Employee(employeeID)
);


Create table Insurance (
InsuranceID numeric(10,0) not null identity(3000000000,1),
Amount numeric(10,2) not null,
Term numeric(5,0) not null, ---months
PremiumAmount numeric(8,2) not null,
EmployeeId numeric (10,0),
[Description] varchar(30),
CustomerID numeric(10,0),
StartDate date not null,
MaturityDate date not null,
CONSTRAINT Insurance_PK  PRIMARY KEY (InsuranceID),
CONSTRAINT Insurance_Customer_FK FOREIGN KEY(CustomerID) references Customer(CustomerID), 
CONSTRAINT Insurance_employee_FK FOREIGN KEY (employeeID) references Employee(employeeID)
)

--PROCEDURES--

--Procedure 1 Creating Customers 
--Used to insert the valuesinto the Customer Table
Create Procedure Create_Customer @FName varchar(20),
								 @MName varchar(20),
								 @Lname varchar(20),
								 @PhnNo numeric(10,0),
								 @Gender char(1),
								 @SSN char(11),
								 @DOB date,
								 @PassportNo varchar(20),
								 @EmailID varchar(30),
								 @Street varchar(50),
								 @Zip varchar(6),
								 @CustId numeric(10,0)  output
As
Begin
	Insert into Customer(FirstName,
						MiddleName,
						LastName,
						PhoneNo,
						Gender,
						SSN,
						DateOfBirth,
						TotalNoOfAccounts,
						PassportNo,
						EmailID,
						Street,
						ZipCode) values (@FName,@MName,@LName,@PhnNo,@Gender,@SSN,@DOB,0,@PassportNo,@EmailID,@Street,@Zip)
	select @CustID=CustomerID from Customer where SSN=@SSN
End

--Creating Procedure For Account
--Used to Create Account if the account type choosen is Savings Savings table gets populated with the account number same for Checkings
--Here 'D' is used for Savings and 'C' for Checking
Create Procedure Create_Account @CustomerID numeric(10,0),
								@Rnumber numeric(10,0),
								@SchemeCode numeric(3,0),
								@SchemeName varchar(35),
								@CheckAllowed char(1),
								@BranchCode numeric(8,0),
								@AccountType char(1),
								@password varchar(60),
								@AccountNo numeric(10,0) output
As
	if(@CustomerID not in (select CustomerID from Customer))
		begin
			print 'Create CustomerID to create an Account'
		END
	else
		begin
			OPEN SYMMETRIC KEY AccPass_SM  
			 DECRYPTION BY CERTIFICATE AccPass; 
			 
			insert into Account(CustomerID,RoutingNumber,SchemeCode,SchemeName,OpeningDate,Balance,CheckAllowed,BranchCode,AccountType,[password]) values
								(@CustomerID,@Rnumber,@SchemeCode,@SchemeName,getdate(),0,@CheckAllowed,@BranchCode,@AccountType,EncryptByKey((select Key_GUID('AccPass_SM')),  convert(varbinary(600),@password)))
			update Customer set TotalNoOfAccounts=TotalNoOfAccounts+1 where CustomerID=@CustomerID
			
		end
	
	select @AccountNo=AccountNo from Account where RoutingNumber=@Rnumber
	if(@AccountType='D')
		begin
			Insert into Savings(SavingsAccountNUmber,AnnualInterest,MaximumTransactions) values(@AccountNo,9,6)
		end
	else
		begin
			Insert into Checking(CheckingAccountNumber) values(@AccountNo)
		end

	print 'If you need card create card'
--Procedure 3
--Creating Procedure for Creating Card
--Used to insert values into the CardDetails if Credit card is choosen the data gets populated into the Credit table and same for Debit
create procedure Create_Card @AccountNo numeric(10,0),
							 @ExpiryDate date,
							 @CVV numeric(3,0),
							 @Name nvarchar(20),
							 @Status varchar(20),
							 @IssuanceCharge numeric(20,0),
							 @AnnualCharge numeric(10,0),
							 @CardType char(1),
							 @StatementDate date
As
	if(@AccountNo not in (select AccountNo from Account))
		begin
			print 'Create Account'
		end
	else
		begin
			Insert into CardDetails(AccountNo,ExpiryDate,CVV,[Name],[Status],IssuanceCharge,AnnualCharge,CardType)
						values(@AccountNo,@ExpiryDate,@CVV,@Name,@Status,@IssuanceCharge,@AnnualCharge,@CardType)
		end
	declare @CardNo numeric(16,0)
	select @CardNo=CardNo from CardDetails where AccountNo=@AccountNo and CardType=@CardType
	if(@CardType='D')
		begin
			insert into Debit values(@CardNo,1000)
			update Checking set CardNo=@CardNO where CheckingAccountNumber=@AccountNo
		end
	else
		begin
			insert into Credit values(@CardNo,1000,1000,30,@StatementDate,0 ,0) 
		end

--Procedure 4
--To get user name password of user
--To get the credentials of the user with decrypted data
Create procedure Get_Credentials @AccountNo numeric(10,0)
	As
		Begin
			declare @Type char(1)
			select @Type=AccountType from Account where AccountNo=@AccountNo;
			OPEN SYMMETRIC KEY AccPass_SM DECRYPTION BY CERTIFICATE AccPass; 
			if(@Type='D')
			 begin
			    SELECT CustomerID,CONVERT(varchar, DecryptByKey([Password]))  AS 'Password','Savings' as Type_Of_Account from Account where AccountNo=@AccountNo
			 end
			else
				begin
					SELECT CustomerID,CONVERT(varchar, DecryptByKey([Password]))  AS 'Password','Checking' as Type_Of_Account from Account where AccountNo=@AccountNo
				end
		END
	
--Procedure 5
--To make transactions with credit card
--It is executed by the trigger transaction and if credit is populated as 'Y'
create procedure Credit_Transaction @CardNo numeric(16,0),
									@Amount numeric(10,2),
									@Type varchar(6)
As
	Begin
		if (@Type='Debit')
			begin
				update Credit set AvailableLimit=AvailableLimit-@Amount,MinimumAmountDue=(TotalAmountDue+@Amount)*0.25,TotalAmountDue=TotalAmountDue+@Amount where CreditCardNo=@CardNo;
			end
		else
			begin
				Declare @TotalAmountDue numeric(10,2)
				select @TotalAmountDue=TotalAmountDue from Credit where CreditCardNo=@CardNo
				if(@TotalAmountDue-@Amount>0)
					begin
						update Credit set AvailableLimit=AvailableLimit+@Amount,MinimumAmountDue=(@TotalAmountDue-@Amount)*0.25,TotalAmountDue=@TotalAmountDue-@Amount where CreditCardNo=@CardNo
					end
				else
					begin
						update Credit set AvailableLimit=AvailableLimit+@Amount,MinimumAmountDue=0,TotalAmountDue=@TotalAmountDue-@Amount where CreditCardNo=@CardNo
					end
			end
	END
--Procedure 6
--Other Transactions
--is called by Trigger when the credit is choosen as 'N'
Create procedure Other_Transactions @AccountNo numeric(10,0),
									@BenAccount numeric(10,0),
									@Type varchar(6),
									@amount numeric(12,2)
As
	Begin
		if(@Type='Debit')
			begin
				update Account set Balance=Balance-@amount,LastTransactionDate=GETDATE() where AccountNo=@AccountNo
				update Account set Balance=Balance+@amount,LastTransactionDate=GETDATE() where AccountNo=@BenAccount
			end
		else
			begin	
				update Account set Balance=Balance+@amount,LastTransactionDate=GETDATE() where AccountNo=@AccountNo
				update Account set Balance=Balance-@amount,LastTransactionDate=GETDATE() where AccountNo=@BenAccount
			end
	end

-- TRIGGER
--Invokes as soon as a row is inserted in the Transaction and makes the changes in thee account table for the transacted amount
create Trigger Make_Transaction on [transaction]
After Insert
As Begin
		declare @AccountNo numeric(10,0)
		declare @BenAccountNo numeric(10,0)
		declare @Type varchar(6)
		declare @Credit char(1)
		declare @Amount numeric(12,2)
		declare @CardNo numeric(16,0)
		declare @mode varchar(10)
		select @AccountNo=AccountNo,@BenAccountNo=BenificiaryAccount,@Type=[Type],@Credit=Credit,@Amount=Amount,@mode=Mode from [Transaction]
		select @CardNo=C.CreditCardNo from Credit C join CardDetails A on A.CardNo=C.CreditCardNo where A.AccountNo=@AccountNo;
		If(@Credit='Y')
			begin
				exec Credit_Transaction  @CardNo,@Amount,@Type
			end
		else
			begin
				if(@mode='ATM' and @Amount>1000)
					begin
						print 'Exceeds Witdrawl Limit'
					end
				else
					begin  
						exec Other_Transactions @AccountNo,@BenAccountNo,@Type,@Amount
					end
			end
	end

-- Views
 -----------Views for reporting purposes--------------------------------------

 ---- LOAN Amount Details Versus City
create view LoanVersusCity as select ZP.city as "City", 
 sum(LA.OutstandingAmount) as"Outstanding Amount Across USA",
 sum(LA.SanctionedAmount) as "Total Disbursed Amount"
  from LoanAccount LA, Zip ZP,Customer C
  where C.CustomerID = LA.CustomerID and ZP.ZipCode=C.ZipCode 
  group by ZP.city;

  select * from LoanVersusCity;

  
 --- select * from LoanVersusCity;

 ----  Credit Amount details versus State---------
  create view CreditVersusState as 
select ZP.[State], sum(CD.TotalCreditLimit) as"Total Sanctioned Amount Across USA",
 sum(CD.TotalCreditLimit-CD.AvailableLimit) as "Total Usuage Amount"
  from Credit CD, Zip ZP,Customer C, CardDetails CDetails,Account A
  where  C.ZipCode =ZP.ZipCode and  CDetails.CardNO =CD.CreditCardNo and  A.CustomerID =C.CustomerID 
  and CDetails.AccountNo=A.AccountNo
  group by zp.[State];

  select * from CreditVersusState;

    ---------------------------------------------------------------------------------------------------------
   

  --------- Total  deposit Amount(Savings and Checking Account) Versus BranchCode ---------------
  create view  MoneyVersusBranch as 
  select sum(AC.Balance) as "Deposits",BD.BranchCode from BranchDetails BD, Account AC
  where AC.BranchCode = BD.BranchCode
  group by BD.BranchCode

 -- select * from MoneyVersusBranch

   ------------------------------------------------------------------------------------------------------------
 
  ---------- Number of Insurance accounts opened by Employeee  --------
  create view InsuranceAccountsVersusEmployee as 
  select count(I.InsuranceID) as "Number of Insurance Accounts", E.EmployeeId from Insurance I , employee E
  where I.EmployeeId =E.EmployeeId 
  group by E.EmployeeId

   create view InsuranceAccountVersusMonth as 
 select count(I.InsuranceID) as " Number of Insurance Accounts", MONTH(StartDate) as "Month_Name"
  from Insurance I
  group by MONTH(StartDate);

  ----------- Number of support tickets resolved by an Eemployee ----------------------

  Create view SupportVersusEmployee as 
  select count(S.SupportID) as Number_of_tickets,E.EmployeeId from Support S, employee E  
  where s.EmployeeID = E.EmployeeId and S.ClosedDate is not null
  group by E.EmployeeId;


  ---- To view customer details 
create view Customer_Details as 
select C.FirstName + ' ' + ISNULL(C.MiddleName,'') + ' ' + C.LastName as "Full Name" , 
C.CustomerID,
AC.AccountNo,
AC.RoutingNumber,
AC.AccountType,
DATEDIFF (day,AC.OpeningDate, AC.ClosingDate) as "Number Of days account is opened" ,
AC.Balance,
BD.[Name] as "Branch Name",
BD.SwiftCode,
LEFT(CD.CardNO,4 ) + '************' + RIGHT(CD.CardNO,4 ) as " Card NO ",
CD.[Status] as "Card Status",
IC.InsuranceID,
IC.Amount,
IC.PremiumAmount,
IC.MaturityDate,
LA.LoanID,
LA.OutstandingAmount,
LA.Due,LA.EMIAmount,
LA.EMIDate,
St.SupportID,
St.OpenDate,
St.ClosedDate,
ZP.City,
ZP.[State]
from
 Account AC ,BranchDetails BD, CardDetails CD,Customer C , Insurance IC , LoanAccount LA,Support St,Zip ZP 
 where AC.CustomerID = C.CustomerID and AC.BranchCode = BD.BranchCode and LA.CustomerID = C.CustomerID and St.CustomerID = C.CustomerID and
 CD.AccountNo = AC.AccountNo and
 IC.CustomerID = C.CustomerID and 
 ZP.ZipCode = C.ZipCode;

 --Non CLustered Indices

 ---customer

create nonclustered index idx_cust_phone on Customer(PhoneNo);

create nonclustered index idx_cust_lastname on Customer(LastName);

--- drop index idx_cust_emailid on Customer;

create nonclustered index idx_cust_emailid on Customer(EmailID);
---branch
create nonclustered index idx_BranchDetails_ContactNo on BranchDetails(ContactNo);

---employee
create nonclustered index idx_emp_phone on Employee(PhoneNo);

create nonclustered index idx_emp_lastname on Employee(LastName);

create nonclustered index idx_emp_emailid on Employee(EmailID);
---support
create nonclustered index idx_support_opendate on Support(OpenDate);


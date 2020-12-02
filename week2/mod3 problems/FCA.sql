DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Facility ;
DROP TABLE IF EXISTS Location ;
DROP TABLE IF EXISTS Employee ;
DROP TABLE IF EXISTS ResourceTbl; 
DROP TABLE IF EXISTS EventRequest; 
DROP TABLE IF EXISTS EventPlan ;
DROP TABLE IF EXISTS EventPlanLine; 



---------------------Customer Table Definition----------------------

CREATE TABLE Customer(
	CustNo		varchar(8)			not null,
	CustName	varchar(50)			not null,
	Address		varchar(50)			not null,
	Internal	char(1)				not null,
	phone		integer				not null,
	Contact		varchar(50)			not null,
	City		varchar(50)			not null,
	State		varchar(24)			not null,
	Zip			integer				not null,
	CONSTRAINT		CustomerPK PRIMARY KEY(CustNo)



);


------------------- Facility Table Definition ----------------
CREATE TABLE Facility(
	FacNo		varchar(8)			not null,
	FacName		varchar(50)		not null,
	
	CONSTRAINT FacNameUn UNIQUE (FacName),
	CONSTRAINT FacilityPK   PRIMARY KEY(FacNo)

);

-------------------------- Location Table Definition ---------------
CREATE TABLE Location(
	
	LocNo		varchar(8)			not null,
	FacNo		varchar(8)			not null,
	LocName		varchar(50)			not null,
	
	CONSTRAINT LocationPk PRIMARY KEY(LocNo),
	CONSTRAINT FacNoFK	FOREIGN KEY(FacNo) REFERENCES Facility ON DELETE CASCADE
	
);

------ Employee Table --------------------------
CREATE TABLE Employee(
	EmpNo			varchar(8)			not null,
	EmpName			varchar(50)			not null,
	Department		varchar(50)			not null,
	Email			varchar(50)			not null,
	Phone			varchar(8)			not null,
	
	CONSTRAINT 		EmployeePK 	PRIMARY KEY(EmpNo)


);


-------------------------ResourceTbl  Table --------------------------
CREATE TABLE ResourceTbl(
	ResNo			varchar(8)			not null,
	ResName			varchar(50)			not null,
	Rate			decimal(5,2)				not null,
	
	CONSTRAINT		ResourceTblPK		PRIMARY KEY(ResNo),
	CONSTRAINT		ResourceRateValue	CHECK( Rate > 0)


);

------------------------- Event Request Table ---------------
CREATE TABLE EventRequest(
	EventNo			varchar(8)			not null,
	DateHeld		date				not null,
	DateReq			date				not null,
	FacNo			varchar(8)			not null,
	CustNo			varchar(8)			not null,
	DateAuth		date				,
	Status			varchar(8)			not null,
	EstCost			decimal(8,2)				not null,
	EstAudience		integer				not null,
	BudNo			varchar(8)			,
	
	CONSTRAINT		EventRequestPK		PRIMARY KEY(EventNo),
	CONSTRAINT		CustomerFK			FOREIGN KEY(CustNo) REFERENCES Customer ON DELETE CASCADE,
	CONSTRAINT		FacilityFK			FOREIGN KEY(FacNo) REFERENCES Facility ON DELETE CASCADE,
	CONSTRAINT		EventStatus			CHECK (Status IN ('Pending','Denied','Approved')),
	CONSTRAINT		EventRequestEstAudienceValue	CHECK( EstAudience > 0)
);

----------Event	Plan Table--------
CREATE TABLE EventPlan(
	PlanNo			varchar(8)			not null,
	EventNo			varchar(8)			not null,
	Workdate		date				not null,
	Notes			varchar(50)			,
	Activity		varchar(50)			not null,
	EmpNo			varchar(8)			,
	
	CONSTRAINT	EventPlanPK PRIMARY KEY(PlanNo),
	
	CONSTRAINT	EventFK		FOREIGN KEY(EventNo)
	REFERENCES	EventRequest ON DELETE CASCADE,
	
	CONSTRAINT	EmployeeFK	FOREIGN KEY(EmpNo)
	REFERENCES Employee ON DELETE CASCADE


);
-----------------------Event Plan Line Table-----
CREATE TABLE EventPlanLine(
	PlanNo			varchar(8)			not null,
	LineNo			integer				not null,
	TimeStart		timestamp			not null,
	TimeEnd			timestamp			not null,
	NumberFld		integer				not null,
	LocNo			varchar(8)			not null,
	ResNo			varchar(8)			not null,
	
	CONSTRAINT		EventPlanLinePK		PRIMARY KEY(PlanNo,LineNo),
	CONSTRAINT		PlanFK				FOREIGN KEY(PlanNo)		REFERENCES EventPlan ON DELETE CASCADE,
	CONSTRAINT		LocationFK				FOREIGN KEY(LocNo)		REFERENCES Location ON DELETE CASCADE,
	CONSTRAINT		RessourceTblFK				FOREIGN KEY(ResNo)		REFERENCES ResourceTbl ON DELETE CASCADE,
	CONSTRAINT		ValidStartEndTime		CHECK(TimeStart < TimeEnd)


);
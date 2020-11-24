DROP TABLE IF EXISTS Customer
DROP TABLE IF EXISTS Facility 




---------------------Customer Table Definition----------------------

CREATE TABLE Customer(
	CustNo		varchar(8)			not null,
	CustName	varchar(50)			not null,
	CustAddress		varchar(50)			not null,
	CustInternal	char(1)				not null,
	Custphone		integer				not null,
	CustContact		varchar(50)			not null,
	CustCity		varchar(50)			not null,
	CustState		varchar(24)			not null,
	CustZip			integer				not null,
	CONSTANT		CustomerPK PRIMARY KEY(CustNo)



);


------------------- Facility Table Definition ----------------
CREATE TABLE Facility(
	FacNo		varchar(6)			not null,
	FacName		varchar(50)		not null,
	
	CONSTRAINTS FacNameUn UNIQUE FacName,
	CONSTANT FacilityPK   PRIMARY KEY(FacNo)

);

-------------------------- Location Table Definition ---------------
CREATE TABLE Location(
	
	LocNo		varchar(6)			not null,
	FacNo		varchar(6)			not null,
	LocName		varchar(50)			not null,
	
	CONSTANT LocationPk PRIMARY KEY(LocNo),
	CONSTRAINTS FacNoFK	FOREIGN KEY(FacNo) REFERENCES Facility,
	
);















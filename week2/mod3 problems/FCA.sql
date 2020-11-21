DROP TABLE IF EXISTS Customer
DROP TABLE IF EXISTS Facility 




---------------------Customer Table Definition----------------------

CREATE TABLE Customer(
	CustNo		varchar(8)			not null,
	CustName	varchar(50)			not null,
	Address		varchar(50)			not null,
	Internal	char(1)				not null,
	phone		integer				not null,
	Contact		varchar



);


------------------- Facility Table Definition ----------------
CREATE TABLE Facility(
	FacNo		varchar(6)			not null,
	FacName		varchar(50)		not null,
	
	CONSTANT FacilityPK   PRIMARY KEY(FacNo)

);
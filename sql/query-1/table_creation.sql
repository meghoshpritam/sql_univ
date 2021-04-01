-- Chereate S table
CREATE TABLE S
(
	S varchar(255) NOT NULL,
	SNAME varchar(255) NOT NULL,
	STATUS int NOT NULL,
	CITY varchar(100) NOT NULL,
	PRIMARY KEY (S)
);
DESC S;

-- Create P table
CREATE TABLE P
(
	P varchar(255) NOT NULL,
	PNAME varchar(255) NOT NULL,
	COLOR varchar(50) NOT NULL,
  	WT int NOT NULL,
	CITY varchar(100) NOT NULL,
	PRIMARY KEY (P)
);
DESC P;

-- Create SP table
CREATE TABLE SP
(
	S varchar(255) NOT NULL,
	P varchar(255) NOT NULL,
	QTY int NOT NULL,
	PRIMARY KEY (S, P)
);
DESC SP;

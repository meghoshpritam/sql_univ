-- create table s
CREATE TABLE S
(
	S varchar(255) NOT NULL,
	SNAME varchar(255) NOT NULL,
	STATUS int NOT NULL,
	CITY varchar(100) NOT NULL,
	PRIMARY KEY (S)
);


-- Create P table
CREATE TABLE P
(
	P varchar(255) NOT NULL,
	PNAME varchar(255) NOT NULL,
	COLOR varchar(50) NOT NULL,
  	WEIGHT float(2) NOT NULL,
	CITY varchar(100) NOT NULL,
	PRIMARY KEY (P)
);


-- Create J table
CREATE TABLE J
(
	J varchar(255) NOT NULL,
	JNAME varchar(255) NOT NULL,
	CITY varchar(100) NOT NULL,
	PRIMARY KEY (J)
);


-- Create SPJ table
CREATE TABLE SPJ
(
	S varchar(255) NOT NULL,
	P varchar(255) NOT NULL,
	J varchar(255) NOT NULL,
  	QTY int NOT NULL,
	PRIMARY KEY (S, P, J),
  	FOREIGN KEY (S) REFERENCES S(S),
  	FOREIGN KEY (P) REFERENCES P(P),
  	FOREIGN KEY (J) REFERENCES J(J)
);


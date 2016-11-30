CREATE TABLE Loan (
	loanid SERIAL,
	amount NUMERIC,
	PRIMARY KEY(loanid)
);

CREATE TABLE Branch (
	name VARCHAR(30), 
	city VARCHAR(30),
	asset NUMERIC,
	PRIMARY KEY(name)
);

CREATE TABLE Account (
	account SERIAL,
	amount NUMERIC,
	PRIMARY KEY(account)
);

CREATE TABLE Customer (
	cid SERIAL,
	pass VARCHAR(20),
	lname VARCHAR(20),
	fname VARCHAR(20),
	address VARCHAR(50),
	city VARCHAR(20),
	phone VARCHAR(20),
	email VARCHAR(50),
	best_time VARCHAR(20),
	PRIMARY KEY(cid)
);

CREATE TABLE Employee (
	eid SERIAL,
	pass VARCHAR(20),
	fname VARCHAR(20),
	lname VARCHAR(20),
	phone VARCHAR(20),
	sdate DATE,
	PRIMARY KEY(eid)
);



CREATE TABLE Payee (
	pid SERIAL,
	payee VARCHAR(50),
	PRIMARY KEY(pid)
);

CREATE TABLE Mgr (
	supervisee_eid INTEGER,
	supervisor_eid INTEGER,
	PRIMARY KEY (supervisee_eid, supervisor_eid),
	FOREIGN KEY (supervisor_eid) REFERENCES Employee(eid),
	FOREIGN KEY (supervisee_eid) REFERENCES Employee(eid)
);

CREATE TABLE Activity (
	activity_id SERIAL,
	descr VARCHAR(100),
	account INTEGER,
	cid INTEGER,
	date DATE,
	rem_bal REAL,
	amount NUMERIC,
	PRIMARY KEY(activity_id),
	FOREIGN KEY(account) REFERENCES Account(account),
	FOREIGN KEY(cid) REFERENCES Customer(cid)
);

CREATE TABLE Bill (
	bid SERIAL,
	pid INTEGER,
	date DATE,
	account INTEGER,
	cid INTEGER,
	amount NUMERIC,
	PRIMARY KEY(bid),
	FOREIGN KEY(account) REFERENCES Account(account),
	FOREIGN KEY(cid) REFERENCES Customer(cid) 
		ON DELETE CASCADE
);


CREATE TABLE Customer_Payee (
	cid INTEGER,
	pid INTEGER,
	cpdate DATE,
	PRIMARY KEY(cid,pid),
	FOREIGN KEY(cid) REFERENCES Customer(cid)
		ON DELETE CASCADE,
	FOREIGN KEY(pid) REFERENCES Payee(pid)
);

CREATE TABLE Holds (
	cid INTEGER,
	account INTEGER,
	acttype SMALLINT DEFAULT 0,
	PRIMARY KEY(cid,account),
	FOREIGN KEY(account) REFERENCES Account(account) 
		ON DELETE CASCADE,
	FOREIGN KEY(cid) REFERENCES Customer(cid)
		ON DELETE CASCADE
);

CREATE TABLE Per_Banker (
	eid INTEGER,
	PRIMARY KEY(eid),
	FOREIGN KEY(eid) REFERENCES Employee(eid)
		ON DELETE CASCADE
);

CREATE TABLE Payments (
	pid INTEGER,
	loanid INTEGER,
	date DATE,
	amount NUMERIC,
	PRIMARY KEY(pid,loanid),
	FOREIGN KEY(loanid) REFERENCES Loan(loanid)
		ON DELETE CASCADE
);
CREATE TABLE Loan_Officer (
	eid INTEGER,
	PRIMARY KEY(eid),
	FOREIGN KEY(eid) REFERENCES Employee(eid)
		ON DELETE CASCADE
);

CREATE TABLE Acc_Sup (
	account INTEGER,
	cid INTEGER,
	eid INTEGER,
	PRIMARY KEY(account,cid,eid),
	FOREIGN KEY(account) REFERENCES Account(account)
			ON DELETE CASCADE,
	FOREIGN KEY(cid) REFERENCES Customer(cid)
		ON DELETE CASCADE,
	FOREIGN KEY(eid) REFERENCES Per_Banker(eid)
);

CREATE TABLE Loan_Sup (
	loanid INTEGER,
	cid INTEGER,
	eid INTEGER,
	PRIMARY KEY(loanid,cid,eid),
	FOREIGN KEY(loanid) REFERENCES Loan(loanid),
	FOREIGN KEY(cid) REFERENCES Customer(cid)
		ON DELETE CASCADE,
	FOREIGN KEY(eid) REFERENCES Loan_Officer(eid)
);

CREATE TABLE Visit (
	date DATE,
	account INTEGER,
	cid INTEGER,
	PRIMARY KEY(date,account,cid),
	FOREIGN KEY(account) REFERENCES Account(account),
	FOREIGN KEY(cid) REFERENCES Customer(cid)
);

CREATE TABLE Offers (
	name VARCHAR(20),
	loanid INTEGER,
	PRIMARY KEY(name,loanid),
	FOREIGN KEY(name) REFERENCES Branch(name),
	FOREIGN KEY(loanid) REFERENCES Loan(loanid)
);

CREATE TABLE Hosts (
	name VARCHAR(20),
	account INTEGER,
	PRIMARY KEY(name,account),
	FOREIGN KEY(name) REFERENCES Branch(name),
	FOREIGN KEY(account) REFERENCES Account(account)
);


CREATE TABLE Savings (
	account INTEGER,
	rate REAL,
	PRIMARY KEY(account),
	FOREIGN KEY(account) REFERENCES Account(account)
		ON DELETE CASCADE
);

CREATE TABLE Checking (
	account INTEGER,
	overdraft NUMERIC,
	PRIMARY KEY(account),
	FOREIGN KEY(account) REFERENCES Account(account)
		ON DELETE CASCADE
);

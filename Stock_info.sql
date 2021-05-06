-- Creating tables for stock Information 
CREATE TABLE Stock_info (
	Ticker VARCHAR(5) NOT NULL,
	C_Name VARCHAR(50) NOT NULL,
	Last_Sale VARCHAR(10) NOT NULL,
	Net_change VARCHAR(40) NOT NULL,
	Percentage_Change VARCHAR(40) NOT NULL,
	Market_Cap VARCHAR(20) NOT NULL,
	Country VARCHAR(40) NOT NULL,
	IPO_Year INT NOT NULL,
	Sector VARCHAR(60) NOT NULL,
	Industry VARCHAR(60) NOT NULL,
     PRIMARY KEY (Ticker),
     UNIQUE (C_Name)
);
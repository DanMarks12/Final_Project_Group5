-- Creating tables for stock Information 
CREATE TABLE Stock_info (
	ticker VARCHAR(5) NOT NULL,
	ipo_year INT NOT NULL,
     PRIMARY KEY (ticker)
);
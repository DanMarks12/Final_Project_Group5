-- Create tech stock table 
CREATE TABLE techstocks(
		ticker VARCHAR(5) NOT NULL,
		market_cap FLOAT(53) NOT NULL,
	    ipo_year INT NOT NULL,
		PRIMARY KEY (ticker)
);

select * from techstocks;
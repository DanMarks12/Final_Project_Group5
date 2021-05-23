-- Create a table to hold Nasdaq stock data 
-- Table 1
CREATE TABLE tech_stocks(
		ticker VARCHAR(5) NOT NULL,
		market_cap FLOAT(53) NOT NULL,
	    ipo_year INT NOT NULL,
		PRIMARY KEY (ticker)
);

-- Display Nasdaq stock data table
select * from tech_stocks;

-- Create a table from the Nasdaq stock data table by ascending order of IPO year
-- Table 2
SELECT ticker, market_cap, ipo_year
INTO ipo_year
FROM tech_stocks
ORDER BY ipo_year ASC;

-- Display IPO year table
SELECT * FROM ipo_year;

-- Create a table for stocks that IPO'd between 1972 and 2013 and organized in descending order of market cap
-- Tabel 3
SELECT ticker, market_cap, ipo_year
INTO market_cap
FROM ipo_year
WHERE ipo_year BETWEEN '1970' AND '2013'
ORDER BY market_cap DESC;

-- Display market cap table (1972-2013)
SELECT * FROM market_cap;

-- Create a table for the top five stocks with the highest market cap (1970-2013)
-- Tabel 4
SELECT ticker, market_cap, ipo_year
INTO blue_chip 
FROM market_cap
LIMIT 5;

-- Display top five table (1970-2015)
SELECT * FROM blue_chip

-- Create a table for stocks with IPO year between 2018 and 2019 organized in descending order of market cap
-- Tabel 5
SELECT ticker, market_cap, ipo_year
INTO new_market_cap
FROM ipo_year
WHERE ipo_year BETWEEN '2018' AND '2019'
ORDER BY market_cap DESC;

-- Display market cap table (2018-2021)
SELECT * FROM new_market_cap;

-- Crate a table for the top five stocks with the highest market cap (2018-2019)
-- Tabel 6
SELECT ticker, market_cap, ipo_year
INTO new_ipos
FROM new_market_cap
LIMIT 5;

-- Display top five table (2018-2019)
SELECT * FROM new_ipos;

-- Create a table to join company name for blue chip tabel
-- Table 7
CREATE TABLE bluechip(
		ticker VARCHAR(5) NOT NULL,
		company_name VARCHAR(10) NOT NULL,
		PRIMARY KEY (ticker)
);

-- Display blue chip table
SELECT * FROM bluechip;

-- Creat a table to join company name for ne IPO's
-- Table 8
CREATE TABLE newipos(
		ticker VARCHAR(5) NOT NULL,
		company_name VARCHAR(15) NOT NULL,
		PRIMARY KEY (ticker)
);

-- Display new IPO table
SELECT * FROM newipos;

-- Retrieve the columns needed from the table to join.
SELECT new_ipos.ticker,
		newipos.company_name,
		new_ipos.market_cap,
		new_ipos.ipo_year
-- Create a new table using the INTO clause.
-- Table 9
INTO new_ipos_list
-- Join both tables on the primary key.
FROM new_ipos
INNER JOIN newipos ON new_ipos.ticker = newipos.ticker;

-- Display new joined tabel. 
SELECT * FROM new_ipos_list;

-- Retrieve the columns needed from the table to join.
SELECT blue_chip.ticker,
		bluechip.company_name,
		blue_chip.market_cap,
		blue_chip.ipo_year
-- Create a new table using the INTO clause.
-- Table 10
INTO blue_chip_list
-- Join both tables on the primary key.
FROM blue_chip
INNER JOIN bluechip ON blue_chip.ticker = bluechip.ticker;

-- Display new joined tabel.
SELECT * FROM blue_chip_list;
# Final_Project_Group5

## Purpose 

In this analysis, the machine learning model required five blue-chip stocks that IPO'd before 2013 and five stocks that IPO'd after 2018 to answer whether blue-chip stock prices can be forecasted better than newer companies using machine learning. To remove bias in the stock-picking process, SQL was used to filter out the stocks needed based on the IPO year and market cap. 

## Data source

* Nasdaq Financial services company
* https://www.nasdaq.com/market-activity/stocks/screener
* Filters  
  * Sector (Technology) 
  * Country (United States) 

## Process 

* Cleaning the data in Pandas.

 1. Remove all the columns that are not needed. 
  
  
  <img width="1012" alt="Image1" src="https://user-images.githubusercontent.com/74740339/118556950-80acfb00-b732-11eb-9538-a1bad72dfe3b.png">

 2. Remove any rows with null values. 
  
  
  <img width="1038" alt="Image2" src="https://user-images.githubusercontent.com/74740339/118557607-6aec0580-b733-11eb-99c2-c77fd9f5f1e1.png">


 3. Convert the column with a numerical value to integer data type. 
  
  <img width="1011" alt="Image3" src="https://user-images.githubusercontent.com/74740339/118557702-8eaf4b80-b733-11eb-855c-bfe73c81e8dd.png">
 
 4. Save the cleaned data into a new CSV.
 
<img width="1007" alt="Image9" src="https://user-images.githubusercontent.com/74740339/118561252-bfde4a80-b738-11eb-8564-472584c81c21.png">

* Creating the tables and importing the data into PgAdmin.

 1. Create the table to import the original data set into. 
 

<img width="760" alt="Image4" src="https://user-images.githubusercontent.com/74740339/118560606-c1f3d980-b737-11eb-9269-3995578fca8b.png">

 2. Create a new table named market_cap that will capture stocks that IPO'd between 1972 to 2013 organized in descending order of market cap value. 
 
<img width="757" alt="Image5" src="https://user-images.githubusercontent.com/74740339/118560671-dcc64e00-b737-11eb-862e-eb4867b3c19d.png">

 3. Using the markert_cap table, create a new table that captures the top five stocks with the highest market cap from 1972 to 2013
 
<img width="760" alt="Image6" src="https://user-images.githubusercontent.com/74740339/118560835-1d25cc00-b738-11eb-9206-032e17550c00.png">

 4. Create a new table named new_market_cap that will capture stocks that IPO'd between 2018 to 2019 organized in descending order of market cap value. 
 
<img width="762" alt="Image7" src="https://user-images.githubusercontent.com/74740339/118560949-4c3c3d80-b738-11eb-91cb-312792a1aeca.png">

 5. Using the new_markert_cap table, create a new table that captures the top five stocks with the highest market cap from 2018 to 2019. 
 
 <img width="762" alt="Image8" src="https://user-images.githubusercontent.com/74740339/118561130-96bdba00-b738-11eb-9c23-169a366d0ab7.png">



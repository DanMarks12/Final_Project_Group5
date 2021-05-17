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

  ** 1. Remove all the columns that are not needed. 
  
  
  <img width="1012" alt="Image1" src="https://user-images.githubusercontent.com/74740339/118556950-80acfb00-b732-11eb-9538-a1bad72dfe3b.png">

  2. Remove any rows with null values 
  
  
  <img width="1038" alt="Image2" src="https://user-images.githubusercontent.com/74740339/118557607-6aec0580-b733-11eb-99c2-c77fd9f5f1e1.png">


  3. Convert the column with a numerical value to integer data type. 
  
  <img width="1011" alt="Image3" src="https://user-images.githubusercontent.com/74740339/118557702-8eaf4b80-b733-11eb-855c-bfe73c81e8dd.png">

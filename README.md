# Final_Project_Group5

## Role Week 1: Github
See Main branch for other commits/week 1 Github progress

## Role Week 2-3: 
Kept Github up to date, created DBD to be used in other questions as well as validating stock picks for IPO and SPAC question. Created a Linear Regression Model and a ML model for 1 stock each before performing analysis on all 10 stocks. 

## Question: Startup Tech Companies vs Bluechip/Established: Analysis on performance and profitability: 
#### Hypothesis: Blue chip companies will have safer more controlled growth whereas startups with have more volitality, higher risk but also higher gains in positive cases and losses in negative cases. In the case of my question I believe Blue chip tech stocks will have more accurate models than new IPO stocks. 

### Criteria for Stocks

Our top 5 bluechip/recent ipo/SPAC companies were chosen because of two metrics: Tech sector and highest market cap as of 5/1/2021
As seen below how I came to chose the top 5 stocks in Tech sector

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/JPG/IPO_marketcap.png)

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/JPG/Bluechip_marketcap.png)

### Machine Learning: 
The question we sought to answer with machine learning was comparing Bluechip stock to newly IPO'd stocks. I started experimenting with various ML methods but found most were not applicable to time series modeling. I ended up with ARIMA and ARMA as they are perfect at predicting future values in a given time series.

#### What is ARIMA? 
'Auto Regressive Integrated Moving Average' or ARIMA for short can be used in analysis of time series models to better understand the data or predict future points based on its own past values. They are categorized with 3 terms: pdq

###### p value:
p value is the order of the Auto Regressive (AR) term. This refers to the number of lags needed in the model to be used as predictors. We can find different p values to test by creating a partial autocorrelation plot (PACF)

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/Partial_autocorrelation.JPG)

By default 1 should be tested in your model, but we can also see 3 and 14 are above the standard deviation and should be considered as a p value. 

###### d value:
d value is the number of differencing required to make the time series stationary we first perform an ADF test. If the p-value is >.05 we cannot reject the null hypothesis and will need to find the order of the differencing. 

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/ADF_test.JPG)

After we conclude the model is not stationary there are 2 methods in finding the number of differencin required: 

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/Differencing.JPG)

First we can plot the auto correlation with different differencing number and see if the auto correlation drastically changes. Above, I tested with differencing of 1, 2 and 3 and concluded that differencing the model 1 time was enough. To double check my results I imported ndiffs module from pdarima.arima-utils package and concluded 1 difference was adequate for the model. 

###### q value:
q value is the order of the Moving Average (MA) term. This explains the number of lagged forecast errors in our ARIMA model. We can chose our q values by creating an ACF plot: 

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/Autocorrelation.JPG}

From here we can see 1 and 3 should be tested as our q terms. 

#### Moving on to modeling
Now that we have decided on our p d and q terms we must split our data into training and testing data. 
![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/split_data.JPG)

By splitting with this method we do not need to manually calulate 80% and 20% of our data and the code is more fluid for shorter or longer time series. Below we can see the data we are working on and visualize our train vs test data:

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/trainvstest.JPG}

The ARMA and ARIMA models I built came up with varying results. The majority of the time ARIMA seemed to better forecast stock prices where ARMA did have an advantage across a few stocks. Below are 2 example models: 

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/Arima_example.JPG)
![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/Arma_example.JPG)

After running the ARIMA and ARMA models I noticed an issue in comparing the results of the tests. Initially I believed mean squared average (MSE) score would be the best indication if the model was succesful or not, but since we are looking at 10 different stocks an MSE score would be more applicable to each individual stocks price (be it open, close, high, low). Because of this I decided to compare the stocks by their Mean Percent Error (MPE) scores. The MPE is the computed average by which forecasts of a model differ from actual values of the forecast. Below is the code run after each model illustrating the calculation used to find MPE scores

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/MPE_calculation.JPG)


#### Exploring the results

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/JPG/MPE%20Score%20Distribution.png)

As we can see here a distribution of the MPE scores for all stocks. We see blue chip stocks trend towards 0 (which indicates a more accurate forecast) across both ARIMA and ARMA models. If we look at the results plotted against the market cap we see similar results:

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/JPG/MPE%20vs%20Marketcap.png}

Here we can see market cap vs our MPE scores. We can also see for the most part the ARIMA model provided more accurate predictions than ARMA. 






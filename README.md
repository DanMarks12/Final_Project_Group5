# Final_Project_Group5: An Analysis into the Tech Sector before and after Covid:
The uncertainty that COVID has brought to various industries around the world has seemingly overlooked or enriched certain sectors. Tech in particular has been able to flourish during pandemic,in part due to many business moving from office workplace to employees working from home; schools moving to remote learning and public transportation shifting to private rides and other forms of transportation. Our goal in our final project is to take a look at the impact covid has had on the Tech industry, and where we expect it to go moving forward. 


## Communication Protocals 
### Roles

Github: Collaborative

MI : Dan Marks

Dashboard : Perry Abdulkadir

Database : Wengi 


### Protocals
- Colaboration through Slack group
- Lay out 5 questions we will be answering, distributed questions
- Meetings throughout the week outside of class
- Shared Google doc: https://docs.google.com/document/d/1SY56LAwAWJcryRgtg58EKAuqdpSpt0IqHUjSmKUIQa4/edit
- Zoom meetings


## Questions:

#### Are tech companies' worthwhile investment with long-term growth potential?

Hypothesis: 

#### ML Question: Do bluechip stocks have any advantage in forecasting stock prices compared to newer companies? (IPO after 2018)

Hypothesis: Blue chip companies will have safer more controlled growth whereas startups with have more volitality, higher risk but also higher gains in positive cases and losses in negative cases 

#### The Rise of SPACs: During Covid, SPACs have become more popular. Since the vaccine released, which have been proven to be more successful (performing better in the market) -- IPOs or SPACs?

Hypothesis: SPACs (Special Purpose Acquisition Corporations) are essentially shell corporations that form with the intention of purchasing a private corporation. It is an alternate method of taking a corporation public with less red tape than an IPO. The SPAC has existed for several decades, but has gained a great deal of attention lately. Despite the buzz around SPACs, they have generated less return for investors than IPOs because this alternate method of going public signals to markets some underlying issue in the company’s fiscal health.

#### How did tech compnies manage during covid, some flourished, while others fell. Were different subsectors of tech hit differently?

Hypothesis: Tech stocks have surged during covid and helped the stock market rise. The pandemic has fueled the tech stocks while hurting other industries like the airline industry.

#### Is there a positive correlation between a companys ethical practices and profitability?

Hypothesis: 




## Source Data: 
We will be pulling data from finance.yahoo.com, finance.google.com, Bloomberg and FactSet data sets

## Companys we are looking into:
Our top 5 bluechip/recent ipo/SPAC companies were chosen because of two metrics: Tech sector and highest market cap as of 5/1/2021

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/JPG/Tickers.JPG)


## Database Design
![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/JPG/DBD_outline.JPG)

## Analysis 

### IPO vs SPACs 

There are plenty of reasons why a company would want to go public, a couple being: liquidity and raise funds and open channels for higher revenues in the future. An IPO stands for “Initial Public Offering” and it involves a journey of working with investors, risk assessors, underwriters, etc. to invest money into the company so it can be taken public. A SPAC stands for “Special Purpose Acquisition Company” which is a shell company that saves its money until it figures out what it wants to spend its money on. SPACs have becoming popular in more recent times as it costs less time and money for companies to go public. However, a SPAC has a time limit of one to two years to acquire a target company before it delists off the market and is forced to give back all the investor money. 

During Covid, SPACs have gained a lot of traction in terms of popularity.  To best address my hypothesis that states IPOs are more profitable compared to SPACs, I have chosen five companies that have IPO’ed and five SPACs, specifically in the Technology sector. The IPO companies I have chosen are Zoom, Moderna, CrowdStrike, DocuSign and Peloton. The SPACs I have chosen are Reinvent Technology Partners, Mason Industrial Technology, E.Merge Technology Acquisition Corp, ScION Tech Growth, and TPG Pace Tech Opportunities Corp. Below, you will find the their growth since over time since the vaccine got released to the general public in early 2021. 

<img width="456" alt="ipos" src="https://user-images.githubusercontent.com/74915619/118407128-40278180-b64d-11eb-9538-e11d172af886.png"> IPOs

<img width="484" alt="spacs" src="https://user-images.githubusercontent.com/74915619/118407148-5b928c80-b64d-11eb-9c5a-48e36207fe65.png"> SPACs

In these graphs, we are comparing the Market Capitalization of these companies. Market Capitalization is the market value of a publicly traded company’s outstanding shares. Market cap is calculated by the share price multiplied by the number of shares outstanding. As you can see from both graphs, all ten companies have not had much growth in these past four months. However, the companies that IPO’ed have a higher Market Capitalization to begin with and have been quite steady throughout these months since the vaccine got released. SPACs have started with a lower Market Cap and have continued to stay in that low range. One of the SPACs even had a large fall in Market Cap in March. Although SPACs look to be profitable, IPOs have proven to be the safer and more profitable option in the long run. 

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

![](https://github.com/DanMarks12/Final_Project_Group5/blob/main/ML_tests/Github_JPGs/Autocorrelation.JPG)

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

WAITING ON TABLEU VISUALIZATIONS TO ILLUSTRATE SOME FINDINGS




## Presentation
https://docs.google.com/presentation/d/1lW8-Si68omeYsMeeIKVGWdINQx402azv0Sgm5ooQO6I/edit?usp=sharing

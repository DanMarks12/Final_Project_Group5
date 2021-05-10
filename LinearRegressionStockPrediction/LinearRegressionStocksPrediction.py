#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:


df = pd.read_csv("StocksData.csv")


# In[3]:


# lets try to look the data
df.head()


# In[4]:


# let try to check the column names
print(df.columns.tolist())


# In[5]:


# lets try to check the shape of dataset
df.shape


# In[6]:


# let try to use the info() method to output some general information about the dataframe like as missing values , types etc
df.info()


# In[7]:


# The describe method shows basic statistical characteristics of each numerical feature (int64 and float64 types):
# number of non-missing values, mean,standard deviation, range, median, 0.25 and 0.75 quartiles. 
df.describe()


# In[8]:


# In order to see statistics on non-numerical features, one has to explicitly indicate data types of interest in the include parameter.
df.describe(include = ['object', 'bool'])


# In[9]:


# convert the date column into datetome field
df['STOCK_TICKER'] = pd.to_datetime(df['STOCK_TICKER'])


# In[10]:


plt.figure(figsize=(15,5))
plt.plot(df.STOCK_TICKER,df.Low, label='Low price')
plt.title("Target Variable (Low Price)")
plt.xlabel("Dates")
plt.ylabel("Price")
plt.xticks(rotation=45)
plt.legend()
plt.show()


# In[11]:


from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
# import methods for measuring errors
from sklearn.metrics import mean_squared_error, explained_variance_score, max_error, mean_absolute_error,mean_squared_log_error


# In[12]:


df.columns


# In[13]:


# let try to separate the dependent and independent variable
X = df[['High', 'Open', 'Close', 'Volume', 'Adj Close']]
y = df['Low']


# Every dataset for Machine Learning model must be split into two separate sets – training set and test set.
# 
# Usually, the dataset is split into 70:30 ratio or 80:20 ratio. This means that you either take 70% or 80% of the data for training the model while leaving out the rest 30% or 20%. The splitting process varies according to the shape and size of the dataset in question.

# In[14]:


# lets try to split the 20% data for testing and 80% for training
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size = 0.2, random_state = 0)


# In[15]:


print('Training Features Shape:', X_train.shape)
print('Training Labels Shape:', y_train.shape)
print('Testing Features Shape:', X_test.shape)
print('Testing Labels Shape:', y_test.shape)


# In[16]:


# fit the linear model
lr = LinearRegression()
lr.fit(X_train,y_train)


# In[17]:


# Evaluation of L
def evaluate(model, X_test, y_test):
    predictions = model.predict(X_test)
    errors = np.sqrt(mean_squared_error(y_test, predictions))
    variance_score = explained_variance_score(y_test,predictions)
    m_errors = max_error(y_test,predictions)
    mae = mean_absolute_error(y_test,predictions)
    log_errors = mean_squared_log_error(y_test,predictions)
    score = model.score(X_test,y_test)
    print("*"*50)
    print('\t\tModel Performance')
    print("*"*50)
    print("Score of: ",score)
    print("-"*50)
    print('RMSE of: ', errors)   
    print("-"*50)
    print('explained_variance_score of: ', variance_score)
    print("-"*50)
    print('Max_Error of: ', m_errors)
    print("-"*50)
    print('MAE of: ', mae)
    print("-"*50)
    print('MSLE of: ', log_errors)
    print("-"*50)
    return errors


# In[18]:


#lets try to evalute the result of LinearRegression
evaluate(lr, X_test,y_test)


# In[19]:


d = {
    'Actual low price':y_test,
    'predicted low price': lr.predict(X_test)
}


# In[20]:


df1 = pd.DataFrame(d)
df1


# In[21]:


df1.head(50)


# In[22]:


plt.figure(figsize=(15,5))
plt.plot(df['STOCK_TICKER'][468:],y_test, label='Actual low price', color='green')
plt.plot(df['STOCK_TICKER'][468:],lr.predict(X_test), label='Predicted low price', color='red')

plt.title("Actual Vs Predicted ( testing data)")
plt.xlabel("Dates")
plt.ylabel("Price")
plt.xticks(rotation=45)
plt.legend()
plt.show()


# In[ ]:





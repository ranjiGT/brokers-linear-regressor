# Case description
A broker wants to use linear regression to find out which factors have a large influence on the price of a property. For this purpose, the variables described in Table are given for the last 88 sales in the broker’s region.

| Variable | Description |
| ----------- | ----------- |
| price | house price (× 1,000 EUR) |
| bdrms | number bedrooms |
| lotsize | parking area (m^2) |
| sqrm | house area (m2^) |
| country | == 1 when in country house style |
| lprice | log(price) |
| lsqrm | log(lsqrm) |
| llotsize | log(llotsize) |

# Task 1 description
Create a linear regression model with **price** as dependent variable and **bdrms**, **lotsize**, **sqrm** and **country** as independent variables.

- Determine the regression coefficients and *p-values* of the dependent variable and compare their influence within the model on the predicted value for **price**.


- Determine how much variance of the dependent variable is explained.


- Check the residuals (graphically) for normal distribution and homoskedasticity.



# Task 2 description
Given be the linear regression model from task 1.

- Create a scatterplot to display the relationship between the predicted value for price and the residual size. 


- For some houses, the price forecast of the broker model is more than EUR 100,000 off. Highlight houses with a residual size of more than 100 or less than 100. What could be the reasons for high model inaccuracies?


- Can the **R^2-value** be increased by using a linear transformation of one of the independent variables?


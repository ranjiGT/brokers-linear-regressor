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
![](https://github.com/ranjiGT/brokers-linear-regressor/blob/main/lmplot.png)

Interpretation of the coefficients:
The increase of the number of bedrooms by 1 leads to an increase of the predicted house price by 11000 EUR. The increase of the parking space by 1 m^2 leads to an increase of the predicted house price by 22 EUR. ... Analog for sqrm and country. Since the independent variables are not scaled, we cannot compare the variable weighting using the regression coefficients. Therefore, we use the p-values. Influence after p-value: sqrm > lotsize > bdrms > country

- Determine how much variance of the dependent variable is explained.
![](https://github.com/ranjiGT/brokers-linear-regressor/blob/main/qqplot.png)

R^2 expresses the variability of the liniear model w.r.t. price -> 1 - SSE/SSTO (Sum of Squared Errors vs. Total Sum of Squares)

- Check the residuals (graphically) for normal distribution and homoskedasticity.
y_hat and add residuals to the data frame homoskedasticity 
(Increase/decrease in the variance of residuals) is not clearly identifiable. For high predicted values, the variance seems to be greater, but the sample size is also very small.

![](https://github.com/ranjiGT/brokers-linear-regressor/blob/main/homoskedasticity.png)


# Task 2 description
Given be the linear regression model from task 1.

- Create a scatterplot to display the relationship between the predicted value for price and the residual size. 
![](https://github.com/ranjiGT/brokers-linear-regressor/blob/main/SPlot.png)
Outlier for lotsize == 92681 --> distorts the model <- remove outlier
No connection between the independent variables of the model and the other 5 houses recognizable. There seems to be an unmeasured or unincluded variable that strongly pushes the price up/down. Log-Transformation of parking area (not linear) leads to increase of R^2-values

- For some houses, the price forecast of the broker model is more than EUR 100,000 off. Highlight houses with a residual size of more than 100 or less than 100. What could be the reasons for high model inaccuracies?

- Can the **R^2-value** be increased by using a linear transformation of one of the independent variables?

# Task 3 description
Graphically display the relationship between **bdrms** and **price**. Check whether this relationship is also reflected in the regression model from Task 1. Create a regression model with bdrms as the only independent variable. Compare the regression coefficients with those of the model from Task 1 and interpret the differences.

The regression coefficient in the model from Task 1 is 11 for bdrms
What does regression coefficient mean?
If the values of all other independent variables remain the same, then another bedroom leads to a price increase of 11 EUR. If the house area and parking space do not change, then another bedroom has no influence on the house price. This means that an existing room is split into two smaller rooms or a normal room is converted into a bedroom, while the living space remains the same. The causality is not given in the second model despite its significance.

![](https://github.com/ranjiGT/brokers-linear-regressor/blob/main/boxplot.png)

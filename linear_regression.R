library(tidyverse)
library(forcats)
library(stringr)
library(purrr)
library(modelr)
library(stats)
library(magrittr)

hprice <- read_csv(str_c(dirname(getwd()), "/Documents/hprice.csv"))

#str(hprice)
#head(hprice)
#tail(hprice)
#class(hprice)

fit <- lm(price ~ bdrms + lotsize + sqrm + country, data = hprice)
sfit <- summary(fit)
sfit
sfit$terms

sfit$coefficients[, 1]

#ls() #gives variables

sfit$coefficients[, 4]


sfit$r.squared


hprice_res <- hprice %>%
  select(price, bdrms, lotsize, sqrm, country) %>%
  add_predictions(fit) %>%
  add_residuals(fit)

# Frequency Chart of the distribution of the residuals
hprice_res %>%
  ggplot(aes(resid)) +
  geom_freqpoly() +
  labs(x = "Residual Magnitude", y = "Count")

# qq-Plot to check the normal distribution
y <- quantile(hprice_res$resid, c(0.25, 0.75))
x <- qnorm(c(0.25,0.75))
slope <- diff(y) / diff(x)
int <- y[1] - slope * x[1]
ggplot(hprice_res, aes(sample = resid)) + stat_qq() +
  geom_abline(aes(slope = slope, intercept = int))

# check homoskedasticity
hprice_res %>%
  ggplot(aes(pred, resid)) +
  geom_point() +
  geom_smooth(se = F)

##Numerical Exercise 5c
##Q6 The Nominal GDP and Real GDP, the percentage increase
Q0 <- c(3000, 6000, 8000)
Q1 <- c(4000, 14000, 32000)
P0 <- c(2,3,4)
P1 <- c(3,2,5)

nGDP0 <- sum(Q0*P0)
nGDP1 <- sum(Q1*P1)
Inc <- (nGDP1 - nGDP0)/nGDP0 *100
nGDP0
nGDP1
Inc

##The increase in real GDP
rGDP0 <- nGDP0
rGDP1 <- sum(Q1*P0)
Inc <- (rGDP1 - rGDP0)/rGDP0 *100
rGDP0
rGDP1
Inc

##Percentage in price level change
Deflator0 <- nGDP0/rGDP0*100
Deflator1 <- nGDP1/rGDP1*100
Deflator0
Deflator1

#The percentage of increase in GDP is missing (increase in price and quantity in combined)

##Q7 Calcuate Inflation Rate
CPI <- c(14.2, 14, 12.7, 11.5, 10.9)
Inflation <- diff(CPI)/lag(CPI, -1)
Inflation

##Q8 
RInflation <- (214-200)/200
EInflation <- (210 - 200)/200

NInterest <- 45/500
RInterest <- NInterest - RInflation
EInterest <- NInterest - EInflation

RInflation *100
EInflation *100
RInterest *100
EInterest *100



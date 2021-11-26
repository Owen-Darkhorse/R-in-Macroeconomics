##GDP per capita treding and cyclcal behaviour
GDP <- read.csv("csv files/CAN GDP and Components.csv", header = TRUE)
Pop <- read.csv("csv files/Canadian Population.csv", header = FALSE)

GDP <- ts(GDP[,6], start = c(1960, 1), frequency = 4)
Pop <- ts(Pop[,2], start = c(1960, 1), frequency = 4)

GDP_per_capita <- GDP / Pop
Time <- time(GDP_per_capita, offset = 0.5)

##Low Frequency Component of GDP capita
LinTrendCoef <- coef(lm(GDP_per_capita ~ Time))
LinTrend <- LinTrendCoef[1] + LinTrendCoef[2]*Time
Detrended <- GDP_per_capita - LinTrend
Cycle <- filter(Detrended, filter = rep(1/5, 5))

Low_freq <- LinTrend + Cycle
Value_low <- cbind(GDP_per_capita, Low_freq)

plot(Value_low, plot.type = "single", 
     col = c(gray(0, 0.7), "red"), lty = c(3, 1), lwd = c(1, 3),
     xlab = "Year", ylab = "Income per capita in Thousands of Dollars",
     main = "Real per capital GDP (Low Frequency)")
##We can see that the real GDP per capita is growing at a nearly linear trend


##Low Frequency Component of GDP per capita growth rates
Growth_rate <- diff(GDP_per_capita)/lag(GDP_per_capita, -1)
Growth_rate
Annual_rate <- (1 + Growth_rate)^4 - 1
Time <- time(Annual_rate, offset = 0.5)

LinGrCoef <- coef(lm(Annual_rate ~ Time))
LinGrTrend <- LinGrCoef[1] + LinGrCoef[2]*Time
GrowthCSI <- Annual_rate - LinGrTrend
GrCycle <- filter(GrowthCSI, filter = rep(1/5, 5))

Growth_low <- LinGrTrend + GrCycle
Growth_comp <- cbind(Annual_rate, LinGrTrend) #Growth comparison

plot(Growth_comp, plot.type = "single", 
     col = c("black", "red"), lty = c(3, 1), lwd = c(2, 3),
     xlab = "Year", ylab = "Percentage Growth",
     main = "Percentage Annualized Growth of Per Capita Real Income")
abline(h = 0, col = "black", lwd = 2)

##The linear Trend of the annual growth rate is decreasing
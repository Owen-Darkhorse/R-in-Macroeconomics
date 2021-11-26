##ECON 102 Assignment 1
data <- read.csv("csv files/data 39.csv")
data <- ts(data$Expenditure, frequency = 4, c(1950, 1))

##Part A: Visualization
##A.1 Visualize the Trend in the Line Graph
plot(data, main = "Expenditure from 1950 to 2021", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "Expenditure in Thousands of Dollars")
##A.2 Growth Rate of the Log Series
logdata <- log(data)
plot(logdata, main = "Log Transformed Expenditure from 1950 to 2021", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "Expenditure in Thousands of Dollars")
##A.3 Annualized Growth Rate
ApproxRate <- diff(logdata)
AnnualRate <- ((ApproxRate + 1)^4-1)*100
plot(AnnualRate, main = "Log Approximated Annualized Growth Rate", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "%")

TrueRate <- diff(data)/lag(data, -1)
AnnualRate <- ((TrueRate + 1)^4-1)*100
plot(AnnualRate, main = "Exact Annualized Growth Rate", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "%")


##Part B: Time Series Decomposition
##B.1 Line of Best Fit
year <- time(data, offset = 0.5)
LinCoef <- coef(lm(data~year))
LinFit <- LinCoef[1] + LinCoef[2]*year

year2 <- year^2
QuaCoef <- coef(lm(data~year + year2))
QuaFit <- QuaCoef[1] + QuaCoef[2]*year + QuaCoef[3]*year2

plot(data, main = "Expenditure versus Linear Trend", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "Expenditure in Thousands of Dollars")
lines(LinFit, col = 2, lty = 2, lwd = 3)
legend("topleft", legend = c("Expenditure", "Linear Fit"),
       col = 1:2, lty = 1:2, lwd = 2:3)

plot(data, main = "Expenditure versus Quadratic Trend", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "Expenditure in Thousands of Dollars")
lines(QuaFit, col = "magenta", lty = 2, lwd = 3)
legend("topleft", legend = c("Expenditure", "Quadratic Fit"),
       col = c("black", "magenta"), lty = 1:2, lwd = 2:3)

##B.2 Best Fit for the Log Series
LogLinCoef <- coef(lm(logdata~year))
LogLinFit <- LogLinCoef[1] + LogLinCoef[2]*year

LogQuaCoef <- coef(lm(logdata~year + year2))
LogQuaFit <- LogQuaCoef[1] + LogQuaCoef[2]*year + LogQuaCoef[3]*year2


plot(logdata, main = "Log Expenditure versus Linear Trend", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "Log Expenditure in Thousands of Dollars")
lines(LogLinFit, col = "red", lty = 2, lwd = 3)
legend("topleft", legend = c("Log Expenditure", "Linear Fit"),
       col = c("black", "red"), lty = 1:2, lwd = 2:3)

plot(logdata, main = "Log Expenditure versus Quadratic Trend", col = 1, lty = 1, lwd = 2,
     xlab = "Year", ylab = "Log Expenditure in Thousands of Dollars")
lines(LogQuaFit, col = "magenta", lty = 2, lwd = 3)
legend("topleft", legend = c("Expenditure", "Quadratic Fit"),
       col = c("black", "magenta"), lty = 1:2, lwd = 2:3)

##B.3 Short Term Fluctuation in Detrended Series
Detrended <- logdata - LogLinFit
plot(Detrended, main = "Short Term Expenditure Fluctuation", col = 1, lty = 1, lwd = 1,
     xlab = "Year", ylab = "Log Expenditure in Thousands of Dollars")

##B.4 Cyclical Component
LogCSI <- decompose(Detrended, type = "additive", filter=rep(1/5, 5))
Cycle <- LogCSI$trend
Short <- cbind(Detrended, Cycle)
plot(Short, main = "The Average Short Term Fluctuation", xlab = "Year", 
     ylab = "Fluctuation in Thousands of Dollars",
     col = c(gray(0.7, 1), "red"), lty = c(2, 1), lwd= c(1, 3),
     plot.type = "single")
legend("topright",legend = c("Detrended Series", "Cyclical Component"), col = c(gray(0.7, 1), "red"),
       lty = c(2, 1), lwd= c(1, 3))

##B.5 Low Frequency
Low <- LogLinFit + Cycle
plot(logdata, main = "Log Expenditure versus Low Frequecy", col = gray(0,0.7), lty = 2, lwd = 2,
     xlab = "Year", ylab = "Log Expenditure in Thousands of Dollars")
lines(Low, col = "orange", lty = 1, lwd = 3)
legend("bottomright",legend = c("Original Series", "Low Freuquency Component"),
       col = c(gray(0,0.7), "orange"),
       lty = c(2, 1), lwd= c(2, 3))

##B.6 The Seasonal Component
Season <- LogCSI$season[1:4]
barplot(Season, names.arg = 1:4, main = "Seasonal Fluctuation",
        xlab = "Quarters", ylab = "Seasonal Fluctuation in Thousands of Dollars",
        col =  "violetred", border = "gray", density = 20, angle = 135)
abline(h=0, col = "black")

##Part C: Comovement
data26 <- read.csv("csv files/data 26.csv")
data26 <- ts(data26$Expenditure, frequency = 4, c(1950, 1))
##C.1 Log Scatter Plot Comparison
logdata26 <- log(data26)
plot(logdata, logdata26, main = "Data 39 versus Data 26 in Log Scale",
     xlab = "Data 39", ylab = "Data 26", pch = 21, col = "black", bg="lightblue",
     xy.labels = FALSE, xy.lines = FALSE)

##C.2 Scatter Plot for Cyclical Component Comparison
LinCoef26 <- coef(lm(logdata26~year))
QuaCoef26 <- coef(lm(logdata26~year + year2))

LinFit26 <- LinCoef26[1] + LinCoef26[2]*year
QuaFit26 <- QuaCoef26[1] + QuaCoef26[2]*year + QuaCoef26[3]*year2

plot(logdata26, main = "Best Fit for Data 26 in Log Scale", 
     col = "black", lty = 1, lwd = 1,
     xlab = "Year", ylab = "Expenditure in Thousands of Dollars")
lines(LinFit26, col = "darkgreen", lty = 2, lwd = 3)
lines(QuaFit26, col = "magenta", lty = 3, lwd = 3)
legend("topleft",legend = c("Original Data", "Linear Fit", "Quadratic Fit"),
       col= c("black", "darkgreen", "magenta"), lty = 1:3, lwd = c(1,3,3),
       bty = "n")

Detrended26 <- logdata26 - QuaFit26
plot(Detrended26)
CSI26 <- decompose(Detrended26, type = "additive", filter = rep(1/5, 5))
Cycle26 <- CSI26$trend

plot(Cycle, Cycle26, main = "Cyclical Component of Data 39 versus that of Data 26",
     col = "orange", bg = "green", pch = 21, xlab = "Data 39", ylab = "Data 26")
cov(na.omit(Cycle), na.omit(Cycle26))
cor(na.omit(Cycle), na.omit(Cycle26))
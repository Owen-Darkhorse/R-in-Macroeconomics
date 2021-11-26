##Assignment 2 Code
##Q1
#(a) Nominal wage evolution
Data79 <- ts(read.csv("Wage79.csv", header = TRUE), frequency = 1,
             start = 1997)
Males <- Data79[,"Males"]
Females <- Data79[,"Females"]
CPI <- Data79[,"CPI"]

#(b)Real wage evolution
Color <- c("lightblue", "pink")
Linetype <- c(1,1)
NominalWage <- cbind(Males, Females)
plot(NominalWage, main = "Nominal Wage of Males vs Females", xlab = "Years", ylab = "Nominal Wage in dollars",
     lwd = c(2,2), lty=Linetype, col = Color,  plot.type = "single",
     legend = legend("topleft", bty="n", c("Males", "Females"), col=Color,
    lty=Linetype))

#(c)Linear fit of real  wage
RealWage <- NominalWage / CPI * 100
plot(RealWage, main = "Real Wage of Males vs Females", xlab = "Years", ylab = "Nominal Wage in dollars",
     lwd = c(2,2), lty=Linetype, col = Color,  plot.type = "single",
     legend = legend("topleft", bty="n", c("Males", "Females"), col=Color,
                     lty=Linetype))

#(d)Comovement between cyclical component
Time <- time(RealWage)
LinCoef <- coef(lm(RealWage ~ Time))
LinMales <- Time*LinCoef[2,1] + LinCoef[1,1]
LinFemales <- Time*LinCoef[2,2] + LinCoef[1,2]
LinColor <- c("blue", "red")
Trendtype <- c(2,3)
WageTrend <- cbind(LinMales, LinFemales)

lines(LinMales, col = LinColor, lty = Trendtype, lwd = 3)
lines(LinFemales, col = LinColor[2], lty = Trendtype[2], lwd = 3)
legend("topleft", bty="n", c("Males", "Females", "Males Trend", "Females Trend"),
       col=c(LinColor, LinColor), lty=c(Linetype,Trendtype))

Detreneded <- RealWage - WageTrend
DetrMales <- Detreneded[, 1]
DetrFemales <- Detreneded[, 2]

plot(DetrMales, DetrFemales, main = "The cyclical component of wages of both genders",
     xlab = "Males' Wage", ylab = "Females' Wage", col = "darkgreen", pch = 19,
     xy.labels = FALSE, xy.lines = FALSE)
CoefDetr <- coef(lm(DetrFemales ~ DetrMales))
FitLine <- DetrMales*CoefDetr[2] + CoefDetr[1]
lines(FitLine, col= "red", lty = 2, lwd = 3)

cor(DetrMales, DetrFemales)

##Q2 (a) Countries: Uruguay Italy Mexico Malaysia
##Codes: URY	ITA	MEX	MYS
##Years: 1978 2004
RealGDP <- read.csv("realgdp.csv", header =T)
RealGDP <- ts(RealGDP, start = 1970, frequency = 1)
URY <- RealGDP[, "URY"]
ITA <- RealGDP[, "ITA"]
MEX <- RealGDP[, "MEX"]
MYS <- RealGDP[, "MYS"]

##(b) Evolution of log-scaled real per capita GDP
URYLog <- log(URY)
ITALog <- log(ITA)
MEXLog <- log(MEX)
MYSLog <- log(MYS)

RealGDPEvo <- cbind(URYLog, ITALog, MEXLog, MYSLog)
Q2Col <- c(2,3, 6, 7)
plot(RealGDPEvo, plot.type = "single", main = "Real per Capita GDP",
     xlab = "Years", ylab = "Real per Capita GDP (Log Scale)",
     col = Q2Col, lty = 1, lwd = 2)
legend("bottomright", bty="n", c("Uruguay", "Italy", "Mexico", "Malaysia"),
       col=Q2Col, lty=1, lwd = 2)


##(c) Cyclical component using the quadratic trend
Time <- seq(1970, 2017, 1)
Time2 <-Time^2
QuaCoef <- coef(lm(RealGDPEvo~Time + Time2))
Term <- data.frame(rep(1, 48), Time, Time2)
Term <- as.matrix(Term)
QuaTrend <- ts(Term %*% QuaCoef, frequency = 1, start = 1970)

Detrended <- RealGDPEvo - QuaTrend

plot(Detrended, main = "The Cyclical Component of Log Real per Capita GDP",
     xlab = "Years",  ylab = "Log Real per Capita GDP", plot.type = "single",
     col = Q2Col, lty = 1, lwd = 2)
legend("bottomright", bty="n", c("Uruguay", "Italy", "Mexico", "Malaysia"),
       col=Q2Col, lty=1, lwd = 2)

##(d) A scatter plot for average annual growth rate 
##versus real per capita GDP from 1970 to 2017
GrowthRates <- diff(RealGDPEvo)
URYRate <- mean(GrowthRates[, "URYLog"]) *100
ITARate <- mean(GrowthRates[, "ITALog"]) *100
MEXRate <- mean(GrowthRates[, "MEXLog"]) *100
MYSRate <- mean(GrowthRates[, "MYSLog"]) *100

CountryRates <- c(URYRate, ITARate, MEXRate, MYSRate)
PerCapGDP70 <- c(window(RealGDPEvo, start= 1970, end = 1970))

plot(PerCapGDP70, CountryRates, main = "Average Annual Growth Rate vs. Initial Per Capita GDP",
     xlab = "1970 Per Capita GDP (in Log Scale)", ylab = "Average Annual Growth Rate (in Percentage )", 
      pch = 19, col ="cyan", cex.lab = 1.1)
text(c(8.960841, 9.443209, 8.998782, 8.088353),
     c(2.4, 2.3, 1.9, 4.1), 
     c("URY", "ITA", "MEX", "MYS"))
#How to plot lables for every point?

##(e) 2 histograms for real per capita GDP expressed in 
##thousands of dollars, one histogram for each year
GDPPerCap78 <- c(window(RealGDP, 1978, 1978)) / 1000
GDPPerCap04 <- c(window(RealGDP, 2004, 2004)) / 1000

hist(GDPPerCap78, main = "Distribution of Real Per Capita GDP across Countries in 1978",
     xlab = "Real Per Capita GDP (In Thousands of 2011 Dollars)", ylab = "Frequency",
     col = "antiquewhite4", breaks=25, cex.main = 1.2)

hist(GDPPerCap04, main = "Distribution of Real Per Capita GDP across Countries in 2004",
     xlab = "Real Per Capita GDP (In Thousands of 2011 Dollars)", ylab = "Frequency",
     col = "azure3", breaks=25, cex.main = 1.2)

##(e) 2 histograms for real per capita GDP expressed in 
##logs, one histogram for each year
GDPLog78 <- log(c(window(RealGDP, 1978, 1978)))
GDPLog04 <- log(c(window(RealGDP, 2004, 2004)))

hist(GDPLog78, main = "Distribution of Real Per Capita GDP across Countries in 1978",
     xlab = "Real Per Capita GDP (In Log Scale)", ylab = "Frequency",
     col = "antiquewhite4", breaks=25, cex.main = 1.2)

hist(GDPLog04, main = "Distribution of Real Per Capita GDP across Countries in 2004",
     xlab = "Real Per Capita GDP (In Log Scale)", ylab = "Frequency",
     col = "azure3", breaks=25, cex.main = 1.2)
sd(GDPLog78)
sd(GDPLog04)


#Functions
##Requires series be a time series
LinTrend <- function(series, color, linetype,
                     Title, Xaxis, Yaxis) {
  Time <- time(series)
  
  TrendCoef <- coef(lm(series ~ Time))
  Trend <- TrendCoef[1] + TrendCoef[2]*Time
  
  plot(series,col = color[1], lwd = 2, lty = linetype[1],
       main = Title, xlab = Xaxis, ylab = Yaxis, plot.type = "single")
  Trend
  lines(Trend, col = color[2], lwd = 3, lty = linetype[2])
}


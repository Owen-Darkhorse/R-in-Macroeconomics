##Moduke 4c Practice
##Q1 (a)
climate <- load("rda/Climate_module2.rda")
time <- time(co2Q, offset = 0.5)
time
Trendata <- coef(lm(co2Q~time))
LinTrend <- Trendata[1] + Trendata[2]*time
plot(co2Q, main = "Quarterly CO2 Emission", col = 1, lty = 1, lwd = 2,
     xlab = "Years", ylab = "Emission")
lines(LinTrend, col = 2, lty = 2, lwd = 3)
legend("topleft",legend = c("Series", "Trend"), col = c(1,2), lty = c(1,2), lwd = c(2,3))

##(b)
time2 <- time^2
Trendata <- coef(lm(co2Q~time+time2))
QuaTrend <- Trendata[1] + Trendata[2]*time + Trendata[3]*time2
plot(co2Q, main = "Quarterly CO2 Emission", col = 1, lty = 1, lwd = 2,
     xlab = "Years", ylab = "Emission")
lines(QuaTrend, col = 2, lty = 2, lwd = 3)
legend(x = 40, y = 40,legend = c("Series", "Trend"), col = c(1,2), lty = c(1,2), lwd = c(2,3))

##(c)
CSI <- co2Q - QuaTrend
Decomp_co2 <- decompose(CSI , type = "additive", rep(1/3, 3))
Cycle <- Decomp_co2$trend
Season <- Decomp_co2$seasonal
plot(CSI, main = "Quarterly CO2 Emission", col = 1, lty = 1, lwd = 2,
     xlab = "Years", ylab = "Emission")
lines(Cycle, col = 2, lty = 2, lwd = 3)
legend("topright",legend = c("Detrended Series", "Cycle"), col = c(1,2), lty = c(1,2), lwd = c(2,3))


##(d)
Low <- QuaTrend + Cycle
plot(co2Q, main = "Quarterly CO2 Emission", col = 1, lty = 1, lwd = 2,
     xlab = "Years", ylab = "Emission")
lines(Low, col = "red", lty = 2, lwd = 3)
legend("topright",legend = c("Detrended Series", "Cycle"), col = c(1,"red"), lty = c(1,2), lwd = c(2,3))

##(e)
#Season only contains 4 distinct values that repeats the same number of times as the years
#To ensure only the 4 distinct values are plotted, we only take the first 4 values
barplot(Season[1:4], names.arg = c("1st", "2nd", "3rd", "4th"), bg = 1, col = "purple", 
        main = "Seasonal Behaviour", xlab = "Quarters", ylab = "Seasonal Level")
##(f)
Deseasonalized <- co2Q - Season
plot(co2Q, main = "Quarterly CO2 Emission", col = 1, lty = 1, lwd = 2,
     xlab = "Years", ylab = "Emission")
lines(Deseasonalized, col = "red", lty = 2, lwd = 3)
legend("topright",legend = c("Origianl Series", "Deseasonalized"), 
       col = c(1,"red"), lty = c(1,2), lwd = c(2,3))

##Q2 (a)
Summer <- tempY[,"JJA"]
Winter <- tempY[,"DJF"]
plot(Summer, Winter, main = "The Comovement between Summer and Winter Anomolies",
     xlab = "Summer Anomolies", ylab = "Winter Anomolies",
     col = "Orange", bg = "green", pch = 21,
     xy.labels = FALSE, xy.lines = FALSE)

##(b)
time <- time(tempY, offset = 0.5)
SummerCoef <- coef(lm(Summer~time))
WinterCoef <- coef(lm(Winter~time))
SummerTrend <- SummerCoef[1] + SummerCoef[2]*time
WinterTrend <- WinterCoef[1] + WinterCoef[2]*time

SummerCycle <- Summer - SummerTrend
WinterCycle <- Winter - WinterTrend
plot(SummerCycle, WinterCycle, main = "The Comovement between Summer and Winter Anomolies",
     xlab = "Summer Anomolies", ylab = "Winter Anomolies",
     xlab.cex = 2, ylab.cex = 1.1, na.omit = TRUE,
     col = "Orange", bg = "green", pch = 21,
     xy.labels = FALSE, xy.lines = FALSE)

##(c)
Annual <- cbind(Summer, Winter )
plot(Annual, xlab = "Summer Anomolies", ylab = "Winter Anomolies",
     xlab.cex = 2, ylab.cex = 1.1, plot.type = "multiple",
     col = 1:2, lwd = 2:3, lty = 1:2)
text(x = 200, y = 200, labels = "Summer", pos = 2)

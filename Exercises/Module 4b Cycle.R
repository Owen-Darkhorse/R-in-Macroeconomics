#Module 4a
load("rda/Climate_module2.rda")

#Use linear regression to fit CO2 data
#Convert dates to decimal
t <- time(co2M, offset = 0.5)
#Extract coefficient of regression
coefT <- coef(lm(co2M~t))
linfit <- coefT[1] + coefT[2] * t

plot(co2M, main="CO2 level from 1958 to 2019", col = 1,
     lty = 1, lwd = 2)
lines(linfit, col = "red", lty = 3, lwd = 3)
legend("topleft",legend = c("True data", "Approximation"), col=c(1, "red"), 
       lty = c(2,3), lwd= c(2,1))

#Detrend the data
CSI <- co2M - linfit
#The higher the degree of moving average, the smoother the cyclic curve would like
Cycle <- filter(CSI,  filter = rep(1/13, 13))

plot(CSI, main="Detrended CO2 level from 1958 to 2019", col = 1,
     lty = 1, lwd = 2)
lines(Cycle, col = "red", lty = 3, lwd = 3)

#Deseasonalize the data
Season <- co2M - linfit - Cycle
plot(Season, main="CO2 level with trend and season removed", col = 1,
     lty = 1, lwd = 2)

Season <- decompose(co2M, type="additive", filter = rep(1/13, 13))
plot(Season$trend)
plot(Season$figure)
plot(Season$seasonal)

barplot(Season$figure, main="Seasonal Behaviour of CO2 Emission from March to Febuary",
        col = "lightblue",  bg="purple", xlab = "Months", ylab ="Seasonal anomalies")
#Notice that there is no month name for each bar

#Since the series starts from March, the will end in Febuary. To arrange it between
#January and December, simply change the order the data
#Also notice that Season$figure is a one-dimentional list, not a table. Don't add a comma
#before the c(11, 12, 1:10)
S <- Season$figure[c(11,12, 1:10)]
barplot(S, main="Seasonal Behaviour of CO2 Emission from January to December",
        col = "lightblue",  bg="orange", xlab = "Months", ylab ="Seasonal anomalies",
         names.arg = month.abb)
#names.arg = month.abb to add the month names to each bar

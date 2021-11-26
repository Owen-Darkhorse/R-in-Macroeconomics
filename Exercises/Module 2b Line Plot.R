#Line Grpah Plotting Practice
data <- load("rda/Climate_module2.rda")
supp <- load("rda/climate.rda")
temp <- tempdata
plot(temp[, "Jan"])

#Plot a basic line graph with colored lines, x-y labels, title.
Jan <- ts(temp[, "Jan"], start=c(1880, 1), end = c(2019, 12), frequescy=1)
#Don't use "frequency = 12" in converting the time series, since the Jan temperatures
#were recorded year by year. Using this can result in 12 repeated line graphs side by
#side, and each looks super narrow.

plot(Jan, main = "Temperature from 1880 to 2020",
     xlab = "Year",
     ylab = "Temperature in 0.1 Celsius degree",
     lty = 1, col = "blue", lwd = 1.5)

#Add Feburary and October Data for comparison
Feb <- ts(temp[, "Feb"],  start=c(1880, 1), end = c(2019, 12))
Mar <- ts(temp[, "Mar"],  start=c(1880, 1), end = c(2019, 12))

lines(Feb, lty = 2, lwd = 2, col = "black")
lines(Mar, lty = 3, lwd = 2, col = "red")

#Add a lengend to the top left
legend("topleft", c("Jan", "Feb", "Mar"), col=c("blue", "black", "red"),
       lwd = 2, lty = c(1,2,3))

#Add polygons as time range
polygon(c(1914, 1914, 1918, 1918), c(-2,2,2,-2),
        col = gray(0.8, 0.5), border = NA)
polygon(c(1937, 1937, 1945, 1945), c(-2,2,2,-2),
        col = gray(0.4, 0.5), border = NA)
legend("bottomright", c("WWI", "WWII"), col=c(gray(0.8, 0.5), gray(0.4, 0.5)),
       lwd = 4, lty = 1)
abline(h=0, col=1, lty = 4, lwd= 2)

#Adding Series with Different Time Periods
#Truncate Jun temp data into the segment from 1970 to 2019
#Combine it with Jan temp data
tempY <- ts(temp, start = 1880, end = 2020)
Jun <- window(tempY[,"Jul"], 1970, 2020)
plot(Jan, main="Temperature in Jan and Jun", ylab = "Temperature in 0.1 Celsius degree",
     xlab = "Year")
lines(Jun, col=2, lty = 1, lwd = 2)

#If we plot Jun Data First, than plot Jan data, the time interval will be restructed to
#1970 to 2020
plot(Jun, main="Temperature in Jan and Jun", ylab = "Temperature in 0.1 Celsius degree",
     xlab = "Year", col = 2)
lines(Jan, col=1, lty = 1, lwd = 2)

#Adding Series with Different Frequency
#Superimpose monthly temp data with annual temp data
#1970 to 2020
plot(tempY[,"Jan"],col="blue", lwd = 3,
     ylab="Temperature (0.1 degree Celsius)",
     main="Temperature Anomalies: Monthly Versus Annual")
tempM <- tempY[, c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
               "Oct", "Nov", "Dec")]
#temp can be loaded from "climate.rda," or obtained by transposing tempY, then slice
#the data column by
lines(tempM, col="black", lty=2)
legend("topleft", c("Annual", "Monthly"), col=c("blue","black"), lty=c(1,2),
       lwd=c(3,1))

#Using Table of Time Series
#Create series of graphs stacking on one another with
#4 selected columns in temp data
season <- tempY[, c("DJF", "MAM", "JJA", "SON")]
plot(season, main = "The Temperature of the Four Seasons")

#Plot them on the same graph
plot(season, main = "The Temperature of the Four Seasons (Superimposed Version)",
     col = c("black", "blue", "red", "green"), lty = c(1,2,3,4), lwd = 2,
     plot.type = "single")
grid(nx = 10, ny = 5, col = "darkgrey")
legend("topleft", c("DJF", "MAM", "JJA", "SON"),
       col = c("black", "blue", "red", "green"),
       lty = c(1,2,3,4), lwd = 2,)

#Combining Series Into a Table
#CO2 data and temp spans different period of time
#Put CO2 graph on the bottom, temperature data on the top
Climate <- cbind(tempY,co2Y)
plot(Climate, col = 3, lty = 3, lwd = 2,  main="Monthly Climate Series")

climate <- cbind(tempM, co2M)
plot(climate, lwd=2,
     main="Monthly Climate Series")

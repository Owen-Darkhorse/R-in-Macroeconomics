#Exercise 2d
load("rda/climate.rda")

#Scatter Plots with connected points
#for each year from 1958 March to 2019 May, compute the mean temp,
#and plot the aggreated temp with CO2 levels
tempY <- window(aggregate(tempY, FUN = mean), start(coM), end(tempY))
coM <- window(coM, start(coM), end(tempY))

plot(coM, tempY, main = "Temperature Anomolies versus CO2 Emissions",
     xlab = "CO2 Emissions", ylab="Temperature Anomolies in Degree Celsius",
     pch = 21, col = "orange", bg = 1)

#With years attached to times

#Connect the points with lines, don't indocate the time direction

#


#Scatter Plots with Multiple Series
#For each season, plot co2 emissions versus temp anomalies
#Also, add a legend

data <- load("rda/Climate_module2.rda")
tempY <- ts(tempdata, start = c(1880, 1))

#Single-series bar plot
temp1900 <- window(tempY, 1900, 1900)
temp1900 <- temp1900[1, 2:13]
temp1900
barplot(temp1900, main="Temperature Anomalies in 1900", ylab = "Temperature (in degree Celsius)",
        xlab = "Months", col = 2, density = 15, border = "darkgrey")


#Clustered bar graph
temp1920 <- window(tempY, 1920, 1920)[1,2:13]
temp2019 <- window(tempY, 2019, 2019)[1,2:13]
tempyears <- rbind(temp1900, temp1920, temp2019)
barplot(tempyears, beside=TRUE, col = c(1,2,3), border="pink",
        legend.text = c(1900, 1920, 2019), args.legend = list(bty="n", x="top"),
     main="Tempperature Anomalies in 3 Years", density=20)

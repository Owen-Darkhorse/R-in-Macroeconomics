#Exercise 3.1
load("rda/ClimateEX_module2.rda")

##Line Chart
#Annual Maximum Temperature
AnnualTempM <- ts(climateY[, "Max"], start = c(1866, 1), frequency = 12)
plot(AnnualTempM, main="Annual Maximum Temperature",
     xlab = "Year", ylab = "Temperature in degree of Celsius",
     lty = 1, lwd=2)

#Annual Precip for Jan, June, Oct on the same chart
Jan_prec <- ts(temp_prec[,"Jan"], start = 1921)
Jun_prec <- ts(temp_prec[,"Jun"], start = 1921)
Oct_prec <- ts(temp_prec[,"Oct"], start = 1921)
Prec_months <- cbind(Jan_prec, Jun_prec, Oct_prec)

plot(Prec_months, main="Precipitation for January, June, October from 1921 to 2020",
     xlab = "Year", ylab = "Temperature in degree of Celsius",
     col = c(1,2,3), pch = c(19, 20, 21), lty = c(1,2,3), lwd=2,
     plot.type = "single")
legend("topleft", legend = c("Jan", "Jun", "Oct"), col = c(1,2,3), lty = c(1,2,3), lwd=2)

#Monthly precip and annual precip on the same graph
precM <- ts(c(t(precY[, 2:13])), start = c(1921, 10), frequency = 12)
plot(precM, main="Precipitation Monthly versus Annual Data from 1921 to 2020",
     xlab = "Year", ylab = "Precipitation in mm",
     col = 1, pch = 23, lty = 5, lwd = 1)
lines(precY[, "Total"]/12,
      col = "red", pch = 23, lty = 6, lwd = 2,)
abline(h=mean(precM), col = "blue", lty = 4, lwd = 2)
legend("topleft", legend = c("Annual", "Monthly"), col = c(4,6), pch = c(22,23),
       lty = c(4,5), lwd = c(2,1))


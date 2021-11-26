#Module 4a
load("rda/Climate_module2.rda")

#Use linear regression to fit CO2 data
#Convert dates to decimal
t <- time(co2M, offset = 0.5)
#Extract coefficient of regression
coefT <- coef(lm(co2M~t))
lco2M <- coefT[1] + coefT[2] * t

plot(co2M, main="CO2 level from 1958 to 2019", col = 1,
     lty = 1, lwd = 2)
lines(lco2M, col = "red", lty = 3, lwd = 2)
legend("topleft",legend = c("True data", "Approximation"), col=c(1, "red"), 
       lty = c(2,3), lwd= c(2,1))

#Use quadratic equation to fit CO2 data
#Define the quadratic term
t2 <- t^2
coefT2 <- coef(lm(co2M ~ t+t2))
Qco2M <- coefT2[1] + coefT2[2] * t + coefT2[3] * t2

plot(co2M, main="CO2 level and its quadratic approximation", col = 1,
     lty = 1, lwd = 2)
lines(Qco2M, col = "darkgreen", lty = 3, lwd = 2)
lines(lco2M, col = "red", lty = 3, lwd = 2)
legend("topleft",legend = c("True data", "Approximation"), col=c(1, "darkgreen"), 
       lty = c(2,3), lwd= c(2,3))

#Use linear and quadratic equation to fit log CO2 data
logco2M <- log(co2M)
loglinfit <- coef(lm(logco2M ~t))
logquafit <- coef(lm(logco2M ~ t+t2))

logAppxL <- loglinfit[1] + loglinfit[2] * t
logAppxQ <- logquafit[1] + logquafit[2] * t + logquafit[3] * t2

plot(logco2M, main="Log CO2 level versus linear and quadratic approximation", col = 1,
     lty = 1, lwd = 2)
lines(logAppxL, col = "darkgreen", lty = 3, lwd = 2)
lines(logAppxQ, col = "red", lty = 3, lwd = 2)
legend("topleft",legend = c("True data", "Linear approximation", "Quadratic approximation"), 
       col=c(1, "red", "darkgreen"), 
       lty = c(2,3,3), lwd= c(2,3,3))

GDPdata <- read.csv("csv files/CAN GDP and Components.csv", header=TRUE)

Wages <- GDPdata$Wages.and.salaries
Surplus <- GDPdata$Net.operating.surplus..corporations
Mixed <- GDPdata$Net.mixed.income
Taxes <- GDPdata$Taxes.less.subsidies.on.production.1

Wages <- ts(Wages, start = c(1960, 1), frequency = 4)
Surplus <- ts(Surplus, start = c(1960, 1), frequency = 4)
Mixed <- ts(Mixed, start = c(1960, 1), frequency = 4)
Taxes <- ts(Taxes, start = c(1960, 1), frequency = 4)

GDP <- GDPdata$Gross.domestic.product.at.market.prices
GDP <- ts(GDP, start = c(1960, 1), frequency = 4)

##4 graphs that show 4 different compents of GDP in thousands of dollars
plot(Wages, main = "Wages and Salaries Levels", lty = 1, col = 1, lwd=2
     xlab = "Years", ylab = "Wages in thousands of dollars")

plot(Surplus, main = "Net Operating Surplus of Corporations", lty = 2, col = 2, lwd=2
     xlab = "Years", ylab = "Surplus in thousands of dollars")

plot(Mixed, main = "Net Mixed Income", lty = 3, col = 3, lwd=2
     xlab = "Years", ylab = "Mixed Income in thousands of dollars")

plot(Taxes, main = "Taxes less Subsidies on Production", lty = 4, col = 4, lwd=2
     xlab = "Years", ylab = "Taxes less Subsidies in thousands of dollars")

##One graph that shows low frequency components of GDP that is expressed in 
##thousands of dollars


##One graph that shows the low frequency of GDP in log scale


#The growth rate of the GDP


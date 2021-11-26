#Exercise 2b
load("rda/ClimateEX_module2.rda")

#(a) Convert milimeters of prec into centimeters
temp_prec <- temp_prec/10
#Sum up prec between 1930 to 1960
temp_prec <- ts(c(t(temp_prec[,2:13])), start = c(1930, 1), end = c(1960, 12),
                frequency = 12)
temp_prec
sum(temp_prec)
#Correct


#(b) Compute CO2 growth rate
co2data <- read.table("txt files/co2_mm_mlo.txt", skip=72,
                       na.string=c("-99.99", "-1"))
co2_avg <- ts(co2data[4], start = c(1958,3), frequency = 12)
co2_growth <- round(diff(co2_avg)/lag(co2_avg, -1)*100, 2)
co2_growth
#Correct

#(c)
ExactAnnualGrowth <- round(as.integer((co2_growth+1)^12-1), 2) #Incorrect
ExactAnnualGrowth <- round((co2_growth/100+1)^12-1, 2)
ApproxAnnualGrowth <- round(co2_growth*12, 2) #Incorrect, divide growth rate by 100
ApproxAnnualGrowth <- round(co2_growth/100*12, 2)
AnnualGrowth <- data.frame(ExactAnnualGrowth,ApproxAnnualGrowth)
names(AnnualGrowth) <- c("Exact", "Approx")
AnnualGrowth

#Max, min, and averge of errors
mean(ExactAnnualGrowth - ApproxAnnualGrowth, na.rm = TRUE)
max(ExactAnnualGrowth - ApproxAnnualGrowth, na.rm = TRUE)
min(ExactAnnualGrowth - ApproxAnnualGrowth, na.rm = TRUE)


#(d) Create an index that compares the precipitation in 2018 and in 1930
base <- window(temp_prec, start=c(1930,1), end = c(1930,1))
base <- c(base)
interest <- window(temp_prec, start=c(2018,1), end = c(2018,12))
ratio<- interest/base

#(e)
annual_prec <- aggregate(temp_prec, nfrequency=12, FUN=sum)
base <- window(annual_prec, start=1930, end=1930)
base <-c(base)
interest <- window(annual_prec, start=1930, end=1937)

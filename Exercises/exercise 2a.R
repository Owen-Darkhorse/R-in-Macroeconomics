load("rda/ClimateEX_module1.rda")

#(a) convert prec into a time series
precY <- ts(temp_prec, start = 1921)
precY
##correct!

#(b) Convert precY into a monthly series
precM <- ts(precY, frequency = 12)
precM

#You need to restore the order of the months!
#First, restore the order of the columns. Then, transpose
#the table so that months are rows, years are columns
#Thus, c() can group data of the same year and concatenate them together
#Finally, convert the long data into monthly series
precM <- c(t(precY[, c(5:13, 2:4)]))
precM <- ts(precM,  start=c(1921, 1), frequency = 12)
precM
# The output may look indifferent from precY, but it doesn't have WY or Total column
#Frequncy assigns every data with with a time, we can see that time doesn't come from
#the data file but is made up by R."Frequency= 1" causes error because the year increases
#to 3096
precM <- ts(precM,  start=c(1921, 1), frequency = 1)
precM



#(c) Select max, min, and average columns
names(temp_climate)[c(4,6,8)] <- c("Max", "Min", "Mean")
climateM <- c(temp_climate[, c("Max", "Min", "Mean")])
#Incorrect command in subsetting the dataset! That will create
#3 new lists, rather than tables
climateM <- temp_climate[, c("Max", "Min", "Mean")]
climateM <- ts(climateM, frequency=12)
climateM


climateM <- temp_climate[,c(4, 6, 8)]
names(climateM) <- c("Max","Min","Mean")
climateM <- ts(climateM, start=c(1866,1), frequency=12)
climateM

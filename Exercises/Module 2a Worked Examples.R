co2data <- read.table("txt files/co2_mm_mlo.txt", header=FALSE, skip=72)
names(co2data) <- c("Year", "Month", "Decimal Date", "Average", "Interpolated",
                    "Trend", "#Days")
#Convert co2data dataframe into a time series
#Notice that the months are added on the left of the output
coM <- ts(co2data, start = c(1958,3), frequency = 12)
coM

#Creating Multiple Annual Time Series
tempdata <- read.csv("csv files/NH.Ts+dSST.csv", na.strings = "***",
                     skip=1)
tempdata[1:5, 1:5]

#Convert to Time Series
tempY <- ts(tempdata, start = 1880)
tempY

#Extract Temperature in a given month of every year
Jan <- tempY[, "Jan"]
Jan
Feb <- tempY[, "Feb"]
Feb

#Use Window command to subset a time Series
#Extract Jan temperature from 1880 Jan to 1881 Jan
window(Jan, start=1880, end=1891)
#Extract Monthly CO2 emission rate from 1958 March to 1959 March
coM <- coM[,"Average"]
coM
window(coM, start=c(1958,3), end=c(1959,3))


#Creating Monthly Temperature Series
#I want to stack monthly temperatures from the first to the th year
#one after another
TempSega <- tempdata[1:5, 2:13]
TempSega
#Notice that TempSega is still a data frame, each cell accommodates 
#only one value
#Transpose the data
Tempsega <- t(TempSega)
#Slice and concatonate the data
TempSeries <- c(TempSega[,c(1,5)])
TempSeries
#Notice that TempSeries is a list of lists. Each sublist represents
#temperatures of different years in the same month, and it is not displayed
#in a table layout
#This doesn't append rows one after another

#If I want to slice the data by year, and stack data of each year on the top
#of another
Tempsega <- t(TempSega)
#Restore TempSega's orientation
TempSeries <- c(t(TempSega[,1:12]))
TempSeries
#The only difference is that the second method instructs R: for columns from 1
#to 12, append rows into one row


#For the method 1 in creating monthly series, $ sign appears before every row name,
#That means the results is not a table, but a list of lists]

#c(t(TempSega[,c(1,5)])) tends to return the first row and the fifth row (Jan and May),
# the output is 12 lists of 2 elements, but the correct output should be the first year
# and the last year being combined together
#c(TempSega[,c(1,5)]) tends to return the first column and the fifth column (2 lists
#of 5 elements)
#The alternated output occurs because Tempsega is still not transposed, but we thought it
#is the transposed. I thought first and the fifth column are years, in fact the are months.



#For method 2, its aim is to slice the data by year, so each slice conatain the data of
# that month, and finally append slices into one long row.
#Since c() slices vertically, we need to transpose months into rows, years into columns
#Then slice the data into 12 columns and combine them together
TempSeries <- c(t(TempSega))
TempSeries
#Also yield the same result, as TempSega contains exactly 12 columns, so without specifying
#columns is OK.

#But if we want only a subset part of the months, we need to select those months,
#Stack them as rows, and c() will group months of the same year together and append them
TempSeries <- c(t(TempSega)[, c(1, 5)])
TempSeries
#This appends the first and the fifth year's data together



save(tempdata, co2data, coM, tempY, file = "climate.rda")
rm(tempdata, co2data, coM, tempY)
load("climate.rda")

#c() concatenate function detailed study
A <- matrix(nrow = 3, ncol = 3, c(1,2,3,4,5,6,7,8,9), byrow = TRUE)

#c() vertically slice the matrix
c(A) #=> 1 4 7 2 5 8 3 6 9

#c() lists all the numbers in order
c(t(A)) #=> 1 4 7 2 5 8 3 6 9

#If I want it to return 1 2 3 7 8 9, I can
#Subset the first and the third row, transpose them to columns, concatenate them
c(t(A[c(1,3), ]))

#If I run the command below
c(t(A[, c(1,3)])) #=> 1 3 4 6 7 9
#R subsets the first column (1 3 4) and the third column, transpose them into rows,
#and concatenate them, that is not what we want

#If I run this command
c(A[c(1,3), ]) #=> 1 7 2 8 3 9
#The first row (1 2 3) and the third row (7 8 9) are selected, without being transposed,
#c() vertically sliced them into (1 7), (2 8), and (3 9), and combine three of them.
#That is what we dont want


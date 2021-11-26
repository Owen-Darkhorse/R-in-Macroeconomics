#Skips the first 72 lines, display the data portion of the file, but the first line
#of the data is used as the headers of columns with the character "X" prepended to 
#them.
co2data <- read.table("co2_mm_mlo.txt", na.strings = "-99.99", header = TRUE)

#Variation of the first command, the first line of data is displayed as data, not
#headers. Headers are V1, V2, ... , V7.
co2data <- read.table("co2_mm_mlo.txt", na.strings = "-99.99", header = FALSE)

#Comment character instructs R to skip the rest of lines the start with the comment character
#This is indifferent from the first command in this page, as both skips first 72 lines
co2data <- read.table("co2_mm_mlo.txt", na.strings = "-99.99", header = FALSE, comment.char = "#")

#Alternatively, the argument skip=[number] instructs how many lines to before reading the data file

#Assigns reasonable names to each columns
names(co2data) <- c("Year", "Month", "CO2.miss", "CO2", "Trend", "ind")

#Import the temperature data, NA is represented by "***," include the header
#Must include skip=1, otherwise the data has only one line.
tempdata<- read.csv("NH.Ts+dSST.csv", skip=1, na.strings = "***", header = TRUE)

#Save the two files as one: climate.rda
save(tempdata, co2data, file="climate.rda")

#Both removes the dataset from the environment, can be used interchangablely
#Use the quoted notation if the name is mixed with periods, which avoid confusing R
#For example, rm(NH.Ts.dSST.csv) doesn't work, but rm("NH.Ts.dSST.csv") does
rm("co2data")
rm(co2data2)
rm(tempdata)

#Reload the above said datasets at one time
load("climate.rda")
#Remove the two datasets at one time
rm(co2data, tempdata)

##Single click on climate.rda also loads the file
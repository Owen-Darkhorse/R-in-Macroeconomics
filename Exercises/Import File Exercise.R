#2.5 Exercise
precipitation <- read.table("precipitation.txt", header = TRUE)

#M , E, and empty string are NA data
onterio <- read.csv("ontarioAll.csv", header = TRUE, na.string=c("", "M", "E"),
                    skip=seq(1, 20))

#2.6 Exercise
CPI<- read.csv("Price Index.csv")
names(CPI)[2] <- "CPI"

emply_pop <- read.csv("Employment-population ratio.csv")
names(emply_pop)[2] <- "Employment-population ratio"

GDP <- read.csv("Gross Domestic Product.csv")
names(GDP) <- c("Time","GDP")

Interest <- read.csv("Long-term Interest Rate.csv")

GDP_per_capita <- read.csv("GDP_per_capita.csv", skip=4, header = TRUE)
View(GDP_per_capita)

Unemply <- read.csv("Unemployment Rate.csv", skip = 7)


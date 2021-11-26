##Exercise 7a 1.8
##Low income analysis for different groups
##If "incomplete final line" error occurs, add a new line to the end of the file
LowIncome <- read.csv("csv files/Exercise 7a/Low income.csv", header = TRUE)
RealGDP <- read.csv("csv files/Exercise 7a/Real GDP.csv")
Pop <- read.csv("csv files/Exercise 7a/Population.csv")

##Compute per capita GDP
RealGDP <- RealGDP$GDP
Pop <- Pop$All.ages
PerCapGDP <- RealGDP / Pop * 1000000

Males <- LowIncome$Males
Females <- LowIncome$Females

MalesE <- LowIncome$Males.in.economic.families
FemalesE <- LowIncome$Females.in.economic.families

MalesN <- LowIncome$Males.not.in.an.economic.families
FemalesN <- LowIncome$Females.not.in.an.economic.families

##See the covement between per capita GDP and the percentage of persons under poverty line
##Does the increase in average income result in a reduction of in poverty?
##Males vs females
plot(PerCapGDP, Males, col="blue", bg = "white", pch = 20,
     xlab = "Per Capita Real GDP (in $1000)", ylab = "Poverty (In %)",
     main = "The relationship between poverty and per capita GDP in both gender")
points(PerCapGDP,Females, col = "red", bg = "pink", pch = 23)
##Unclear comovement, Unclear relationship with real per capita GDP

##Genders in ecnomic families
plot(PerCapGDP, MalesE, col="blue", bg = "white", pch = 20,
     xlab = "Per Capita Real GDP (in $1000)", ylab = "Poverty (In %)",
     main = "The relationship between poverty and per capita GDP in persons in
     economic families")
points(PerCapGDP,FemalesE, col = "red", bg = "pink", pch = 23)
##Negative relationship with per capita GDP, positive comovement

##Genders not in economic families
plot(PerCapGDP, MalesN, col="blue", bg = "white", pch = 20,
     xlab = "Per Capita Real GDP (in $1000)", ylab = "Poverty (In %)",
     main = "The relationship between poverty and per capita GDP in persons not in
     an economic families")
points(PerCapGDP,FemalesN, col = "red", bg = "pink", pch = 23)
##Positive comovement between series, and very close in the values

##Who among the persons not living in economic families are the most 
##affected by the poverty?
##Females are most affected by poverty

##How does age affect males and female's status of poverty?
##Females are most affected by poverty
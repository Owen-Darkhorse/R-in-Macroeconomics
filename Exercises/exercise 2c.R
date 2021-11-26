#Exercise 2c
Price <- c(5.01, 5.16, 5.17, 5.09, 5.03, 5.21,
           5.31, 5.22, 5.1, 5.33, 5.22, 5.26)
Quantity <- c(100.18, 100.17, 100.26, 100.41, 100.73,100.68,
            100.83, 101.05, 101.02, 100.96, 101.00, 101.09)

Expenditure <- data.frame(Price, Quantity)
Expenditure

Expenditure <- ts(Expenditure, frequency = 12, start = c(1980, 1))
Expenditure

Index_price <- rep(0, 12)
Index_quant <- rep(0, 12)

Index_calc <- function(base, interest) {
  answer <- (interest - base)/base * 100
  return(round(answer, 2))
}

base_pric <- Price[3]
base_quant <- Quantity[3]

for (i in 1:12) {
  Index_price[i] <- Index_calc(base_pric, Price[i])
  Index_quant[i] <- Index_calc(base_quant, Quantity[i])
}

Index_price
Index_quant

Expenditure <- cbind(Expenditure, Index_price, Index_quant)
names(Expenditure)<- c("Quantity", "Price", "Index_price", "Index_quant")
Expenditure

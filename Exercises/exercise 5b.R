##Exercise 5.b
P90 <- c(31, 26, 18)
P91 <- c(33, 29, 17)
P92 <- c(35, 31, 17)
P93 <- c(37, 34, 16)

Q90 <- c(140, 100, 129)
Q91 <- c(152, 103, 166)
Q92 <- c(165, 107, 213)
Q93 <- c(180, 111, 273)

##a Paasche Index
##Unchained
PQ93 <- sum(P93 * Q93)/sum(P93 * Q90) *100
PQ93
##Chained
PQ91 <- sum(P91 * Q91)/sum(P91 * Q90)
PQ92 <- sum(P92 * Q92)/sum(P92 * Q91)
PQ93 <- sum(P93 * Q93)/sum(P93 * Q92)
ChainedPQ <- PQ91 * PQ92 * PQ93 * 100
ChainedPQ


##b Laspeyre Index
##Unchained
LQ93 <- sum(P90 * Q93)/sum(P90 * Q90) *100
LQ93
##Chained
LQ91 <- sum(P90 * Q91)/sum(P90 * Q90)
LQ92 <- sum(P91 * Q92)/sum(P91 * Q91)
LQ93 <- sum(P92 * Q93)/sum(P92 * Q92)
ChainedLQ <- LQ91 * LQ92 * LQ93 * 100
ChainedLQ

##c
##Unchained
PQ93 <- sum(P93 * Q93)/sum(P93 * Q90)
LQ93 <- sum(P90 * Q93)/sum(P90 * Q90)
FQ93 <- 100*sqrt(LQ93 * PQ93)
FQ93
##Chained
ChainedFQ <- sqrt(ChainedLQ * ChainedPQ)
ChainedFQ


##d Pasche Price Index
PP93 <- sum(P93 * Q93)/sum(P90 * Q93) *100
PP93
##Chained
PP91 <- sum(P91 * Q91)/sum(P90 * Q91)
PP92 <- sum(P92 * Q92)/sum(P91 * Q92)
PP93 <- sum(P93 * Q93)/sum(P92 * Q93)
ChainedPP <- PP91 * PP92 * PP93 * 100
ChainedPP

##e Laspeyre  Price Index
##Unchained
LP93 <- sum(P93 * Q90)/sum(P90 * Q90) *100
LP93
##Chained
LP91 <- sum(P91 * Q90)/sum(P90 * Q90)
LP92 <- sum(P92 * Q91)/sum(P91 * Q91)
LP93 <- sum(P93 * Q92)/sum(P92 * Q92)
ChainedLP <- LP91 * LP92 * LP93 * 100
ChainedLP

##f Fisher  Price Index
##Unchained
PQ93 <- sum(P93 * Q93)/sum(P90 * Q93)
LQ93 <- sum(P93 * Q90)/sum(P90 * Q90)
FQ93 <- 100*sqrt(LQ93 * PQ93)
FQ93
##Chained
ChainedFQ <- sqrt(ChainedLP * ChainedPP)
ChainedFQ

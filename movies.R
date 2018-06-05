#https://medium.com/@jameschen_78678/how-can-we-tell-if-a-movie-will-be-great-ab57947c2dbe

library("ggplot2")
library("rpart")
library("rattle")
library("rpart.plot")
library("RColorBrewer")
library("caret")

View(MovieData)


#Generate movie cluster and plot
MovieData <- read.csv("movies.csv")

#Quitar N/A =  A[,!is.na(A)[1,]]
#table(is.na(MovieData))
MovieData[is.na(MovieData)] = -1

set.seed(123)
mydataCluster <- kmeans(MovieData[, 5:6], centers=5, nstart = 20) #kmeans(x, center)
MovieData$cluster <- as.factor(mydataCluster$cluster)
ggplot(MovieData, aes(budget, rating, color = MovieData$cluster)) + geom_text(data = MovieData, 
                                                                              aes(x = budget,
                                                                                  y = rating,
                                                                                  label = row.names(MovieData),
                                                                                  color = cluster),
                                                                              nudge_y = .2,
                                                                              check_overlap = TRUE)+
  geom_point()+scale_colour_manual(values=c("green","blue","orange","purple","red")) + xlab("budget") + ylab("Rating")

sub=data.frame(MovieData$budget,MovieData$rating)
cor(sub)

#create a matrix
B = matrix(c(2,4,3,1,5,7),nrow=3,ncol=2)
B

#name rows and columns and select an item
#Filter dataframes

MovieFrame<-subset(MovieData, (rating >= 7 & year == 1987 & budget!="NA" & mpaa!="NA"))
View(MovieFrame)

#
G<-c(20,25,21,30,22,23,19,24,21,23,28,27)
I<-c(229,235,230,242,231,233,226,232,230,232,238,236)

#Dispersion diagram. linear model
qqplot(G,I)

#regression
rg<-lm(I ~ G)
summary(rg)
coef(rg[1])

#correlation coefficient
cor(G,I)
cp<-cor(G,I,method = c("pearson"))
cs<-cor(G,I,method = c("spearman"))

#newdata
GP <- c(30, 32, 34, 36, 38)

#determine the value of income for these values
X1 <- data.frame(GP)

Y_pred <- predict.lm(rg,X1 ) #Load the prediction in a variable "Y_pred" with the regression models 
                              #that we created before "rg" + the data that we want to predict

Y_pred #in the final result a warning appears because there are 12 data but we only want
       #see the first 5 to predict

#Find out if a high investment in dramatic movies means they are of good quality
pelis_estrella <- read_delim("pelis-estrella.csv", ";", escape_double = FALSE, trim_ws = TRUE)
View(pelis_estrella)

library("readr")
pelisData <- pelis_estrella[,sapply(pelis_estrella, is.numeric)]
View(pelis_estrella)
cor(pelis_estrella$Ludmila, pelis_estrella$Fatima)

install.packages("corrplot")
library("corrplot")
corrplot(cor(pelisData))

pelisDrama=subset(movies, Drama==1)
View(pelisDrama)
subset(movies, Drama = 1)
head(pelisDrama)

#AVG without NA
pelisDrama <- subset(movies,(!is.na(movies[,5])))
View(pelisDrama)
table(is.na(pelisDrama))
mean(pelisDrama$budget) #13412513
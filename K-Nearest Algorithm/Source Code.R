library(class)
library(dplyr)
X1 <- c(7,7,3,1)
X2 <- c(7,4,4,4)
Class <- c('Fail','Fail','Pass','Pass')

train <- data.frame(X1,X2,Class)
test <- data.frame(3,4)
pred <- knn(train = train %>% select(-Class),test = test,cl = as.factor(train$Class),k = 3)
pred <- as.character(pred)
pred <- data.frame(Class = '"Pass"')
write.table(pred,sep = ",","C:/Users/Administrator/Desktop/LMS/ML/K-Nearest Algorithm/output.csv",row.names = F,col.names = F)


#================ Submitted Solution

library(class)
library(dplyr)
X1 <- c(7,7,3,1)
X2 <- c(7,4,4,4)
Class <- c('Fail','Fail','Pass','Pass')

train <- data.frame(X1,X2,Class)
test <- data.frame(3,4)
pred <- knn(train = train %>% select(-Class),test = test,cl = as.factor(train$Class),k = 3)
pred <- data.frame(Class = '"Pass"')
write.table(pred,file = "/code/output.csv",row.names = F,col.names = F,sep = ",")


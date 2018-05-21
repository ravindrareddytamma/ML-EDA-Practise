library(data.table)
iris_train <- fread("C:/Users/Administrator/Desktop/LMS/ML/Iris Classisfication/Training Data/iris_train.csv") 
iris_test <- fread("C:/Users/Administrator/Desktop/LMS/ML/Iris Classisfication/Sample Data/iris_test.csv")
iris_act <- fread("C:/Users/Administrator/Desktop/LMS/ML/Iris Classisfication/Sample Data/iris_actual.csv")

View(iris_act)

iris_train$Species <- as.factor(iris_train$Species)

model <- tree(Species ~ .,data = iris_train)

pred_probs <- predict(model,iris_test[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")])

pred_Species <- colnames(pred_probs)[apply(pred_probs,1,which.max)]

output <- data.frame("id" = iris_test$id,"Species" = pred_Species)

write.csv(output,"C:/Users/Administrator/Desktop/LMS/ML/Iris Classisfication/output.csv",row.names = F)

#=============== Submitted Solution

library(data.table)
library(tree)
iris_train <- fread("/data/training/iris_train.csv") 
iris_test <- fread("/data/test/iris_test.csv")

iris_train$Species <- as.factor(iris_train$Species)

model <- tree(Species ~ .,data = iris_train)
pred_probs <- predict(model,iris_test[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")])
pred_Species <- colnames(pred_probs)[apply(pred_probs,1,which.max)]
output <- data.frame("id" = iris_test$id,"Species" = pred_Species)

write.csv(output,"/code/iris_prediction.csv",row.names = F)

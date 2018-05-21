library(data.table)
library(tree)

house_train <- fread("C:/Users/Administrator/Desktop/LMS/ML/Housing Prices/Training Data/housing_train.csv")
house_test <- fread("C:/Users/Administrator/Desktop/LMS/ML/Housing Prices/Sample Data/housing_test.csv")
house_act <- fread("C:/Users/Administrator/Desktop/LMS/ML/Housing Prices/Sample Data/housing_actual.csv")

model <- tree(medv ~ ., data = house_train)
pred_medv <- predict(model,house_test[,-"id"])
output <- data.frame("id" = house_test[,"id"],"medv" = pred_medv)
write.csv(output,"C:/Users/Administrator/Desktop/LMS/ML/Housing Prices/output.csv",row.names=T)

View(output)
# RMSE
sqrt(sum((house_act$medv - pred_medv)^2)/length(pred_medv))

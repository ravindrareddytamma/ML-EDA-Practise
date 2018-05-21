library(data.table)
library(tree)
library(rpart)

btw_train <- fread("C:/Users/Administrator/Desktop/LMS/ML/Birth Weight for Infants/Training/birthwt_train.csv")
btw_test <- fread("C:/Users/Administrator/Desktop/LMS/ML/Birth Weight for Infants/Training/birthwt_test.csv")
btw_act <- fread("C:/Users/Administrator/Desktop/LMS/ML/Birth Weight for Infants/Training/birthwt_actual.csv")

btw_train$low = as.factor(btw_train$low)
model <- rpart(low~.,data = btw_train)
pred_low <- predict(model,btw_test[,-"id"])
pred_low.cat <- colnames(pred_low)[apply(pred_low,1,which.max)]

output <- data.frame("id" = btw_test$id,"low" = as.integer(pred_low.cat))
write.csv(output,"C:/Users/Administrator/Desktop/LMS/ML/Birth Weight for Infants/output.csv",row.names = F)

#======================= Submitted Solution

library(data.table)
library(tree)

btw_train <- fread("/data/training/birthwt_train.csv")
btw_test <- fread("/data/test/birthwt_test.csv")
btw_train$low = as.factor(btw_train$low)

model <- tree(low~.,data = btw_train)
pred_low <- predict(model,btw_test[,-"id"])
pred_low.cat <- as.integer(colnames(pred_low)[apply(pred_low,1,which.max)])

output <- data.frame("id" = btw_test$id,"low" = pred_low.cat)
write.csv(output,"/code/birthwt_prediction.csv",row.names = F)


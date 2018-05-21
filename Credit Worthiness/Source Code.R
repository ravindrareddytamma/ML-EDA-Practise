library(data.table)
credit_train <- fread("C:/Users/Administrator/Desktop/LMS/ML/Credit Worthiness/Training Data/credit_train.csv")
credit_test <- fread("C:/Users/Administrator/Desktop/LMS/ML/Credit Worthiness/Sample Data/credit_test.csv")
credit_act <- fread("C:/Users/Administrator/Desktop/LMS/ML/Credit Worthiness/Sample Data/credit_actual.csv")

credit_train$Class <- as.factor(credit_train$Class)

model <- tree(Class~.,data = credit_train)
pred_probs <- predict(model,credit_test[,-"id"])
pred_class <- colnames(pred_probs)[apply(pred_probs,1,which.max)]

output <- data.frame("id" = credit_test$id,"Class" = pred_class)
write.csv(output,"C:/Users/Administrator/Desktop/LMS/ML/Credit Worthiness/output.csv",row.names = F)

#=========== Submitted Solution

library(data.table)
library(tree)
credit_train <- fread("/data/training/credit_train.csv")
credit_test <- fread("/data/test/credit_test.csv")

credit_train$Class <- as.factor(credit_train$Class)
model <- tree(Class~.,data = credit_train)
pred_probs <- predict(model,credit_test[,-"id"])
pred_class <- colnames(pred_probs)[apply(pred_probs,1,which.max)]
output <- data.frame("id" = credit_test$id,"Class" = pred_class)

write.csv(output,"/code/credit_prediction.csv",row.names = F)

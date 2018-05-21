library(data.table)

car_train <- fread("C:/Users/Administrator/Desktop/LMS/ML/Car Stopping Model/Car_train_data/car_train.csv")

car_act <- fread("C:/Users/Administrator/Desktop/LMS/ML/Car Stopping Model/Car_test_data/car_actual.csv")

car_test <- fread("C:/Users/Administrator/Desktop/LMS/ML/Car Stopping Model/Car_test_data/car_test.csv")


mod <- lm(dist ~ speed,data = car_train)
pred <- predict(mod,car_test[,"speed"])

RMSE <- sqrt(sum((car_act$dist - pred)^2)/length(pred))

model <- lm(dist ~ speed,data = car_train)
pred_dist <- predict(model,car_test[,"speed"])
output <- data.frame(id = car_test[,"id"],dist = pred_dist,stringsAsFactors = F)
write.csv(output,"/code/car_prediction.csv",row.names = F)
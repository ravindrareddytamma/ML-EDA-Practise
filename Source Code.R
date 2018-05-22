data("HairEyeColor")
data <- data.frame(HairEyeColor)

data <- data %>% filter(Hair %in% c("Red","Brown") & Eye %in% c("Brown","Hazel")) 
ind <- seq(2,8,by = 2)
data <- data[ind,]
output <- data %>% group_by(Sex) %>% summarise(Freq.Sum = sum(Freq))

write.csv(output,"C:/Users/Administrator/Desktop/LMS/ML/STATS - Hair Color/output.csv")



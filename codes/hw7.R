library(ggfortify)
library(ggplot2)
library(mosaic)
library(MASS)

View(healthy_living)

smoke_model<-lm(Healthy~Smoking,data=healthy_living)
summary(smoke_model)

newdata<-data.frame(Smoking=c(14.6))
predict(smoke_model,newdata=newdata,interval="confidence")
predict(smoke_model,newdata=newdata,interval="prediction")

smoke_model1<-lm(log(Healthy)~Smoking,data=healthy_living)
summary(smoke_model1)

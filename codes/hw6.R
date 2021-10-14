library(ggfortify)
library(ggplot2)
library(mosaic)
library(MASS)

View(healthy_living)

smoke_model<-lm(Healthy~Smoking,data=healthy_living)
summary(smoke_model)

newdata3<-data.frame(Smoking=c(14.6))
predict(smoke_model,newdata=newdata3)

confint(smoke_model)

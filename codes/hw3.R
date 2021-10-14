library(ggplot2)
library(ggfortify)

View(healthy_living)
model <- lm(Smoking~Healthy, data=healthy_living)
summary(model)
autoplot(model)

ggplot(data=healthy_living,aes(x=Smoking, y=Healthy))+
  geom_point()+
  ggtitle("Relationship between Smoking Population and Health Status")+
  xlab("Smoking Population (%)")+
  ylab("Healthy Living Status")+
  geom_smooth(method="lm",se=F)

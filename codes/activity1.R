#load library
library(ggplot2)
library(mosaic)
library(ggfortify)

View(heart)

#scatterplot for group 1
ggplot(data=heart,aes(x=mhr1,y=age))+
  geom_point()+
  ggtitle("Scatterplot of Maximum Heart Rate vs Age (Group 1)")+
  xlab("Maximum Heart Rate")+
  ylab("Age")+
  geom_smooth(method = 'lm', se=F)

#correlation coefficient
cor(heart$age, heart$mhr1)

#scatterplot for group 2
ggplot(data=heart,aes(x=mhr2,y=age))+
  geom_point()+
  ggtitle("Scatterplot of Maximum Heart Rate vs Age (Group 2)")+
  xlab("Maximum Heart Rate")+
  ylab("Age")+
  geom_smooth(method = 'lm', se=F)

#correlation coefficient
cor(heart$age, heart$mhr2)

#scatterplot for group 3
ggplot(data=heart,aes(x=mhr3,y=age))+
  geom_point()+
  ggtitle("Scatterplot of Maximum Heart Rate vs Age (Group 3)")+
  xlab("Maximum Heart Rate")+
  ylab("Age")+
  geom_smooth(method = 'lm', se=F)

#correlation coefficient
cor(heart$age, heart$mhr3)

#scatterplot for group 4
ggplot(data=heart,aes(x=mhr4,y=age))+
  geom_point()+
  ggtitle("Scatterplot of Maximum Heart Rate vs Age (Group 4)")+
  xlab("Maximum Heart Rate")+
  ylab("Age")+
  geom_smooth(method = 'lm', se=F)

#correlation coefficient
cor(heart$age, heart$mhr4)

#linear regresion model 1
model1 <- lm(age~mhr1, data=heart)

#dianogstic plot
autoplot(model1)

#linear regresion model 2
model2 <- lm(mhr2~age, data=heart)

#dianogstic plot
autoplot(model2)

#linear regresion model 3
model3 <- lm(age~mhr3, data=heart)

#dianogstic plot
autoplot(model3)

#linear regresion model 4
model4 <- lm(age~mhr4, data=heart)

#dianogstic plot
autoplot(model4)

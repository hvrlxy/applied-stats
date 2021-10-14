View(healthy_living) 
library(ggplot2)
#scatterplots
ggplot(data=healthy_living,aes(x=Healthy,y=Smoking))+
  geom_point()+
  ggtitle("Scatterplot of Healthy vs Smoking")+
  xlab("Health Status")+
  ylab("Smoking Percentage")

cor(x=healthy_living$Healthy, healthy_living$Smoking)

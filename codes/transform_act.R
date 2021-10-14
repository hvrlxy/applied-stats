library(ggplot2)
library(ggfortify)

new_un <- na.omit(un)

# create a scatterplot of im and pcgdp
ggplot(data=new_un,aes(x=pcgdp,y=IM))+
  geom_point()+
  ggtitle("Scatterplot of GDP per capita and infant mortality rate")+
  xlab("$")+
  ylab("%")

# create a scatterplot of log(im) and pcgdp
ggplot(data=new_un,aes(x=pcgdp,y=log(IM)))+
  geom_point()+
  ggtitle("Scatterplot of GDP per capita and log(IM)")+
  xlab("$")+
  ylab("%")

# create a scatterplot of im and log(pcgdp)
ggplot(data=new_un,aes(x=log(pcgdp),y=IM))+
  geom_point()+
  ggtitle("Scatterplot of log(GDP) and infant mortality rate")+
  xlab("$")+
  ylab("%")

# create a scatterplot of log(im) and log(pcgdp)
ggplot(data=new_un,aes(x=log(pcgdp),y=log(IM)))+
  geom_point()+
  ggtitle("Scatterplot of log(GDP) and log(IM)")+
  xlab("$")+
  ylab("%")

#fit a simple regression model on im and pcgdp and get a dianogstic plot
un.lm <- lm(IM~pcgdp, data=new_un)
autoplot(un.lm)

#transform the data, fit model and plot dia
un1.lm <- lm(log(IM)~pcgdp, data=new_un)
autoplot(un1.lm)

un2.lm <- lm(IM~log(pcgdp), data=new_un)
autoplot(un2.lm)

un3.lm <- lm(log(IM)~log(pcgdp), data=new_un)
autoplot(un3.lm)

#report the model chosen
summary(un3.lm)

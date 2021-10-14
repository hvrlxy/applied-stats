##load in packages
library(ggfortify)
library(ggplot2)
library(mosaic)
library(MASS)
##looking at the data
nba<-na.omit(nba)
#salary
ggplot(data=nba,aes(x=Salary))+
  geom_histogram()+
  ggtitle("Histogram of NBA salary")+
  xlab("salary")+
  ylab("Frequency")
#made FGs (FG_made)
ggplot(data=nba,aes(x=FG_made))+
  geom_histogram()+
  ggtitle("Histogram of NBA salary")+
  xlab("salary")+
  ylab("Frequency")
#salary and made FGs
ggplot(data=nba,aes(x=FG_made,y=(Salary - Salary%%100000)))+
  geom_point()+
  ggtitle("Scatterplot of Square footage vs Square Feet")+
  xlab("Square Feet")+
  ylab("# of bathrooms")+
  geom_smooth(se=F)
cor(nba$Salary, nba$FG_made,use="pairwise.complete.obs")
#estimated regression (Y=Salary, X=FG_made)
nba_model<-lm(Salary~FG_made,data=nba)
summary(nba_model)

# b0: it is estimated that the average salary for all players that make no 
# fg is -2675399
# b1: it is estimated that for each additional fg made, salary increased 
# by 1992740

#fit model (Y=Salary, X=ThreeP_made)
nba_model1<-lm(Salary~ThreeP_made,data=nba)
summary(nba_model1)

# b0: it is estimated that the average salary for all players that make no 
# 3 points is 7409510
# b1: it is estimated that for each additional 3 points made, salary increased 
# by -1064030

# Linearity assumptions
autoplot(nba_model)
# Based on the residual plot, the linear assumption is not satisfied.
# as the blue smoother shows a clear U shape.
# 

#diagnostic plots for model with Y=Salary
#and X=FG_made

#diagnostic plots for model with Y=Salary
#and X=ThreeP_made

#Inference
#HT: obtain output to conduct HT (Y=Salary, X=FG_made)

#HT: obtain output to conduct HT (Y=Salary, X=ThreeP_made)

#CI: CI for slope (Y=Salary, X=FG_made)
confint(nba_model)
#CI: 99% CI for slope (Y=Salary, X=ThreeP_made)
confint(nba_model1,level=0.99)
#Estimation and Prediction
#obtaining estimated and predicted values
#FG_made=4
newdata<-data.frame(FG_made=4)
predict(nba_model,newdata=newdata)
#FG_made=4 and 5
newdata2<-data.frame(FG_made=c(4,5))
predict(nba_model,newdata=newdata2)
#salary for Kevin Garnett (FG_made=7.2)
newdata3<-data.frame(FG_made=c(7.2))
predict(nba_model,newdata=newdata3)
#salary for "average" players (FG_made=1.1)
newdata3<-data.frame(FG_made=c(1.1))
predict(nba_model,newdata=newdata3)
#salary for three European players (FG_made=3.4,2.4,5.1)
newdata3<-data.frame(FG_made=c(3.4,2.4,5.1))
predict(nba_model,newdata=newdata3)

#CI for estimated response (FG_made=4)
predict(nba_model,newdata=newdata,interval="confidence")
#PI for predicted response (FG_made=4)
predict(nba_model,newdata=newdata,interval="prediction")
#CI/PIs examples
#Kevin Garnett
newdata3<-data.frame(FG_made=c(7.2))
predict(nba_model,newdata=newdata3, interval='prediction')
#All "average" players making 1.1 FGs
newdata3<-data.frame(FG_made=c(1.1))
predict(nba_model,newdata=newdata3, interval='confidence')
#European players
newdata3<-data.frame(FG_made=c(3.4,2.4,5.1))
predict(nba_model,newdata=newdata3, interval='prediction')
#CI/PI se's
#se's for model with Y=Salary and X=FG_made
predict(nba_model,newdata=newdata,se.fit=TRUE)
#se for Kevin Garnett
newdata3<-data.frame(FG_made=c(7.2))
predict(nba_model,newdata=newdata3,se.fit=TRUE)
#se for "average" players
newdata3<-data.frame(FG_made=c(1.1))
predict(nba_model,newdata=newdata3, se.fit=TRUE)
#remedial measures
#QQ plot for model with Y=Salary, X=ThreeP_made
autoplot(nba_model2,which=2)
#transformations
#look at model with Y=Salary and X=FG_made
#choose a reasonable transformation

#Box-Cox transformation
#choose value for lambda

#rerun model with transformed data

#check diagnostic plots for this model
##load in packages 
library(ggplot2)
library(ggfortify)
library(GGally)
library(mosaic)
library(car)
##data are in peaks.csv

##look at data
View(peaks)
#Elevation
ggplot(peaks,aes(x=Elevation))+
  geom_histogram(bins=20)
favstats(peaks$Elevation)
#Difficulty
ggplot(peaks,aes(x=Difficulty))+
  geom_histogram(bins=20)
favstats(peaks$Difficulty)
#Ascent
ggplot(peaks,aes(x=Ascent))+
  geom_histogram(bins=20)
favstats(peaks$Ascent)
#Length
ggplot(peaks,aes(x=Length))+
  geom_histogram(bins=20)
favstats(peaks$Length)
#Time
ggplot(peaks,aes(x=Time))+
  geom_histogram(bins=15)
favstats(peaks$Time)

#scatterplot matrix
ggpairs(peaks,columns=2:6)

#fit model (Y=Time, Xs=Elevation, Difficulty, Ascent, Length)
peak_model <- lm(Time~Elevation+Difficulty+Ascent+Length,data=peaks) 
#obtain parameter estimates
summary(peak_model)

#model checking
#look at diagnostic plots
autoplot(peak_model)
#make residual vs predictor plots

#save residuals

#Elevation
ggplot(data=peaks,aes(x=Elevation,y=Residuals))+
  geom_point()+
  geom_smooth(se=F)
#Difficulty

#Length

#Ascent


#scale location plot
#bottom left of diagnostic plots panel

#added variable plots

##outliers and influential observations
#outliers
#obtain leverage values
peaks$leverage<-hatvalues(peaks.lm)
#look at observations with large leverage
peaks[which(peaks$leverage>2*5/46),]
#or look at row numbers
which(peaks$leverage>2*5/46)
#Cook's d

#multicollinearity
#vifs

##inference
#single coefficient--same as SLR

#overall F test
#ANOVA table
anova(peaks.lm)
#testing several parameters
#null model
peaks.lm_red<-lm(Time~Length+Ascent,data=peaks)
#alternative model is peaks.lm
#compare models
anova(peaks.lm_red,peaks.lm)
#test whether Elevation and Ascent are needed

#CIs
confint(peaks.lm)

##Estimation and prediction
mt_tall<-data.frame(Elevation=7342,Difficulty=6,Ascent=4232,Length=18.9)
predict(peaks.lm,newdata=mt_tall,interval="prediction")
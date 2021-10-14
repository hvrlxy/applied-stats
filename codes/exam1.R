#load the library
library(ggplot2)
library(mosaic)
library(readr)

#load the dataset
colleges <- read_csv("Desktop/242-MCS/colleges.csv")

#view the dataset
View(colleges)

#get the dimensions of the dataset
dim(colleges)

#get the number of colleges with missing values
length(which(!complete.cases(colleges)))

#check the number of NA in each columns + highest NetPrice
summary(colleges)

#bar chart for Region
ggplot(data=colleges,aes(x=Region))+
  geom_bar()+
  ggtitle("Bar Chart of Regions")+
  xlab("Region")+
  ylab("Count")

#histogram for AdmitRate
ggplot(data=colleges,aes(x=AdmitRate))+
  geom_histogram(bins=100)+
  ggtitle("Histogram of AdmitRate")+
  xlab("Admit Rate (%)")+
  ylab("Count")

#get statistics for variable AdmitRate
summary(colleges$AdmitRate, na.omit=TRUE)

#filter only public colleges
colleges2 <- colleges[colleges$Control=='Public',]

#view the new dataset
View(colleges2)

#get the dimensions
dim(colleges2)

#see how many school are in the suburb
length(colleges2[colleges2$Locale == 'Suburb',])

#scatterplot for instate and outof state tuition
ggplot(data=colleges2,aes(x=TuitionIn,y=TuitonOut))+
  geom_point()+
  ggtitle("Scatterplot of In-state Tuition vs Out-Of-State Tuition")+
  xlab("In-state Tuition")+
  ylab("Out-Of-State Tuition")+
  geom_smooth(method = 'lm', se=F)

#omit all missing values to calculate the correlation
colleges2 <- na.omit(colleges2)
#calculate the correlation coefficients
cor(colleges2$NetPrice, colleges2$CompRate)

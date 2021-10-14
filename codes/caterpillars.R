library(ggplot2)

#look at the dimensions of the dataset
dim(caterpillars)

#omit missing values
caterpillars <- na.omit(caterpillars)

#frequency table for Instar
table(caterpillars$Instar)
prop.table(table(caterpillars$Instar))

#frequency table for ActiveFeeding
table(caterpillars$ActiveFeeding)
prop.table(table(caterpillars$ActiveFeeding))

#frequency table for fgp
table(caterpillars$Fgp)
prop.table(table(caterpillars$Fgp))

#frequency table for mgp
table(caterpillars$Mgp)
prop.table(table(caterpillars$Mgp))

#summary for mass
summary(caterpillars$Mass)
#histogram for mass
ggplot(data=caterpillars,aes(x=Mass))+
  geom_histogram(bins=20)+
  ggtitle("Histogram of Mass")+
  xlab("Grams")+
  ylab("Count")

#summary for intake
summary(caterpillars$Intake)
#histogram for intake
ggplot(data=caterpillars,aes(x=Intake))+
  geom_histogram(bins=20)+
  ggtitle("Histogram of Wet Food Intake")+
  xlab("Grams")+
  ylab("Count")

#summary for nfrass
summary(caterpillars$Nfrass)
#histogram for Nfrass
ggplot(data=caterpillars,aes(x=Nfrass))+
  geom_histogram(bins=20)+
  ggtitle("Histogram of Amount of Nitrogen in Frass")+
  xlab("Grams")+
  ylab("Count")

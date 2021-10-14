##EDA
#install packages if needed (only need to do this once!)
#load packages
library(ggplot2)
library(mosaic)

#univariate categorical variables
#frequency table
table(house_prices$Type)
#relative frequency table
prop.table(table(house_prices$Type))
#to display percentages to two decimals
round(100*prop.table(table(house_prices$Type)),digits=2)
#bar chart (frequency)
ggplot(data=house_prices,aes(x=Type))+
  geom_bar()+
  ggtitle("Bar Chart of House Type")+
  xlab("House Type")+
  ylab("Frequency")
#bar chart (relative frequency)
ggplot(data=house_prices,aes(x=Type, y=..prop.., group=1))+
  geom_bar()+
  ggtitle("Bar Chart of House Type")+
  xlab("House Type")+
  ylab("Relative Frequency")
#frequency table for beds
table(house_prices$Beds)
#relative frequency table for beds
prop.table(table(house_prices$Beds))
#bar chart for beds
ggplot(data=house_prices,aes(x=Beds))+
  geom_bar()+
  ggtitle("Bar Chart of House Type")+
  xlab("Number of Beds")+
  ylab("Frequency")

#univariate numeric variables
#measures of center
mean(house_prices$Sale_amount)
median(house_prices$Sale_amount)
quantile(house_prices$Sale_amount,probs=0.25)
quantile(house_prices$Sale_amount,probs=0.75)
quantile(house_prices$Sale_amount,probs=c(0.25,0.75))
#mean of Sqft_home

#median of Sqft_home

#Q1 of Sqft_home

#Q3 of Sqft_home

#measures of spread
sd(house_prices$Sale_amount)
var(house_prices$Sale_amount)  
range(house_prices$Sale_amount)
max(house_prices$Sale_amount)-min(house_prices$Sale_amount)
IQR(house_prices$Sale_amount)
summary(house_prices$Sale_amount)
#standard deviation of Sqft_home

#variance of Sqft_home

#range of Sqft_home

#IQR of Sqft_home

#histogram
ggplot(data=house_prices,aes(x=Sale_amount))+
  geom_histogram(bins=100)+
  ggtitle("Histogram of Sale Price")+
  xlab("Sale Price")+
  ylab("Frequency")
#histogram of Sqft_home (even student ID)

#histogram of Sqft_lot (odd student ID)

#two numeric variables
#remove super expensive house
house_prices2<-house_prices[house_prices$Sale_amount<max(house_prices$Sale_amount,na.rm=TRUE),]
#scatterplots
ggplot(data=house_prices2,aes(x=Sqft_home,y=Sale_amount))+
  geom_point()+
  ggtitle("Scatterplot of Sale Price vs Square Feet")+
  xlab("Square Feet")+
  ylab("Sale Price")
#correlation
#exclude observations missing values for price or sqft
cor(house_prices$Sale_amount,house_prices$Sqft_home,use="pairwise.complete.obs")

#boxplots
ggplot(data=house_prices, aes(y= Sale_amount, x=Type))+
  geom_boxplot()+
  ggtitle("Distribution of Sale Price by House Type")+
  ylab("Sales Price")+ 
  xlab("Housing Type")
#construct boxplot for Sqft_home by Type

#summary stats by group
#use favstats() from mosaic package
favstats(Sale_amount~Type,data=house_prices)
#calculate summary statistics for Sqft_home for each home type

#unusual observations
#look at house with maximum sale price

house_prices[house_prices$Sale_amount==max(house_prices$Sale_amount,na.rm=TRUE),]
#look at house with maximum Baths
house_prices[house_prices$Baths==6242,]

#histograms
ggplot(data=house_prices2,aes(x=Sqft_lot))+
  geom_histogram(bins=50)+
  ggtitle("Scatterplot of Sale Price vs Square Feet")+
  xlab("Square Feet")+
  ylab("Sale Price")

# the distribution of the sqft_lot is highly skewed to the left
# due to the presence of outliners ,
# with the range from 0 to around 3 millions.
# The peak is at approximately from 0 to 3000, with nearly 10000
# houses. The majority of house is between 0 to 250000 sqft.876

ggplot(data=house_prices2[house_prices2$Baths < 6000 & house_prices2$Sqft_home < 15000,],aes(x=Baths,y=Beds))+
  geom_point()+
  ggtitle("Scatterplot of Square footage vs Square Feet")+
  xlab("Square Feet")+
  ylab("# of bathrooms")+
  geom_smooth(method = 'lm', se=F)

cor(house_prices$Sqft_home,house_prices$Baths,use="pairwise.complete.obs")

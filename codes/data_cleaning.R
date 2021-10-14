##Data cleaning and preparation
#dataset: house_prices

#Data inspection
#View dataset
View(house_prices)
#check dimensions
dim(house_prices)

#Data preparation

#check for missing data
complete.cases(house_prices)
#what are the row numbers of observations with missing values?
which(complete.cases(house_prices))
#how many observations have at least one missing value?
length(which(complete.cases(house_prices)))
#what variables have missing values? 
which(!complete.cases(house_prices))
length(which(!complete.cases(house_prices)))
#look variable by variable
summary(house_prices)
#for observation 365, what values (if any) are missing?
house_prices[365,]
#what about observation 2387
house_prices[2387,]
#view all observations with missing values
house_prices[!complete.cases(house_prices),]
#what three houses are missing data on square feet?
house_prices[!complete.cases(house_prices),'Sqft_home']
#omit missing data
house_prices2<-na.omit(house_prices)

#subsetting data
#observations from Ames, IA
#variable names
names(house_prices2)
#different towns
unique(house_prices2$Town)
house_prices_Ames<-house_prices2[house_prices2$Town=="Ames, IA",]
#houses less than 2000 sqft
houses_prices_small<-house_prices2[house_prices2$Sqft_home<2000,]
#houses in Ames or Bozeman
house_prices_Ames_BZN<-house_prices2[house_prices2$Town=="Ames, IA"|
                                       house_prices2$Town=="Bozeman, MT",]
#houses between 1000 and 2000 sqft
houses_prices_smallish<-house_prices2[house_prices2$Sqft_home<2000 &
                                        house_prices2$Sqft_home>=1000,]
#houses in Ames that are under 2000 sqft
house_prices_Ames_small<-house_prices2[house_prices2$Town=="Ames, IA"&
                                         house_prices2$Sqft_home<2000,]
##Let's practice examples
#multi-family homes
house_prices_multifamily<-house_prices[house_prices$Type == 'Multi Family',]
dim(house_prices_multifamily)
#multi-family homes in Minneapolis
dim(house_prices[house_prices$Type == 'Multi Family' & 
                   house_prices$Town == 'Minneapolis, MN',])
#3,4,5 bedroom homes
dim(house_prices[house_prices$Beds >= 3 & 
                   house_prices$Beds <=5,])
#homes with 2 or more beds and baths
dim(house_prices[house_prices$Beds >= 2 | 
                   house_prices$Baths >= 2,])

#check variable type for a single variable
class(house_prices2$Town)
class(house_prices2$Sqft_home)
class(house_prices2$Sale_date)
#variable type for all variables
sapply(house_prices2,class)
#convert numeric to categorical
class(house_prices$Beds)
house_prices$Beds<-as.character(house_prices$Beds)
class(house_prices$Beds)
#convert categorical to numeric
house_prices$Beds<-as.numeric(house_prices$Beds)
class(house_prices$Beds)
#creating new variables and transformations
#take log of price
house_prices2$sale_log<-log(house_prices2$Sale_amount)
#price per square foot
house_prices2$price_sqft<-house_prices2$Sale_amount/house_prices2$Sqft_home
#Let's practice examples
#square root of sale price
house_prices$sqrt_sale<-sqrt(house_prices$Sale_amount)
#total number of beds and baths
house_prices$bed_and_bath<-house_prices$Baths + house_prices$Beds
#ratio of sqft of home to sqft of lot
house_prices$home_over_lot<-house_prices$Sqft_home/house_prices$Sqft_lot

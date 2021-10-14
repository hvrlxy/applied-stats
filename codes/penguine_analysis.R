#open the dataset
View(penguins)

#see how many missing cases are there
length(which(!complete.cases(penguins)))

#penguins[!complete.cases(penguins),'year']
#delete observations with missing values
penguins2<-na.omit(penguins)

#filter out years before 2009
penguins2<-penguins2[penguins2$year==2009, ]

#calculate the ratio
penguins2$length_over_depth<-sqrt(penguins2$bill_length_mm / penguins2$bill_depth_mm)

#write the result to a csv file
write_csv(penguins2, './penguins2.csv')

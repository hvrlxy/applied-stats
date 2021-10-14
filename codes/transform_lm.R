library(ggplot2)
library(ggfortify)

View(gestation)  
gestation.lm<-lm(log(Gestation) ~ Birthwgt, data=gestation)
summary(gestation.lm)

# b1 = 0.0104 -> for each additional kg of birth weight, 
# the estimated median gestation time increased by exp(0.0104 - 1)*100%
# =1.05%.

recall.lm<-lm(prop~log(time),data=recall)
summary(recall.lm)

# b1 = -0.0792 -> when the amount of time since memorizing the list, 
# it is estimated that the average proportion of words recalled decreased 
# by 0.0792 * log(2) = 0.0544

trees.lm<-lm(log(Vol)~log(Diam),data=trees)
summary(gestation.lm)

# b1 = 2.5644 -> when the diameter of a tree is doubled, it is estimated that
# the median value of the volume of the tree increases by 
# (exp(2.5644) - 1) * 100% = 1144.286%

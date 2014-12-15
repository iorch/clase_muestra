#!/usr/bin/env Rscript
require('ggplot')
mydata <- read.csv("heart_attack.csv") # read the data from our file
head(mydata) # Shows the first 10 elements in 'mydata' sample

summary(mydata) # get Basic information summarizing 'mydata' sample

sapply(mydata,sd) # Get standard deviation

mydata$Treatment_of_Anger<-factor(mydata$Treatment_of_Anger) # Treatment_of_Anger as category variable

mylogit <- glm(Second_Heart_Attack~Treatment_of_Anger+Trait_Anxiety,data = mydata, family = "binomial") #binomial	(link = "logit")

summary(mylogit)  # display results

confint(mylogit) # 95% CI for the coefficients

exp(coef(mylogit)) 


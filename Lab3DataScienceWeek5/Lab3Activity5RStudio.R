#Activity 5.1
#Label encoding with binary (two levels)
gender_encode <- ifelse(titanic_train$Sex == "male",1,0)
table(gender_encode)

# Label encoding for the 'Embarked' variable
#The 'Embarked' variable has three main categories: "C" for Cherbourg, 
#"Q" for Queenstown, and "S" for Southampton .Others will be replaced with 4.
embarked_encode <- as.numeric(factor(titanic_train$Embarked))
table(embarked_encode)


#Activity 5.2
#Create new data frame from titanic_train: fare,Sex,Embarked
new_dat = data.frame(titanic_train$Fare,titanic_train$Sex,titanic_train$Embarked)

summary(new_dat)

library(caret)
dmy <- dummyVars(" ~ .", data = new_dat, fullRank = T)
dat_transformed <- data.frame(predict(dmy, newdata = new_dat))
glimpse(dat_transformed)

"The output dummy variables created for the 'Sex' and 
'Embarked' columns. Each category in these columns is represented by a binary 
'variable (0 or 1) in the output. For example,titanic_train.Sexmale: This column 
'is a dummy variable encoding for the 'Sex' variable. It has a value of 1 for male passengers and 0 for female passengers"

#Activity 5.3
#View Fare variable as example
summary(new_dat$titanic_train.Fare)

"create a vector of cut-off points based on 1st Quarter 
value and 3rd Quarter values."
bins <- c(-Inf, 7.91, 31.00, Inf)
#Set the respective names to these cut-off points
bin_names <- c("Low", "Mid50", "High")

#Break the vector using the cut-off points
new_dat$new_Fare <- cut(new_dat$titanic_train.Fare, breaks = bins, labels = bin_names)

"Compare the original Fare variable with the binned new_Fare variable using the summary() function."
summary(new_dat$titanic_train.Fare)
summary(new_dat$new_Fare)
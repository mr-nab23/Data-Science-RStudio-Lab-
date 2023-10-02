#Activity1:Data Exploration
str(Carseats)
?Carseats

#calculate descriptive statistics using describe()
describe(Carseats)
describe(Carseats,Sales,CompPrice,Income)#select column by name
describe(Carseats,Sales:Income)#select all columns between sales and incomes(include)
describe(Carseats,-(Sales:Income))#Select all column except sales until income

#test normality
normality(Carseats)
normality(Carseats,Sales,CompPrice,Income)#select column by name
normality(Carseats,Sales:Income)#select all columns between sales and incomes(include)
normality(Carseats,-(Sales:Income))#Select all column except sales until income

#plot correlate
Carseats %>%
  correlate() %>%
  plot()

correlate(Carseats,Sales,Price) %>%
  plot()

#EDA based on target variable
categ <- target_by(Carseats,US)

#EDA when target variable is categorical , predictor is numerical
cat_num <- relate(categ,Sales)
cat_num
summary(cat_num)
plot(cat_num)

#EDA when target variable is numerical , predictor is numerical
num <- target_by(Carseats,Sales)
num_num <- relate(num,Price)
num_num
summary(num_num)
plot(num_num)

#EDA when target variable is numerical,predictor is categorical
num_cat <- relate(num,ShelveLoc)
num_cat
summary(num_cat)
plot(num_cat)
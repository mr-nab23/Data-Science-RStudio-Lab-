getwd()
#read data form csv file
churn = read.csv("Churn_Train.csv" , header = TRUE)
View(churn)

sum(is.na(churn))#Check sum of missing data

# Check which rows have missing values
rows_with_missing <- which(apply(is.na(churn), 1, any))

# Display the rows with missing values
rows_with_missing

#View the total charges distribution using histogram
ggplot(churn, aes(Total.Charges)) +
  geom_histogram(color = "#000000", fill = "#0099F8") +
  ggtitle("Variable distribution") +
  theme_classic() +
  theme(plot.title = element_text(size = 18))

# Impute missing values in Total.Charges column with zero, mean, and median
churn_imputed <- data.frame(
  original = churn$Total.Charges,
  imputed_zero = replace(churn$Total.Charges, is.na(churn$Total.Charges), 0),
  imputed_mean = replace(churn$Total.Charges, is.na(churn$Total.Charges), mean(churn$Total.Charges, na.rm = TRUE)),
  imputed_median = replace(churn$Total.Charges, is.na(churn$Total.Charges), median(churn$Total.Charges, na.rm = TRUE))
)

# Display the imputed values
churn_imputed

h1 <- ggplot(churn_imputed, aes(x = original)) +
  geom_histogram(fill = "#ad1538", color = "#000000", position = 
                   "identity") +
  ggtitle("Original distribution") +
  theme_classic()
h2 <- ggplot(churn_imputed, aes(x = imputed_zero)) +
  geom_histogram(fill = "#15ad4f", color = "#000000", position = 
                   "identity") +
  ggtitle("Zero-imputed distribution") +
  theme_classic()
h3 <- ggplot(churn_imputed, aes(x = imputed_mean)) +
  geom_histogram(fill = "#1543ad", color = "#000000", position = 
                   "identity") +
  ggtitle("Mean-imputed distribution") +
  theme_classic()
h4 <- ggplot(churn_imputed, aes(x = imputed_median)) +
  geom_histogram(fill = "#ad8415", color = "#000000", position = 
                   "identity") +
  ggtitle("Median-imputed distribution") +
  theme_classic()

plot_grid(h1, h2, h3, h4, nrow = 2, ncol = 2)


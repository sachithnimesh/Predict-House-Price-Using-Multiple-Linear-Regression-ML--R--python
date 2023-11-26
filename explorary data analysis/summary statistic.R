life <- read.csv("Life Expectancy Data.csv")
master.life <- life  # backup data
#life <- master.life # calling backup
head(life)
# Load the dplyr package
library(dplyr)

# Assuming you have a data frame called 'my_data' and you want to remove rows with NA values
life <- na.omit(life)
life
str(life)  

summary(life)
hist(life$Life.expectancy,col = "violet", main = "Distribution of life expectancy",xlab = 'life expectancy')

# Load the vioplot package
library(vioplot)

# Sample data (assuming you have the 'life' dataset loaded)
data <- list(
  life$Adult.Mortality,
  life$Alcohol,
  life$infant.deaths,
  life$percentage.expenditure,
  life$Hepatitis.B,
  life$Measles,
  life$BMI,
  life$under.five.deaths,
  life$Polio
)

# Set the margins to reduce the figure margin
par(mar = c(2.5, 2, 2, 0.5))  # Adjust the margin values as needed (bottom, left, top, right)

# Create the violin plot
vioplot(data, names = c("Adult Mortality", "Alcohol", "Infant Deaths", "Percentage Expenditure", "Hepatitis B", "Measles", "BMI", "Under 5 Deaths", "Polio"), col = "yellow",main='violin plots of variable')
data_num <- life_selected %>% 
  select_if(is.numeric)

life_selected <- life %>% 
  select(-Country, -Year) %>% 
  mutate(Hepatitis.B = ifelse(Hepatitis.B < 90, "<90% Covered", ">=90% Covered"),
         Polio = ifelse(Polio < 90, "<90% Covered", ">=90% Covered"),
         Diphtheria = ifelse(Diphtheria < 90, "<90% Covered", ">=90% Covered"),
         Hepatitis.B = as.factor(Hepatitis.B),
         Polio = as.factor(Polio),
         Diphtheria = as.factor(Diphtheria))

str(life_selected)
data_num <- life_selected %>% 
  select_if(is.numeric)
library(ggcorrplot)
# Assuming you have a data frame called 'data_num' containing numerical variables
# For this example, let's assume data_num contains three numerical variables: var1, var2, and var3

# Calculate the correlation matrix
cor_matrix <- cor(data_num)

# Create the correlation heatmap with labels and custom styling
ggcorrplot(cor_matrix,
           lab = TRUE,
           lab_size = 2,
           lab_round = 2,
           hjust = 1,
           cell_size = 3,
           colors = c("green3", "gray95", "darkorange"),
           type = "lower",
           name = "Correlation")



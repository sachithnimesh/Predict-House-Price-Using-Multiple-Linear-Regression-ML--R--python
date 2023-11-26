life <- read.csv("Life Expectancy Data.csv")
x0 = life$Lifeexpectancy
x1=life$AdultMortality
x2=life$infantdeaths
x3=life$Alcohol
x4=life$percentage_expenditure
x5=life$HepatitisB
x6=life$Measles
x7=life$BMI
x8=life$underfivedeaths
x9=life$Polio
x10=life$Totalexpenditure
x11=life$thinness119years
x12=life$thinness59years
x13=life$Incomecompositionofresources
x14=life$Schooling


# Install and load required libraries
install.packages("plotly")
library(plotly)

# Assuming the data has already been read into the 'life' variable

# Create a function to generate the histogram plot
generate_histogram <- function(data, column_name) {
  # Create a histogram using plot_ly
  plot_ly(data, x = ~get(column_name), type = "histogram", name = column_name) %>%
    layout(barmode = "overlay", title = column_name)
}

# List of column names
column_names <- c("AdultMortality", "infantdeaths", "Alcohol", "percentage_expenditure",
                  "HepatitisB", "Measles", "BMI", "underfivedeaths", "Polio",
                  "Totalexpenditure", "thinness119years", "thinness59years",
                  "Incomecompositionofresources", "Schooling")

# Create a list to store all histogram plots
histogram_plots <- lapply(column_names, generate_histogram, data = life)

# Create the dashboard using subplot
subplot(histogram_plots, nrows = 5) %>%
  layout(title = "Life Expectancy Data Histograms")

# To display the dashboard in RStudio, use the following line:
# subplot(histogram_plots, nrows = 5) %>% layout(title = "Life Expectancy Data Histograms") %>% 
#   embed_notebook()

# Alternatively, you can save the dashboard as an HTML file using:
# library(htmlwidgets)
# saveWidget(subplot(histogram_plots, nrows = 5) %>% layout(title = "Life Expectancy Data Histograms"), "life_expectancy_histograms.html")

# Install and load required libraries
install.packages("plotly")
library(plotly)

# Assuming the data has already been read into the 'life' variable

# List of column names
column_names <- c("AdultMortality", "infantdeaths", "Alcohol", "percentage_expenditure",
                  "HepatitisB", "Measles", "BMI", "underfivedeaths", "Polio",
                  "Totalexpenditure", "thinness119years", "thinness59years",
                  "Incomecompositionofresources", "Schooling")

# Create a function to generate the scatter plot
generate_scatter_plot <- function(data, x_var, y_var) {
  # Create a scatter plot using plot_ly
  plot_ly(data, x = ~get(x_var), y = ~get(y_var), mode = "markers",
          type = "scatter", marker = list(size = 8), name = y_var) %>%
    layout(title = paste("Scatter Plot of", y_var, "vs. Lifeexpectancy"),
           xaxis = list(title = x_var), yaxis = list(title = "Lifeexpectancy"))
}

# Create a list to store all scatter plots
scatter_plots <- lapply(column_names, generate_scatter_plot, data = life, x_var = "Lifeexpectancy")

# Create the dashboard using subplot
subplot(scatter_plots, nrows = 5) %>%
  layout(title = "Scatter Plots of Lifeexpectancy vs. Other Columns")

# To display the dashboard in RStudio, use the following line:
# subplot(scatter_plots, nrows = 5) %>% layout(title = "Scatter Plots of Lifeexpectancy vs. Other Columns") %>% 
#   embed_notebook()

# Alternatively, you can save the dashboard as an HTML file using:
# library(htmlwidgets)
# saveWidget(subplot(scatter_plots, nrows = 5) %>% layout(title = "Scatter Plots of Lifeexpectancy vs. Other Columns"), "life_expectancy_scatterplots.html")


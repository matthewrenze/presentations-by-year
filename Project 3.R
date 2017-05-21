# Load packages
library(plotly)
library(lubridate)
library(dplyr)

# Set working directory
setwd("C:/Work/School/Products/Projects/Project 3")

# Load presentation data
presentations <- read.csv("Presentations.csv")

# Convert date 
presentations$Date <- as.Date(
  x = presentations$Date,
  format = "%m/%d/%Y")

# Transform data
history <- presentations %>%
  select(Date) %>%
  group_by(Year = year(Date)) %>%
  summarize(Count = n()) %>%
  arrange(Year) %>%
  as.data.frame()

# Display line chart
plot_ly(
  data = history,
  x = ~Year,
  y = ~Count,
  mode = "lines")%>%
  layout(
    title = "Count of Presentations by Year",
    yaxis = list(
      range = c(0, max(history$Count))))
    ))




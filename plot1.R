#### Prepare environment
# Set working directory on local computer 
setwd("D:/ORCL-Technology/03 - Business Analytics/Data Science/Johns Hopkins University (Coursera)/04 - Exploratory Analysis/R-WorkDir")

#### Read dataset
source("load_dataset.R")

#### Interactive Mode - plot Histogram
hist(reduced_data$Global_active_power)

# add axis descriptions and color
hist(reduced_data$Global_active_power
    ,main = "Global Active Power"
    ,xlab = "Global Active Power (kilowatts)"
    ,ylab = "Frequency"
    ,col = "red"
    )

#### Define PNG file with a width of 480 pixels and a height of 480 pixels
#?png
# png(filename = "Rplot%03d.png",
#     width = 480, height = 480, units = "px", pointsize = 12,
#     bg = "white", res = NA, family = "", restoreConsole = TRUE,
#     type = c("windows", "cairo", "cairo-png"), antialias)
png(filename = "plot1.png",width = 480, height = 480,units = "px")

# plot histogram
hist(reduced_data$Global_active_power
     ,main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)"
     ,ylab = "Frequency"
     ,col = "red"
     )
# shut down specified device
dev.off()

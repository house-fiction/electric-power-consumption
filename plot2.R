#### Prepare environment
# Set working directory on local computer 
setwd("D:/ORCL-Technology/03 - Business Analytics/Data Science/Johns Hopkins University (Coursera)/04 - Exploratory Analysis/R-WorkDir")

#### Read dataset
source("load_dataset.R")

#### Interactive Mode - plot time vs. Global_active_power
plot(reduced_data$Time, reduced_data$Global_active_power)

# plot as line chart and add axis desc.
plot(reduced_data$Time, reduced_data$Global_active_power
    ,type = "l"
    ,xlab = ""
    ,ylab = "Global Active Power (kilowatts)"
     )

#### Define PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot2.png",width = 480, height = 480,units = "px")

# plot line chart
plot(reduced_data$Time, reduced_data$Global_active_power
     ,type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)"
    )

# shut down specified device
dev.off()

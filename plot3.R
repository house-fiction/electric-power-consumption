#### Prepare environment
# Set working directory on local computer 
setwd("D:/ORCL-Technology/03 - Business Analytics/Data Science/Johns Hopkins University (Coursera)/04 - Exploratory Analysis/R-WorkDir")

#### Read dataset
source("load_dataset.R")

#### Interactive Mode - plot time vs. Sub_metering_1, Sub_metering_2, Sub_metering_3 as line chart

# Start with time vs. Sub_metering_1 as line chart
plot(reduced_data$Time,reduced_data$Sub_metering_1
    ,type = "l"
    ,col = "black"
    ,xlab = ""
    ,ylab = "Energy sub metering"
    )

# add Sub_metering_2 (red line)
lines(reduced_data$Time,reduced_data$Sub_metering_2
     ,type = "l"
     ,col = "red"
     )

# add Sub_metering_3 (blue line)
lines(reduced_data$Time,reduced_data$Sub_metering_3
      ,type = "l"
      ,col = "blue"
)

# add a legend
#?legend
legend("topright"
      , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      , lwd=1, col=c("black", "red", "blue")
      )

#### Define PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot3.png",width = 480, height = 480,units = "px")

# plot line chart
plot(reduced_data$Time,reduced_data$Sub_metering_1
     ,type = "l"
     ,col = "black"
     ,xlab = ""
     ,ylab = "Energy sub metering"
)

lines(reduced_data$Time,reduced_data$Sub_metering_2
      ,type = "l"
      ,col = "red"
)

lines(reduced_data$Time,reduced_data$Sub_metering_3
      ,type = "l"
      ,col = "blue"
)

legend("topright"
       , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lwd=1, col=c("black", "red", "blue")
)

# shut down specified device
dev.off()




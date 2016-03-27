#### Prepare environment
# Set working directory on local computer 
setwd("D:/ORCL-Technology/03 - Business Analytics/Data Science/Johns Hopkins University (Coursera)/04 - Exploratory Analysis/R-WorkDir")

#### Read dataset
source("load_dataset.R")

#### Interactive Mode
## Chart 1 (Top-left)
plot(reduced_data$Time,reduced_data$Global_active_power
    ,type = "l"
    ,xlab = ""
    ,ylab = "Global Active Power"
    )

## Chart 2 (Top-right)
plot(reduced_data$Time,reduced_data$Voltage
    ,type = "l"
    ,xlab = "datetime"
    ,ylab = "Voltage"
    )

## Chart 3 (Bottom-left)
plot(reduced_data$Time,reduced_data$Sub_metering_1
     ,type = "l"
     ,col = "black"
     ,xlab = ""
     ,ylab = "Energy sub metering"
     )

lines(reduced_data$Time,reduced_data$Sub_metering_2,type = "l",col = "red")

lines(reduced_data$Time,reduced_data$Sub_metering_3,type = "l",col = "blue")

# Suppressing the legend box with bty = "n" (for some reason does not work 
# in interactive mode...)
legend("topright", bty = "n"
      ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      ,lwd=1, col=c("black", "red", "blue")
      )

## Chart 4 (Bottom-right)
plot(reduced_data$Time,reduced_data$Global_active_power
    ,type = "l"
    ,col = "black"
    ,xlab = "datetime"
    ,ylab = colnames(reduced_data)[4]
    )


#### Define PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot4.png",width = 480, height = 480,units = "px")

#?par
# A vector of the form c(nr, nc). 
# Subsequent figures will be drawn in an nr-by-nc array on the device by columns 
# (mfcol), or rows (mfrow), respectively.
par(mfrow = c(2, 2))

## plot all line charts
## Chart 1 (Top-left)
plot(reduced_data$Time,reduced_data$Global_active_power
    ,type = "l",xlab = "",ylab = "Global Active Power"
    )

## Chart 2 (Top-right)
plot(reduced_data$Time,reduced_data$Voltage
    ,type = "l",xlab = "datetime",ylab = "Voltage"
    )

## Chart 3 (Bottom-left)
plot(reduced_data$Time,reduced_data$Sub_metering_1
    ,type = "l",col = "black",xlab = "",ylab = "Energy sub metering"
    )

lines(reduced_data$Time,reduced_data$Sub_metering_2,type = "l",col = "red")

lines(reduced_data$Time,reduced_data$Sub_metering_3,type = "l",col = "blue")

# Suppressing the legend box with bty = "n" (for some reason not working...)
legend("topright", bty = "n"
      ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      ,lwd=1, col=c("black", "red", "blue")
      )

## Chart 4 (Bottom-right)
plot(reduced_data$Time,reduced_data$Global_active_power
    ,type = "l",col = "black",xlab = "datetime",ylab = colnames(reduced_data)[4]
    )

# shut down specified device
dev.off()

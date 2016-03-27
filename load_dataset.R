### Prepare environment
# Set working directory on local computer 
setwd("D:/ORCL-Technology/03 - Business Analytics/Data Science/Johns Hopkins University (Coursera)/04 - Exploratory Analysis/R-WorkDir")

# Checking for and creating directories
if (!file.exists("data")) {
        dir.create("data")
}
### 
# Load Data Set (Individual household electric power consumption )
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"

# Load zip archive 
archive <- paste(getwd(), "/data/household_power_consumption.zip", sep = "")

if(!file.exists(archive)){
        download.file(fileURL, destfile = "./data/household_power_consumption.zip")
}

# unzip downloaded file
data_file <- paste(getwd(), "/data/household_power_consumption.txt", sep = "")

if(!file.exists(data_file)){
        unzip(archive, list = FALSE, overwrite = FALSE, exdir = "./data")
}

data <- read.table(data_file,header = TRUE,sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?"
                   )

# inspect the data
str(data)
#'data.frame':	2075259 obs. of  9 variables:
# $ Date                 : chr  "16/12/2006" "16/12/2006" "16/12/2006" "16/12/2006" ...
# $ Time                 : chr  "17:24:00" "17:25:00" "17:26:00" "17:27:00" ...
# $ Global_active_power  : num  4.22 5.36 5.37 5.39 3.67 ...
# $ Global_reactive_power: num  0.418 0.436 0.498 0.502 0.528 0.522 0.52 0.52 0.51 0.51 ...
# $ Voltage              : num  235 234 233 234 236 ...
# $ Global_intensity     : num  18.4 23 23 23 15.8 15 15.8 15.8 15.8 15.8 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  1 1 2 1 1 2 1 1 1 2 ...
# $ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

# subsetting "2007-02-01" and "2007-02-02"
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"

reduced_data <- data[subset, ]
str(reduced_data)

### Conversion of Date and Time variables to Date/Time classes

# (1) Time conversion
#?strptime
reduced_data$Time <- strptime(paste(reduced_data$Date, reduced_data$Time), "%d/%m/%Y %H:%M:%S")

# (2) Date conversion
reduced_data$Date <- as.Date(reduced_data$Date, "%d/%m/%Y")

# Inspect Data
str(reduced_data)
# 'data.frame':	2880 obs. of  9 variables:
# $ Date                 : Date, format: "2007-02-01" "2007-02-01" "2007-02-01" ...
# $ Time                 : POSIXlt, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" ...
# $ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
# $ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
# $ Voltage              : num  243 243 244 244 243 ...
# $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...

#hist(reduced_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")



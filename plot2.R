library(data.table)
## download the zip file and unzip it
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="dataset2.zip")
unzip("./dataset2.zip",overwrite=TRUE)
data_project<-read.table(text = grep("^[1,2]/2/2007", readLines("./household_power_consumption.txt"), value = TRUE),sep = ";",header=FALSE,col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##make plot 1
date_char <- paste(data_project$Date,data_project$Time)
date_vector <- as.POSIXct(strptime(date_char,"%d/%m/%Y %H:%M:%S"))
##save png file
png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(data_project$Global_active_power ~ date_vector ,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()
##display on screen
dev.set(1)
plot(data_project$Global_active_power ~ date_vector,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")

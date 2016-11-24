url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("data")) {
  dir.create("data")
}
download.file(url, destfile = "/data")

data <- unzip("exdata_data_household_power_consumption.zip")
data1<- read.csv("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
data2<- subset(data1, data1$Date=="1/2/2007"| data1$Date=="2/2/2007")
data3<- data2
data3$Date<- as.Date(data2$Date,"%d/%m/%Y")
# creating new col as time and date mix
data3$TimeandDate<- strptime(paste(data2$Time,data2$Date), "%H:%M:%S %d/%m/%Y")

# plot 1
par(mfrow=c(1,1))
hist(data3$Global_active_power, main=paste("Global Active Power"), xlab = "Global Active Power (kilowatts)",col="red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
cat("Plot1.png has been saved in", getwd())
# Zip file downloaded and unzziped from plot1.R
HPCtxtFile <- "household_power_consumption.txt"
HPCData <- read.table(HPCtxtFile, header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE, dec = ".")
dateDownloaded <- date()

twoDaysData <- HPCData[HPCData$Date %in% c("1/2/2007","2/2/2007"), ]

with(twoDaysData, {
   date_time <<- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") 
   globalActivePower <<- as.numeric(Global_active_power)
   globalReactivePower <<- as.numeric(Global_reactive_power)
   voltage <<- as.numeric(Voltage)
   subMetering1 <<- as.numeric(Sub_metering_1)
   subMetering2 <<- as.numeric(Sub_metering_2)
   subMetering3 <<- as.numeric(Sub_metering_3)
})

# default dimensions 480x480 in pixels
png("plot4.png", bg = "lightyellow")
   par(mfrow = c(2, 2)) 
   
   plot(date_time, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
   plot(date_time, voltage, type = "l", xlab = "date_time", ylab = "Voltage")
   plot(date_time, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
   
   lines(date_time, subMetering2, type = "l", col = "red")
   lines(date_time, subMetering3, type = "l", col = "blue")
   
   legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n", cex = 0.85)
   
   plot(date_time, globalReactivePower, type = "l", xlab = "date_time", ylab = "Global_reactive_power")
dev.off()

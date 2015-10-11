# Zip file downloaded and unzziped from plot1.R
HPCtxtFile <- "household_power_consumption.txt"
HPCData <- read.table(HPCtxtFile, header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE, dec = ".")

twoDaysData <- HPCData[HPCData$Date %in% c("1/2/2007","2/2/2007"), ]

with(twoDaysData, {
   date_time <<- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") 

   # default dimensions 480x480 in pixels
   png("plot4.png", bg = "lightyellow")
      par(mfrow = c(2, 2)) 
      
      plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
      plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

      plot(date_time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
      lines(date_time, Sub_metering_2, type = "l", col = "red")
      lines(date_time, Sub_metering_3, type = "l", col = "blue")
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n", cex = 0.9)
      
      plot(date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
   dev.off()
})

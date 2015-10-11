# Zip file downloaded and unzziped from plot1.R
HPCtxtFile <- "household_power_consumption.txt"
HPCData <- read.table(HPCtxtFile, header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE, dec = ".")

twoDaysData <- HPCData[HPCData$Date %in% c("1/2/2007","2/2/2007"), ]

with(twoDaysData, {
   date_time <<- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") 
   
   # default dimensions 480x480 in pixels
   png("plot3.png", bg = "lightyellow")
      plot(date_time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
      lines(date_time, Sub_metering_2, type = "l", col = "red")
      lines(date_time, Sub_metering_3, type = "l", col = "blue")
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
   dev.off()
})

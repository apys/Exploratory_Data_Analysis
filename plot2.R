# Zip file downloaded and unzziped from plot1.R
HPCtxtFile <- "household_power_consumption.txt"
HPCData <- read.table(HPCtxtFile, header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE, dec = ".")

twoDaysData <- HPCData[HPCData$Date %in% c("1/2/2007","2/2/2007"), ]

with(twoDaysData, {
   date_time <<- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") 

   # default dimensions 480x480 in pixels
   png("plot2.png", bg = "lightcyan")
      plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
   dev.off()
})

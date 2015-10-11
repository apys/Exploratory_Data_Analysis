fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Download zip file
HPCzipFile <- "household_power_consumption.zip"
download.file(fileUrl, destfile = HPCzipFile)
dateDownloaded <- date()
# Read data set after unzipping the data file
HPCtxtFile <- "household_power_consumption.txt"
HPCData <- read.table(unz(HPCzipFile, filename = HPCtxtFile), header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE, dec = ".")

twoDaysData <- HPCData[HPCData$Date %in% c("1/2/2007","2/2/2007"), ]

with(twoDaysData, {
   globalActivePower <<- as.numeric(Global_active_power)
})

# default dimensions 480x480 in pixels
png("plot1.png", bg = "lightblue")
   hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

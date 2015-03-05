############################GETTING THE DATA############################

#Before running this code, make sure that the 'Electric power consumption'
# data set has been downloaded and extracted to your working directory.
# If not, you can use this script:

#URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#destfile <- "./EPC.zip"
#download.file(URL, destfile,mode="wb")
#unzip("EPC.zip")


file <- "household_power_consumption.txt"
peak <- readLines(file)
start_at <- grep("^1/2/2007;00:00:00", peak) - 1
get_col_names <- read.table(file, header = TRUE, sep=";",nrow = 1)
get_data <- read.table(file, sep= ";", skip=start_at, nrows = 2880)
names(get_data) <- names(get_col_names)

x <- paste(get_data$Date, get_data$Time)
Datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")

tidyset <- cbind(Datetime, get_data[c(-1,-2)])


####PLOTTING####
png(filename = "plot1.png", width = 480, height = 480)
hist(tidyset$Global_active_power, xlab = "Global Active Power (kilowatts)", 
                col = "red", main = "Global Active Power")
dev.off()
#load the 'sqldf' package and the file
# set the language of the dates/times to English
#read in only data from the lines which contain either '1/2/2007' or '2/2/2007'

require(sqldf)
Sys.setlocale("LC_TIME", "English")
file<-c("./household_power_consumption.txt")

DF<-read.csv.sql(file,header=T,sep=";",sql="select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

#close the connections
closeAllConnections()

#add a column to the dataframe, containing both date and time
DF$datetime<-paste(DF$Date, DF$Time)

#print date and time in the correct format
DF$datetime<-strptime(DF$datetime, "%d/%m/%Y %H:%M:%S", tz="")

#create a png-file of the correct size
png("plot3.png", width=480, height=480)

#create the plot
plot(DF$datetime, DF$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(DF$datetime, DF$Sub_metering_2, col = "red")
lines(DF$datetime, DF$Sub_metering_3, col = "blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#shut down the graphic devices
dev.off()
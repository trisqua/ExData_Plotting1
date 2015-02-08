#load the 'sqldf' package
require(sqldf)

#load the file, but read in only data from the lines which contain either '1/2/2007' or '2/2/2007'
file<-c("./household_power_consumption.txt")
DF<-read.csv.sql(file,header=T,sep=";",sql="select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

#close the connection again
closeAllConnections()

#create a histogram
png("plot1.png", width=480, height=480)
hist(DF$Global_active_power,col="red",main=paste("Global Active Power"),xlab=paste("Global Active Power (kilowatts)"))

#shut down all active grahpic devices
dev.off()
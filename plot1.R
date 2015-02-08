require(sqldf)

file<-c("./household_power_consumption.txt")

DF<-read.csv.sql(file,header=T,sep=";",sql="select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

closeAllConnections()

png("plot1.png", width=480, height=480)
hist(DF$Global_active_power,col="red",main=paste("Global Active Power"),xlab=paste("Global Active Power (kilowatts)"))
dev.off()
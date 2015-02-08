require(sqldf)
Sys.setlocale("LC_TIME", "English")
file<-c("./household_power_consumption.txt")

DF<-read.csv.sql(file,header=T,sep=";",sql="select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

closeAllConnections()

DF$datetime<-paste(DF$Date, DF$Time)

DF$datetime<-strptime(DF$datetime, "%d/%m/%Y %H:%M:%S", tz="")

png("plot2.png", width=480, height=480)

plot(DF$datetime,DF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

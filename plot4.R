require(sqldf)
Sys.setlocale("LC_TIME", "English")
file<-c("./household_power_consumption.txt")

DF<-read.csv.sql(file,header=T,sep=";",sql="select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

closeAllConnections()

DF$datetime<-paste(DF$Date, DF$Time)

DF$datetime<-strptime(DF$datetime, "%d/%m/%Y %H:%M:%S", tz="")

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))
with(DF, {

plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", bty="n",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
plot(datetime, Voltage, type = "l")

plot(datetime, Global_reactive_power, type="l")
})  
dev.off()        
        
        
        
        

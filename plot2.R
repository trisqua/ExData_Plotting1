#load the 'sqldf' package
require(sqldf)

# set the language of the dates/times to English
Sys.setlocale("LC_TIME", "English")

#read the file, but only data from the lines which contain either '1/2/2007' or '2/2/2007'
file<-c("./household_power_consumption.txt")
DF<-read.csv.sql(file,header=T,sep=";",sql="select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

#close the connections
closeAllConnections()

#add a column to the dataframe, containing both date and time
DF$datetime<-paste(DF$Date, DF$Time)

#print date and time in the correct format
DF$datetime<-strptime(DF$datetime, "%d/%m/%Y %H:%M:%S", tz="")

#create a png-file of the correct size
png("plot2.png", width=480, height=480)

#create the plot
plot(DF$datetime,DF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#shut down the graphic devices
dev.off()

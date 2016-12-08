library(data.table)


## Importing Data and Liitle Manipualation to extract required data
Data <- fread("household_power_consumption.txt",stringsAsFactors = F,header = T,sep=";")
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")
Data <- Data[Data$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

## Plot 4
#Initializing dev connection for creating a png file
png(filename = "plot4.png")

# steps followed in bulding the plot
# 1. adjust no of rows and columns, margins to accomodate 4 graphs -- mfcol adds graphs columnwise
# 2. same procedure as followed in plot2
# 3. same procedure as followed in plot3
# 4. similar to step 2 -- add x-axis label as well
# 5. similar to step 4

par(mfcol=c(2,2),mar = c(4,4,2,2))
plot(row.names(Data),as.numeric(Data$Global_active_power),type="l",xlab="",ylab="Global Active Power (Kilowatts)",xaxt="n")
axis(1,at= c(1,1440,2880),labels = c("Thu","Fri","Sat"))

plot(row.names(Data),Data$Sub_metering_1,type="l",xlab = "",ylab = "Energy Sub Metering",xaxt="n")
lines(row.names(Data),Data$Sub_metering_2,col="red")
lines(row.names(Data),Data$Sub_metering_3,col="blue")
axis(1,at= c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "_",col=c("black","red","blue"))

plot(row.names(Data),Data$Voltage,type="l",xlab = "datetime",ylab = "Voltage",xaxt="n")
axis(1,at= c(1,1440,2880),labels = c("Thu","Fri","Sat"))

plot(row.names(Data),Data$Global_reactive_power,type="l",xlab = "datetime",ylab = "Voltage",xaxt="n")
axis(1,at= c(1,1440,2880),labels = c("Thu","Fri","Sat"))
#closing the connection creates the png file
dev.off

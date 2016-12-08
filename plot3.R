library(data.table)


## Importing Data and Liitle Manipualation to extract required data
Data <- fread("household_power_consumption.txt",stringsAsFactors = F,header = T,sep=";")
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")
Data <- Data[Data$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

## Plot 3
#Initializing dev connection for creating a png file
png(filename = "plot3.png")


# steps followed in bulding the plot
# 1. plot sub_metering-1 data first --- attributes -> remove x-axis label,add y-axis label, remove x-axis tick  marks
# 2. plot sub_metering_2 data with red color
# 3. plot sub_metering_3 data with blue color
# 4. add x-axis tick marks
# 5. add legend --- attributes -> position of legend,text in legend, symbol type in legend, symbol color in legend
plot(row.names(Data),Data$Sub_metering_1,type="l",xlab = "",ylab = "Energy Sub Metering",xaxt="n")
lines(row.names(Data),Data$Sub_metering_2,col="red")
lines(row.names(Data),Data$Sub_metering_3,col="blue")
axis(1,at= c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "_",col=c("black","red","blue"))
# closing the connection will create the png file
dev.off


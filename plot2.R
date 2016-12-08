library(data.table)

## Importing Data and Liitle Manipualation to extract required data
Data <- fread("household_power_consumption.txt",stringsAsFactors = F,header = T,sep=";")
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")
Data <- Data[Data$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

## Plot 3
#Initializing dev connection for creating a png file
png(filename = "plot2.png")

# steps followed in bulding the plot
# 1. plot global active power data first vs index of data --- attributes -> type of plot,remove x-axis label,add y-axis label, remove x-axis tick  marks
# 2. add x-axis tick marks
plot(row.names(Data),as.numeric(Data$Global_active_power),type="l",xlab="",ylab="Global Active Power (Kilowatts)",xaxt="n")
axis(1,at= c(1,1440,2880),labels = c("Thu","Fri","Sat"))
# closing the connection creates the png file
dev.off



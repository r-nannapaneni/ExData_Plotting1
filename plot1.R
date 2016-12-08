library(downloader)
library(data.table)


##Downloading and Unzipping Data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url,dest = "Data.zip",mode="wb")
unzip("Data.Zip","./")

## Importing Data and Liitle Manipualation to extract required data
Data <- fread("household_power_consumption.txt",stringsAsFactors = F,header = T,sep=";")
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")
Data <- Data[Data$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

## Plot 1
#Initializing dev connection for creating a png file
png(filename = "plot1.png")

# histogram of global active power
# Attributes --- data,title,x-axis label,color for the histogram
hist(as.numeric(Data$Global_active_power),main= "Global Active Power",xlab = "Global Active Power (Kilowatts)",col="red")
# closing the connection creates the png file in the folder
dev.off


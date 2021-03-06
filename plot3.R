
plot3<-function()
{
  #Read in power consumption data, first 70K lines since data from Feb 1 & 2, 2007 is contained in those
  #The file is ";" delimited and NA values are represented as ?
  data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=70000)
  
  #convert Date column to date class
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  
  #Find subset of data that was collected on Feb 1 & 2, 2007
  sub<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
  
  #Combine date & time fields into one new column
  sub$datetime<-strptime(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S")
  
  #Open png graphics device
  png(file = "plot3.png")
  
  #Plot three variables (Sub_metering_1, 2 & 3) on the y axis vs DateTime on the y axis.  
  #Specify color for each line
  plot(datetime,Sub_metering_1, type="l", xlab="",ylab="Energy sub metering", col="black")
  lines(datetime, Sub_metering_2,type="l",col="red")
  lines(datetime, Sub_metering_3,type="l",col="blue")
  
  #Create legend
  legend(x="topright", # places legend at top right
         c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), #assigns labels
         lty=c(1,1,1), #specifies lines
         lwd=c(2.5,2.5), #specifies width
         col=c("black","red","blue"))  #specifies color
  
  #Closes graphics device
  dev.off()
  
}
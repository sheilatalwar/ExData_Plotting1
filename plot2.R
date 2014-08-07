
plot2<-function()
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
  png(file = "plot2.png")
  
  #plot DateTime vs Global Active power, specify line graph and labels
  plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  #Closes graphics device
  dev.off()
}
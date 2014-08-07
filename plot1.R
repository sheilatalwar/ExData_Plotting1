
plot1<-function()
{
  #Read in power consumption data, first 70K lines since data from Feb 1 & 2, 2007 is contained in those
  #The file is ";" delimited and NA values are represented as ?
  data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=70000)

  #convert Date column to date class
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  
  #Find subset of data that was collected on Feb 1 & 2, 2007
  sub<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
  
  #Open png graphics device
  png(file = "plot1.png")
  
  #Create a histogram of Global Active Power, set the color to red, and specify 12 bins for the histogram
  hist(sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", breaks=12)
  
  #Turn off the graphics device
  dev.off()
}
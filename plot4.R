#Code is assuming that data is available in the working directory

plot4 <- function(){
  #reading data from txt file
  dt <- 
    read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
           colClasses = 
               c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  #filtering to take the two days only as mentioned in instructions
  plotInput <- dt[dt$"Date" == "1/2/2007" | dt$"Date" == "2/2/2007", ] 
  
  #Creating datetime vector for plotting aginst weekdays
  dVec <- as.POSIXct(strptime(paste(plotInput$"Date", plotInput$"Time", sep = " "), format="%d/%m/%Y %H:%M:%S"))
  
  #creating graphics device
  png("plot4.png", width = 480, height = 480, bg="transparent")
  
  #specifying that we will drawing rowwise in 2 rows and 2 columns
  par(mfrow=c(2,2))
  
  #plotting Global active power vs. weekdays
  plot(x = dVec, y = plotInput$"Global_active_power", type="l", xlab="", ylab="Global Active Power") 
  
  #plotting Voltage vs. weekdays
  plot(x = dVec, y = plotInput$"Voltage", type="l", xlab="datetime", ylab="Voltage") 
  
  #plotting the 3 sub meterings in 1 graph 
  plot(x = dVec, y = plotInput$"Sub_metering_1", type="l", xlab="", ylab="Energy sub metering") 
  lines(x = dVec, y = plotInput$"Sub_metering_2", col="red") 
  lines(x = dVec, y = plotInput$"Sub_metering_3", col="blue")
  
  #adding legends
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)

  #plotting Global reactive power vs. weekdays
  plot(x = dVec, y = plotInput$"Global_reactive_power", type="l", xlab="datetime", ylab="Global_reactive_power") 

  #closing graphics device
  dev.off()
}
  
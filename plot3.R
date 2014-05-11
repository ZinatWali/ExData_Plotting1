#Code is assuming that data is available in the working directory

plot3 <- function(){
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
  png("plot3.png", width = 480, height = 480, bg="transparent")
    
  #plotting the 3 sub meterings in 1 graph
  plot(x = dVec, y = plotInput$"Sub_metering_1", type="l", xlab="", ylab="Energy sub metering") 
  lines(x = dVec, y = plotInput$"Sub_metering_2", col="red") 
  lines(x = dVec, y = plotInput$"Sub_metering_3", col="blue")
  
  #adding legends
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
  
  #closing graphics device
  dev.off()  
}

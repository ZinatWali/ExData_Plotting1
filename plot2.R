#Code is assuming that data is available in the working directory

plot2 <- function(){
  #reading data from txt file
  dt <- 
    read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
             colClasses = 
               c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  #filtering to take the two days only as mentioned in instructions
  plotInput <- dt[dt$"Date" == "1/2/2007" | dt$"Date" == "2/2/2007", ] 
  
  #setting background as transparent
  par(bg="transparent")
  
  #Creating datetime vector for plotting aginst weekdays
  dVec <- as.POSIXct(strptime(paste(plotInput$"Date", plotInput$"Time", sep = " "), format="%d/%m/%Y %H:%M:%S"))
  
  #plotting Global active power vs. weekdays
  plot(x = dVec, y = plotInput$"Global_active_power", type="l", xlab="", ylab="Global Active Power (kilowatts)") 
  
  #copying graph to png
  dev.copy(png, file="plot2.png", width=480, height=480)
  
  #closing graphics device
  dev.off()
}

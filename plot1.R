#Code is assuming that data is available in the working directory

plot1 <- function(){
  #reading data from txt file
  dt <- 
    read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
             colClasses = 
               c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  #filtering to take the two days only as mentioned in instructions
  plotInput <- dt[dt$"Date" == "1/2/2007" | dt$"Date" == "2/2/2007", ] 
  
  #setting background as transparent
  par(bg="transparent")
  
  #drawing a frequency histogram of Global active power
  hist(plotInput$"Global_active_power", col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
  #copying graph to png
  dev.copy(png, file="plot1.png", width=480, height=480)
  
  #closing graphics device
  dev.off()
}




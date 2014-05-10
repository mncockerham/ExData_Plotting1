##Creation Code for Chart 1
 

## SET WD
setwd <- 'C:\\Users\\Mark\\Documents\\IntroR'

##file location

file <- 'C:\\Users\\Mark\\Documents\\IntroR\\Exp_Peer_1\\Data\\household_power_consumption.txt'

 


##Load file (Iload the entire data set)

base <- read.table(file,sep = ';',header = TRUE)
 
##Filter down to the data we need (Extract the 2 days data we are interested in)
dayOne <- base[base$Date == '1/2/2007',]
dayTwo <- base[base$Date == '2/2/2007',] 
plotData <- rbind(dayOne,dayTwo)

#For graphing we want a single filed with day of week and time information, this can be created with the following code
plotData$DateTime <- strptime(paste(plotData$Date,plotData$Time), "%d/%m/%Y %H:%M:%S")

##Set up ouptut

png(filename = "Chart4.png",  width = 480, height = 480  , units = "px", pointsize = 12,  bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png") )


#plot4 (I use the as.character/as.numeric functions to change the loaded factors to numeric values)

##Set the output to show 4 seperate graphs
par(mfrow=c(2,2) )

#Sub1
plot(plotData$DateTime,as.numeric(as.character(plotData$Global_active_power)),type='l',ylab="Global Active Power",xlab="")
#Sub2
plot(plotData$DateTime,as.numeric(as.character(plotData$Voltage)),type='l',ylab="Voltage",xlab="datetime")
#sub3
with(plotData,plot(DateTime,as.numeric(as.character(Sub_metering_1)),type="l",col="black",ylab="Energy sub metering",xlab=""))
with(plotData,lines(DateTime,as.numeric(as.character(Sub_metering_2)),type="l",col="red"))
with(plotData,lines(DateTime,as.numeric(as.character(Sub_metering_3)),type="l",col="blue"))
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n") 
#Sub 4
plot(plotData$DateTime,as.numeric(as.character(plotData$Global_reactive_power)),type='l',ylab="Global_reactive_power",xlab="datetime")



dev.off()
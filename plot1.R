##Creation Code for Chart 1
 

## SET WD
setwd ('C:\\Users\\Mark\\Documents\\IntroR\\Exp_Peer_1')
 
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

png(filename = "Chart1.png",  width = 480, height = 480  , units = "px", pointsize = 12,  bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png") )

#plot1 (I use the as.character/as.numeric functions to change the loaded factors to numeric values)

hist(as.numeric(as.character(plotData$Global_active_power)), col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")


dev.off()
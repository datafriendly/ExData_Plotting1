rm(list=ls())
   
   
setwd('C:/Users/Administrator/Toolbox/ExData_Plotting1')
dt <- read.table('exdata-data-household_power_consumption/household_power_consumption.txt',
                 na.strings = "?", sep = ";",stringsAsFactors = F, header = T)

## extract the data used for plot
dt.plot <- dt[dt$Date%in%c('1/2/2007', '2/2/2007'), ] 

## add datetime column by combining Date and Time
dt.plot$datetime <- as.POSIXct(paste(dt.plot$Date, dt.plot$Time), format="%d/%m/%Y %H:%M:%S")

## plot 2
png('plot2.png', width = 480, height = 480)
plot(Global_active_power~datetime, data = dt.plot, type = 'l', xlab = "", ylab = 'Global Active Power (kilowatts)')
dev.off()
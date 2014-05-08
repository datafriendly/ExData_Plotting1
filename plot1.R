rm(list = ls())
setwd('C:/Users/Administrator/Toolbox/ExData_Plotting1')

dt <- read.table('exdata-data-household_power_consumption/household_power_consumption.txt',
                 na.strings = "?", sep = ";",stringsAsFactors = F, header = T)

## extract the data used for plot
dt.plot <- dt[dt$Date%in%c('1/2/2007', '2/2/2007'), ] 

#3 plot 1
png('plot1.png', width = 480, height = 480)
hist(dt.plot$Global_active_power, col = 'red', 
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')
dev.off()
rm(list = ls())
setwd('C:/Users/Administrator/Toolbox/ExData_Plotting1')
dt <- read.table('exdata-data-household_power_consumption/household_power_consumption.txt',
                 na.strings = "?", sep = ";",stringsAsFactors = F, header = T)

## extract the data used for plot
dt.plot <- dt[dt$Date%in%c('1/2/2007', '2/2/2007'), ] 

## add datetime column by combining Date and Time
dt.plot$datetime <- as.POSIXct(paste(dt.plot$Date, dt.plot$Time), format="%d/%m/%Y %H:%M:%S")

## plot 4
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
plot(Global_active_power~datetime, data = dt.plot, type = 'l', xlab = "", ylab = 'Global Active Power')
plot(Voltage~datetime, data = dt.plot, type = 'l', xlab = 'datetime')
plot(Sub_metering_1~datetime, data = dt.plot, type = 'l', xlab = "", ylab = 'Energy sub metering')
points(Sub_metering_2~datetime, data = dt.plot, type = 'l', col = 'red')
points(Sub_metering_3~datetime, data = dt.plot, type = 'l', col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n')
plot(Global_reactive_power~datetime, data = dt.plot, type = 'l', xlab = 'datetime')
dev.off()

#read all data from csv - separator=';'
hhpower <- read.csv2('household_power_consumption.txt', na.strings='?')

#subset data to only 01-02/02/2007
hhpower2days <- subset(hhpower, as.Date(hhpower$Date,'%d/%m/%Y') %in% c(as.Date('2007-02-02', '%Y-%m-%d'), as.Date('2007-02-01','%Y-%m-%d')))

## Needed datetime for plot 2, 3, 4:
hhpower2days$datetime = strptime(paste(hhpower2days$Date, hhpower2days$Time), '%d/%m/%Y %H:%M:%S')


#intialize
par(mfcol = c(2,2), bg = 'transparent')


# PLOT 2
with(hhpower2days, 
  plot(datetime, as.numeric(Global_active_power)/1000,
       xlab = '', ylab = 'Global Active Power (kilowatts)', type='l')
)


# PLOT 3
with(hhpower2days, {
  plot(datetime, Sub_metering_1, col='black', xlab='', ylab='Energy sub metering', type='l')
  lines(datetime, Sub_metering_2, col='red')
  lines(datetime, Sub_metering_3, col='blue')
})
legend('topright',
  legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
  lty = c(1, 1, 1), #symbol is line
  lwd = c(2.5, 2.5, 2.5), #line thickness
  col = c('black', 'red', 'blue') #line colors
)



# ..for PLOT 4, 2 more plots:
with(hhpower2days, {
  plot(datetime, Voltage, col='black', xlab='datetime', ylab='Voltage', type='l')
}) 

with(hhpower2days, {
  plot(datetime, Global_reactive_power, col='black', xlab='datetime', ylab='Global_reactive_power', type='l')
}) 


# PLOT 4
dev.copy(png, file='./figure/plot4.png', width=480, height=480)
dev.off()

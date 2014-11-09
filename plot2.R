#read all data from csv - separator=';'
hhpower <- read.csv2('household_power_consumption.txt', na.strings='?')

#subset data to only 01-02/02/2007
hhpower2days <- subset(hhpower, as.Date(hhpower$Date,'%d/%m/%Y') %in% c(as.Date('2007-02-02', '%Y-%m-%d'), as.Date('2007-02-01','%Y-%m-%d')))

## Needed datetime for plot 2, 3, 4:
hhpower2days$datetime = strptime(paste(hhpower2days$Date, hhpower2days$Time), '%d/%m/%Y %H:%M:%S')

#intialize
par(mfrow = c(1,1), bg = 'transparent')


# PLOT 2
with(hhpower2days, 
  plot(datetime, as.numeric(Global_active_power)/1000,
       xlab = '', ylab = 'Global Active Power (kilowatts)', type='l')
)

dev.copy(png, file='./figure/plot2.png', width=480, height=480)
dev.off()

#read all data from csv - separator=';'
hhpower <- read.csv2('household_power_consumption.txt', na.strings='?')

#subset data to only 01-02/02/2007
hhpower2days <- subset(hhpower, as.Date(hhpower$Date,'%d/%m/%Y') %in% c(as.Date('2007-02-02', '%Y-%m-%d'), as.Date('2007-02-01','%Y-%m-%d')))

#intialize
par(mfrow = c(1,1), bg = 'transparent')



# PLOT 1
hist(as.numeric(paste(hhpower2days$Global_active_power)), col='red', xlab='Global Active Power (kilowatts)', ylab='Frequency', main='Global Active Power')

dev.copy(png, file='plot1.png', width=480, height=480)
dev.off()

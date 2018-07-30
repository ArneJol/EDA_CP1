
# Outline -----------------------------------------------------------------

# plot 4 of Cource project 1

# Load libraries ----------------------------------------------------------
require(readr)
require(dplyr)
require(lubridate)



# download zip dataset and unzip to folder --------------------------------
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "./data/hh_power_consumption.zip")
unzip("./data/hh_power_consumption.zip", exdir = "./data/")


# transform data ----------------------------------------------------------

# read data in dataframe
dfhhpower <- read_delim("./data/household_power_consumption.txt",
                        na="?", delim=";")

# convert Date and Time to proper format
dfhhpower %>%
  mutate(DateTime =  dmy_hms(paste0(Date,"_",Time)),
         Date = dmy(Date),
         Time = hms(Time)) %>%
  filter(Date == "2007-02-01" | Date == "2007-02-02") -> dfhhpower_smal


# Create plot -------------------------------------------------------------

# open output to png file
png(filename = "plot4.png", width = 480, height = 480)

# create 4 plots in one plot
par(mfrow=c(2,2))


# plot 1 - Global active power
plot(dfhhpower_smal$DateTime, dfhhpower_smal$Global_active_power, 
     type="l",  ylab="Global Active Power (kilowats)", xlab="",
     xaxt="n") 

date_seq <- seq(min(dfhhpower_smal$DateTime), max(dfhhpower_smal$DateTime) + days(1),
                by="days")
axis(side=1, at=date_seq, labels=weekdays(date_seq))


# plot 2 - Voltage
plot(dfhhpower_smal$DateTime, dfhhpower_smal$Voltage, 
     type="l",  ylab="Voltage", xlab="DateTime",
     xaxt="n") 

date_seq <- seq(min(dfhhpower_smal$DateTime), max(dfhhpower_smal$DateTime) + days(1),
                by="days")
axis(side=1, at=date_seq, labels=weekdays(date_seq))




# plot 3 - Energy sub metering
plot(dfhhpower_smal$DateTime, dfhhpower_smal$Sub_metering_1, 
     type="l",  ylab="Energy sub metering", xlab="",
     xaxt="n", col=1) 

# line sub_metering 2
lines(dfhhpower_smal$DateTime, dfhhpower_smal$Sub_metering_2, 
      type="l",col=2)

# line sub_metering 3
lines(dfhhpower_smal$DateTime, dfhhpower_smal$Sub_metering_3, 
      type="l",col=4)

date_seq <- seq(min(dfhhpower_smal$DateTime), max(dfhhpower_smal$DateTime) + days(1),
                by="days")
axis(side=1, at=date_seq, labels=weekdays(date_seq))
legend("topright", lty=c(1,1,1), legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"), col=c(1,2,4))




# plot 4 - Global reactive power
plot(dfhhpower_smal$DateTime, dfhhpower_smal$Global_reactive_power, 
     type="l",  ylab="Global_reactive_power", xlab="DateTime",
     xaxt="n") 

date_seq <- seq(min(dfhhpower_smal$DateTime), max(dfhhpower_smal$DateTime) + days(1),
                by="days")
axis(side=1, at=date_seq, labels=weekdays(date_seq))

# clode png device
dev.off()
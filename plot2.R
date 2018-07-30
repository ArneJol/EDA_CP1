
# Outline -----------------------------------------------------------------

# plot 2 of Cource project 1

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

# line chart of global active power on thir, fri, sat
png(filename = "plot2.png", width = 480, height = 480)

# set up the plot 
with(dfhhpower_smal,
  plot(DateTime,
       Global_active_power, 
       type="l",
       ylab="Global Active Power (kilowats)",
       xaxt="n") 
 )
 date_seq <- seq(min(dfhhpower_smal$DateTime), max(dfhhpower_smal$DateTime) + days(1),
                    by="days")
 axis(side=1, at=date_seq, labels=weekdays(date_seq))
 dev.off()
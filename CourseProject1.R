require(data.table)
require(dplyr)
require(lubridate)
# Course project 1

# download zip dataset and unzip to folder
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "./data/hh_power_consumption.zip")
unzip("./data/hh_power_consumption.zip", exdir = "./data/")

# read data in dataframe
dfhhpower <- fread("./data/household_power_consumption.txt",
                       dec=".",
                       colClasses=c("character","character","numeric","numeric","numeric",
                                    "numeric","numeric","numeric","numeric"),
                        na.strings="?")

# convert Date and Time to proper format
dfhhpower %>% mutate(Date=dmy(Date)) -> dfhhpower_t

# format of input datafile
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

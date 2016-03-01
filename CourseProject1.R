# Course project 1

# download zip dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "./data/hh_power_consumption.zip")
unzip("./data/hh_power_consumption.zip", exdir = "./data/")

dfhhpower <- read.csv2(file="./data/household_power_consumption.txt",
                       dec=".",
                       colClasses=c("POSIXct","POSIXct","numeric","numeric","numeric",
                                    "numeric","numeric","numeric","numeric"),
                        na.strings="?")

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
dfhhpower %>% 
        mutate(Date=dmy(Date)) %>%
        filter(Date == "2007-02-01" | Date == "2007-02-02") -> dfhhpower_smal

# histogram of global active power
png(filename = "plot1.png", width = 480, height = 480)
with(dfhhpower_sel,
  hist(Global_active_power,
    col = "red", breaks=seq(0,9,by=0.5),
    main = paste("Global Active Power"),
    xlab="Global Active Power (kilowatts)",
    xlim=c(0,7.5)
  )
)
dev.off()





par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
plot(Wind, Ozone, main = "Ozone and Wind")
plot(Solar.R, Ozone, main = "Ozone and Solar Radiation") plot(Temp, Ozone, main = "Ozone and Temperature") mtext("Ozone and Weather in New York City", outer = TRUE)
})
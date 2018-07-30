require(readr)
require(dplyr)
require(lubridate)
# Course project 1

# download zip dataset and unzip to folder
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "./data/hh_power_consumption.zip")
unzip("./data/hh_power_consumption.zip", exdir = "./data/")

# read data in dataframe
dfhhpower <- read_delim("./data/household_power_consumption.txt",
                       na="?",
                       delim=";")


# convert Date and Time to proper format
dfhhpower %>%
  mutate(DateTime =  dmy_hms(paste0(Date,"_",Time)),
         Date = dmy(Date),
         Time = hms(Time)) %>%
         filter(Date == "2007-02-01" | Date == "2007-02-02") -> dfhhpower_smal

# histogram of global active power
png(filename = "plot1.png", width = 480, height = 480)
with(dfhhpower_smal,
  hist(Global_active_power,
    col = "red", breaks=seq(0,9,by=0.5),
    main = paste("Global Active Power"),
    xlab="Global Active Power (kilowatts)",
    xlim=c(0,7.5)
  )
)
dev.off()
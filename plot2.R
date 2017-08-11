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

# line chart of global active power on thir, fri, sat
# png(filename = "plot2.png", width = 480, height = 480)

     
     # set up the plot 
     plot(dfhhpower_sel$Time, dfhhpower_sel$Global_active_power, type="n", , ylab="Global Active Power (kilowats)") 
     lines(dfhhpower_sel$Time, dfhhpower_sel$Global_active_power, type="l", lwd=1.5) 
      
     # add a title and subtitle 
     title("Tree Growth", "example of line plot")
    

#dev.off()
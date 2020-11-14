# The file is donwloaded by another file "202011_JHU_EDA_Week1.R"
# Reading file
path <- getwd()
df <- read.table(file.path(path,"household_power_consumption.txt"),
                 header=TRUE,sep=";",na.strings="?")

# Subset the data set dated from 2007-02-01 to 2007-02-02
### Create a DateTime variable
df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- strptime(df$DateTime,"%d/%m/%Y %H:%M:%S")
### Convert Date variable as date
df$Date <- as.Date(df$Date,"%d/%m/%Y")
## Subset by dates, 2007-02-01 and 2007-02-02
df_clean <- subset(df, Date=="2007-02-01" | Date=="2007-02-02" )

# Global Active Power line plot
png(filename = "plot2.png")
plot(df_clean$DateTime,df_clean$Global_active_power,
     pch="." , xlab="",
     ylab="Global Active Power (kilowatts)")
lines(df_clean$DateTime,df_clean$Global_active_power)
dev.off()


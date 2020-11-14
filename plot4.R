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

# Create 2 x 2 plot area
png(filename = "plot4.png")
par(mfcol=c(2,2),mar=c(4,4,2,1))
with(df_clean,{
    plot(df_clean$DateTime,df_clean$Global_active_power,
         type="l",pch="." , xlab="",
         ylab="Global Active Power (kilowatts)")
    plot(df_clean$DateTime,df_clean$Sub_metering_1,
         type="l",pch=".",xlab="",
         ylab="Energy sub metering")
    lines(df_clean$DateTime,df_clean$Sub_metering_2,
          col="red")
    lines(df_clean$DateTime,df_clean$Sub_metering_3,
          col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           cex=0.5, lty=1, col=c("black","red","blue"),
           y.intersp = 1,bty="n")
    plot(df_clean$DateTime,df_clean$Voltage,
         type="l",xlab="datetime",ylab="Voltage")
    plot(df_clean$DateTime,df_clean$Global_reactive_power,
         type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()

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

# Energy sub metering
png(filename = "plot3.png")
plot(df_clean$DateTime,df_clean$Sub_metering_1,
     pch=".",xlab="",
     ylab="Energy sub metering")
lines(df_clean$DateTime,df_clean$Sub_metering_1)
lines(df_clean$DateTime,df_clean$Sub_metering_2,
      col="red")
lines(df_clean$DateTime,df_clean$Sub_metering_3,
      col="blue")
dev.off()

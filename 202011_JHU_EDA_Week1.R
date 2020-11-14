# Download file 
path <- getwd()
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, file.path(path,"dataset.zip"))
unzip(zipfile="dataset.zip")
list.files(path=path)

# Read file
## As the instruction says, missing values are coded as ?
## Replace ? with NA
df <- read.table(file.path(path,"household_power_consumption.txt"),
                 header=TRUE,sep=";",na.strings="?")

# Summary of the dataset
head(df)
summary(df)
str(df)
# Subset the data set dated from 2007-02-01 to 2007-02-02
## Before subsetting the specified dates, df$V1
## needs to be converted as date
### Create a DateTime variable
df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- strptime(df$DateTime,"%d/%m/%Y %H:%M:%S")
### Convert Date variable as date
df$Date <- as.Date(df$Date,"%d/%m/%Y")

## Subset by dates, 2007-02-01 and 2007-02-02
df_clean <- subset(df, Date=="2007-02-01" | Date=="2007-02-02" )
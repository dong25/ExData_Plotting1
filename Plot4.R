#reading and formatting data
df_source<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?", stringsAsFactors = FALSE)
t2<-str_c(df_source$Date,df_source$Time, sep = " ")
t3<-strptime(t2,"%d/%m/%Y %H:%M:%S") #capital Y for yyyy, small y for yy
df2<-cbind(df_source,t3)
colnames(df2)[10]<-"formatted_date"
df3<-subset(df2,formatted_date<="2007-02-02 23:59:59" & formatted_date>="2007-02-01 00:00:00")

#plotting
png("plot4.png", 480, 480)
par(mfcol=c(2,2))
#plot first graph
plot(df3$formatted_date,df3$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab="",type = 'n')
lines(df3$formatted_date,df3$Global_active_power)
#plot 2nd graph
plot(df3$formatted_date,df3$Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = 'n')
lines(df3$formatted_date,df3$Sub_metering_1)
lines(df3$formatted_date,df3$Sub_metering_2,col = "red")
lines(df3$formatted_date,df3$Sub_metering_3,col = "blue")
#plot 3rd graph
plot(df3$formatted_date,df3$Voltage,xlab = "datetime",ylab = "Voltage", type = 'n')
lines(df3$formatted_date,df3$Voltage)
#plot 4th graph
plot(df3$formatted_date,df3$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type='n')
lines(df3$formatted_date,df3$Global_reactive_power)
dev.off()
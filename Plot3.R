#reading and formatting data
df_source<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?", stringsAsFactors = FALSE)
t2<-str_c(df_source$Date,df_source$Time, sep = " ")
t3<-strptime(t2,"%d/%m/%Y %H:%M:%S") #capital Y for yyyy, small y for yy
df2<-cbind(df_source,t3)
colnames(df2)[10]<-"formatted_date"
df3<-subset(df2,formatted_date<="2007-02-02 23:59:59" & formatted_date>="2007-02-01 00:00:00")

#plotting
png("plot3.png", 480, 480)
plot(df3$formatted_date,df3$Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = 'n')
lines(df3$formatted_date,df3$Sub_metering_1)
lines(df3$formatted_date,df3$Sub_metering_2,col = "red")
lines(df3$formatted_date,df3$Sub_metering_3,col = "blue")
#title(ylab = "Energy sub metering")
legend("topright", lwd = c(2,2,2), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"))
dev.off()

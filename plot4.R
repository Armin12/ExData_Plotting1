#Read household_power_consumption data
household_power_consumption<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

#Explore the data
typeof(household_power_consumption)
class(household_power_consumption)
names(household_power_consumption)
dim(household_power_consumption)

#Check for NA values in Date
household_power_consumption[household_power_consumption$Date=="?",]

#convert the Date to Date/Time classes in R
household_power_consumption$Date = as.Date(household_power_consumption$Date,format=c("%d/%m/%Y"))

#Extracting related data
household_power_consumption_twodays = household_power_consumption[(household_power_consumption$Date=="2007-02-01") | (household_power_consumption$Date=="2007-02-02"),]

# 1. Open png file
png("plot4.png", width = 480, height = 480)

# 2. Create the plot
#convert factor to numeric

plot_data1=as.numeric(levels(household_power_consumption_twodays$Global_active_power))[household_power_consumption_twodays$Global_active_power]

plot_data2=as.numeric(levels(household_power_consumption_twodays$Voltage))[household_power_consumption_twodays$Voltage]

plot_data3=as.numeric(levels(household_power_consumption_twodays$Sub_metering_1))[household_power_consumption_twodays$Sub_metering_1]
plot_data4=as.numeric(levels(household_power_consumption_twodays$Sub_metering_2))[household_power_consumption_twodays$Sub_metering_2]
plot_data5=household_power_consumption_twodays$Sub_metering_3

plot_data6=as.numeric(levels(household_power_consumption_twodays$Global_reactive_power))[household_power_consumption_twodays$Global_reactive_power]


par(mfrow = c(2,2),mar=c(4,4,2,1))

plot(plot_data1,col="black",ylab="Global Active Power",type="l",xlab="",xaxt = "n")
axis(side = 1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))


plot(plot_data2,col="black",ylab="Voltage",type="l",xlab="",xaxt = "n")
axis(side = 1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))


plot(plot_data3,col="black",ylab="Energy sub metering",type="l",xlab="",xaxt = "n")
lines(plot_data4,col="red",ylab="Energy sub metering",type="l",xlab="",xaxt = "n")
lines(plot_data5,col="blue",ylab="Energy sub metering",type="l",xlab="",xaxt = "n")
axis(side = 1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))
legend("topright", pch = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(plot_data6,col="black",ylab="Global_reactive_power",type="l",xlab="",xaxt = "n")
axis(side = 1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))


# 3. Close the file
dev.off()
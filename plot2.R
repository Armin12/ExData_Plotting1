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
png("plot2.png", width = 480, height = 480)

# 2. Create the plot
#convert factor to numeric
plot_data=as.numeric(levels(household_power_consumption_twodays$Global_active_power))[household_power_consumption_twodays$Global_active_power]
plot(plot_data,col="black",ylab="Global Active Power (kilowatts)",main="Global Active Power",type="l",xlab="",xaxt = "n")
axis(side = 1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))
# 3. Close the file
dev.off()
#1st plot
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","temp.zip")
file<-unzip("temp.zip")
file2<-readRDS(file[2])
#Get emissions by year
ybaldata<- aggregate(Emissions ~ year, file2,sum)
png("plot1.png")
barplot(ybaldata$Emissions,xlab = "Year", ylab = "Emissions(tons)", main="Total PM2.5 Emissions From all Sources")
dev.off()

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","temp.zip")
file<-unzip("temp.zip")
file2<-readRDS(file[2])
#Baltimore data
baldata<-subset(file2,fips=="24510")
#Get emissions by year
ybaldata<- aggregate(Emissions ~ year, baldata,sum)
png("plot2.png")
barplot(ybaldata$Emissions,xlab = "Year", ylab = "Emissions(tons)", main="Total PM2.5 Emissions From All Baltimore City Sources")
dev.off()

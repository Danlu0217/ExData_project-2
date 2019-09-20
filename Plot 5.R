#plot 5, motervehcile emissions
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="temp.zip")
file<-unzip("temp.zip")
file2<-readRDS(file[2])
file1<-readRDS(file[1])
#Get sources that contain "Motor Vehchiles"
vehicles <- grepl("vehicle", file1$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- file1[vehicles,]$SCC
vNEI <- file2[file2$SCC %in% vehiclesSCC,]
#Get Baltimore related data
baltimorevNEI <- vNEI[vNEI$fips==24510,]
library(ggplot2)
png("plot5.png")
ggplot(data=baltimorevNEI,aes(factor(year),Emissions))+geom_bar(stat = "identity")+labs(x="year",y="Emissions (tons)")+labs(title = "Emissions from motor vehicle sources changed from 1999–2008 in Baltimore City")
dev.off()
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
baltimorevNEI <- vNEI[vNEI$fips=="24510",]
LAvNEI<-vNEI[vNEI$fips=="06037",]
library(ggplot2)
library(gridExtra)
png("plot6.png")
p1<-ggplot(data=baltimorevNEI,aes(factor(year),Emissions))+geom_bar(aes(fill=year),stat = "Identity")+labs(title = "Baltimore PM2.5 Emissions from motor vehcile source")+xlab("Year")+ ylab("Emissions(tons)")
p2<-ggplot(LAvNEI,aes(x=factor(year),y=Emissions),aes(fips))+geom_bar(aes(fill=year),stat = "Identity") + labs(title = "LA PM2.5 Emissions from motor vehcile source")+xlab("Year")+ylab("Emissions(tons)")
grid.arrange(p2,p1)
dev.off()
#3rd plot
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","temp.zip")
file<-unzip("temp.zip")
file2<-readRDS(file[2])
#Baltimore data
baldata<-subset(file2,fips=="24510")
#Load ggplot package
library(tidyverse)
#ploting
png("Plot3.png")
ggplot(data=baldata,aes(x=year, y=Emissions),color=type)+geom_point(aes(color=type))+ ylab("Emissions(tons)")
dev.off()


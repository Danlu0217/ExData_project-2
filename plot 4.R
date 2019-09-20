download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="temp.zip")
file<-unzip("temp.zip")
file2<-readRDS(file[2])
file1<-readRDS(file[1])
#Get sources that contain "Comb/Coal"
Comb <- grepl("Comb.*Coal|Coal.*Comb", file1$Short.Name, ignore.case=TRUE)
CombSCC <- file1[Comb,]$SCC
Cfile2 <- file2[file2$SCC %in% CombSCC,]
library(ggplot2)
png("plot 4.png")
ggplot(data=Cfile2,aes(factor(year),Emissions))+geom_bar(stat = "identity")+labs(x="year",y="Emissions (tons)")+labs(title = "Emissions from Coal combustion related sources")
dev.off()
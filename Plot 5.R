#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#subset SSC by motor sources and separate out the SSC numbers
motor<-subset(SCC, SCC.Level.One=="Mobile Sources")
motorscc<-motor$SCC
motorscc<-as.character(motorscc)
motorscc<-as.numeric(motorscc)

#Filter NEI by motor SCC numbers
library(dplyr)
NEImotor<-filter(NEI,NEI$SCC %in% motorscc)

#Subset the filtered NEI by Baltimore
Balt<-subset(NEImotor,fips=="24510")

#sum of emissions by year
years<-split(Balt,Balt$year)
sums<-data.frame()
for (i in years) {
    x<-sum(i$Emissions)
    sums<-rbind(sums,x)
}
colnames(sums)<-c("Sum")
sums<-cbind(sums,Year=c(1999,2002,2005,2008))

#graphing
png("plot5.png")
barplot(sums$Sum, names.arg = sums$Year, xlab = "Year", ylab = "Total PM2.5 Emission (tons)", main = "Baltimore Emissions by Motor Vehicle Sources", col = "darkblue")
dev.off()


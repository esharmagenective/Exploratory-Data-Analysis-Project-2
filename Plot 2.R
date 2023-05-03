#Have total emissions from PM2.5 decreased in the 
#Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

Balt<-subset(NEI,fips=="24510")

years<-split(Balt,Balt$year)
sums<-data.frame()
for (i in years) {
    x<-sum(i$Emissions)
    sums<-rbind(sums,x)
}
colnames(sums)<-c("Sum")
sums<-cbind(sums,Year=c(1999,2002,2005,2008))

png("plot2.png")
barplot(sums$Sum, names.arg = sums$Year, xlab = "Year", ylab = "Total PM2.5 Emission (tons)", main = "Baltimore PM2.5 Emission by Year", col = "darkblue")
dev.off()

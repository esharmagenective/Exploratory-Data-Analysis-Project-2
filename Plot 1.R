# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

years<-split(NEI,NEI$year)
sums<-data.frame()
for (i in years) {
    x<-sum(i$Emissions)
    sums<-rbind(sums,x)
}
colnames(sums)<-c("Sum")
sums<-cbind(sums,Year=c(1999,2002,2005,2008))

png("plot1.png")
barplot(sums$Sum, names.arg = sums$Year, xlab = "Year", ylab = "Total PM2.5 Emission (tons)", main = "Total PM2.5 Emission by Year", col = "darkblue")
dev.off()

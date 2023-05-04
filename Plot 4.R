#Across the United States, 
#how have emissions from coal combustion-related sources changed from 1999–2008?

#subset SSC by coal sources and separate out the SSC numbers
coal<-subset(SCC, SCC.Level.Three=="Bituminous/Subbituminous Coal")
coalscc<-coal$SCC
coalscc<-as.numeric(coalscc)

#filter NEI by SCC numbers linked to coal emissions
library(dplyr)
NEIcoal<-filter(NEI,NEI$SCC %in% coalscc)

# sum of emissions for coal sources by year
years<-split(NEIcoal,NEIcoal$year)
sums<-data.frame()
for (i in years) {
    x<-sum(i$Emissions)
    sums<-rbind(sums,x)
}
colnames(sums)<-c("Sum")
sums<-cbind(sums,Year=c(1999,2002,2005,2008))

#graphing
png("plot4.png")
barplot(sums$Sum, names.arg = sums$Year, xlab = "Year", ylab = "Total PM2.5 Emission by Coal (tons)", main = "Total PM2.5 Emission by Coal", col = "darkblue")
dev.off()

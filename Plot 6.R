#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
#sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#subset SSC by motor sources and separate out the SSC numbers
motor<-subset(SCC, SCC.Level.One=="Mobile Sources")
motorscc<-motor$SCC
motorscc<-as.character(motorscc)
motorscc<-as.numeric(motorscc)

#Filter NEI by motor SCC numbers
library(dplyr)
NEImotor<-filter(NEI,NEI$SCC %in% motorscc)

# Baltimore subset
Balt<-subset(NEImotor,fips=="24510")

#sum Baltimore emissions
Byears<-split(Balt,Balt$year)
Bsums<-data.frame()
for (i in Byears) {
    x<-sum(i$Emissions)
    Bsums<-rbind(Bsums,x)
}
colnames(Bsums)<-c("Sum")
Bsums<-cbind(Bsums,Year=c(1999,2002,2005,2008))


# Los Angeles subset
LAC<-subset(NEImotor,fips=="06037")

#sum Los Angeles emissions
Lyears<-split(LAC,LAC$year)
Lsums<-data.frame()
for (i in Lyears) {
    x<-sum(i$Emissions)
    Lsums<-rbind(Lsums,x)
}
colnames(Lsums)<-c("Sum")
Lsums<-cbind(Lsums,Year=c(1999,2002,2005,2008))

#graph
library(ggplot2)

a<-ggplot(Bsums,aes(Year,Sum))
plot1<-a+geom_col(fill="darkred")+labs(y="Sum of Motor Emissions (tons)", title = "Emissions caused by Motor Vehicles in Baltimore")+theme(plot.title = element_text(size = 14))

b<-ggplot(Lsums,aes(Year,Sum))
plot2<-b+geom_col(fill="darkorange")+labs(y="Sum of Motor Emissions (tons)", title = "Emissions caused by Motor Vehicles in Los Angeles")+theme(plot.title = element_text(size = 14))

library(cowplot)
png("plot6.png")
plot_grid(plot1,plot2, ncol=1, nrow=2)
dev.off()




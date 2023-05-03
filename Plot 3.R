#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 1999–2008 
#for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

point<-subset(NEI,type=="POINT")
nonpoint<-subset(NEI,type=="NONPOINT")
onroad<-subset(NEI,type=="ON-ROAD")
nonroad<-subset(NEI,type=="NON-ROAD")
head(nonroad)

# point
pointyears<-split(point,point$year)
pointsums<-data.frame()
for (i in pointyears) {
    x<-sum(i$Emissions)
    pointsums<-rbind(pointsums,x)
}
colnames(pointsums)<-c("Sum")
pointsums<-cbind(pointsums,Year=c("1999","2002","2005","2008"))

# nonpoint
nonpointyears<-split(nonpoint,nonpoint$year)
nonpointsums<-data.frame()
for (i in nonpointyears) {
    x<-sum(i$Emissions)
    nonpointsums<-rbind(nonpointsums,x)
}
colnames(nonpointsums)<-c("Sum")
nonpointsums<-cbind(nonpointsums,Year=c("1999","2002","2005","2008"))

# onroad
onroadyears<-split(onroad,onroad$year)
onroadsums<-data.frame()
for (i in onroadyears) {
    x<-sum(i$Emissions)
    onroadsums<-rbind(onroadsums,x)
}
colnames(onroadsums)<-c("Sum")
onroadsums<-cbind(onroadsums,Year=c("1999","2002","2005","2008"))

# nonroad
nonroadyears<-split(nonroad,nonroad$year)
nonroadsums<-data.frame()
for (i in nonroadyears) {
    x<-sum(i$Emissions)
    nonroadsums<-rbind(nonroadsums,x)
}
colnames(nonroadsums)<-c("Sum")
nonroadsums<-cbind(nonroadsums,Year=c("1999","2002","2005","2008"))

# Plotting all four
library(ggplot2)

a<-ggplot(pointsums,aes(Year,Sum))
plot1<-a+geom_col(fill="darkred")+labs(y="Sum of PM2.5 Emissions (tons)", title = "Emissions caused by Point Sources by Year in Baltimore")+theme(plot.title = element_text(size = 10))

b<-ggplot(nonpointsums,aes(Year,Sum))
plot2<-b+geom_col(fill="darkorange")+labs(y="Sum of PM2.5 Emissions (tons)", title = "Emissions caused by Non-Point Sources by Year in Baltimore")+theme(plot.title = element_text(size = 10))

c<-ggplot(onroadsums,aes(Year,Sum))
plot3<-c+geom_col(fill="darkgreen")+labs(y="Sum of PM2.5 Emissions (tons)", title = "Emissions caused by On-Road Sources by Year in Baltimore")+theme(plot.title = element_text(size = 10))

d<-ggplot(nonroadsums,aes(Year,Sum))
plot4<-d+geom_col(fill="darkred")+labs(y="Sum of PM2.5 Emissions (tons)", title = "Emissions caused by Non-Road Sources by Year in Baltimore")+theme(plot.title = element_text(size = 10))

library(cowplot)
plot_grid(plot1,plot2,plot3,plot4,ncol=2,nrow=2)
?plot_grid



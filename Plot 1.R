# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

#create list with each year separated
years<-split(NEI,NEI$year)
#create new data frame
sums<-data.frame()
# loop through each year in list and sum up Emmissions, then add it all to data frame
for (i in years) {
    x<-sum(i$Emissions)
    sums<-rbind(sums,x)
}
#name column
colnames(sums)<-c("Sum")
#Add column specifying what year
sums<-cbind(sums,Year=c(1999,2002,2005,2008))

#create png graph file
png("plot1.png")
barplot(sums$Sum, names.arg = sums$Year, xlab = "Year", ylab = "Total PM2.5 Emission (tons)", main = "Total PM2.5 Emission by Year", col = "darkblue")
dev.off()

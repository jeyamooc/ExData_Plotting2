NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

motorvehiclenei <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

totalmotorvehicle <- aggregate(Emissions ~ year, motorvehiclenei, sum)

png("plot5.png", width=840, height=480)
g <- ggplot(totalmotorvehicle, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("Years") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland per annum')
print(g)
dev.off()
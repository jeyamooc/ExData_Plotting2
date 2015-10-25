NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

bmlanei <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

totalyearfips <- aggregate(Emissions ~ year + fips, bmlanei, sum)
totalyearfips$fips[totalyearfips$fips=="24510"] <- "Baltimore, MD"
totalyearfips$fips[totalyearfips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(totalyearfips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity") + xlab("Years") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle in Baltimore City, MD vs Los Angeles, CA per annum')
print(g)
dev.off()

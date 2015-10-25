NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

bmnei <- NEI[NEI$fips=="24510", ]

totalbmyeartype <- aggregate(Emissions ~ year + type, bmnei, sum) 

png("plot3.png", width=640, height=480)
g <- ggplot(totalbmyeartype, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Years") + ylab(expression('Total PM'[2.5]*" Emissions")) +   ggtitle('Total Emissions in Baltimore City, Maryland per annum')
print(g)
dev.off()
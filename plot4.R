NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

neiscc <- merge(NEI, SCC, by="SCC")

library(ggplot2)

coallines  <- grepl("coal", neiscc$Short.Name, ignore.case=TRUE)
coalneiscc <- neiscc[coallines, ]
totalcoal <- aggregate(Emissions ~ year, coalneiscc, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(totalcoal, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +  xlab("Years") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal per annum')
print(g)
dev.off()
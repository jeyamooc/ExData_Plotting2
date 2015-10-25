NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bmnei <- NEI[NEI$fips=="24510", ]

totalbm <- aggregate(Emissions ~ year, bmnei, sum)
png('plot2.png')
barplot(height=totalbm$Emissions, names.arg=totalbm$year, xlab="Years", ylab=expression('Total PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MaryLand Emissions per annum'))
dev.off()
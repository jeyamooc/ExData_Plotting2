NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmission <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=totalEmission$Emissions, names.arg=totalEmission$year, xlab="Years", ylab=expression('Total PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' Emissions per annum'))
dev.off()
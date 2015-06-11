## Rather than include the download scrpit, the file was downloaded and unzipped manually, as per the assignment instructions.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Create a dataframe that shows total emissions for the sample years
tot_em <- ddply(NEI, .(year), summarise, total_emissions = sum(Emissions))

## Create graph and save it as png file titled "plot1.png"
png("plot1.png", width = 480, height = 480)
plot(x$year, x$total_emissions, pch = 19, bg = "black", main = "Total emissions in the US for the years 1999, 2002, 2005, and 2008", xlab = "Year", ylab = "Total Emissions (PM2.5)")
dev.off()

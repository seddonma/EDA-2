## Rather than include the download scrpit, the file was downloaded and unzipped manually, as per the assignment instructions.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Creates a dataframe that shows total emissions for Baltimore City for the sample years
library(plyr)
NEI_BC <- subset(NEI, NEI$fips == "24510")
tot_em_BC <- ddply(NEI_BC, .(year,type), summarise, total_emissions = sum(Emissions))

## Creates the graph and trendlines and saves it in a png file named "plot3.png"
library(ggplot2)
png("plot3.png", width = 480, height = 480)
qplot(year, total_emissions, data = tot_em_BC, facets = . ~type) + labs(title = "Total Emissions for Baltimore City by type from 1999-2008") + labs(x = "Year", y = "Total Emissions") + geom_smooth(method  = "lm") + scale_x_continuous(breaks=seq(1999,2008,4))
dev.off()

## There is a downward trend for all types of emissions except for point, which has an upward trend. 

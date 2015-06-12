## Rather than include the download scrpit, the file was downloaded and unzipped manually, as per the assignment instructions.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Creates a dataframe that shows total emissions for Baltimore City for the sample years
library(plyr)
NEI_BC <- subset(NEI, NEI$fips == "24510")
tot_em_BC <- ddply(NEI_BC, .(year), summarise, total_emissions = sum(Emissions))

## Creates a graph and trendline and save it as png file titled "plot2.png"
png("plot2.png", width = 480, height = 480)
plot(tot_em_BC$year, tot_em_BC$total_emissions, pch = 19, bg = "black", xlab = "Year", ylab = "Total Emissions (PM2.5)")
title(main = "Total emissions in Baltimore City for the years 1999, 2002, 2005, and 2008", cex.main = 1)
fit <- lm(total_emissions~year, tot_em_BC)
abline(fit, col = "blue")
dev.off()

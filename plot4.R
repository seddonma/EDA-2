## Rather than include the download scrpit, the file was downloaded and unzipped manually, as per the assignment instructions.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Creates a dataframe that shows total emissions for the sample years
library(plyr)
tot_em <- ddply(NEI, .(year), summarise, total_emissions = sum(Emissions))

grep("coal", SCC$Short.Name, ignore.case = TRUE)

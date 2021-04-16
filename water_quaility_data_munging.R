setwd('../../../../water_data/Monitoring_station_data/')
dat <- read.csv(file = 'Jemez River at USGS Gauge.csv')

## Subset data into three columns

dat <- subset(dat, select =  c('CharacteristicName','ActivityStartDate','ResultMeasureValue'))

##  subeset into characteristic of interest
Asdat <- dat[which(dat$CharacteristicName == 'Arsenic'),]
# count number of samples
nrow(Asdat)
# years it occured
min(Asdat$ActivityStartDate)
max(Asdat$ActivityStartDate)

## summary stats for characteristic of interest concentrations
summarystatsAs <- summary(Asdat$ResultMeasureValue)

## find instances and days that excceeded EPA limit

Ashighyear <- Asdat[which(Asdat$ResultMeasureValue >= 100),]
# coutn number of samples exceeding EPA limit
nrow(Ashighyear)




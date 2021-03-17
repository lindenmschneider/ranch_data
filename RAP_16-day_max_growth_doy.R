## this script takes the 16-day biomass growth data that is downloaded from RAP and 
## gives us the maximum growth and the doy that the maximum growth occured.  It does this
## by year and then outputs a .csv file

setwd("/Volumes/GoogleDrive/My Drive/01 Programs/CRI/CRI_Technical Service Provision/CRI_TSP_Planning/2021 CRI Plans/American Creek Ranch/web_data/vegetation_data/RAP/north")

dat <- read.csv("ACP_north_16-day_biomass_RAP.csv")

colnames(dat)

## afgAGB

foo <- function(x) {
  
  max_growth_a <- max(x$afgAGB)
  
  max_growth_doy_a <- x$doy[which.max(x$afgAGB)]
  
  max_growth_p <- max(x$pfgAGB)
  
  max_growth_doy_p <- x$doy[which.max(x$pfgAGB)]
  
  return(c(max_growth_a, max_growth_doy_a, max_growth_p, max_growth_doy_p))
}

output_max_growth_doy <- t(sapply(split(dat, dat$year), foo))

output_max_growth_doy <- as.data.frame(output_max_growth_doy)

colnames(output_max_growth_doy) <- c('max_afgAGB','doy_a','max_pfgAGB','doy_p')

output_max_growth_doy$doy_a <- 
  as.Date(output_max_growth_doy$doy_a, 
          origin = paste0(row.names(output_max_growth_doy),'-01-01'))

output_max_growth_doy$doy_p <- 
  as.Date(output_max_growth_doy$doy_p, 
          origin = paste0(row.names(output_max_growth_doy),'-01-01'))


write.csv(output_max_growth_doy, "output_max_growth_doy_north.csv", row.names = FALSE)

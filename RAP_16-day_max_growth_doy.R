setwd("/Volumes/GoogleDrive/My Drive/01 Programs/CRI/CRI_Technical Service Provision/CRI_TSP_Planning/2021 CRI Plans/American Creek Ranch/web_data/vegetation_data/RAP/north")

dat <- read.csv("ACP_north_16-day_biomass_RAP.csv")

colnames(dat)

foo <- function(x) {
  
  print(class(x))
  
  max_growth <- max(x$afgAGB)
  
  max_growth_doy <- x$doy[which.max(x$afgAGB)]
  
  return(c(max_growth, max_growth_doy))
}
                
output_max_growth_doy<-sapply(foo, split(dat, dat$year))

write.csv(output_max_growth_doy, "output_max_growth_doy_north.csv")

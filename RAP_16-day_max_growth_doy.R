## this script takes the 16-day biomass growth data that is downloaded from RAP and 
## gives us the maximum growth and the doy that the maximum growth occured.  It does this
## by year, for both annuals and perennials and then outputs a .csv file

## set your wd to where the 16-day biomass csv is that you downloaded from RAP for the property
setwd('American Creek Ranch/American Creek Ranch data/web_data/vegetation_data/RAP/middle/')

## read in csv
dat <- read.csv("ACP_middle_16-day_biomass_RAP.csv")

## function to find the maximum 16-day biomass growth values and the 
## corresponding day of year (doy) for annuals and perennials

foo <- function(x) {
  
  max_growth_a <- max(x$afgAGB)
  
  max_growth_doy_a <- x$doy[which.max(x$afgAGB)]
  
  max_growth_p <- max(x$pfgAGB)
  
  max_growth_doy_p <- x$doy[which.max(x$pfgAGB)]
  
  return(c(max_growth_a, max_growth_doy_a, max_growth_p, max_growth_doy_p))
}

## use split to split the data by year, sapply to apply the function foo to 
## each of the years and t to transform the output into columns rather than rows

output_max_growth_doy <- t(sapply(split(dat, dat$year), foo))

## covert to data.frame so you can rename and modify doy to a date

output_max_growth_doy <- as.data.frame(output_max_growth_doy)

## rename columns in output_max_growth_day

colnames(output_max_growth_doy) <- c('max_afgAGB','doy_a','max_pfgAGB','doy_p')

## covert doy for annuals into date, using paste to create the year (row.names) day day format to define the origin

output_max_growth_doy$date_a <- 
  as.Date(output_max_growth_doy$doy_a, 
          origin = paste0(row.names(output_max_growth_doy),'-01-01'))

## covert doy for perennials into date, using paste to create the year (row.names) day day format to define the origin

output_max_growth_doy$date_p <- 
  as.Date(output_max_growth_doy$doy_p,
          origin = paste0(row.names(output_max_growth_doy),'-01-01'))

## binning max growth days and counting for annuals and perennials, making into their own dataframes

output_max_growth_doy_count_annuals <- as.data.frame(table(output_max_growth_doy$doy_a))
colnames(output_max_growth_doy_count_annuals) <- c("doy_a", 'count_a')

output_max_growth_doy_count_perennials <- as.data.frame(table(output_max_growth_doy$doy_p))
colnames(output_max_growth_doy_count_perennials) <- c("doy_p", 'count_p')

## write all three data frames(count annual, count perennial, and max each year) to csv

write.csv(output_max_growth_doy_count_annuals, "output_max_growth_doy_count_annuals_middle.csv", row.names = FALSE)
write.csv(output_max_growth_doy_count_perennials, "output_max_growth_doy_count_perennials_middle.csv", row.names = FALSE)

write.csv(output_max_growth_doy, "output_max_growth_doy_middle.csv", row.names = FALSE)

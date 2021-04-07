## this script will take the downloaded climate toolbox future timeseries data and combine the months 
## (it is downloaded in three month incriments) and then summarize the columns so you can
## get the mean increase annually under RCP 4.5 and RCP 8.5 for your downloaded data

## set working directory to where the .csv's you downloaded are saved
setwd('American Creek Ranch data/web_data/climate_data/Climate_toolbox/precip/')
## create list for lapply to itereate on of file names with only .csv
all_file_names <- dir(pattern = '*.csv')
## combine all files into one dataframe
combined <- do.call(rbind, lapply(all_file_names, read.csv))
## summary stats for combined files
summary_stats <- summary(combined)
## write to csv
write.csv(summary_stats, "summary_stats_precip.csv", row.names = FALSE)

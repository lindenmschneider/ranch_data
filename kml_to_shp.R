## this script converts kml to shp file using rgdal package

## setwd will need to be changed depending on where your kml file is saved

setwd("")

## read in kml file and assign the data to an object (ACP)

ACP <- readOGR('American Creek Pastures.kml')

## write shape file from object (ACP)

writeOGR(ACP, dsn = 'ACP', driver="ESRI Shapefile",layer='ACP')

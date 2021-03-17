## this script converts kml to shp file using rgdal package

## setwd will need to be changed depending on where your kml file is saved

setwd("/Volumes/GoogleDrive/My Drive/01 Programs/CRI/CRI_Technical Service Provision/CRI_TSP_Planning/2021 CRI Plans/American Creek Ranch")

## read in kml file and assign the data to an object (ACP)

ACP <- readOGR('American Creek Pastures.kml')

## write shape file from object (ACP)

writeOGR(ACP, dsn = 'ACP', driver="ESRI Shapefile",layer='ACP')

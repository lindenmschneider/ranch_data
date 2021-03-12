setwd("/Users/quivira/Desktop")

ACP <- readOGR('American Creek Pastures.kml')

writeOGR(ACP, dsn = 'ACP', driver="ESRI Shapefile",layer='ACP')

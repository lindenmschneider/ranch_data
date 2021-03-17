setwd("/Volumes/GoogleDrive/My Drive/01 Programs/CRI/CRI_Technical Service Provision/CRI_TSP_Planning/2021 CRI Plans/American Creek Ranch")

ACP <- readOGR('American Creek Pastures.kml')

writeOGR(ACP, dsn = 'ACP', driver="ESRI Shapefile",layer='ACP')

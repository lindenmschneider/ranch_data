## copied esd species list from wss survey report, you need to remove any apostrophes

x <- 'California brome
Little bluestem
Arizona fescue
Big bluestem
Sideoats grama
Mountain muhly
Miscellaneous perennial forbs
Miscellaneous perennial grasses
Oregongrape
Columbia needlegrass
MuttongrassSheep fescue
Thurbers fescueCalifornia brome
Nodding brome
Kinnikinnick
Miscellaneous perennial forbs
Russet buffaloberry
Parishs snowberry'

## Fuss with gsub to get list with no erronious characters or spaces or numbers and only sperareted by \n
## this is what you are after Mountain muhly\nMiscellaneous perennial forbs\nSideoats grama\nMuttongrass\nPine dropseed

x <- gsub('[0-9]+','',x)
#x <- gsub ('\n—\n','\n',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('—', '\n',x)
x <- gsub('—','',x)

## make it into a indexed list
x <- strsplit(x, '\n')

## get everything from the first element of the list where your indexed list is so that it can be made into a vector
x <- x[[1]]

## remove dupes
x <- unique(x, incomparables = FALSE)

## a nice list to copy
cat(x, sep = '\n')


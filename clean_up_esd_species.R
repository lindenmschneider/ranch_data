## copied esd species list from wss survey report

x <- 'Mountain muhly
—
Miscellaneous perennial forbs
—
Sideoats grama
—
Muttongrass
—
Pine dropseed
—
Blue grama
—
Arizona fescue
—
Miscellaneous annual forbs
—
Little bluestem
—
Shrubby cinquefoil
—
Kinnikinnick
—
Miscellaneous perennial forbs
—
Mountain muhly
—
Muttongrass
—
Twoneedle pinyon
—
Kinnikinnick
—
Rocky mountain juniper
—
Pct


Prairie junegrass
Arizona fescue
—

Pine dropseed
—

—

Gambel oak
—

Sideoats grama
—Mountain muhly
20

Pine dropseed
15

Little bluestem
15

Prairie junegrass
Miscellaneous shrubs
15

Miscellaneous perennial grasses
10

10

Sideoats grama
5

Ponderosa pine
5

Miscellaneous perennial forbs
5'

## Fuss with gsub to get list with no erronious characters or spaces or numbers and only sperareted by \n
## this is what you are after Mountain muhly\nMiscellaneous perennial forbs\nSideoats grama\nMuttongrass\nPine dropseed

x <- gsub('[0-9]+','',x)
x <- gsub ('\n—\n','\n',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('—', '\n',x)
x <- gsub('—','',x)

## make it into a vector
x <-strsplit(x, "\n")
x <- x[[1]]

## remove dupes
x <-unique(x, incomparables = FALSE)

## a nice list to copy
cat(x, sep = '\n')


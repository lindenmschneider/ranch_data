x <- 'text'
x <- gsub('[0-9]+','',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('\n\n','\n',x)
x <- gsub ('\n \n  ','\n',x)
x <- gsub ('\n\n','\n',x)

x <- gsub ('—', '\n',x)
x <- gsub('—','',x)
cat(x)

## R Programming Programming Assignment 1: Air Pollution Part 3

corr <- function(directory, threshold = 0) {
    cwd <- getwd()
    setwd(directory)
    Listoffiles<-list.files()
    setwd(cwd)
    id <- 1:332
    result <- numeric(0)
    for(i in id) {
        finalframe <- complete(directory, i)
        if (finalframe["nobs"] > threshold){
            setwd(directory)
            mydata <- read.table(Listoffiles[i], sep= ",",skip=1, 
                                 col.names=c("Date","sulfate","nitrate","ID"))
            cleandata <- na.omit(mydata)
            correlation <- as.numeric(cor(cleandata["sulfate"],cleandata["nitrate"]))
            ##correlation <- as.numeric(round(correlation,digits =5))
            result <- append(result,correlation )
            setwd(cwd)
        }}
    result
}

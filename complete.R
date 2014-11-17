## R Programming Programming Assignment 1: Air Pollution Part 1

complete <- function(directory, id = 1:332) {
    
    library(data.table)
    if (file.exists(directory))
    {
        cwd <- getwd()
        setwd(directory)
        Listoffiles<-list.files()
        for(i in id) 
        { 
            mydata <- read.csv(Listoffiles[i],header=TRUE,
                               col.names=c("Date","sulfate","nitrate","ID"))
            cleandata <- na.omit(mydata)
            if (!exists("finalframe")){
                finalframe <- data.frame(id=i,nobs=NROW(cleandata))
            }
            else if (exists("finalframe")){
                tempframe <-data.frame(id=i,nobs=NROW(cleandata))
                finalframe<-rbind(finalframe, tempframe)
                rm(tempframe)            
                
            }
        }
        rm(mydata)
        setwd(cwd)
        finalframe
            
    }
}

## R Programming Programming Assignment 1: Air Pollution Part 2


pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## setwd ("C:/Users/IBM_ADMIN/Desktop/DATA SCIENCE")
    
    
    library(data.table)
    if (file.exists(directory))
    {
        cwd <- getwd()
        setwd(directory)
        Listoffiles<-list.files()
        for(i in id) 
        { 
            if (!exists("mydata")){
                mydata <- read.table(Listoffiles[i], sep= ",",skip=1, 
                                   col.names=c("Date","sulfate","nitrate","ID"))
            }
            # if the merged dataset does exist, append to it
            else if (exists("mydata")){
                temp_dataset <-read.table(Listoffiles[i], sep= ",", skip=1, 
                                   col.names=c("Date","sulfate","nitrate","ID"))
                mydata<-rbind(mydata, temp_dataset)
                rm(temp_dataset)
            }
        }
        meanpoll <- mean(mydata[,pollutant],na.rm= TRUE)
        rm(mydata)
        setwd(cwd)
        round(meanpoll,digits =3)
      
    }
}

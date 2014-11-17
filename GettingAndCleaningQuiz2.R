## Getting and Cleaning Data Quiz 2

## Q1
library(httr)
library(jsonlite)
oauth_endpoints("github")
Rcourse <- oauth_app("github", "26748cd2b3add031b49c", "190d29ac1ddf13439c2508277f0451311f77ce85")
github_token <- oauth2.0_token(oauth_endpoints("github"), Rcourse)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
json1 = content(req)
json2 = fromJSON(toJSON(json1))

name <- as.character(json2$name)
createddate <- as.character(json2$created_at)
comb <- cbind(name,createddate)

x <- subset(comb, name =="datasharing")
print(x[,2])

##Q2
library("sqldf")
print(getwd())
acs <- read.csv("getdata-data-ss06pid.csv", header=TRUE)
x<- sqldf('select distinct AGEP from acs',  drv = "SQLite")
print(NROW(x))


##Q4
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(con)
no <- as.numeric(nchar(htmlcode))
close(con)
result <- c()
index <- c(10,20,30,100)
for (i in index)
{
result <- append(result,no[i])
}
print (result)

##Q5
fileread <- read.fwf(
    file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
    skip=4,
    widths=c(12,7,4, 9,4, 9,4, 9,4))

sum <- sum(as.numeric(fileread[,4]))
print(sum)
print(head(fileread))
rm(fileread)

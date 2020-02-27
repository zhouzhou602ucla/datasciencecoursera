## Getting and Clean the data 
#download the file from website

# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# 
# How many properties are worth $1,000,000 or more?
library(readr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL,destfile = "./Getting_and_clean_the_data/quiz1dt.csv",method = "curl")
dt <- read_csv("/Users/Fangzhu/coursera/datasciencecoursera/Getting_and_clean_the_data/quiz1dt.csv")
table(dt$VAL)


################################################################
# Download the Excel spreadsheet on Natural Gas Aquisition Program here  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called dat
# What is the value of: sum(dat$Zip*dat$Ext,na.rm=T)

library(readxl)
exl_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(exl_URL,destfile = "./Getting_and_clean_the_data/quiz1.xlsx")
dat <- read_xlsx("./Getting_and_clean_the_data/quiz1.xlsx",sheet = 1, col_names = TRUE,range = "G18:O23")

################################################################
# Read the XML data on Baltimore restaurants from here:
# http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# How many restaurants have zipcode 21231?

library(XML)
xml_URL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(xml_URL,useInternalNodes =TRUE)
rootNode <- xmlRoot(doc)
sum(xpathSApply(rootNode,"//zipcode",xmlValue) == "21231")


################################################################
library(data.table)
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(URL,destfile = "./Getting_and_clean_the_data/quiz1dt2.csv")
DT <- read_csv("./Getting_and_clean_the_data/quiz1dt2.csv")
DT <- as.data.table(DT)
#(1)
system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))

#(2)
system.time(mean(DT$pwgtp15), by=DT$SEX)


#(3)
system
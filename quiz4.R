#Q1
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,destfile = "acs.csv")
acs <- read.csv("acs.csv")
cname <- colnames(acs)
lapply(cname,function(x){strsplit(x,"wgtp")})

#Q2
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2,destfile = "gsp.csv")
gdp <- read.csv("gsp.csv")
gdp <- gdp[5:194,]
num_gdp <- gdp$X.3
num_gdp_new <- sapply(num_gdp, function(x){gsub(pattern = ",",replacement = "",x)})
num_gdp_new <- as.numeric(num_gdp_new)

#Q4
url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url3,"gdp.csv")
download.file(url4,"edu.csv")

gdp <- read.csv("gdp.csv")
gdp <- gdp[5:194,]
edu <- read.csv("edu.csv")
dt <- merge(gdp,edu,by.x = "X", by.y = "CountryCode")
dt_match <- grep(pattern = "^Fiscal year end.",dt$Special.Notes)
a <- dt$Special.Notes[dt_match]
table(grepl("June",a))


#Q5

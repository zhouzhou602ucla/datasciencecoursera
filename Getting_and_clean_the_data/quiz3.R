URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL,"./quiz3.csv",method = "curl")
dt <- read.csv("./quiz3.csv")
agricultureLogical <- dt$ACR==3 & dt$AGS == 6
###########################

q2_url_1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
q2_url_2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(q2_url_1,"./quiz3_q2_1.csv",method = "curl")
download.file(q2_url_2,"./quize_q2_2.csv",method="curl")

dt1 <- read.csv("./quiz3_q2_1.csv")
dt1 <- dt1[5:194,]
dt2 <- read.csv("./quize_q2_2.csv")
full_dt <- merge(dt1,dt2,by.x = "X",by.y="CountryCode")
full_dt$rank <- as.numeric(levels(full_dt$Gross.domestic.product.2012)[full_dt$Gross.domestic.product.2012])
arrange(full_dt,desc(rank))

###################################
full_dt %>% group_by(Income.Group) %>% summarize(mean(rank,na.rm=TRUE))
###################################
breaks <- quantile(full_dt$rank,probs=seq(0,1,0.2),na.rm=TRUE)
full_dt$qut <- cut(full_dt$rank,breaks = breaks)
table(full_dt$Income.Group,full_dt$qut)

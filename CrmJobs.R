#setwd("E:\\Desktop\\R Language\\Practice4R")
Sys.setlocale(category="LC_ALL", locale = "chinese")
install.packages("xlsx")
library("xlsx")
jobs<-read.xlsx("data\\jobs.xlsx",1,encoding="UTF-8")

jobs<-na.omit(jobs)

#for(i in 1:length(colnames(jobs)))
#{
#  jobs[i]<-as.vector(jobs[i])
#  
#}


jobs$jobtitle<-as.vector(jobs$jobtitle)
jobs$companytype<-as.vector(jobs$companytype)
jobs$company<-as.vector(jobs$company)
jobs$location<-as.vector(jobs$location)
jobs$salary<-as.vector(jobs$salary)
jobs$source<-as.vector(jobs$source)
jobs$publisheddate<-as.vector(jobs$publisheddate)
jobs$workyears<-as.vector((jobs$workyears))
jobs$url<-as.vector(jobs$url)
jobs$jd<-as.vector(jobs$jd)
#jobs$createdon<-as.vector(jobs$createdon)

#str(jobs)



install.packages("stringr")
library(stringr)

#company type
jobs$companytype<-lapply(str_split(str_replace_all(jobs$companytype,"\\t",""),"\\|"),str_trim)
cMatrix<-matrix(unlist(jobs$companytype),ncol=3,byrow=2)
jobs$cType<-cMatrix[,1]
jobs$cSize<-cMatrix[,2]
jobs$cIndustry<-cMatrix[,3]


#location
jobs$location<-str_split(jobs$location,"-",simplify = TRUE)[,1]

#salary
sMatrix<-str_match(jobs$salary,"((?:\\d\\.)?\\d+)-(\\d+\\.?\\d*)(\\w)/(\\w)")
colnames(sMatrix)<-c("salary","min.","max.","unit","period")
jobs$minSalary<-sMatrix[,2]
jobs$maxSalary<-sMatrix[,3]
jobs$salaryUnit<-sMatrix[,4]
jobs$salaryPeriod<-sMatrix[,5]

jobs$baseMinSalary<-0
jobs$baseMaxSalary<-0

jobs[which(jobs$salaryUnit=="万"),"baseMinSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="万"),"minSalary"])*10000
jobs[which(jobs$salaryUnit=="万"),"baseMaxSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="万"),"maxSalary"])*10000

jobs[which(jobs$salaryUnit=="千"),"baseMinSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="千"),"minSalary"])*1000
jobs[which(jobs$salaryUnit=="千"),"baseMaxSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="千"),"maxSalary"])*1000

jobs[which(jobs$salaryPeriod=="年"),"baseMinSalary"]<-round(as.numeric(jobs[which(jobs$salaryPeriod=="年"),"baseMinSalary"])/12)
jobs[which(jobs$salaryPeriod=="年"),"baseMaxSalary"]<-round(as.numeric(jobs[which(jobs$salaryPeriod=="年"),"baseMaxSalary"])/12)

#JD
install.packages("jiebaR")
library("jiebaR")
cutter=worker()
#jobs$segWords<-segment(jobs$jd,cutter)
tmp<-str_c(jobs$jd,"")
segWords<-segment(tmp,cutter)



library(plyr)
tableWords<-count(segWords)



install.packages("wordcloud2")
install.packages("RColorBrewer")
install.packages("slam")
library("RColorBrewer")
library("wordcloud2")
windowsFonts(myFont=windowsFont("华文彩云"))
wordcloud2(tableWords,size=10)
#tableWords[order(tableWords$freq, decreasing = TRUE),]
tableWords[order(tableWords$freq, decreasing = TRUE),]
write.csv2(tableWords,file="C:\\jeff\\R\\Practice4R\\Bin\\segWords.csv")  #乱码

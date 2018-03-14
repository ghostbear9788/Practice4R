setwd("E:\\Desktop\\R Language\\Practice4R")
install.packages("xlsx")
library("xlsx")
jobs<-read.xlsx("data\\jobs.xlsx",1,encoding="UTF-8")
head(jobs,1)

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

str(jobs)



install.packages("stringr")
library(stringr)

jobs$companytype<-lapply(str_split(str_replace_all(jobs$companytype,"\\t",""),"\\|"),str_trim)
jobs$location<-str_split(jobs$location,"-")
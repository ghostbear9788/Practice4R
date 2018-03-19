#setwd("E:\\Desktop\\R Language\\Practice4R")
#Sys.setlocale(category="LC_ALL", locale = "chinese")

if(!require("xlsx")){
  install.packages("xlsx")
  require("xlsx")
  }
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


if(!require(stringr))
{
  install.packages("stringr")
  require(stringr)
}


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
if(!require("jiebaR"))
{
  install.packages("jiebaR")
  require("jiebaR")
}

cutter<-worker(stop_word = "Bin\\stopword.txt", user = "Bin\\jieba.dict.user.utf8",topn = 20)
#jobs$segWords<-segment(jobs$jd,cutter)
tmp<-str_c(jobs$jd,"")

segWords<-segment(tmp,cutter)



if(!require("plyr"))
{
  install.packages("plyr")
  require("plyr")
}
tableWords<-count(segWords)


if(!require("wordcloud2"))
{
  install.packages("wordcloud2")
  require("wordcloud2")
}

tableWords<-head(tableWords[order(tableWords$freq, decreasing = TRUE),],100)
#write.csv2(tableWords,file="C:\\jeff\\R\\Practice4R\\Bin\\segWords.csv")  #乱码
#write.csv(tableWords,file="E:\\Desktop\\R Language\\Practice4R\\Bin\\segWords.csv",sep = ",")  #乱码
wordcloud2(tableWords,size=1)



#job title

jobTitleSegwords<-segment(str_c(jobs$jobtitle,""),cutter)
jobTitleSegTbl<-count(jobTitleSegwords)
jobTitleSegTbl<-head(jobTitleSegTbl[order(jobTitleSegTbl$freq,decreasing = TRUE),],100)
wordcloud2(jobTitleSegTbl,minSize = 10)


#绘图分析

#if(!require("vcd"))
#{
#  install.packages("vcd")
#  require(vcd)
#}
#
#means<-aggregate(jobs$baseMaxSalary,by=list(jobs$location),FUN=mean)
#barplot(means$x,names.arg = means$Group.1)
#abline(a=20000)

if(!require("ggplot2"))
{
  install.packages("ggplot2")
  require("ggplot2")
}
#职位数量和地区的关系
ggplot(jobs,aes(x=location))+geom_bar(position ="stack")+labs(title='position="stack')

#薪水和地区的关系
meanS<-aggregate(jobs$baseMaxSalary+jobs$baseMinSalary,by=list(jobs$location),FUN=mean)
colnames(meanS)<-c("location","avgSalary")
#barplot(means$x,names.arg = means$Group.1)
ggplot(meanS,aes(x=location,y=avgSalary,fill=location))+geom_bar(stat="identity")




#薪水和企业类型的关系
meanS_compType<-aggregate(jobs$baseMaxSalary+jobs$baseMinSalary,by=list(jobs$cType),FUN=mean)
colnames(meanS_compType)<-c("cType","avgSalary")
ggplot(meanS_compType,aes(x=cType,y=avgSalary,fill=cType))+geom_bar(stat="identity")




#薪水和title的关系?


(jobs$baseMaxSalary+jobs$baseMaxSalary)/2
s_t_matrix<-data.frame(jobs$jobtitle,salary=(jobs$baseMaxSalary+jobs$baseMaxSalary)/2)
#需要制作一个关键词和薪水对于的表格，并可以知道某个关键词下的薪水分布情况
s_t_matrix$jobs.jobtitle<-as.vector(s_t_matrix$jobs.jobtitle)
s_t_matrix$jobtitle_breakdown<-""


titleBD<-function(name)
{
  
  s_t_matrix[s_t_matrix$jobs.jobtitle==name,3]<-  segment(name,cutter)
}

lapply(s_t_matrix$jobs.jobtitle,FUN = titleBD)
s_t_matrix$titleBreakdown<-segment(s_t_matrix$jobs.jobtitle,cutter)

for(i in 1:nrow(s_t_matrix))
{
  s_t_matrix[i,3]<-list(segment(s_t_matrix[i,1],cutter))
}
str(s_t_matrix[1,c("jobs.jobtitle")])


s_t_matrix[1,3]<-list(segment(s_t_matrix[1,1],cutter))


#会“微信”开发的人，一般拿多少薪水
wechat_Salary<-jobs[str_detect(jobs$jd,"微信"),c("jobtitle","baseMinSalary","baseMaxSalary")]
summary(wechat_Salary$baseMaxSalary)

<<<<<<< HEAD
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


=======
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0   12500   16000   16819   20000   83333 
>>>>>>> c5d2ebf41a9daaa952b18919cfbd8dd0107a00be

#setwd("E:\\Desktop\\R Language\\Practice4R")
setwd("C:\\jeff\\R\\Practice4R")
Sys.setlocale(category="LC_ALL", locale = "chinese")

#load data from mysql
if(!require("RMySQL"))
{
    install.packages("RMySQL")
    require(RMySQL)
}
conn <- dbConnect(MySQL(),host="pyspider.crmhome.net",port=3306,dbname = "result_db",user = "root",password = "",client.flag = CLIENT_MULTI_STATEMENTS )
dbGetInfo(conn) # 查看连接信息
dbSendQuery(conn,"SET NAMES gbk")

revenue <- dbGetQuery(conn,"SELECT * FROM CRMJOBSSURVEY order by createdon desc;")
head(revenue,1)
# 解决windows中文乱码问题
dbDisconnect(conn) # 断开连接


if(!require("xlsx")){
  install.packages("xlsx")
  require("xlsx")
}

write.xlsx(revenue,col.names = TRUE, file = "data\\jobs2.xlsx", sheetName = "jobs")
jobs<-revenue[-1];

#jobs<-na.omit(jobs)

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
jobs$createdon<-as.Date(jobs$createdon)



#str(jobs)


if(!require(stringr))
{
  install.packages("stringr")
  require(stringr)
}


#company type
#jobs$companytype2<-lapply(str_split(str_replace_all(jobs$companytype,"\\?\\?",""),"\\|"),str_trim)
jobs$companytype2<-str_split(str_replace_all(jobs$companytype,"\\?\\?",""),"\\|")

cMatrix<-matrix(unlist(jobs$companytype2),ncol=3,byrow=2)

for(i in 1:length(jobs$companytype2))
{
  # for(j in 1:lengths(unlist(jobs$companytype2[i])))
  # {
  #print(i)
      jobs$cType[i]<-unlist(jobs$companytype2[i])[1]
      jobs$cSize[i]<-unlist(jobs$companytype2[i])[2]
      jobs$cIndustry[i]<-unlist(jobs$companytype2[i])[3]
      
  # }
}





#salary
#51job
fo_jobs_ind<-which(jobs$source=="51job")
sMatrix<-str_match(jobs[fo_jobs_ind,"salary"],"((?:\\d\\.)?\\d+)-(\\d+\\.?\\d*)(\\w)/(\\w)")
colnames(sMatrix)<-c("salary","min.","max.","unit","period")
jobs[fo_jobs_ind,"minSalary"]<-sMatrix[,2]
jobs[fo_jobs_ind,"maxSalary"]<-sMatrix[,3]
jobs[fo_jobs_ind,"salaryUnit"]<-sMatrix[,4]
jobs[fo_jobs_ind,"salaryPeriod"]<-sMatrix[,5]

#zhaopin
zp_jobs_ind<-which(jobs$source=="Zhaopin")
zp_Matrix<-str_match(jobs[zp_jobs_ind,c("salary")],"(\\d+)-(\\d+)(\\w)/(\\w)\\s(.+?)\\s")
colnames(zp_Matrix)<-c("salary","min.","max.","unit","period","location")
jobs[zp_jobs_ind,"minSalary"]<-zp_Matrix[,2]
jobs[zp_jobs_ind,"maxSalary"]<-zp_Matrix[,3]
jobs[zp_jobs_ind,"salaryUnit"]<-zp_Matrix[,4]
jobs[zp_jobs_ind,"salaryPeriod"]<-zp_Matrix[,5]
jobs[zp_jobs_ind,"location"]<-zp_Matrix[,6]

#liepin
lp_jobs_ind<-which(jobs$source=="Liepin")
lp_Matrix<-str_match(jobs[lp_jobs_ind,c("salary")],"(\\d+)-(\\d+)(\\w)\\s")
colnames(lp_Matrix)<-c("salary","min.","max.","unit")
jobs[lp_jobs_ind,"minSalary"]<-lp_Matrix[,2]
jobs[lp_jobs_ind,"maxSalary"]<-lp_Matrix[,3]
jobs[lp_jobs_ind,"salaryUnit"]<-lp_Matrix[,4]
jobs[lp_jobs_ind,"salaryPeriod"]<-'年'

#calculate salary
jobs$baseMinSalary<-0
jobs$baseMaxSalary<-0

jobs[which(jobs$salaryUnit=="万"),"baseMinSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="万"),"minSalary"])*10000
jobs[which(jobs$salaryUnit=="万"),"baseMaxSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="万"),"maxSalary"])*10000

jobs[which(jobs$salaryUnit=="千"),"baseMinSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="千"),"minSalary"])*1000
jobs[which(jobs$salaryUnit=="千"),"baseMaxSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="千"),"maxSalary"])*1000

jobs[which(jobs$salaryUnit=="元"),"baseMinSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="元"),"minSalary"])
jobs[which(jobs$salaryUnit=="元"),"baseMaxSalary"]<-as.numeric(jobs[which(jobs$salaryUnit=="元"),"maxSalary"])


jobs[which(jobs$salaryPeriod=="年"),"baseMinSalary"]<-round(as.numeric(jobs[which(jobs$salaryPeriod=="年"),"baseMinSalary"])/12)
jobs[which(jobs$salaryPeriod=="年"),"baseMaxSalary"]<-round(as.numeric(jobs[which(jobs$salaryPeriod=="年"),"baseMaxSalary"])/12)

jobs$avgSalary<-round((jobs$baseMinSalary+jobs$baseMaxSalary)/2)

#location
jobs$location<-str_split(jobs$location,"-",simplify = TRUE)[,1]

# #JD
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

#
 if(!require("wordcloud2"))
 {
   install.packages("wordcloud2")
   require("wordcloud2")
 }
#
 jdWords<-tableWords[order(tableWords$freq, decreasing = TRUE),]
 jdWordsTop100<-head(tableWords[order(tableWords$freq, decreasing = TRUE),],100)
 #write.csv2(tableWords,file="C:\\jeff\\R\\Practice4R\\Bin\\segWords.csv")  #乱码
 #write.csv(tableWords,file="E:\\Desktop\\R Language\\Practice4R\\Bin\\segWords.csv",sep = ",")  #乱码
 wordcloud2(jdWordsTop100,size=1)
 



# #job title
#
 jobTitleSegwords<-segment(str_c(jobs$jobtitle,""),cutter)
 jobTitleSegTbl<-count(jobTitleSegwords)
 jobTitleSegTbl2<-head(jobTitleSegTbl[order(jobTitleSegTbl$freq,decreasing = TRUE),],100)
 wordcloud2(jobTitleSegTbl2,minSize = 10)


#绘图分析

if(!require("vcd"))
{
 install.packages("vcd")
 require(vcd)
}

if(!require("ggplot2"))
{
  install.packages("ggplot2")
  require("ggplot2")
}
 
 if(!require("ggrepel"))
 {
   install.packages("ggrepel")
   require("ggrepel")
 }


#薪水和地区的关系
jobs<-jobs[-which(jobs$location==""),]
means<-aggregate((jobs$baseMinSalary+ jobs$baseMaxSalary)/2,by=list(jobs$location),FUN=mean)
ggplot(data=means[means$x!=0&means$Group.1!="",],mapping = aes(x=Group.1,y=x,fill=Group.1))+geom_bar(stat="identity",width=0.5)+geom_text(aes(label=round(x),vjust=-0.8,hjust=0.5,color=Group.1), show.legend = TRUE)+geom_hline(aes(yintercept=mean(means$x)),linetype="dashed")


#职位数量和地区的关系
ggplot(jobs,aes(x=location))+geom_bar(position ="stack")+labs(title='position="stack')


#薪水和企业类型的关系

meanS_compType<-aggregate((jobs$baseMaxSalary+jobs$baseMinSalary)/2,by=list(jobs$cType),FUN=mean)
meanS_compType<-meanS_compType[-which(meanS_compType$avgSalary==0),]
colnames(meanS_compType)<-c("cType","avgSalary")

ggplot(meanS_compType,aes(x=cType,y=avgSalary,fill=cType))+geom_bar(stat="identity")




#薪水和title的关系?

s_t_matrix<-data.frame(title=jobs$jobtitle,minSalary=jobs$baseMaxSalary,maxSalary=jobs$baseMaxSalary,avgSalary=(jobs$baseMinSalary+jobs$baseMaxSalary)/2)
jobTitleSegTbl2$avgSalary<-0
for(i in 1:nrow(jobTitleSegTbl2))
{
  # print(paste(as.character(jobTitleSegTbl2[i,c("x")]),mean(s_t_matrix[grepl(as.character(jobTitleSegTbl[i,c("x")]),s_t_matrix$title),c("avgSalary")])))
  
   jobTitleSegTbl2$avgSalary[i]<-mean(s_t_matrix[grepl(as.character(jobTitleSegTbl2[i,c("x")]),s_t_matrix$title),c("avgSalary")])
}


ggplot(jobTitleSegTbl2,aes(x=freq,y=avgSalary))+geom_point(shape=21,color="black",fill="cornsilk")+geom_text_repel(aes(label=x),size=4)

#ggplot(jobTitleSegTbl2,aes(x=x,y=freq))+geom_point(size=3,shape=21)

#ggplot(jobTitleSegTbl,aes(x=x,y=freq))+geom_bar(position ="stack")+labs(title='position="stack')

#install.packages("scatterplot3d")
#library(scatterplot3d)
#scatterplot3d(x=jobTitleSegTbl$,disp,mpg,main="Basic 3D Scatter Plot")



#需要制作一个关键词和薪水对于的表格，并可以知道某个关键词下的薪水分布情况
#jobTitleSegTbl, 
#10K<以上的工作，职位名称分词数在列表中的出现次数
#10~15K<
#15~20k<
#>20K

jobTitleSegTbl2$avgSalary<-0
for(i in 1:nrow(jobTitleSegTbl2))
{
  
  jobTitleSegTbl2$avgSalary[i]<-mean(s_t_matrix[grepl(as.character(jobTitleSegTbl2[i,c("x")]),s_t_matrix$title),c("avgSalary")])
}


jobTitleSegTbl2$salaryLevel<-NULL
jobTitleSegTbl2[jobTitleSegTbl2$avgSalary<10000,c("salaryLevel")]<-"1K~10K"
jobTitleSegTbl2[jobTitleSegTbl2$avgSalary<15000 & jobTitleSegTbl2$avgSalary>=10000,c("salaryLevel")]<-"10K~15K"
jobTitleSegTbl2[jobTitleSegTbl2$avgSalary<20000 & jobTitleSegTbl2$avgSalary>=15000,c("salaryLevel")]<-"15K~20K"
jobTitleSegTbl2[jobTitleSegTbl2$avgSalary<30000 & jobTitleSegTbl2$avgSalary>=20000,c("salaryLevel")]<-"20K~30K"
jobTitleSegTbl2[jobTitleSegTbl2$avgSalary<40000 & jobTitleSegTbl2$avgSalary>=30000,c("salaryLevel")]<-"30K~40K"
jobTitleSegTbl2[jobTitleSegTbl2$avgSalary<50000 & jobTitleSegTbl2$avgSalary>=40000,c("salaryLevel")]<-"40K~50K"
jobTitleSegTbl2[jobTitleSegTbl2$avgSalary>=50000,c("salaryLevel")]<-"50K+"


table(jobTitleSegTbl2$salaryLevel)

wordcloud2(jobTitleSegTbl2[jobTitleSegTbl2$salaryLevel=='1K~10K',],minSize = 10)
wordcloud2(jobTitleSegTbl2[jobTitleSegTbl2$salaryLevel=='10K~15K',],minSize = 10)
wordcloud2(jobTitleSegTbl2[jobTitleSegTbl2$salaryLevel=='15K~20K',],minSize = 10)
wordcloud2(jobTitleSegTbl2[jobTitleSegTbl2$salaryLevel=='20K~30K',],minSize = 10)
wordcloud2(jobTitleSegTbl2[jobTitleSegTbl2$salaryLevel=='30K~40K',],minSize = 10)
wordcloud2(jobTitleSegTbl2[jobTitleSegTbl2$salaryLevel=='50K+',],minSize = 10)



#JD 和薪水的关系

jdWords<-jdWordsTop100
tryCatch({
  for(i in 1:nrow(jdWords))
  {
    
    jdWords$baseMinSalary[i]<-mean(jobs[grepl(as.character(jdWords[i,c("x")]),jobs$jd),c("baseMinSalary")])
    jdWords$baseMaxSalary[i]<-mean(jobs[grepl(as.character(jdWords[i,c("x")]),jobs$jd),c("baseMaxSalary")])
    jdWords$avgSalary[i]<-(jdWords$baseMinSalary[i]+jdWords$baseMaxSalary[i])/2
    
  }
}, error=function(c){print(c)})

#会“微信”开发的人，一般拿多少薪水
wechat_Salary<-jobs[str_detect(jobs$jd,"微信"),c("jobtitle","baseMinSalary","baseMaxSalary")]
summary(wechat_Salary$baseMaxSalary)




#重要的表格
#title-salary
head(jobTitleSegTbl2)
write.xlsx(jobTitleSegTbl2,col.names = TRUE, file = "data\\jobtitle_salary.xlsx", sheetName = "jobTitleSegTbl2")

#jd-salary
head(jdWords)
write.xlsx(jdWords,col.names = TRUE, file = "data\\job_jd_salary.xlsx", sheetName = "jdWords")

#jobs
head(jobs)
jobs$companytype2<-""
write.xlsx(jobs,col.names = TRUE, file = "data\\jobs_processed.xlsx", sheetName = "p_jobs")

#薪水和title的关系?
ggplot(jobTitleSegTbl2,aes(x=freq,y=avgSalary))+geom_point(shape=21,color="black",fill="cornsilk")+geom_text_repel(aes(label=x),size=4)

#探索新技术和薪水的关系
discovery_Salary<-jobs[str_detect(jobs$jd,fixed("adobe",ignore_case=T)),c("jobtitle","avgSalary")]
summary(discovery_Salary$avgSalary)
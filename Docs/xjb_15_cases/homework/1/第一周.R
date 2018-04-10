setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\作业\\1")
install.packages("ggplot2")
install.packages("shiny")

library(ggplot2)
library(shinydashboard)


#list
my.list<-list(stud.id=12345,stud.name='张三',stud.mark=c(60,70,40,90))
my.list

my.list$stud.name
my.list$stud.mark

stud_id<-my.list[1]
stud_name<-my.list[2]
stud_mark<-my.list[3]


#frame
my.dataset<-data.frame(site=c('A','B','B','B','A'),season=c('Winter','Summer','Summer','Spring','Winter'),PH=c(7.4,6.3,8.6,7.2,8.9))
my.dataset

dim(my.dataset)
colnames(my.dataset)
rownames(my.dataset)

colnames(my.dataset)[1]<-"ID"
my.dataset[,1]
my.dataset[1,]

unstructData<-readCitationFile("unstructuredText.txt" )

text<-readChar("unstructuredText.txt",nchars=file.info("unstructuredText.txt")$size)
text

install.packages("readr")
library("readr")

text2<-read_file("unstructuredText.txt",locale=locale())


strConn=file("unstructuredText.txt","r",blocking = FALSE)
text3<-readLines(strConn)
close(strConn)
setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\作业\\2")


#       1、数据集airquality中的变量Ozone和Solar.R均存在缺失值，
#       请利用线性回归模型的方式对这两个变量进行缺失值的替换
#      （以其他四个没有缺失值的变量作为自变量建模）。

head(airquality)

library(VIM)
library(mice)

airquality_lab<-airquality

#图形展示缺失值分布
md.pattern(airquality)

aggr(airquality_lab,prop=FALSE,numbers=TRUE)



#线性回归插补缺失值
sub1<-which(is.na(airquality_lab$Ozone)==TRUE)

DataTR1<-airquality_lab[-sub1,c("Ozone","Wind","Temp","Month","Day")]
DataTE1<-airquality_lab[sub1,c("Ozone","Wind","Temp","Month","Day")]

fit1<-lm(Ozone ~ .,data=DataTR1)

airquality_lab[sub1,"Ozone"]=predict(fit1,DataTE1)


sub2<-which(is.na(airquality_lab$Solar.R)==TRUE)
DataTR2<-airquality_lab[-sub2,]
DataTE2<-airquality_lab[sub2,]


fit2<-lm(Solar.R~Wind+Temp+Month+Day,data=DataTR2)
airquality_lab[sub2,2]=round(predict(fit2,DataTE2))

#随机森林插补缺失值
airquality_lab2<-airquality   #有缺失值NA的R自带的数据

library(missForest) #用随机森林迭代弥补缺失值
z=missForest(airquality_lab2)
airquality_lab2.full=z$ximp  # 随机森林插补后的新数据集
aggr(airquality_lab2.full,prop=FALSE,number=TRUE)


#多重删补
library(mice)
airquality_lab3<-airquality
data(airquality_lab3,package="VIM")
imp<-mice(airquality_lab3,seed=1)

airquality_lab3.full<-complete(imp,action = 3)
aggr(airquality_lab3,prop=FALSE,number=TRUE) #old
aggr(airquality_lab3.full,prop=FALSE,number=TRUE) #new




#2、在对缺失值进行填补时，K近邻和袋装算法也是常用的技巧。
#现在对问卷调研数据利用knn和bag缺失值插补的方式对缺失数据进行预测
#（此题为选做题，提示：利用caret包中的preProcess函数，method参数有多种方式可选）

questionnaire<-read.csv("问卷调研数据.csv",header = TRUE,sep=",")


aggr(questionnaire,prop=FALSE,number=TRUE)

#for(i in 1:ncol(questionnaire))
#{
#  questionnaire[,i]<-factor(questionnaire[,i])
#}
#library(caret)
#dmy<-dummyVars("~.",questionnaire)
#questionnaire.dummyVersion<-data.frame(predict(dmy,newdata=questionnaire))

#KNN
library(DMwR)
questionnaire.full<-knnImputation(questionnaire.dummyVersion,k=3,scale=T,meth="weighAvg",distData = NULL) #preProcess knnImpute
aggr(questionnaire.full,prop=FALSE,number=TRUE)

#BAG
library(caret)
install.packages("ipred")
bag.model<-preProcess(questionnaire,method="bagImpute")
questionnaire.full2<-predict(bag.model,questionnaire)
aggr(questionnaire.full2,prop=FALSE,number=TRUE)




#识别缺失值
install.packages("VIM")
data(sleep,package="VIM")

#列出没有缺失值的行
sleep[complete.cases(sleep),]

#列出有一个或多个缺失值的行
sleep[!complete.cases(sleep),]

#有多少个缺失值
sum(is.na(sleep$Dream))

#sleep$dream上有百分之几的数据是有缺失值的
mean(is.na(sleep$Dream))

#数据集中多个行包含缺失值
mean(!complete.cases(sleep))



#探索缺失值
install.packages("mice")
library(mice)
data(sleep,package="VIM")
md.pattern(sleep)

#图形探索
library("VIM")
aggr(sleep,prop=FALSE,numbers=TRUE)

matrixplot(sleep)

marginplot(sleep[c("Gest","Dream")],pch=c(20),col=c("darkgray","red","blue"))

#用相关性探索缺失值
x<-as.data.frame(abs(is.na(sleep)))
head(sleep,n=5)
head(x,n=5)
y<-x[which(apply(x,2,sum)>0)]#把存在空值的列拿出来
cor(y)
cor(sleep,y,use="pairwise.complete.obs")

#行删除
newdata<-mydata[complete.cases(mydata),]
newdata<-na.omit(mydata)

options(digits=1)
cor(na.omit(sleep))

fit<-lm(Dream~Span+Gest,data=na.omit(sleep))
summary(fit)

#多重插补
library(mice)
data(sleep,package="VIM")
imp<-mice(sleep,seed=1234)

fit<-with(imp,lm(Dream~Span+Gest))
pooled<-pool(fit)
summary(pooled)
imp
imp$imp$Dream

dataset3<-complete(imp,action=3)
dataset3

#成对删除
cor(sleep,use="pairwise.complete.obs")


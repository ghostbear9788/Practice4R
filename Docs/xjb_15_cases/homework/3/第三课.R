setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\作业")

#1、安装fUnitRoots包，并给出安装成功后的截图

install.packages(fUnitRoots)
library(fUnitRoots)



#2、利用指数平滑法来对收入数据建立时间序列模型，对未来6个月进行预测。
#什么是
incomes<-read.csv("3\\收入数据.csv",header=TRUE,sep=",")
incomes_ts<-ts(incomes,start=c(2014,1),frequency = 12,class="ts")

plot(incomes_ts[,2])

library(forecast)

incomes_fit<-ets(incomes_ts[,2],model="ANN")

forecast(incomes_fit,1)

plot(forecast(incomes_fit,1),xlab="year",ylab="incomes",main="income forecast")


#标准答案
# 利用HoltWinters函数对数据进行建模
revenue.ts <- ts(incomes[,2],frequency = 12,start = c(2014,1)) # 转换成时间序列对象

HoltWintersModel <-  HoltWinters(revenue.ts,alpha=TRUE,beta=TRUE,gamma=TRUE)
HoltWintersModel
plot(HoltWintersModel,lty= 1,lty.predicted = 2)
# 利用forecast.HoltWinters函数对未来6个月进行预测
library(forecast)
HoltWintersForecast <- forecast:::forecast.HoltWinters(HoltWintersModel,h=6,level=c(80,95))

#HoltWintersForecast <- HoltWinters(HoltWintersModel,h=6,level=c(80,95))
HoltWintersForecast
# 对残差进行检验
acf(HoltWintersForecast$residuals,lag.max = 20)   #报错：Error in na.fail.default(as.ts(x)) : 对象里有遺漏值
# 绘制模拟预测图
plot(HoltWintersForecast)
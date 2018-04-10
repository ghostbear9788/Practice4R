revenue <- read.csv("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\每周课程作业讲解用到的资料\\第三周\\第三周\\收入数据.csv",T) #导入数据
head(revenue)                         #查看前六行
revenue.ts <- ts(revenue[,2],frequency = 12,start = c(2014,1)) # 转换成时间序列对象
# 利用HoltWinters函数对数据进行建模
HoltWintersModel <-  HoltWinters(revenue.ts,alpha=TRUE,beta=TRUE,gamma=TRUE)
HoltWintersModel
plot(HoltWintersModel,lty= 1,lty.predicted = 2)
# 利用forecast.HoltWinters函数对未来6个月进行预测
library(forecast)
HoltWintersForecast <- forecast:::forecast.HoltWinters(HoltWintersModel,h=6,level=c(80,95))

#HoltWintersForecast <- HoltWinters(HoltWintersModel,h=6,level=c(80,95))
HoltWintersForecast
# 对残差进行检验
acf(HoltWintersForecast$residuals,lag.max = 20)
# 绘制模拟预测图
plot(HoltWintersForecast)
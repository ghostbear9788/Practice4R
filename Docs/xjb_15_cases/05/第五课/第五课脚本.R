setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第五课\\第五课")
###  留存率预测曲线 ###
# 前期实际留存率数据
(day <- seq(1:7)) # 天数
(ratio <- c(0.392,0.278,0.196,0.166,0.106,0.096,0.046)) # 留存率值
# 利用nls函数求出幂指数函数y=a*x^b的系数a、b
fit <- nls(ratio~a*day^b,start = list(a=1,b=1))
# 查看模型结果
summary(fit)
# 对新增用户在接下来365日每天的留存率进行预测
predicted <- predict(fit,data.frame(day=seq(1,365)))
# 查看预测结果
predicted
# 绘制留存率预测曲线
library(dygraphs)
data <- as.data.frame(predicted)
data <- ts(data)
dygraph(data,main="留存了预测曲线") %>% 
  dySeries("predicted",label="留存率",strokeWidth = 2) %>%
  dyOptions(colors = "green",fillGraph = TRUE,fillAlpha = 0.4) %>%
  dyHighlight(highlightCircleSize = 5, 
              highlightSeriesBackgroundAlpha = 0.2,
              hideOnMouseOut = FALSE) %>%
  dyAxis("x", label = "日期",drawGrid = FALSE) %>% 
  dyAxis("y", label = "留存率") %>%
  dyRangeSelector()

### 优化预测曲线 ###
# 导入实际留存率数据
actual <- read.csv("data/实际留存数据.csv")
# 对类型1的游戏进行留存率预测
type1 <- actual[1:7,2]
day <- seq(1:7)
fit1 <- nls(type1~a*day^b,start = list(a=1,b=1))
fit1
predicted1 <- round(predict(fit1,data.frame(day=seq(1,365))),3)
# 对类型2的游戏进行留存率预测
type2 <- actual[1:7,3]
day <- seq(1:7)
fit2 <- nls(type2~a*day^b,start = list(a=1,b=1))
fit2
predicted2 <- round(predict(fit2,data.frame(day=seq(1,365))),3)
# 将预测值与原始值合并在一起
result <- data.frame(actual,predicted1,predicted2)
head(result)
# 导入T值
tvalue <- read.csv("data/T值.csv")
# 对type1类型的游戏计算调整预测值
result$adjust.predicted1 <- tvalue$T1*result$predicted1
# 对type2类型的游戏计算调整预测值
result$adjust.predicted2 <- tvalue$T2*result$predicted2
# 查看数据前六行
head(result)
# 绘制留存率曲线
# 绘制type1的预测曲线
# 绘制实际留存率曲线
plot(Type1~day,data=result,col="slateblue2",main="类型1的留存率曲线",
     type="l",xaxt="n",lty=1,lwd=2)
# 绘制留存率预测曲线
lines(predicted1~day,dat=result,col="violetred3",type="l",lty=2,lwd=2)
# 绘制留存率调整预测曲线
lines(adjust.predicted1~day,data=result,col="yellowgreen",type="l",lty=3,lwd=2)
#  增加图例
legend("top",legend=colnames(result)[c(2,4,6)],lty = 1:3,ncol=3,
       col=c("slateblue2","violetred3","yellowgreen"),bty = "n")
# 绘制type2的预测曲线
# 绘制实际留存率曲线
plot(Type2~day,data=result,col="slateblue2",main="类型2的留存率曲线",
     type="l",xaxt="n",lty=1,lwd=2)
# 绘制留存率预测曲线
lines(predicted2~day,dat=result,col="violetred3",type="l",lty=2,lwd=2)
# 绘制留存率调整预测曲线
lines(adjust.predicted2~day,data=result,col="yellowgreen",type="l",lty=3,lwd=2)
#  增加图例
legend("top",legend=colnames(result)[c(3,5,7)],lty = 1:3,ncol = 3,
       col=c("slateblue2","violetred3","yellowgreen"),bty = "n")

setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第三课\\第三课")
### 双指标数据可视化  ###
# 绘制散点图
w <- read.csv("data//可视化数据.csv",T)
plot(w$新增用户,w$活跃用户,col="violetred2",pch=16,
     main="活跃用户 vs 新增用户散点图")
# 添加线性拟合直线
fit <- lm(w$活跃用户~w$新增用户,data=w)
abline(fit,col="blue",lwd=2,lty=2)

### 三指标数据可视化 ###
plot(w$新增用户,w$活跃用户,col="violetred2",pch=16,
     cex=w$付费率,
     main="活跃用户 vs 新增用户气泡图")

### 时间序列数据预测 ###
revenue <- read.csv("data//收入数据.csv",T) # 导入数据
head(revenue)
revenue.ts <- ts(revenue[,2],frequency = 12,start = c(2014,1)) # 转换成时间序列对象
is.ts(revenue.ts) # 判断是否为时间序列对象
start(revenue.ts) # 查看开始日期
end(revenue.ts)   # 查看结束日期
frequency(revenue.ts) # 查看一个周期的聘书
# 绘制时序图
plot.ts(revenue.ts,xlab="时间",ylab="收入")
abline(lm(revenue.ts~time(revenue.ts)),col="red",lty=2,lwd=2)#时间序列的趋势线
# 使用单位根检验方法验证其平稳性
install.packages("fUnitRoots")
library(fUnitRoots)
unitrootTest(revenue.ts)
# 进行一阶差分运算
revenue.ts.diff <- diff(revenue.ts)
unitrootTest(revenue.ts.diff)
# 对时间序列对象进行拆解
revenue.ts.decompose <- decompose(revenue.ts)
plot(revenue.ts.decompose)
# 利用auto.arima函数建立时间序列预测模型
install.packages("forecast")
library(forecast)
fit <- auto.arima(revenue.ts)
fit
fit.forecast <- forecast(fit,h=6)
fit.forecast
plot(fit.forecast)

### 活跃时间段相关分析 ###
logindata <- read.csv("data//logindata.csv")
library(caret)
dmy <- dummyVars(~.,data = logindata)
dmyTsrf <- data.frame(predict(dmy,newdata = logindata))
dim(dmyTsrf)
str(dmyTsrf)
# 导入自定义的求相关系数函数
source("code//CorrelationFunction.R")
corMasterList <- flattenSquareMatrix(cor.prob(dmyTsrf))
# 按照相关系数的绝对值进行降序排序
corList <- corMasterList[order(-abs(corMasterList$cor)),]
# 提取与“是否付费.是"的相关系数大于0.04的记录
selectedSub <- subset(corList,(abs(cor))>0.04 & i %in% c("是否付费.是"))
bestsub <- as.character(selectedSub$j)
# 绘制相关系数图
install.packages("corrplot")
library(corrplot)
corrplot.mixed(cor(dmyTsrf[,c('是否付费.是',bestsub)]),
               lower = "ellipse",upper = "number",
               tl.pos="lt",diag="u")

### 玩家对应分析 ###
w <- read.csv("data\\玩家喜好分析数据.csv")
rownames(w) <- w[,1] # 将道具名称赋予行名称
install.packages("ca")
library(ca)
w.ca <- ca(w[,-1]) # 建立简单对应分
               # 查看结果
names(w.ca)        # 查看因子分析输出的对象列表
w.ca$colnames      # 查看列名称
w.ca$colcoord      # 查看列的标准坐标
# 绘制对应分析的散点图
plot(w.ca$rowcoord[,1],w.ca$rowcoord[,2],pch=16,col=rgb(0.6,0.3,0.2),
     xlim=c(min(w.ca$rowcoord[,1]),max(w.ca$rowcoord[,1])+0.3),
     main= "玩家购买物品偏好分析")
text(w.ca$rowcoord[,1],w.ca$rowcoord[,2],labels = w.ca$rownames,
     cex=0.8,pos=4,col=rgb(0.6,0.3,0.2))
points(w.ca$colcoord[,1],w.ca$colcoord[,2],pch=17,col="#007e7e")
text(w.ca$colcoord[,1],w.ca$colcoord[,2],labels = w.ca$colnames,
     cex=0.8,pos=4,col="#007e7e")

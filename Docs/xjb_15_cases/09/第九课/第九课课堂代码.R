setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第九课\\第九课")
### 用户四象限分析法 ###
# 导入渠道日运营数据
channel <- read.csv("data/渠道日概况.csv",header=TRUE,fill=TRUE)
# 利用Median-IQR方法分析ARPPU、ARPU、新增次日留存率和新增七日留存率
# 自定义求中位数和四分位距函数
mystats <- function(x) c(Median=median(x,na.rm=T),IQR=IQR(x,na.rm=T))  #IQR?
# 求出各指标的统计值
install.packages("doBy")
library(doBy)
result <- summaryBy(ARPPU+ARPU+新增次日留存率+新增7日后留存率~渠道名称,
                    data=channel,FUN = mystats)
result
# 对各指标绘制四象限图，查看渠道分布情况
# 将需要绘制四象限图的指标赋予name对象
name <- c("ARPPU","ARPU","新增次日留存率","新增7日留存率")
# 利用for循环绘制四个四象限分布图
par(mfrow = c(2,2))
for(i in 1:4){
  plot(result[,2*i],result[,2*i+1],type = "n",
       xlim=c(0.95*min(result[,2*i]),1.05*max(result[,2*i])), # 设置横轴坐标轴范围
       ylim=c(0.95*min(result[,2*i+1]),1.05*max(result[,2*i+1])), #设置纵轴坐标轴范围
       main = paste0(name[i],"四象限图"), 
       xlab = "中位数值",ylab = "四分位距值") #绘制散点图 
  abline(v = mean(result[,2*i]),lty = 2,col = "green") # 添加垂直直线
  abline(h = mean(result[,2*i+1]),lty = 2,col = "blue")  # 添加水平直线
  text(result[,2*i],result[,2*i+1],result[,1],
       col = "black",cex = 0.8,font=2) # 在图中打印出渠道名称
}
par(mfrow=c(1,1))


### 渠道质量打分模型 ###
# 自定义channel_score( )实现指标打分模型
# 渠道得分函数
channel_score <- function(data,amount=T){
  
  # 进行指标的波动性打分  
  library(reshape)
  data <- cast(data,渠道名称~自然周)
  # 利用apply函数分渠道求出当前周与上周的差值
  x <- t(apply(data[,-1],1,diff))
  # 利用as.data.frame函将x转换成数据框形式
  x <- as.data.frame(x,row.names = as.character(data[,1]))
  # 利用colnames函数对x列名重新赋值
  colnames(x) <-  colnames(data[3:ncol(data)])
  # 找出最近四周的最大值
  # 自定义函数mystat求最近四周的最大值
  mystat <- function(x){
    m <- rep(0,(ncol(data)-1))
    for(i in 1:(ncol(data)-1)){
      if(i <=3){
        m[i] <- max(x[1:i])
      } else {
        m[i] <- max(x[(i-3):i])
      }
    }
    return(m)
  }
  # 利用apply函按分渠道求最近四周最大值
  y <- t(apply(data[,-1],1,mystat))
  # 利用as.data.frame函数将y转换成数据框形式
  y <- as.data.frame(y,row.names = as.character(data[,1]))
  # 利用colnames函数对y列名重新赋值
  colnames(y) <-  colnames(data[2:ncol(data)])
  # 计算波动变化得分
  reliability_score <- 5*round(x/y[,-1],3)
  reliability_score
  if(amount) {
    # 进行指标的量级打分
    # 利用colSums函数进行按列求和
    x <- colSums(data[,-1])
    x <- as.data.frame(matrix(rep(x,nrow(data)),nrow = nrow(data),byrow = T))
    amount_score <- 5*round(data[,-1]/x,3)
    rownames(amount_score) <- rownames(reliability_score)
    amount_score
    
    # 计算指标得分
    # 利用cumsum函数进行对波动变化值进行累积求和
    rs_cumsum <- apply(reliability_score,1,cumsum)
    rs_cumsum <- as.data.frame(t(rs_cumsum))
    score <- 10+rs_cumsum+amount_score[,-1] #起始分+波动变化得分+量级得分
    score[,colnames(data)[2]] <- 10
    score <- score[,c(ncol(score),1:ncol(score)-1)] # 改变列的顺序
  } else {
    # 利用cumsum函数进行对波动变化值进行累积求和
    rs_cumsum <- apply(reliability_score,1,cumsum)
    rs_cumsum <- as.data.frame(t(rs_cumsum))
    score <- 10+rs_cumsum #起始分+波动变化得分
    score[,colnames(data)[2]] <- 10
    score <- score[,c(ncol(score),1:ncol(score)-1)] # 改变列的顺序
  }
  return(score)
}
# 导入周渠道概况数据
load("data/rawdata.RData")
str(rawdata)
# 对字段自然周转化成有序因子变量
levels <- c(paste0("第",1:length(unique(rawdata$自然周)),"周"))
rawdata$自然周 <- factor(rawdata$自然周,
                      levels = levels,
                      ordered = T)
str(rawdata)

# 计算指标1得分
channel_index1 <- channel_score(rawdata[,c("渠道名称","自然周","指标1")])
# 计算指标2得分
channel_index2<- channel_score(rawdata[,c("渠道名称","自然周","指标2")])
# 计算指标3得分
channel_index3 <- channel_score(rawdata[,c("渠道名称","自然周","指标3")],amount=F)
# 计算指标4得分
channel_index4 <- channel_score(rawdata[,c("渠道名称","自然周","指标4")],amount=F)
# 计算指标5得分
channel_index5 <- channel_score(rawdata[,c("渠道名称","自然周","指标5")],amount=F)
# 计算综合得分
channel_total <- round(0.3*channel_index1+0.2*channel_index2+0.2*channel_index3+
                         0.15*channel_index4+0.15*channel_index5,2)
# 查看综合得分结果
channel_total
# 绘制在各渠道的生存曲线
channel_total$渠道名称 <- rownames(channel_total) # 增加渠道名称变量
library(reshape)
md <- melt(channel_total,id="渠道名称") #对数据进行重塑
md$week <- ifelse(nchar(as.character(md$variable))==4,
                  substr(md$variable,2,3),substr(md$variable,2,2)) #增加周数变量
md$week <- as.numeric(md$week)
library(lattice)
xyplot(value~week|渠道名称,data=md,type=c("l","g"),
       lwd=2,layout=c(6,2)) #绘制面板曲线图


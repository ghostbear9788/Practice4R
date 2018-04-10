setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第十课\\第十课\\航空公司客户价值分析\\航空公司客户价值分析")
# 数据读取
datafile <- read.csv("data\\air_data.csv")
# 选择需要探索分析的变量
col <- c(15:18,20:29) #去掉日期型变量
# 输出变量最值、缺失情况
summary(datafile[,col])
install.packages("mice")
install.packages("VIM")
library(mice)
library(VIM)
md.pattern(datafile[,col])
aggr(datafile[,col],prob=F,number=T)

# 数据清洗
# 丢弃票价为空的记录
delet_na <- datafile[-which(is.na(datafile$SUM_YR_1) | is.na(datafile$SUM_YR_2)),]
# 丢弃票价为0、平均折扣不为0、总飞行公里数大于0的记录
index <- ((delet_na$SUM_YR_1==0 & delet_na$SUM_YR_2==0)*
            (delet_na$avg_discount != 0)*
            (delet_na$SEG_KM_SUM > 0))
deletdata <-delet_na[-which(index==1),]

# 属性规约
deletdata <- deletdata[,c("LOAD_TIME","FFP_DATE","LAST_TO_END","FLIGHT_COUNT",
                          "SEG_KM_SUM","avg_discount")]
DT::datatable(deletdata)

# 数据变换,变换后的数据存为zscoredata.csv
datafile <- read.csv("data\\zscoredata.csv")
summary(datafile)
# 对数据做标准差标准化处理
zscoreddata <- scale(datafile)
DT::datatable(round(zscoreddata,3))

# K-Means聚类算法
# 分成五类
result <- kmeans(zscoreddata,5)
# 查看类别分布  
table(result$cluster)
barplot(table(result$cluster),col= rainbow(5),border = F)
# 查看类中心
result$centers

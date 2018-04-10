setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第七课\\第七课")
###  玩家物品购买关联分析 ###
# 业务案例：对玩家物品购买关联分析
data <- read.csv("玩家购物数据.csv",T)
# 利用cast函数对数据进行重组
install.packages("reshape")
library(reshape)
data_matrix <- cast(data,player_id~product_name,value = "qty")
# 查看前三行五列数据
data_matrix[1:3,1:5]
# 进行替换，将NA转化为0，其他数字为1
data_matrix_new <- apply(data_matrix[,-1],2,function(x) {ifelse(is.na(x),0,1)})
# 对矩阵行名称、列名称进行赋值
data_matrix_new <- matrix(data_matrix_new,nrow=dim(data_matrix_new)[1],
                          ncol=dim(data_matrix_new)[2],
                          dimnames = list(data_matrix[,1],colnames(data_matrix)[-1]))
# 查看前三行五列数据
data_matrix_new[1:3,1:5]
# 利用as函数将矩阵转换成事物型??
install.packages("arules")
library(arules)
data_class <- as(data_matrix_new,"transactions")
inspect(data_class[1:6]) # 查看前六条交易记录
summary(data_class) # 查看汇总信息
# itemFrequency函数计算各个项集的出现频率(支持度)
itemFrequency(data_class[,1:3]) # 查看前三件道具的支持度
itemFrequency(data_class[,c('8条钥匙','15000金币','0.1元大礼包')]) # 查看指定道具的支持度
# 使用itemFrequencyPlot函数绘制支持度频率图
par(mfrow=c(1,1))
# 输出支持度support大于0.05的项集的支持度频率图
itemFrequencyPlot(data_class,support=0.05,main="support大于0.05的项集支持度频率图") 
# 输出支持度support最大的前20个项集的支持度频率图
itemFrequencyPlot(data_class,topN=20,main="support最大的前20个项集的支持度频率图")
par(mfrow=c(1,1))
# 建立关联规则rules
rules <- apriori(data_class,
                 parameter=list(support=0.005,confidence=0.1,target="rules",minlen=2))
summary(rules) # 查看规则汇总信息
inspect(rules[1:6]) # 查看前六条规则
quality(rules[1:6]) # 提取前六条规则信息
# 对规则按照提升度排序，并输出提升度最大的前六条规则
inspect(sort(rules,by="lift")[1:6]) 
# 提取规则
# 提取前项包含"超值大礼包"或"新手礼包"的规则
inspect(subset(rules,subset=lhs %in% c("超值大礼包","新手礼包")))
# 提取lhs包含"超值大礼包"或"新手礼包"的规则且lift大于1的规则
inspect(subset(rules,subset=lhs %in% c("超值大礼包","新手礼包") & lift>1))
# 对关联规则进行可视化
rules_lift <- subset(rules,subset=lift>2)
install.packages("arulesViz")
library(arulesViz)
#绘制关联图形
plot(rules_lift,method="graph",
     control = list(nodeCol = grey.colors(10), 
                    edgeCol = grey(.7), alpha = 1))
#绘制分组矩阵
plot(rules_lift,method = "grouped",
     control = list(col = grey.colors(10))) 
# 将规则导出到本地
write(rules,"rules.txt",sep="|",row.names=F)


# 业务案例：对玩家物品购买进行智能推荐
install.packages("recommenderlab")
library(recommenderlab)
# 将矩阵转化为binaryRatingMatrix对象
data_class <- as(data_matrix_new,"binaryRatingMatrix")
as(data_class,"matrix")[1:3,1:5] #显示部分物品购买情况
# 建立三种模型，并对模型进行评价
# 创建一个评分方案 (十折交叉验证)
scheme <- evaluationScheme(data_class, method="cross-validation",
                           k=10, given=-1)
## 创建用于评估模型的算法列表
algorithms <- list(
  POPULAR = list(name = "POPULAR", param = NULL),
  UBCF=list(name="UBCF",param=NULL),
  IBCF=list(name="IBCF",param=NULL)
)
# 对模型进行评价
result <- evaluate(scheme,algorithms,n=1:5)
# 输出ROC曲线和precision-recall曲线
par(mfrow=c(1,2))
plot(result,lty=1:3,annotate=1:3,legend="topleft") # ROC
plot(result,"prec/rec",lty=1:3,annotate=1:3) #precision-recall(查准与召回)
par(mfrow=c(1,1))

# 按照评价方案建立推荐模型
model.popular <- Recommender(getData(scheme,"train"),method="POPULAR")
model.ubcf <- Recommender(getData(scheme,"train"),method="UBCF")
model.ibcf <- Recommender(getData(scheme,"train"),method="IBCF")
# 对推荐模型进行预测
predict.popular <- predict(model.popular,getData(scheme,"known"),type="topNList")
predict.ubcf <- predict(model.ubcf,getData(scheme,"known"),type="topNList")
predict.ibcf <- predict(model.ibcf,getData(scheme,"known"),type="topNList")
# calcPredictionAccuracy()的参数"know"和"unknow"表示对测试集的进一步划分：
# "know"表示用户已经评分的，要用来预测的items；
# "unknow"表示用户已经评分，要被预测以便于进行模型评价的item
predict.err <- rbind(calcPredictionAccuracy(predict.popular,getData(scheme,"unknow"),given=3),
                     calcPredictionAccuracy(predict.ubcf,getData(scheme,"unknow"),given=3),
                     calcPredictionAccuracy(predict.ibcf,getData(scheme,"unknow"),given=3))
rownames(predict.err) <- c("POPULAR",'UBCF','IBCF')
round(predict.err,3)

#选择IBCF作为最优模型
model.best <- Recommender(data_class,method="IBCF")
# 使用precict函数，对玩家进行Top3推荐
data.predict <- predict(model.best,newdata=data_class,n=5)
recom3 <- bestN(data.predict,3)
as(recom3,"list")[1:5] #查看前五个玩家的top3推荐
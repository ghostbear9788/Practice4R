#1、arules包中有一份Groceries数据集，这是一个超市购物例子(Hahsler et al., 2006)，
#   数据中有9835笔交易，涉及169种商品。请利用arules包中的apriori算法对Groceries数据
#   进行研究。


#2、尝试将课堂上的智能推荐结果（TOP3列表）导出到本地（选做题）。


setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\作业")

library(arules)
Groceries<-data(Groceries)  #transaction type

# 输出支持度support大于0.05的项集的支持度频率图
itemFrequencyPlot(Groceries,support=0.05,main="support大于0.05的项集支持度频率图") 

# 输出支持度support大于0.05的项集的支持度频率图
itemFrequencyPlot(Groceries,topN=20,main="support最大的前20个项集的支持度频率图")


# 建立关联规则rules
rules <- apriori(Groceries,
                 parameter=list(support=0.005,confidence=0.1,target="rules",minlen=2))
summary(rules) # 查看规则汇总信息
inspect(rules[1:6]) # 查看前六条规则
quality(rules[1:6]) # 提取前六条规则信息

# 对规则按照提升度排序，并输出提升度最大的前六条规则
inspect(sort(rules,by="lift")[1:6]) 

install.packages("arulesViz")
library(arulesViz)

#绘制关联图形
plot(rules,method="graph",
     control = list(nodeCol = grey.colors(10), 
                    edgeCol = grey(.7), alpha = 1))

#绘制分组矩阵
plot(rules,method = "grouped",
     control = list(col = grey.colors(10))) 


#物品购买进行智能推荐
install.packages("recommenderlab")
library(recommenderlab)
# 将矩阵转化为binaryRatingMatrix对象
data_class <- as(Groceries,"binaryRatingMatrix")
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
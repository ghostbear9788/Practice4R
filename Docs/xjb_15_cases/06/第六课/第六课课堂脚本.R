setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第六课\\第六课")
###  分类及模型评估  ###
# KNN近邻分类
# 随机抽取1/2的样本作为训练集，另外一半的样本作为测试集来验证模型的效果
iris1<-iris
set.seed(1234)
# 利用caret包的createDataPartition函数按不同类别等比例抽取50%
library(caret)
ind <- createDataPartition(iris1$Species,times=1,p=0.5,list=F)
traindata <-iris1[ind,]  #构建训练集
testdata <- iris1[-ind,] #构建测试集
# 利用class包中的knn函数对测试集的分类进行预测。
library(class)
a=knn(traindata[,1:4],testdata[,1:4],traindata[,5],k=3) #指定k值为3
a[1];a[75] # 查看第一条和最后一条测试数据的预测结果
# KNN算法流程验证：
ceshi <- function(n=1,k=3){
  # 计算第n个测试集样本与训练集样本的距离
  x <- (traindata[,1:4]-testdata[rep(n,75),1:4])^2
  traindata$dist1 <- apply(x,1,function(x) sqrt(sum(x)))
  # 对距离进行升序排序，选择最近的K个邻居
  mydata <- traindata[order(traindata$dist1)[1:k],5:6]
  # 统计不同类别的频数
  result <- data.frame(sort(table(mydata$Species),decreasing = T))
  # 给出最后的预测结果
  return(result[1,1])
}
ceshi() # 第一个样本的预测结果
ceshi(n=75) # 最后一个样本的预测结果

# 朴素贝叶斯分类
# 导入car数据集
car <- read.table("car.data",sep = ",")
# 对变量重命名
colnames(car) <- c("buy","main","doors","capacity",
                   "lug_boot","safety","accept")
# 随机选取75%的数据作为训练集建立模型，25%的数据作为测试集用来验证模型
library(caret)
# 构建训练集的下标集
ind <- createDataPartition(car$accept,times=1,p=0.75,list=FALSE) 
# 构建测试集数据好训练集数据
carTR <- car[ind,]
carTE <- car[-ind,]

# 使用naiveBayes函数建立朴素贝叶斯分类器
library(e1071)
naiveBayes.model <- naiveBayes(accept~.,data=carTR)
# 预测结果
carTR_predict <- predict(naiveBayes.model,newdata=carTR) # 训练集数据
carTE_predict <- predict(naiveBayes.model,newdata=carTE) # 测试集数据
# 构建混淆矩阵
tableTR <- table(actual=carTR$accept,predict=carTR_predict)
tableTE <- table(actual=carTE$accept,predict=carTE_predict)
# 计算误差率
errTR <- paste0(round((sum(tableTR)-sum(diag(tableTR)))*100/sum(tableTR),
                      2),"%")
errTE <- paste0(round((sum(tableTE)-sum(diag(tableTE)))*100/sum(tableTE),
                      2),"%")
errTR;errTE

# 使用决策树算法建立分类树
# 使用C50函数实现C5.0算法
install.packages("C50")
library(C50)
C5.0.model <- C5.0(accept~.,data=carTR)
# 使用rpart函数实现CART算法
library(rpart)
rpart.model <- rpart(accept~.,data=carTR)
# 使用ctree函数实现条件推理决策树算法
install.packages("party")
library(party)
ctree.model <- ctree(accept~.,data=carTR)

# 预测结果，并构建混淆矩阵，查看准确率
# 构建result，存放预测结果
result <- data.frame(arithmetic=c("C5.0","CART","ctree"),
                     errTR=rep(0,3),errTE=rep(0,3))
for(i in 1:3){
  # 预测结果
  carTR_predict <- predict(switch(i,C5.0.model,rpart.model,ctree.model),
                           newdata=carTR,
                           type=switch(i,"class","class","response")) # 训练集数据
  carTE_predict <- predict(switch(i,C5.0.model,rpart.model,ctree.model),
                           newdata=carTE,
                           type=switch(i,"class","class","response")) # 测试集数据
  # 构建混淆矩阵
  tableTR <- table(actual=carTR$accept,predict=carTR_predict)
  tableTE <- table(actual=carTE$accept,predict=carTE_predict)
  # 计算误差率
  result[i,2] <- paste0(round((sum(tableTR)-sum(diag(tableTR)))*100/sum(tableTR),
                              2),"%")
  result[i,3] <- paste0(round((sum(tableTE)-sum(diag(tableTE)))*100/sum(tableTE),
                              2),"%")
}
# 查看结果
result

# 集成学习及随机森林
# 使用adabag包中的bagging函数实现bagging算法
install.packages("adabag")
library(adabag)
bagging.model <- bagging(accept~.,data=carTR)
# 使用adabag包中的boosting函数实现boosting算法
boosting.model <- boosting(accept~.,data=carTR)
# 使用randomForest包中的randomForest函数实现随机森林算法
library(randomForest)
randomForest.model <- randomForest(accept~.,data=carTR)

# 预测结果，并构建混淆矩阵，查看准确率
# 构建result，存放预测结果
result <- data.frame(arithmetic=c("bagging","boosting","随机森林"),
                     errTR=rep(0,3),errTE=rep(0,3))
for(i in 1:3){
  # 预测结果
  carTR_predict <- predict(switch(i,bagging.model,boosting.model,randomForest.model),
                           newdata=carTR) # 训练集数据
  carTE_predict <- predict(switch(i,bagging.model,boosting.model,randomForest.model),
                           newdata=carTE) # 测试集数据
  # 构建混淆矩阵
  tableTR <- table(actual=carTR$accept,
                   predict=switch(i,carTR_predict$class,carTR_predict$class,carTR_predict))
  tableTE <- table(actual=carTE$accept,
                   predict=switch(i,carTE_predict$class,carTE_predict$class,carTE_predict))
  # 计算误差率
  result[i,2] <- paste0(round((sum(tableTR)-sum(diag(tableTR)))*100/sum(tableTR),
                              2),"%")
  result[i,3] <- paste0(round((sum(tableTE)-sum(diag(tableTE)))*100/sum(tableTE),
                              2),"%")
}
# 查看结果
result

# 人工神经网络与支持向量机
# 使用nnet包中的nnet函数建立人工神经网络模型
library(nnet)
# 隐藏层有3个节点，初始随机权值在[-0.1,0.1]，权值是逐渐衰减的,最大迭代数是200
nnet.model <- nnet(accept~.,data=carTR,size=3,rang=0.1,decay=5e-4,maxit=200)
# 使用kernlab包中的ksvm函数建立支持向量机模型
library(kernlab)
# 使用rbfdot选项制定径向基核函数
svm.model <- ksvm(accept~.,data=carTR,kernel="rbfdot")

# 利用模型对结果进行预测
# 构建混淆矩阵
nnet.t0 <- table(carTR$accept,predict(nnet.model,carTR,type="class"))
nnet.t <- table(carTE$accept,predict(nnet.model,carTE,type="class"))
svm.t0 <- table(carTR$accept,predict(svm.model,carTR,type="response"))
svm.t <- table(carTE$accept,predict(svm.model,carTE,type="response"))
# 查看各自错误率
nnet.err0 <- paste0(round((sum(nnet.t0)-sum(diag(nnet.t0)))*100/sum(nnet.t0),
                          2),"%")
nnet.err <- paste0(round((sum(nnet.t)-sum(diag(nnet.t)))*100/sum(nnet.t),
                         2),"%")
svm.err0 <- paste0(round((sum(svm.t0)-sum(diag(svm.t0)))*100/sum(svm.t0),
                         2),"%")
svm.err <- paste0(round((sum(svm.t)-sum(diag(svm.t)))*100/sum(svm.t),
                        2),"%")
nnet.err0;nnet.err;svm.err0;svm.err

# 模型评估
# k折交叉验证
# 构建10折交叉验证
#下面构造10折下标集
library(caret)
ind<-createFolds(car$accept,k=10,list=FALSE,returnTrain=FALSE)
# 下面再做10折交叉验证，这里仅给出训练集和测试集的分类平均误判率。
E0=rep(0,10);E1=E0
library(C50)
for(i in 1:10){
  n0=nrow(car)-nrow(car[ind==i,]);n1=nrow(car[ind==i,])
  a=C5.0(accept~.,car[!ind==i,])
  E0[i]=sum(car[!ind==i,'accept']!=predict(a,car[!ind==i,]))/n0   #当前I之外的预测错误比例：预测错误数/总共预测数
  E1[i]=sum(car[ind==i,'accept']!=predict(a,car[ind==i,]))/n1   #当前I的预测错误比例：预测错误数/总共预测数
}
(1-mean(E0));(1-mean(E1))  #预测准确率

# 利用caret包中的train函数完成交叉验证
library(caret)
control <- trainControl(method="repeatedcv",number=10,repeats=3)
model <- train(accept~.,data=car,method="rpart",
               trControl=control)
model
plot(model)
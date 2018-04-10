setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第七课\\第七课")
###   活跃用户流失预测  ###
# 数据准备
w <- read.csv("用户流失预测数据.csv") # 导入数据
w <- w[,-1] # 剔除用户ID
w$活跃度 <- round(w$登录总次数/7,3) #增加活跃度字段
w$玩牌胜率 <- round(w$赢牌局数/w$玩牌局数,3) # 增加玩牌胜率字段
# 对数据进行哑变量处理，进行相关性分析
library(caret)
dmy <- dummyVars(~.,data=w) # 构建哑变量对象
trsf <- data.frame(predict(dmy,newdata=w)) # 对数据进行虚拟化处理
M <- round(cor(trsf[,1:2],trsf[,c(-1,-2)]),3) # 进行相关性分析
M
library(corrplot)
corrplot(M,method="ellipse",col = c("green","black"))                 # 对相关系数进行可视化
# 利用随机森林模型中查看每个属性的重要性
library(randomForest)
model <- randomForest(是否流失~.,data=w,importance=TRUE) # 建立随机森林模型
varImpPlot(model,main="Variable Importance Random Forest") # 查看变量重要性
# 随机选取75%的数据作为训练集建立模型，25%的数据作为测试集用来验证模型
library(caret)
# 构建训练集的下标集
ind <- createDataPartition(w$是否流失,times=1,p=0.75,list=FALSE) 
# 构建测试集数据好训练集数据
traindata <- w[ind,]
testdata <- w[-ind,]

# 数据建模
# 利用10折交叉验证来选择最优参数
control <- trainControl(method="repeatedcv",number=10,repeats=3)
rpart.model <- train(是否流失~.,data=w,method="rpart",
                         trControl=control)
rf.model <- train(是否流失~.,data=w,method="rf",
                      trControl=control)
nnet.model <- train(是否流失~.,data=w,method="nnet",
                        trControl=control)
# 查看模型结果
rpart.model
rf.model
nnet.model

# 利用决策树、随机森林、人工神经网络构建分类器，并对查看预测错误率
# 利用rpart函数建立分类树
rpart.model <- rpart::rpart(是否流失~.,data=traindata,control=(cp=0.0137457))
# 利用randomForest函数建立随机森林
rf.model <- randomForest::randomForest(是否流失~.,data=traindata,mtry=2)
# 利用nnet函数建立人工神经网络
nnet.model <- nnet::nnet(是否流失~.,data=traindata,size = 5,decay = 0.1)

# 构建result，存放预测结果
result <- data.frame(arithmetic=c("决策树","随机森林","人工神经网络"),
                     errTR=rep(0,3),errTE=rep(0,3))
for(i in 1:3){
  # 预测结果
  traindata_predict <- predict(switch(i,rpart.model,rf.model,nnet.model),
                               newdata=traindata,type="class") # 对训练集数据预测
  testdata_predict <- predict(switch(i,rpart.model,rf.model,nnet.model),
                              newdata=testdata,type="class") # 对测试集数据预测
  # 构建混淆矩阵
  tableTR <- table(actual=traindata$是否流失,traindata_predict)
  tableTE <- table(actual=testdata$是否流失,testdata_predict)
  # 计算误差率
  result[i,2] <- paste0(round((sum(tableTR)-sum(diag(tableTR)))*100/sum(tableTR),
                              2),"%")
  result[i,3] <- paste0(round((sum(tableTE)-sum(diag(tableTE)))*100/sum(tableTE),
                              2),"%")
}
# 查看结果
result
# 下面用不同数目(1~500棵)树训练随机森林
n = 500
NMSE  = NMSE0 <- rep(0,n)
for(i in 1:n){
  a <- randomForest(是否流失~.,data=traindata,ntree=i)
  y0 <- predict(a,traindata)
  y1 <- predict(a,testdata)
  NMSE0[i] <- sum(traindata[,'是否流失']!=y0)/nrow(traindata)
  NMSE[i] <- sum(testdata[,'是否流失']!=y1)/nrow(testdata)
}
plot(1:n,NMSE,type="l",ylim=c(min(NMSE,NMSE0),max(NMSE,NMSE0)),
     xlab="树的数目",ylab="误差率",lty=2)
lines(1:n,NMSE0)
legend("topright",lty=1:2,c("训练集","测试集"))

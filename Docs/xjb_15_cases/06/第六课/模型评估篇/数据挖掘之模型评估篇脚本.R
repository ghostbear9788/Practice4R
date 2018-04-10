# 使用caret包的GermanCredit数据
library(caret)
data(GermanCredit)
str(GermanCredit)
# 数据清洗
GermanCredit$Class <- factor(GermanCredit$Class, levels = c("Bad", "Good", 0, 1))
class <- GermanCredit$Class
GermanCredit$Class[which(class == "Bad")] <- 0
GermanCredit$Class[which(class == "Good")] <- 1
GermanCredit$Class <- factor(GermanCredit$Class, levels = c(0, 1))
# 利用nearZeroVar进行进零方差预测识别并移除
GermanCredit <- GermanCredit[, -nearZeroVar(GermanCredit)]
# 再移除其他不需要的变量
GermanCredit$CheckingAccountStatus.lt.0 <- NULL
GermanCredit$SavingsAccountBonds.lt.100 <- NULL
GermanCredit$EmploymentDuration.lt.1 <- NULL
GermanCredit$EmploymentDuration.Unemployed <- NULL
GermanCredit$Personal.Male.Married.Widowed <- NULL
GermanCredit$Property.Unknown <- NULL
GermanCredit$Housing.ForFree <- NULL
# 数据分区
ind <-createDataPartition(GermanCredit$Class,times=1,p=0.9,list=FALSE) 
credit.train <- GermanCredit[ind,] #训练集
credit.test <- GermanCredit[-ind,] #测试集
# 建模及预测
credit.fit <- train(Class~.,data=credit.train,method="knn",trControl=trainControl(method="cv"))
# 对测试集数据进行预测
credit.p <- predict(credit.fit,newdata=credit.test,type="raw")
# 构建混淆矩阵
confusion<-table(actual=credit.test$Class,predict=credit.p)
confusion
# 计算各指标
(TP <- confusion[4])
(TN <- confusion[3])
(FP <- confusion[2])
(FN <- confusion[1])
(N <- sum(credit.test$Class == 0))
(P <- sum(credit.test$Class == 1))
(TPR <- TP/P)
(TNR <- TN/N)
(FPR <- FP/P)
(FNR <- FP/N)
(ACC <- (sum(TN) + sum(TP))/sum(confusion))
(ERR <- (sum(FN) + sum(FP))/sum(confusion))

# ROC
# 下载数据
titanicDF <- read.csv('http://math.ucdenver.edu/RTutorial/titanic.txt',sep='\t')
print(str(titanicDF))
# 数据清洗
titanicDF$Title <- ifelse(grepl('Mr ',titanicDF$Name),'Mr',ifelse(grepl('Mrs ',titanicDF$Name),'Mrs',ifelse(grepl('Miss',titanicDF$Name),'Miss','Nothing'))) 
titanicDF$Age[is.na(titanicDF$Age)] <- median(titanicDF$Age, na.rm=T)
titanicDF <- titanicDF[c('PClass', 'Age',    'Sex',   'Title', 'Survived')]
print(str(titanicDF))
# 哑变量处理
library(caret)
titanicDF$Title <- as.factor(titanicDF$Title)
titanicDummy <- dummyVars("~.",data=titanicDF, fullRank=F)
titanicDF <- as.data.frame(predict(titanicDummy,titanicDF))
print(names(titanicDF))

prop.table(table(titanicDF$Survived))
outcomeName <- 'Survived'
predictorsNames <- names(titanicDF)[names(titanicDF) != outcomeName]
titanicDF$Survived2 <- ifelse(titanicDF$Survived==1,'yes','nope')
titanicDF$Survived2 <- as.factor(titanicDF$Survived2)
outcomeName <- 'Survived2'
# 数据分区
set.seed(1234)
splitIndex <- createDataPartition(titanicDF[,outcomeName], p = .75, list = FALSE, times = 1)
trainDF <- titanicDF[ splitIndex,]
testDF  <- titanicDF[-splitIndex,]
# 建模及预测
objControl <- trainControl(method='cv', number=3, returnResamp='none', summaryFunction = twoClassSummary, classProbs = TRUE)
objModel <- train(trainDF[,predictorsNames], trainDF[,outcomeName], 
                  method='rpart', 
                  trControl=objControl,  
                  metric = "ROC",
                  preProc = c("center", "scale"))
summary(objModel)
print(objModel)
predictions <- predict(object=objModel, testDF[,predictorsNames], type='raw')
head(predictions)
print(postResample(pred=predictions, obs=as.factor(testDF[,outcomeName])))
# 求概率 
predictions <- predict(object=objModel, testDF[,predictorsNames], type='prob')
# 自定义roc函数
roc <- function(p, y, n) {
  y <- factor(y)
  l <- length(p)
  criteria <- p > matrix(rep(seq(1, 0, length = n), l), ncol = n, byrow = T)
  fpr <- colSums((y == levels(y)[1]) * criteria)/sum(y == levels(y)[1])
  tpr <- colSums((y == levels(y)[2]) * criteria)/sum(y == levels(y)[2])
  roc <- data.frame(tpr, fpr)
}
# 计算roc
roc.result <- roc(predictions[[2]],ifelse(testDF[,outcomeName]=="yes",1,0), 327)
# 画出roc曲线
library(ggplot2)
ggplot(roc.result, aes(x = fpr, y = tpr)) + geom_line(color = "blue") + 
  geom_segment(aes(x = 0, y = 0, xend = 1, yend = 1), color = "grey", lty = 2)
# 用ROCR包绘制roc曲线
library(ROCR)
pre <- prediction(predictions[[2]],ifelse(testDF[,outcomeName]=="yes",1,0))
plot(performance(pre, "tpr", "fpr"), main = "ROC CURVE", colorize = T)
performance(pre, measure = "auc")@y.values
# 绘制提升曲线
plot(performance(pre, "lift", "rpp"), main = "LIFT CURVE", colorize = T)

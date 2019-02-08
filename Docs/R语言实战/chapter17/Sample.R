#数据准备
loc<-"https://archive.ics.uci.edu/ml/machine-learning-databases/"
ds<-"breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url<-paste(loc,ds,sep="")

breast<-read.table(url,sep=",",header=FALSE,na.strings="?")
names(breast)<-c("ID","clumpThickness","sizeUniformity","shapeUniformity","maginalAdhesion","singleEpithelialCellSize","bareNuclei","blandChromatin","normalNucleoli","mitosis","class")
df<-breast[-1]
df$class<-factor(df$class,levels=c(2,4),labels=c("benign","malignant"))

set.seed(1234)
train<-sample(nrow(df),0.7*nrow(df))
df.train<-df[train,] #取行的意思
df.validate<-df[-train,]
table(df.train$class)
table(df.validate$class)

#逻辑回归
fit.logit<-glm(class~.,data=df.train,family=binomial())
summary(fit.logit)

prob<-predict(fit.logit,df.validate,type="response")
logit.pred<-factor(prob>.5,levels=c(FALSE,TRUE),labels=c("begin","malignant"))
logit.perf<-table(df.validate$class,logit.pred,dnn=c("Actual","Predicted"))
logit.perf

#决策树
library(rpart)
set.seed(1234)
dtree<-rpart(class~.,data=df.train,method="class",parms=list(split="information"))
dtree$cptable

dtree.pruned<-prune(dtree,cp=.0125)

library(rpart.plot)
prp(dtree.pruned,type=2,extra=104,fallen.leaves = TRUE,main="Decision Tree")

dtree.pred<-predict(dtree.pruned,df.validate,type="class")
dtree.perf<-table(df.validate$class,dtree.pred,dnn=c("Actual","Predicted"))
#head(dtree.pred,2)
#head(df,1)
dtree.perf


#条件推断树
install.packages("party")
library(party)
fit.ctree<-ctree(class~.,data=df.train)
plot(fit.ctree,main="Conditional Inference Tree")

ctree.pred<-predict(fit.ctree,df.validate,type="response")
ctree.perf<-table(df.validate$class,ctree.pred,dnn=c("Actual","Predicted"))
ctree.perf


#随机森林
install.packages("randomForest")
library(randomForest)
set.seed(1234)
fit.forest<-randomForest(class~.,data=df.train,na.action=na.roughfix,importance=TRUE)
fit.forest

importance(fit.forest,type=2)
forest.pred<-predict(fit.forest,df.validate)
forest.perf<-table(df.validate$class,forest.pred,dnn=c("Actual","Predicted"))
forest.perf



#支持向量机
install.packages("e1071")
library(e1071)
set.seed(1234)
fit.svm<-svm(class~.,data=df.train)
fit.svm

svm.pred<-predict(fit.svm,na.omit(df.validate))
svm.perf<-table(na.omit(df.validate)$class,svm.pred,dnn=c("Actual","Predicted"))
svm.perf

#带RBF核的SVM模型
set.seed(1234)
tuned<-tune.svm(class~.,data=df.train,gamma=10^(-6:1),cost=10^(-10:10))
tuned

fit.svm<-svm(class~.,data=df.train,gamma=.01,cost=1)
svm.pred<-predict(fit.svm,na.omit(df.validate))
svm.perf<-table(na.omit(df.validate)$class,svm.pred,dnn=c("Actual","Predicted"))
svm.perf


#选择预测效果最好的解，评估二分类准确性
performance<-function(table,n=2){
  if(!all(dim(table)==c(2,2)))
    stop("Must be a 2x2 table")
  tn=table[1,1]
  fp=table[1,2]
  fn=table[2,1]
  tp=table[2,2]
  sensitivity=tp/(tp+fn)
  specificity=tn/(tn+fp)
  ppp=tp/(tp+fp)
  npp=tn/(tn+fn)
  hitrate=(tp+tn)/(tp+tn+fp+fn)
  result<-paste("Sensitivity=",round(sensitivity,n),"\nSpecificity = ",round(specificity,n),"\nPositive Predictive Value=",round(ppp,n),"\nNegative Predictive Value=",round(npp,n),"\nAccuracy=",round(hitrate,n),"\n",sep="")
  cat(result)
}


performance(logit.perf)

performance(dtree.perf)

performance(ctree.perf)

performance(ctree.perf)

performance(forest.perf)

performance(svm.perf)


#Rattle包
library(rattle)

loc<-"https://archive.ics.uci.edu/ml/machine-learning-databases/"
ds<-"pima-indians-diabetes/pima-indians-diabetes.data"
url<-paste(loc,ds,sep="")
diabetes<-read.table(url,sep=",",header=FALSE)
names(diabetes)<-c("npregant","plasma","bp","triceps","insulin","bmi","pedigree","age","class")
diabetes$class<-factor(diabetes$class,levels=c(0,1),labels=c("normal","diabetic"))


rattle()

cv<-matrix(c(145,50,8,27),nrow=2)
performance(as.table(cv))


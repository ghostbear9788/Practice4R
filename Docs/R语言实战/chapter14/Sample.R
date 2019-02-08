#主成分分析
par(mfrow=(c(1,1)))
library(psych)
head(USJudgeRatings,5)
head(USJudgeRatings[,-1],5)

fa.parallel(USJudgeRatings[,-1],fa="pc",n.iter=100,show.legend = FALSE,main="Scree plot with parallel analysis")

#提取主成分
pc<-principal(USJudgeRatings[,-1],nfactors=1)
pc

#例子，身体测量指标主成份分析
library(psych)
fa.parallel(Harman23.cor$cov,n.obs=302,fa="pc",n.iter=100,show.legend = FALSE,main="Scree plot with parallel analysis")

pc<-principal(Harman23.cor$cov,nfactors=2,rotate="none")
pc

#主成份旋转
rc<-principal(Harman23.cor$cov,nfactors = 2,rotate="varimax")
rc


#获取每个变量在主成份上的得分
pc<-principal(USJudgeRatings[,-1],nfactors=1,score=TRUE)
head(pc$scores)

#获取主成分得分系数
rc<-principal(Harman23.cor$cov,nfactors=2,rotate="varimax")
round(unclass(rc$weights),2)



#探索性因子分析
options(digits=2)
covariances<-ability.cov$cov
correlations<-cov2cor(covariances)
correlations

#判断需提取的公共因子数
covariances<-ability.cov$cov
correlations<-cov2cor(covariances)
fa.parallel(correlations,n.obs=112,fa="both",n.iter=100,main="Scree plots with parallel analysis")

#提取公共因子
fa<-fa(correlations,nfactors=2,rotate="none",fm="pa")
fa

#因子旋转
#正交旋转
fa.varimax<-fa(correlations,nfactors=2,rotate="varimax",fm="pa")
fa.varimax

#斜交旋转
install.packages("GPArotation")
library(GPArotation)
fa.promax<-fa(correlations,nfactors=2,rotate="promax",fm="pa")
fa.promax

fsm<-function(oblique){
  if(class(oblique)[2] =="fa" & is.null(oblique$Phi)){
    warning("Object dosen't look like oblique EFA")
  } else{
    P<-unclass(oblique$loading)
    F<-P%*% oblique$Phi
    colnames(F)<-c("PA1","PA2")
    return(F)
  }
}

fsm(fa.promax)

#斜交结果的图形展示
factor.plot(fa.promax,labels=rownames(fa.promax$loadings))

#正交结果的图形展示 -- 不能正常工作
#factor.plot(fa.varimax,labels=rownames(fa.varimax$loadings))

fa.diagram(fa.promax,simple=FALSE)

#fa.diagram(fa.varimax,simple=FALSE) 不能正常工作

#因子得分
fa.promax$weights

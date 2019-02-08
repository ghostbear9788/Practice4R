fit3<-lm(weight~height+I(height^2)+I(height^3),data=women)
summary(fit3)
plot(women$height,women$weight,xlab="height",ylab="weight")
lines(women$height,fitted(fit3))



scatterplot(weight~height,data=women,spread=FALSE,smoother.args=list(lty=2),pch=19,main="Women Age 30~39",xlab="height",ylab="weight")

states<-as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])

cor(states)
library(car)
scatterplotMatrix(states,spread=FALSE,smoother.args=list(lty=2),main="Scatter Plot Matrix")

#8-4  多元线性回归
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
summary(fit)


#8-5 有显著交互项的多元线性回归
fit<-lm(mpg~hp+wt+hp:wt,data=mtcars)
summary(fit)

library(effects)
plot(effect("hp:wt", fit, , list(wt = c(2.2, 3.2, 4.2))), multiline = TRUE)

#回归判断
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
confint(fit)

#8.3.1
fit<-lm(weight~height,data=women)
par(mfrow=c(2,2))
plot(fit)

fit2<-lm(weight~height+I(height^2),data=women)
par(nfrow=c(2,2))
plot(fit2)

newfit2<-lm(weight~height+I(height^2),data=women[-c(13,15),])
par(nfrow=c(2,2))
plot(newfit2)


fit3<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
par(nfrow=c(2,2))
plot(fit3)

#检测异常值
library(car)
states<-as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
qqPlot(fit,labels=row.names(states),id.method="identify",simulate=TRUE,main="Q-Q Plot")

fitted(fit)["Nevada"]

#8-6
par(mfrow=c(1,1))

residplot<-function(fit,nbreaks=10)
{
  z<-rstudent(fit)
  hist(z,breaks=nbreaks,freq=FALSE,xlab="Studentized Residual",main = "Distribution of Errors")
  rug(jitter(z),col="brown")
  curve(dnorm(x,mean=mean(z),sd=sd(z)), add=TRUE, col="blue",lwd=2)
  lines(density(z)$x,density(z)$y,col="red",lwd=2,lty=2)
  legend("topright",legend=c("Normal Curve","Kernel Density Curve"),lty=1:2,col=c("blue","red"),cex=.7)
}

residplot(fit)

#Durbin-Watson
durbinWatsonTest(fit)

#线性
library(car)
crPlots(fit)

#检验同方差性
library(car)
ncvTest(fit)
spreadLevelPlot(fit)

#线性模型假设的综合检验
install.packages("gvlma")
library(gvlma)
gvmodel<-gvlma(fit)
summary(gvmodel)

#检测多重共线性
library(car)
vif(fit)
sqrt(vif(fit))>2 



#8.4 异常观察值

#离群点
library(car)
outlierTest(fit)

#高杠杆值
hat.plot<-function(fit){
  p<-length(coefficients(fit))
  n<-length(fitted(fit))
  plot(hatvalues(fit),main="Index Plot of Hat Values")
  abline(h=c(2,3)*p/n,col="red",lty=2)
  identify(1:n,hatvalues(fit),names(hatvalues(fit)))
}

hat.plot(fit)

#强影响点
cutoff<-4/(nrow(states)-length(fit$coefficients)-2)
plot(fit,which=4,cook.levels=cutoff)
abline(h=cutoff,lty=2,col="red")

library(car)
avPlots(fit,ask=FALSE,id.method="identify")

library(car)
influencePlot(fit,id.method = "identify",main="Influence Plot",sub="Circle size is proportional to Cook's distance")

#8.5 改进措施

#变量变换
library(car)
summary(powerTransform(states$Murder))

boxTidwell(Murder~Population+Illiteracy,data=states)


#8.6 选择最佳回归模型

#排除不需要的随机变量
fit1<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
fit2<-lm(Murder~Population+Illiteracy,data=states)
anova(fit2,fit1)

AIC(fit1,fit2)
AIC(fit2,fit1)

#变量选择-逐步回归
library(MASS)
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
stepAIC(fit,direction="backward")

#变量选择-全子集回归
install.packages("leaps")
library(leaps)
states<-as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])
leaps<-regsubsets(Murder~Population+Illiteracy+Income+Frost,data=states,nbest=4)
plot(leaps,scale="adjr2")

library(car)
subsets(leaps,statistic="cp",main="Cp Plot for All Subsets Regression")
abline(1,1,lty=2,col="red")


#8.7深层次分析

#R平方的K重交叉验证
install.packages("bootstrap")
shrinkage<-function(fit,k=10)
{
  require(bootstrap)
  theta.fit<-function(x,y){lsfit(x,y)}
  theta.predict<-function(fit,x){cbind(1,x)%*%fit$coef}
  
  x<-fit$model[,2:ncol(fit$model)]
  y<-fit$model[,1]
  
  results<-crossval(x,y,theta.fit,theta.predict,ngroup=k)
  r2<-cor(y,fit$fitted.values)^2
  r2cv<-cor(y,results$cv.fit)^2
  cat("Original R-square=",r2,"\n")
  cat(k,"Fold Cross-Validated R-square=",r2cv,"\n")
  cat("Change=",r2-r2cv,"\n")
  
}
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
shrinkage(fit)
fit2<-lm(Murder~Population+Illiteracy,data=states)
shrinkage(fit2)


#相对重要性
zstates<-as.data.frame(scale(states))
zfit<-lm(Murder~Population+Income+Illiteracy+Frost,data=zstates)
coef(zfit)



relweights <- function(fit,...){
  R <- cor(fit$model)
  nvar <- ncol(R)
  rxx <- R[2:nvar, 2:nvar]
  rxy <- R[2:nvar, 1]
  svd <- eigen(rxx)
  evec <- svd$vectors
  ev <- svd$values
  delta <- diag(sqrt(ev))
  lambda <- evec %*% delta %*% t(evec)
  lambdasq <- lambda ^ 2
  beta <- solve(lambda) %*% rxy
  rsquare <- colSums(beta ^ 2)
  rawwgt <- lambdasq %*% beta ^ 2
  import <- (rawwgt / rsquare) * 100
  import <- as.data.frame(import)
  row.names(import) <- names(fit$model[2:nvar])
  names(import) <- "Weights"
  import <- import[order(import),1, drop=FALSE]
  dotchart(import$Weights, labels=row.names(import),
           xlab="% of R-Square", pch=19,
           main="Relative Importance of Predictor Variables",
           sub=paste("Total R-Square=", round(rsquare, digits=3)),
           ...)
  return(import)
}

fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
relweights(fit,col="blue")



par(nfrow=c(1,1))
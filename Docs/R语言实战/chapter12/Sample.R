#置换实验 Coin包
install.packages(c("coin"))

#lmPerm包
install.packages("lmPerm")


#独立两样本和K样本检验
library(coin)
score<-c(40,57,45,55,58,57,64,55,62,65)
treatment<-factor(c(rep("A",5),rep("B",5)))
mydata<-data.frame(treatment,score)
t.test(score~treatment,data=mydata,var.equal=TRUE)

#置换T检验
library(coin)
oneway_test(score~treatment,data=mydata,distribution="exact")

library(multcomp)
set.seed(1234)
oneway_test(response~trt,data=cholesterol,distribution=approximate(B=9999))

#Wilcox.test
library(MASS)
UScrime<-transform(UScrime,So=factor(So))
wilcox_test(Prob~So,data=UScrime,distribution="exact")
wilcox.test(Prob~So,data=UScrime,distribution="exact")


#chisq_Test
library(coin)
library(vcd)
Arthritis<-transform(Arthritis,Improved=as.factor(as.numeric(Improved)))
set.seed(1234)
chisq_test(Treatment~Improved,data=Arthritis,distribution=approximate(B=9999))
chisq.test(Treatment~Improved,data=Arthritis,distribution=approximate(B=9999))


#spearman.test 数值变量间的独立性
states<-as.data.frame(state.x77)
set.seed(1234)
spearman_test(Illiteracy~Murder,data=states,distribution=approximate(B=9999))


#两样本和K样本相关性检验
library(coin)
library(MASS)
wilcoxsign_test(U1~U2,data=UScrime,distribution="exact")


#lmPerm包的置换检验
library(lmPerm)

#简单线性回归置换
set.seed(1234)
fit<-lmp(weight~height,data=women,perm="Prob")
summary(fit)

#多项式回归的置换检验
set.seed(1234)
fit<-lmp(weight~height+I(height^2),data=women,perm="Prob")
summary(fit)


#多元回归
library(lmPerm)
set.seed(1234)
states<-as.data.frame(state.x77)
fit<-lmp(Murder~Population+Illiteracy+Income+Frost,data=states,perm="Prob")
summary(fit)


#单因素方差分析和协方差分析
library(lmPerm)
library(multcomp)
set.seed(1234)
fit<-aovp(response~trt,data=cholesterol,perm="Prob")
anova(fit)

#双因素方差分析
library(lmPerm)
set.seed(1234)
fit<-aovp(len~supp*dose,data=ToothGrowth,perm="Prob")
anova(fit)


#自助法
library(boot)
set.seed(1234)
rsq<-function(formula,data,indices){
  d<-data[indices,]
  fit<-lm(formula,data=d)
  return(summary(fit)$r.square)
  
}


results<-boot(data=mtcars,statistic=rsq,R=1000,formula=mpg~wt+disp)
print(results)

boot.ci(results,type=c("perc","bca"))

#多个统计量的自助法
bs<-function(formula,data,indices){
  d<-data[indices,]
  fit<-lm(formula,data=d)
  return(coef(fit))
  
}

library(boot)
set.seed(1234)
results<-boot(data=mtcars,statistic=bs,R=1000,formula=mpg~wt+disp)
print(results)


plot(results,index=1)

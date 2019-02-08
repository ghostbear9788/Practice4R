#Logistic 回归
install.packages("AER")
data(Affairs,package="AER")
summary(Affairs)
table(Affairs$affairs)

Affairs$ynaffair[Affairs$affairs>0]<-1
Affairs$ynaffair[Affairs$affairs==0]<-0
Affairs$ynaffair<-factor(Affairs$ynaffair,levels=c(0,1),labels=c("No","Yes"))

table(Affairs$ynaffair)

#拟合Logistic回归
fit.full<-glm(ynaffair~gender+age+yearsmarried+children+religiousness+education+occupation+rating,data=Affairs,family=binomial())
summary(fit.full)

fit.reduced<-glm(ynaffair~age+yearsmarried+religiousness+rating,data=Affairs,family=binomial())
summary(fit.reduced)

#fit.reducedtest<-glm(ynaffair~age+religiousness,data=Affairs,family=binomial())
#summary(fit.reducedtest)

#检验fit.reduced模型
anova(fit.reduced,fit.full,test="Chisq")
#anova(fit.reducedtest,fit.full,test="Chisq") 

#模型参数
coef(fit.reduced)
exp(coef(fit.reduced))

#评价预测变量对概率的影响概率
testdata<-data.frame(rating=c(1,2,3,4,5),age=mean(Affairs$age),yearsmarried=mean(Affairs$yearsmarried),religiousness=mean(Affairs$religiousness))
testdata
testdata$prob<-predict(fit.reduced,newdata=testdata,type="response")
testdata

#过度离势
deviance(fit.reduced)/df.residual(fit.reduced)

#过度离势检测
fit<-glm(ynaffair~age+yearsmarried+religiousness+rating,family=binomial(),data=Affairs)
fit.od<-glm(ynaffair~age+yearsmarried+religiousness+rating,family=quasibinomial(),data=Affairs)
pchisq(summary(fit.od)$dispersion*fit$df.residual,fit$df.residual,lower=F)



#泊松回归
install.packages("robust")
data(breslow.dat,package="robust")
names(breslow.dat)
summary(breslow.dat[c(6,7,8,10)])

opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
#attach(breslow.dat)
hist(sumY,
     breaks = 20,
     xlab = "Seizure Count",
     main = "Distribution of Seizures")
boxplot(sumY ~ Trt, xlab = "Treatment", main = "Group Comparisons")
par(opar)
#拟合泊松回归
fit<-glm(sumY~Base+Age+Trt,data=breslow.dat,family = poisson())
summary(fit)

#解释模型参数
coef(fit)
exp(coef(fit))

#过度离势
deviance(fit)/df.residual(fit)

install.packages("qcc")
library(qcc)
qcc.overdispersion.test(breslow.dat$sumY,type="poisson") 

#存在过度离势，重新拟合泊松回归
fit.od<-glm(sumY~Base+Age+Trt,data=breslow.dat,family=quasipoisson())
summary(fit.od)
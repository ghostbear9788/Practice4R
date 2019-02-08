#9.3 单因素方程分析
install.packages("multcomp")
library(multcomp)
attach(cholesterol)
table(trt)

aggregate(response, by=list(trt),FUN=mean)

aggregate(response, by=list(trt),FUN=sd)

fit<-aov(response~trt)

summary(fit)

install.packages("gplots")
library(gplots)
plotmeans(response~trt,xlab="Treatment",ylab="Response", main="Mean Plot\nwith 95% CI")
detach(cholesterol)

#多重比较
TukeyHSD(fit)

par(las=2)
par(mar=c(5,8,4,2))
plot(TukeyHSD(fit))

library(multcomp)
par(mar=c(5,4,6,2))
tuk<-glht(fit,linfct=mcp(trt="Tukey"))
plot(cld(tuk,level=.05),col="lightgrey")

#离群点检测 - 
#评估检验的假设条件
library(car)
qqPlot(lm(response~trt,data=cholesterol),simulate=TRUE,main="Q-Q Plot",labels=FALSE)

#Bartlett检验
bartlett.test(response~trt,data=cholesterol)

outlierTest(fit)


#9.4单因素协方差分析
data(litter,package="multcomp")
attach(litter)
table(dose)
weight<-weight[c(1:60)]
gesttime<-gesttime[c(1:60)]
aggregate(weight,by=list(dose),FUN=mean)
fit<-aov(weight~gesttime+dose)
summary(fit)

library(effects)
effect("dose",fit)

#多重比较
library(multcomp)
contrast<-rbind("no drug vs. drug"=c(3,-1,-1,-1))
summary(glht(fit,linfct=mcp(dose=contrast)))

#评估验证的假设条件
library(multcomp)
fit2<-aov(weight~gesttime*dose,data=litter)
summary(fit2)

#结果可视化
install.packages("HH")
library(HH)
ancova(weight~gesttime+dose,data=litter)


#9.5 双因素分析
attach(ToothGrowth)
table(supp,dose)

aggregate(len,by=list(supp,dose),FUN=mean)

aggregate(len,by=list(supp,dose),FUN=sd)

dose<-factor(dose)
fit<-aov(len~supp*dose)
summary(fit)

interaction.plot(dose,supp,len,type="b",col=c("red","blue"),pch=c(16,18),main="Interaction between Dose and Supplement Type")

detach(ToothGrowth)

library(gplots)
plotmeans(len~interaction(supp,dose,sep=" "),connect = list(c(1,3,5),c(2,4,6)),col=c("red","darkgreen"),main="Interaction Plot with 95% CIs",xlab="Treatment and Dose Combination")


library(HH)
interaction2wt(len~supp*dose)


#9.6 重复测量方差分析
CO2$conc<-factor(CO2$conc)
w1b1<-subset(CO2,Treatment=='chilled')
fit<-aov(uptake~conc*Type+Error(Plant/(conc)),w1b1)
summary(fit)

par(las=2)
par(mar=c(10,4,4,2))
with(w1b1,interaction.plot(conc,Type,uptake,type="b",col=c("red","blue"),pch=c(16,18),main="Interaction Plot for Plant Type and Concentration"))

boxplot(uptake~Type*conc, data=w1b1,col=(c("gold","green")),main="Chilled Quebec and Mississippi Plants",ylab="Carbon dioxide uptake rate (umol/m^2 sec)")


#9.7 多元方差分析
library(MASS)
attach(UScereal)
shelf<-factor(shelf)
y<-cbind(calories,fat,sugars)
aggregate(y,by=list(shelf),FUN=mean)

cov(y)
fit<-manova(y~shelf)
summary(fit)
summary.aov(fit)


#评估假设检验
center<-colMeans(y)
n<-nrow(y)
p<-ncol(y)
cov<-cov(y)
d<-mahalanobis(y,center,cov)
coord<-qqplot(qchisq(ppoints(n),df=p),d,main="Q-Q Plot Assessing Multivariate Normality",ylab="Mahalanobis D2")
abline(a=0,b=1)
identify(coord$x,coord$y,labels=row.names(UScereal))

#install.packages("rrcov")
library(rrcov)
Wilks.test(y,shelf,method="mcd")


#9.8 用回归来做ANOVA

library(multcomp)
levels(cholesterol$trt)

fit.aov<-aov(response~trt,data=cholesterol)
summary(fit.aov)

fit.lm<-lm(response~trt,data=cholesterol)
summary(fit.lm)

contrasts(cholesterol$trt)

fit.lm<-lm(response~trt,data=cholesterol,contrasts="contr.helmert")
summary(fit.lm)

